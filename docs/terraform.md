
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name | The name of the ECS cluster to monitor. | string | - | yes |
| cpu_utilization_threshold | The maximum percentage of CPU utilization average. | string | `80` | no |
| memory_utilization_threshold | The maximum percentage of Memory utilization average. | string | `80` | no |
| service_name | The name of the ECS Service in the ECS cluster to monitor. | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| sns_topic_arn | The ARN of the SNS topic |

