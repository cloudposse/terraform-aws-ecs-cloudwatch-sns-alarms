terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.4.0"
    }
    template = {
      source  = "cloudposse/template"
      version = ">= 2.2"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.2"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}