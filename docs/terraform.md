
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alarm_description | The string to format and use as the alarm description. | string | `Average service %v utilization %v last %d minute(s) over %v period(s)` | no |
| attributes | List of attributes to add to label. | list | `<list>` | no |
| cluster_name | The name of the ECS cluster to monitor. | string | - | yes |
| cpu_utilization_high_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High Alarm action. | list | `<list>` | no |
| cpu_utilization_high_evaluation_periods | Number of periods to evaluate for the alarm. | string | `1` | no |
| cpu_utilization_high_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High OK action. | list | `<list>` | no |
| cpu_utilization_high_period | Duration in seconds to evaluate for the alarm. | string | `300` | no |
| cpu_utilization_high_threshold | The maximum percentage of CPU utilization average. | string | `80` | no |
| cpu_utilization_low_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low Alarm action. | list | `<list>` | no |
| cpu_utilization_low_evaluation_periods | Number of periods to evaluate for the alarm. | string | `1` | no |
| cpu_utilization_low_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low OK action. | list | `<list>` | no |
| cpu_utilization_low_period | Duration in seconds to evaluate for the alarm. | string | `300` | no |
| cpu_utilization_low_threshold | The minimum percentage of CPU utilization average. | string | `20` | no |
| delimiter | The delimiter to be used in labels. | string | `-` | no |
| enabled | Whether to create all resources | string | `true` | no |
| memory_utilization_high_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High Alarm action. | list | `<list>` | no |
| memory_utilization_high_evaluation_periods | Number of periods to evaluate for the alarm. | string | `1` | no |
| memory_utilization_high_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High OK action. | list | `<list>` | no |
| memory_utilization_high_period | Duration in seconds to evaluate for the alarm. | string | `300` | no |
| memory_utilization_high_threshold | The maximum percentage of Memory utilization average. | string | `80` | no |
| memory_utilization_low_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low Alarm action. | list | `<list>` | no |
| memory_utilization_low_evaluation_periods | Number of periods to evaluate for the alarm. | string | `1` | no |
| memory_utilization_low_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low OK action. | list | `<list>` | no |
| memory_utilization_low_period | Duration in seconds to evaluate for the alarm. | string | `300` | no |
| memory_utilization_low_threshold | The minimum percentage of Memory utilization average. | string | `20` | no |
| name | Name (unique identifier for app or service) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| service_name | The name of the ECS Service in the ECS cluster to monitor. | string | `` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Map of key-value pairs to use for tags. | map | `<map>` | no |

