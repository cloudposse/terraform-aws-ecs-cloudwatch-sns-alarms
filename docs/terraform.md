<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.3 |
| aws | >= 3.1 |
| local | >= 1.3 |
| null | >= 2.0 |
| template | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_description | The string to format and use as the alarm description. | `string` | `"Average service %v utilization %v last %d minute(s) over %v period(s)"` | no |
| attributes | Additional attributes (\_e.g.\_ "1") | `list(string)` | `[]` | no |
| cluster\_name | The name of the ECS cluster to monitor | `string` | n/a | yes |
| cpu\_utilization\_high\_alarm\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High Alarm action | `list(string)` | `[]` | no |
| cpu\_utilization\_high\_evaluation\_periods | Number of periods to evaluate for the alarm | `number` | `1` | no |
| cpu\_utilization\_high\_ok\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High OK action | `list(string)` | `[]` | no |
| cpu\_utilization\_high\_period | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| cpu\_utilization\_high\_threshold | The maximum percentage of CPU utilization average | `number` | `80` | no |
| cpu\_utilization\_low\_alarm\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low Alarm action | `list(string)` | `[]` | no |
| cpu\_utilization\_low\_evaluation\_periods | Number of periods to evaluate for the alarm | `number` | `1` | no |
| cpu\_utilization\_low\_ok\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low OK action | `list(string)` | `[]` | no |
| cpu\_utilization\_low\_period | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| cpu\_utilization\_low\_threshold | The minimum percentage of CPU utilization average | `number` | `20` | no |
| delimiter | Delimiter between `namespace`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Enable/disable resources creation | `bool` | `true` | no |
| memory\_utilization\_high\_alarm\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High Alarm action | `list(string)` | `[]` | no |
| memory\_utilization\_high\_evaluation\_periods | Number of periods to evaluate for the alarm | `number` | `1` | no |
| memory\_utilization\_high\_ok\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High OK action | `list(string)` | `[]` | no |
| memory\_utilization\_high\_period | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| memory\_utilization\_high\_threshold | The maximum percentage of Memory utilization average | `number` | `80` | no |
| memory\_utilization\_low\_alarm\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low Alarm action | `list(string)` | `[]` | no |
| memory\_utilization\_low\_evaluation\_periods | Number of periods to evaluate for the alarm | `number` | `1` | no |
| memory\_utilization\_low\_ok\_actions | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low OK action | `list(string)` | `[]` | no |
| memory\_utilization\_low\_period | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| memory\_utilization\_low\_threshold | The minimum percentage of Memory utilization average | `number` | `20` | no |
| name | Name of the application | `string` | n/a | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | `string` | `""` | no |
| service\_name | The name of the ECS Service in the ECS cluster to monitor | `string` | `""` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| tags | Additional tags (\_e.g.\_ { BusinessUnit : ABC }) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_arn | CPU utilization high CloudWatch metric alarm ARN |
| cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_id | CPU utilization high CloudWatch metric alarm ID |
| cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_arn | CPU utilization low CloudWatch metric alarm ARN |
| cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_id | CPU utilization low CloudWatch metric alarm ID |
| memory\_utilization\_high\_cloudwatch\_metric\_alarm\_arn | Memory utilization high CloudWatch metric alarm ARN |
| memory\_utilization\_high\_cloudwatch\_metric\_alarm\_id | Memory utilization high CloudWatch metric alarm ID |
| memory\_utilization\_low\_cloudwatch\_metric\_alarm\_arn | Memory utilization low CloudWatch metric alarm ARN |
| memory\_utilization\_low\_cloudwatch\_metric\_alarm\_id | Memory utilization low CloudWatch metric alarm ID |

<!-- markdownlint-restore -->
