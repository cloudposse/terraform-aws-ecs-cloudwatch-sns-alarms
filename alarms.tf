module "cpu_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("cpu", "util", "high")))}"
}

module "memory_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("mem", "util", "high")))}"
}

locals {
  thresholds = {
    CPUUtilizationThreshold    = "${min(max(var.cpu_utilization_threshold, 0), 100)}"
    MemoryUtilizationThreshold = "${min(max(var.memory_utilization_threshold, 0), 100)}"
  }

  dimensions_map = {
    "service" = {
      "ClusterName" = "${var.cluster_name}"
      "ServiceName" = "${var.service_name}"
    }

    "cluster" = {
      "ClusterName" = "${var.cluster_name}"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  count               = "${local.enabled}"
  alarm_name          = "${module.cpu_alarm_label.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["CPUUtilizationThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "CPU", var.period/60, var.evaluation_periods)}"
  alarm_actions       = ["${aws_sns_topic.default.arn}"]
  ok_actions          = ["${aws_sns_topic.default.arn}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_too_high" {
  count               = "${local.enabled}"
  alarm_name          = "${module.memory_alarm_label.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["MemoryUtilizationThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "Memory", var.period/60, var.evaluation_periods)}"
  alarm_actions       = ["${aws_sns_topic.default.arn}"]
  ok_actions          = ["${aws_sns_topic.default.arn}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}
