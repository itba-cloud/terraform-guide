terraform {
  required_version = "~> 1.4.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6.2"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
