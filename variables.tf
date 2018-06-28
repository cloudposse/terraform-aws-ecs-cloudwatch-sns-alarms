variable "name" {
  type        = "string"
  description = "Name (unique identifier for app or service)"
}

variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "delimiter" {
  type        = "string"
  description = "The delimiter to be used in labels."
  default     = "-"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "attributes" {
  type        = "list"
  description = "List of attributes to add to label."
  default     = []
}

variable "tags" {
  type        = "map"
  description = "Map of key-value pairs to use for tags."
  default     = {}
}

variable "enabled" {
  type        = "string"
  description = "Whether to create all resources"
  default     = "true"
}

variable "cluster_name" {
  type        = "string"
  description = "The name of the ECS cluster to monitor."
}

variable "service_name" {
  type        = "string"
  description = "The name of the ECS Service in the ECS cluster to monitor."
}

variable "evaluation_periods" {
  type        = "string"
  description = "Number of periods to evaluate for the alarm."
  default     = "1"
}

variable "period" {
  type        = "string"
  description = "Duration in seconds to evaluate for the alarm."
  default     = "300"
}

variable "cpu_utilization_threshold" {
  type        = "string"
  description = "The maximum percentage of CPU utilization average."
  default     = "80"
}

variable "memory_utilization_threshold" {
  type        = "string"
  description = "The maximum percentage of Memory utilization average."
  default     = "80"
}

variable "alarm_description" {
  type        = "string"
  description = "The string to format and use as the alarm description."
  default     = "Average service %v utilization over last %d minute(s) too high over %d period(s)"
}
