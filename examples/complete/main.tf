provider "aws" {
  region = var.region
}

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

module "vpc" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.8.1"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  cidr_block = var.vpc_cidr_block
  tags       = var.tags
}

module "subnets" {
  source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.16.1"
  availability_zones   = var.availability_zones
  namespace            = var.namespace
  stage                = var.stage
  name                 = var.name
  attributes           = var.attributes
  delimiter            = var.delimiter
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  cidr_block           = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = false
  nat_instance_enabled = false
  tags                 = var.tags
}

resource "aws_ecs_cluster" "default" {
  name = module.label.id
  tags = module.label.tags
}

module "container_definition" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=tags/0.21.0"
  container_name               = var.container_name
  container_image              = var.container_image
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  container_cpu                = var.container_cpu
  essential                    = var.container_essential
  readonly_root_filesystem     = var.container_readonly_root_filesystem
  environment                  = var.container_environment
  port_mappings                = var.container_port_mappings
}

module "ecs_alb_service_task" {
  source                             = "git::https://github.com/cloudposse/terraform-aws-ecs-alb-service-task.git?ref=tags/0.17.0"
  namespace                          = var.namespace
  stage                              = var.stage
  name                               = var.name
  attributes                         = var.attributes
  delimiter                          = var.delimiter
  alb_security_group                 = module.vpc.vpc_default_security_group_id
  container_definition_json          = module.container_definition.json
  ecs_cluster_arn                    = aws_ecs_cluster.default.arn
  launch_type                        = var.ecs_launch_type
  vpc_id                             = module.vpc.vpc_id
  security_group_ids                 = [module.vpc.vpc_default_security_group_id]
  subnet_ids                         = module.subnets.public_subnet_ids
  tags                               = var.tags
  ignore_changes_task_definition     = var.ignore_changes_task_definition
  network_mode                       = var.network_mode
  assign_public_ip                   = var.assign_public_ip
  propagate_tags                     = var.propagate_tags
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_controller_type         = var.deployment_controller_type
  desired_count                      = var.desired_count
  task_memory                        = var.task_memory
  task_cpu                           = var.task_cpu
}

resource "aws_sns_topic" "sns_topic" {
  name         = module.label.id
  display_name = "Test terraform-aws-ecs-cloudwatch-sns-alarms"
  tags         = module.label.tags
}

module "ecs_cloudwatch_sns_alarms" {
  source       = "../../"
  namespace    = var.namespace
  stage        = var.stage
  name         = var.name
  attributes   = var.attributes
  delimiter    = var.delimiter
  tags         = var.tags
  cluster_name = aws_ecs_cluster.default.name
  service_name = module.ecs_alb_service_task.service_name

  cpu_utilization_high_threshold          = var.cpu_utilization_high_threshold
  cpu_utilization_high_evaluation_periods = var.cpu_utilization_high_evaluation_periods
  cpu_utilization_high_period             = var.cpu_utilization_high_period
  cpu_utilization_low_threshold           = var.cpu_utilization_low_threshold
  cpu_utilization_low_evaluation_periods  = var.cpu_utilization_low_evaluation_periods
  cpu_utilization_low_period              = var.cpu_utilization_low_period

  memory_utilization_high_threshold          = var.memory_utilization_high_threshold
  memory_utilization_high_evaluation_periods = var.memory_utilization_high_evaluation_periods
  memory_utilization_high_period             = var.memory_utilization_high_period
  memory_utilization_low_threshold           = var.memory_utilization_low_threshold
  memory_utilization_low_evaluation_periods  = var.memory_utilization_low_evaluation_periods
  memory_utilization_low_period              = var.memory_utilization_low_period

  cpu_utilization_high_alarm_actions = [aws_sns_topic.sns_topic.arn]
  cpu_utilization_high_ok_actions    = [aws_sns_topic.sns_topic.arn]
  cpu_utilization_low_alarm_actions  = [aws_sns_topic.sns_topic.arn]
  cpu_utilization_low_ok_actions     = [aws_sns_topic.sns_topic.arn]

  memory_utilization_high_alarm_actions = [aws_sns_topic.sns_topic.arn]
  memory_utilization_high_ok_actions    = [aws_sns_topic.sns_topic.arn]
  memory_utilization_low_alarm_actions  = [aws_sns_topic.sns_topic.arn]
  memory_utilization_low_ok_actions     = [aws_sns_topic.sns_topic.arn]
}
