## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alarm_description | The string to format and use as the alarm description. | string | `Average service %v utilization %v last %d minute(s) over %v period(s)` | no |
| attributes | Additional attributes (_e.g._ "1") | list(string) | `<list>` | no |
| cluster_name | The name of the ECS cluster to monitor | string | - | yes |
| cpu_utilization_high_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High Alarm action | list(string) | `<list>` | no |
| cpu_utilization_high_evaluation_periods | Number of periods to evaluate for the alarm | number | `1` | no |
| cpu_utilization_high_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High OK action | list(string) | `<list>` | no |
| cpu_utilization_high_period | Duration in seconds to evaluate for the alarm | number | `300` | no |
| cpu_utilization_high_threshold | The maximum percentage of CPU utilization average | number | `80` | no |
| cpu_utilization_low_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low Alarm action | list(string) | `<list>` | no |
| cpu_utilization_low_evaluation_periods | Number of periods to evaluate for the alarm | number | `1` | no |
| cpu_utilization_low_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low OK action | list(string) | `<list>` | no |
| cpu_utilization_low_period | Duration in seconds to evaluate for the alarm | number | `300` | no |
| cpu_utilization_low_threshold | The minimum percentage of CPU utilization average | number | `20` | no |
| delimiter | Delimiter between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| enabled | Enable/disable resources creation | bool | `true` | no |
| memory_utilization_high_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High Alarm action | list(string) | `<list>` | no |
| memory_utilization_high_evaluation_periods | Number of periods to evaluate for the alarm | number | `1` | no |
| memory_utilization_high_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High OK action | list(string) | `<list>` | no |
| memory_utilization_high_period | Duration in seconds to evaluate for the alarm | number | `300` | no |
| memory_utilization_high_threshold | The maximum percentage of Memory utilization average | number | `80` | no |
| memory_utilization_low_alarm_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low Alarm action | list(string) | `<list>` | no |
| memory_utilization_low_evaluation_periods | Number of periods to evaluate for the alarm | number | `1` | no |
| memory_utilization_low_ok_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low OK action | list(string) | `<list>` | no |
| memory_utilization_low_period | Duration in seconds to evaluate for the alarm | number | `300` | no |
| memory_utilization_low_threshold | The minimum percentage of Memory utilization average | number | `20` | no |
| name | Name of the application | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | `` | no |
| service_name | The name of the ECS Service in the ECS cluster to monitor | string | `` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| tags | Additional tags (_e.g._ { BusinessUnit : ABC }) | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu_utilization_high_cloudwatch_metric_alarm_arn | CPU utilization high CloudWatch metric alarm ARN |
| cpu_utilization_high_cloudwatch_metric_alarm_id | CPU utilization high CloudWatch metric alarm ID |
| cpu_utilization_low_cloudwatch_metric_alarm_arn | CPU utilization low CloudWatch metric alarm ARN |
| cpu_utilization_low_cloudwatch_metric_alarm_id | CPU utilization low CloudWatch metric alarm ID |
| memory_utilization_high_cloudwatch_metric_alarm_arn | Memory utilization high CloudWatch metric alarm ARN |
| memory_utilization_high_cloudwatch_metric_alarm_id | Memory utilization high CloudWatch metric alarm ID |
| memory_utilization_low_cloudwatch_metric_alarm_arn | Memory utilization low CloudWatch metric alarm ARN |
| memory_utilization_low_cloudwatch_metric_alarm_id | Memory utilization low CloudWatch metric alarm ID |

