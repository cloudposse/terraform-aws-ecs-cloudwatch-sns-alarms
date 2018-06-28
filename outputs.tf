output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = "${join("", aws_sns_topic.default.*.arn)}"
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = "${join("", aws_sns_topic.default.*.name)}"
}
