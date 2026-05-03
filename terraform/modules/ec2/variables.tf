variable "env_name" {
  description = "Environment name"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
}

variable "security_group_id" {
  description = "Security group ID to attach to EC2"
}
