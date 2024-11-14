provider "aws" {
  region = var.AWS_REGION
}

terraform {
  required_version = ">= 1.9.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.74"
    }
  }
}