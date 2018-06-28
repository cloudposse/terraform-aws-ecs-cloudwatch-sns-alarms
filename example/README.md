# Example usage of the Alarm for monitoring the ECR cluster metric alone.

To test this example, clone the repoistry, cd into this example directory and run:
```bash
terraform init
terraform apply
```
A new empty cluster will be created in London region, and two metric alarms will be created for memory and cpu usage.

```hcl
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

```