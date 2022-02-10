<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cpu_utilization_high_alarm_label"></a> [cpu\_utilization\_high\_alarm\_label](#module\_cpu\_utilization\_high\_alarm\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_cpu_utilization_low_alarm_label"></a> [cpu\_utilization\_low\_alarm\_label](#module\_cpu\_utilization\_low\_alarm\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_memory_utilization_high_alarm_label"></a> [memory\_utilization\_high\_alarm\_label](#module\_memory\_utilization\_high\_alarm\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_memory_utilization_low_alarm_label"></a> [memory\_utilization\_low\_alarm\_label](#module\_memory\_utilization\_low\_alarm\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.24.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.cpu_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_utilization_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_utilization_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | The string to format and use as the alarm description. | `string` | `"Average service %v utilization %v last %d minute(s) over %v period(s)"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the ECS cluster to monitor | `string` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_cpu_utilization_high_alarm_actions"></a> [cpu\_utilization\_high\_alarm\_actions](#input\_cpu\_utilization\_high\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High Alarm action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_high_evaluation_periods"></a> [cpu\_utilization\_high\_evaluation\_periods](#input\_cpu\_utilization\_high\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `1` | no |
| <a name="input_cpu_utilization_high_ok_actions"></a> [cpu\_utilization\_high\_ok\_actions](#input\_cpu\_utilization\_high\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High OK action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_high_period"></a> [cpu\_utilization\_high\_period](#input\_cpu\_utilization\_high\_period) | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| <a name="input_cpu_utilization_high_threshold"></a> [cpu\_utilization\_high\_threshold](#input\_cpu\_utilization\_high\_threshold) | The maximum percentage of CPU utilization average | `number` | `80` | no |
| <a name="input_cpu_utilization_low_alarm_actions"></a> [cpu\_utilization\_low\_alarm\_actions](#input\_cpu\_utilization\_low\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low Alarm action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_low_evaluation_periods"></a> [cpu\_utilization\_low\_evaluation\_periods](#input\_cpu\_utilization\_low\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `1` | no |
| <a name="input_cpu_utilization_low_ok_actions"></a> [cpu\_utilization\_low\_ok\_actions](#input\_cpu\_utilization\_low\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low OK action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_low_period"></a> [cpu\_utilization\_low\_period](#input\_cpu\_utilization\_low\_period) | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| <a name="input_cpu_utilization_low_threshold"></a> [cpu\_utilization\_low\_threshold](#input\_cpu\_utilization\_low\_threshold) | The minimum percentage of CPU utilization average | `number` | `20` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_memory_utilization_high_alarm_actions"></a> [memory\_utilization\_high\_alarm\_actions](#input\_memory\_utilization\_high\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High Alarm action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_high_evaluation_periods"></a> [memory\_utilization\_high\_evaluation\_periods](#input\_memory\_utilization\_high\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `1` | no |
| <a name="input_memory_utilization_high_ok_actions"></a> [memory\_utilization\_high\_ok\_actions](#input\_memory\_utilization\_high\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High OK action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_high_period"></a> [memory\_utilization\_high\_period](#input\_memory\_utilization\_high\_period) | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| <a name="input_memory_utilization_high_threshold"></a> [memory\_utilization\_high\_threshold](#input\_memory\_utilization\_high\_threshold) | The maximum percentage of Memory utilization average | `number` | `80` | no |
| <a name="input_memory_utilization_low_alarm_actions"></a> [memory\_utilization\_low\_alarm\_actions](#input\_memory\_utilization\_low\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low Alarm action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_low_evaluation_periods"></a> [memory\_utilization\_low\_evaluation\_periods](#input\_memory\_utilization\_low\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `1` | no |
| <a name="input_memory_utilization_low_ok_actions"></a> [memory\_utilization\_low\_ok\_actions](#input\_memory\_utilization\_low\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low OK action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_low_period"></a> [memory\_utilization\_low\_period](#input\_memory\_utilization\_low\_period) | Duration in seconds to evaluate for the alarm | `number` | `300` | no |
| <a name="input_memory_utilization_low_threshold"></a> [memory\_utilization\_low\_threshold](#input\_memory\_utilization\_low\_threshold) | The minimum percentage of Memory utilization average | `number` | `20` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the ECS Service in the ECS cluster to monitor | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_utilization_high_cloudwatch_metric_alarm_arn"></a> [cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_arn](#output\_cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_arn) | CPU utilization high CloudWatch metric alarm ARN |
| <a name="output_cpu_utilization_high_cloudwatch_metric_alarm_id"></a> [cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_id](#output\_cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_id) | CPU utilization high CloudWatch metric alarm ID |
| <a name="output_cpu_utilization_low_cloudwatch_metric_alarm_arn"></a> [cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_arn](#output\_cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_arn) | CPU utilization low CloudWatch metric alarm ARN |
| <a name="output_cpu_utilization_low_cloudwatch_metric_alarm_id"></a> [cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_id](#output\_cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_id) | CPU utilization low CloudWatch metric alarm ID |
| <a name="output_memory_utilization_high_cloudwatch_metric_alarm_arn"></a> [memory\_utilization\_high\_cloudwatch\_metric\_alarm\_arn](#output\_memory\_utilization\_high\_cloudwatch\_metric\_alarm\_arn) | Memory utilization high CloudWatch metric alarm ARN |
| <a name="output_memory_utilization_high_cloudwatch_metric_alarm_id"></a> [memory\_utilization\_high\_cloudwatch\_metric\_alarm\_id](#output\_memory\_utilization\_high\_cloudwatch\_metric\_alarm\_id) | Memory utilization high CloudWatch metric alarm ID |
| <a name="output_memory_utilization_low_cloudwatch_metric_alarm_arn"></a> [memory\_utilization\_low\_cloudwatch\_metric\_alarm\_arn](#output\_memory\_utilization\_low\_cloudwatch\_metric\_alarm\_arn) | Memory utilization low CloudWatch metric alarm ARN |
| <a name="output_memory_utilization_low_cloudwatch_metric_alarm_id"></a> [memory\_utilization\_low\_cloudwatch\_metric\_alarm\_id](#output\_memory\_utilization\_low\_cloudwatch\_metric\_alarm\_id) | Memory utilization low CloudWatch metric alarm ID |
<!-- markdownlint-restore -->
