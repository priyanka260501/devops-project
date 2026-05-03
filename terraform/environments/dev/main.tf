# Tells Terraform to use AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Calls VPC module with DEV specific values
module "vpc" {
  source = "../../modules/vpc"

  env_name            = "dev"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "ap-south-1a"
}

# Calls EC2 module using outputs from VPC module
module "ec2" {
  source = "../../modules/ec2"

  env_name          = "dev"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}
