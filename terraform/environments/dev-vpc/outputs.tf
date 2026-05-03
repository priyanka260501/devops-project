output "vpc_id" {
  description = "ID of the DEV VPC"
  value       = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.dev_public_subnet.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.dev_private_subnet.id
}

output "instance_public_ip" {
  description = "Public IP of DEV server"
  value       = aws_instance.dev_server.public_ip
}

output "instance_id" {
  description = "Instance ID of DEV server"
  value       = aws_instance.dev_server.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.dev_sg.id
}
