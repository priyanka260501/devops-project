# Public subnet — resources here can reach the internet
resource "aws_subnet" "dev_public_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "dev-public-subnet"
    Environment = "DEV"
  }
}

# Private subnet — no direct internet access, more secure
resource "aws_subnet" "dev_private_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "dev-private-subnet"
    Environment = "DEV"
  }
}

# Associates public subnet with the route table so it gets internet access
resource "aws_route_table_association" "dev_public_rta" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

