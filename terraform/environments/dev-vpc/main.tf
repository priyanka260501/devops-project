# Tells Terraform to use AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Sets the AWS region from variables
provider "aws" {
  region = var.region
}
