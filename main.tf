resource "aws_vpc" "msvpc-01" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "msvpc-01"
  }
}

resource "aws_subnet" "msvpc-subnet-01" {
  vpc_id                  = aws_vpc.msvpc-01.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "msvpc-subnet-01"
  }
}

resource "aws_subnet" "msvpc-subnet-02" {
  vpc_id                  = aws_vpc.msvpc-01.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "msvpc-subnet-01"
  }
}

resource "aws_route_table" "msvpc-rt-01" {
  vpc_id = aws_vpc.msvpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.msvpc-igw-01.id
  }

  tags = {
    Name = "msvpc-rt-01"
  }
}

resource "aws_route_table_association" "ass-subnet-01" {
  subnet_id      = aws_subnet.msvpc-subnet-01.id
  route_table_id = aws_route_table.msvpc-rt-01.id
}

resource "aws_route_table_association" "ass-subnet-02" {
  subnet_id      = aws_subnet.msvpc-subnet-02.id
  route_table_id = aws_route_table.msvpc-rt-01.id
}

resource "aws_internet_gateway" "msvpc-igw-01" {
  vpc_id = aws_vpc.msvpc-01.id
  depends_on = [
    aws_vpc.msvpc-01
  ]

  tags = {
    Name = "msvpc-igw-01"
  }
}