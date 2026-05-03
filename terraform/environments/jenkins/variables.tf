variable "aws_region" {
  description = "AWS region to deploy Jenkins"
  type        = string
  default     = "ap-south-1"
}

variable "key_name" {
  description = "Name of your EC2 Key Pair for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your local machine IP (format: x.x.x.x/32) for SSH and Jenkins UI access"
  type        = string
}
