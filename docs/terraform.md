
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alarm_description | The string to format and use as the alarm description. | string | `Average service %v utilization over last %d minute(s) too high over %v period(s)` | no |
| attributes | List of attributes to add to label. | list | `<list>` | no |
| cluster_name | The name of the ECS cluster to monitor. | string | - | yes |
| cpu_utilization_threshold | The maximum percentage of CPU utilization average. | string | `80` | no |
| delimiter | The delimiter to be used in labels. | string | `-` | no |
| enabled | Whether to create all resources | string | `true` | no |
| evaluation_periods | Number of periods to evaluate for the alarm. | string | `1` | no |
| memory_utilization_threshold | The maximum percentage of Memory utilization average. | string | `80` | no |
| name | Name (unique identifier for app or service) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| period | Duration in seconds to evaluate for the alarm. | string | `300` | no |
| service_name | The name of the ECS Service in the ECS cluster to monitor. | string | `` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Map of key-value pairs to use for tags. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| sns_topic_arn | The ARN of the SNS topic |
| sns_topic_name | The name of the SNS topic |

