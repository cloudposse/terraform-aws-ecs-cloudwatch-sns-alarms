module "cpu_utilization_high_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("cpu", "utilization", "high")))}"
}

module "cpu_utilization_low_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("cpu", "utilization", "low")))}"
}

module "memory_utilization_high_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("memory", "utilization", "high")))}"
}

module "memory_utilization_low_alarm_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("memory", "utilization", "low")))}"
}

locals {
  thresholds = {
    CPUUtilizationHighThreshold    = "${min(max(var.cpu_utilization_high_threshold, 0), 100)}"
    CPUUtilizationLowThreshold     = "${min(max(var.cpu_utilization_low_threshold, 0), 100)}"
    MemoryUtilizationHighThreshold = "${min(max(var.memory_utilization_high_threshold, 0), 100)}"
    MemoryUtilizationLowThreshold  = "${min(max(var.memory_utilization_low_threshold, 0), 100)}"
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

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  count               = "${local.enabled}"
  alarm_name          = "${module.cpu_utilization_high_alarm_label.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.cpu_utilization_high_evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.cpu_utilization_high_period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["CPUUtilizationHighThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "CPU", "High", var.cpu_utilization_high_period/60, var.cpu_utilization_high_evaluation_periods)}"
  alarm_actions       = ["${compact(var.cpu_utilization_high_alarm_actions)}"]
  ok_actions          = ["${compact(var.cpu_utilization_high_ok_actions)}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_low" {
  count               = "${local.enabled}"
  alarm_name          = "${module.cpu_utilization_low_alarm_label.id}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "${var.cpu_utilization_low_evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.cpu_utilization_low_period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["CPUUtilizationLowThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "CPU", "Low", var.cpu_utilization_low_period/60, var.cpu_utilization_low_evaluation_periods)}"
  alarm_actions       = ["${compact(var.cpu_utilization_low_alarm_actions)}"]
  ok_actions          = ["${compact(var.cpu_utilization_low_ok_actions)}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high" {
  count               = "${local.enabled}"
  alarm_name          = "${module.memory_utilization_high_alarm_label.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.memory_utilization_high_evaluation_periods}"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.memory_utilization_high_period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["MemoryUtilizationHighThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "Memory", "Hight", var.memory_utilization_high_period/60, var.memory_utilization_high_evaluation_periods)}"
  alarm_actions       = ["${compact(var.memory_utilization_high_alarm_actions)}"]
  ok_actions          = ["${compact(var.memory_utilization_high_ok_actions)}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_low" {
  count               = "${local.enabled}"
  alarm_name          = "${module.memory_utilization_low_alarm_label.id}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "${var.memory_utilization_low_evaluation_periods}"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.memory_utilization_low_period}"
  statistic           = "Average"
  threshold           = "${local.thresholds["MemoryUtilizationLowThreshold"]}"
  alarm_description   = "${format(var.alarm_description, "Memory", "Low", var.memory_utilization_low_period/60, var.memory_utilization_low_evaluation_periods)}"
  alarm_actions       = ["${compact(var.memory_utilization_low_alarm_actions)}"]
  ok_actions          = ["${compact(var.memory_utilization_low_ok_actions)}"]

  dimensions = "${local.dimensions_map[var.service_name == "" ? "cluster" : "service"]}"
}
