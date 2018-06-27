variable "cluster_name" {
  description = "The name of the ECS cluster to monitor."
  type        = "string"
}

variable "service_name" {
  description = "The name of the ECS Service in the ECS cluster to monitor."
  type        = "string"
}

variable "cpu_utilization_threshold" {
  description = "The maximum percentage of CPU utilization average."
  type        = "string"
  default     = 80
}

variable "memory_utilization_threshold" {
  description = "The maximum percentage of Memory utilization average."
  type        = "string"
  default     = 80
}