data "aws_caller_identity" "default" {}

module "sns_topic_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.1.3"
  name       = "${var.name}"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  attributes = "${compact(concat(var.attributes, list("alarms")))}"
}

locals {
  enabled          = "${var.enabled == "true" ? 1 : 0}"
  create_sns_topic = "${var.create_sns_topic == "true" ? 1 : 0}"
}

data "aws_sns_topic" "default" {
  count = "${(1 - local.create_sns_topic) * local.enabled}"
  name  = "${var.sns_topic_name}"
}

# Create an SNS topic if one is not passed
resource "aws_sns_topic" "default" {
  count       = "${local.enabled * local.create_sns_topic}"
  name_prefix = "${module.sns_topic_label.id}"
}

locals {
  sns_topic_arn = "${element(compact(concat(aws_sns_topic.default.*.arn, data.aws_sns_topic.default.*.arn, list(""))), 0)}"
}

resource "aws_sns_topic_policy" "default" {
  count  = "${local.enabled * local.create_sns_topic}"
  arn    = "${local.sns_topic_arn}"
  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
}

data "aws_iam_policy_document" "sns_topic_policy" {
  count = "${local.enabled * local.create_sns_topic}"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    effect    = "Allow"
    resources = ["${local.sns_topic_arn}"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${data.aws_caller_identity.default.account_id}",
      ]
    }
  }

  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["sns:Publish"]
    resources = ["${local.sns_topic_arn}"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}
