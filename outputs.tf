output "cpu_utilization_high_cloudwatch_metric_alarm_id" {
  value       = join("", aws_cloudwatch_metric_alarm.cpu_utilization_high.*.id)
  description = "CPU utilization high CloudWatch metric alarm ID"
}

output "cpu_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = join("", aws_cloudwatch_metric_alarm.cpu_utilization_high.*.arn)
  description = "CPU utilization high CloudWatch metric alarm ARN"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_id" {
  value       = join("", aws_cloudwatch_metric_alarm.cpu_utilization_low.*.id)
  description = "CPU utilization low CloudWatch metric alarm ID"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = join("", aws_cloudwatch_metric_alarm.cpu_utilization_low.*.arn)
  description = "CPU utilization low CloudWatch metric alarm ARN"
}

output "memory_utilization_high_cloudwatch_metric_alarm_id" {
  value       = join("", aws_cloudwatch_metric_alarm.memory_utilization_high.*.id)
  description = "Memory utilization high CloudWatch metric alarm ID"
}

output "memory_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = join("", aws_cloudwatch_metric_alarm.memory_utilization_high.*.arn)
  description = "Memory utilization high CloudWatch metric alarm ARN"
}

output "memory_utilization_low_cloudwatch_metric_alarm_id" {
  value       = join("", aws_cloudwatch_metric_alarm.memory_utilization_low.*.id)
  description = "Memory utilization low CloudWatch metric alarm ID"
}

output "memory_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = join("", aws_cloudwatch_metric_alarm.memory_utilization_low.*.arn)
  description = "Memory utilization low CloudWatch metric alarm ARN"
}
