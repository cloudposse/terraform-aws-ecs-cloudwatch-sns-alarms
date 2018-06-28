variable "cluster_name" {
  description = "The name of the ECS cluster to monitor."
  type        = "string"
}

variable "service_name" {
  description = "The name of the ECS Service in the ECS cluster to monitor."
  type        = "string"
}

variable "evaluation_periods" {
  description = "Number of periods to evaluate for the alarm."
  type        = "string"
  default     = "1"
}

variable "period" {
  description = "Duration in seconds to evaluate for the alarm."
  type        = "string"
  default     = "300"
}

variable "cpu_utilization_threshold" {
  description = "The maximum percentage of CPU utilization average."
  type        = "string"
  default     = "80"
}

variable "memory_utilization_threshold" {
  description = "The maximum percentage of Memory utilization average."
  type        = "string"
  default     = "80"
}
