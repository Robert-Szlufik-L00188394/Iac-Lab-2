provider "aws" {
  region = "us-east-1"
}

# Create a new VPC
resource "aws_vpc" "lab_2-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "lab_2-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "lab_2-igw" {
  vpc_id = aws_vpc.lab_2-vpc.id

  tags = {
    Name = "lab_2-igw"
  }
}

# Public Subnet
resource "aws_subnet" "lab_2-public-subnet" {
  vpc_id                  = aws_vpc.lab_2-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab_2-public-subnet"
  }
}

# Route Table   
resource "aws_route_table" "lab_2-public-route-table" {
  vpc_id = aws_vpc.lab_2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_2-igw.id
  }

  tags = {
    Name = "lab_2-public-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "lab_2-public-route-table-association" {
  subnet_id      = aws_subnet.lab_2-public-subnet.id
  route_table_id = aws_route_table.lab_2-public-route-table.id
}

# Private Subnet
resource "aws_subnet" "lab_2-private-subnet" {
  vpc_id            = aws_vpc.lab_2-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "lab_2-private-subnet"
  }
}

