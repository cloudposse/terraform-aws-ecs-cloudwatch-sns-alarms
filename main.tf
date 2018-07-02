data "aws_caller_identity" "default" {}

locals {
  enabled = "${var.enabled == "true" ? 1 : 0}"
}
