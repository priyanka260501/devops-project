# Creates EC2 instance using values passed from environment
resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name        = "${var.env_name}-server"
    Environment = var.env_name
    Project     = "devops-project"
  }
}
