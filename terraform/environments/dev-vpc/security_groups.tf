# Security Group = firewall for your EC2 instance
resource "aws_security_group" "dev_sg" {
  name        = "dev-security-group"
  description = "Security group for DEV environment"
  vpc_id      = aws_vpc.dev_vpc.id

  # Allow SSH from anywhere — so you can connect to EC2
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP traffic — for web applications
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS traffic — for secure web applications
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic — EC2 can reach the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "dev-sg"
    Environment = "DEV"
  }
}

# EC2 instance inside the VPC with security group attached
resource "aws_instance" "dev_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.dev_public_subnet.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  tags = {
    Name        = "dev-server"
    Environment = "DEV"
    Project     = "devops-project"
  }
}
