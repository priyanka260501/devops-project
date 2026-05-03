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

# Calls VPC module with QA specific values
# Notice different CIDR ranges from DEV — 10.1.x.x instead of 10.0.x.x
module "vpc" {
  source = "../../modules/vpc"

  env_name            = "qa"
  vpc_cidr            = "10.1.0.0/16"
  public_subnet_cidr  = "10.1.1.0/24"
  private_subnet_cidr = "10.1.2.0/24"
  availability_zone   = "ap-south-1a"
}

# Calls EC2 module using outputs from VPC module
module "ec2" {
  source = "../../modules/ec2"

  env_name          = "qa"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}
