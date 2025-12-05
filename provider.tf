terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      Environment = local.environment
      ManagedBy   = "Terraform"
      Project     = "Demo"
    }
  }
}

locals {
  environment = terraform.workspace
}