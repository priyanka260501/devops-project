variable "env_name" {
  description = "Environment name e.g. dev, qa"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
}

variable "availability_zone" {
  description = "AWS availability zone"
  default     = "ap-south-1a"
}
