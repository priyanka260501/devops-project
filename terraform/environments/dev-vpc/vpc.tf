# VPC = your private network on AWS
resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "dev-vpc"
    Environment = "DEV"
  }
}

# Internet Gateway = door between your VPC and the internet
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name        = "dev-igw"
    Environment = "DEV"
  }
}

# Route Table = traffic rules — send internet traffic through gateway
resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name        = "dev-public-rt"
    Environment = "DEV"
  }
}
