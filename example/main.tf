provider "aws" {
  region = "eu-west-2"
}

module "alarms" {
  source       = "../"
  namespace    = "cp"
  stage        = "prod"
  name         = "app"
  cluster_name = "${aws_ecs_cluster.default.name}"
  service_name = ""
  enabled      = "true"
}

resource "aws_ecs_cluster" "default" {
  name = "cp-prod-app"
}
