provider "aws" {
  region = var.region
}

# Create a new VPC
resource "aws_vpc" "lab_2-vpc" {
  cidr_block           = var.cidr_block
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
  count                   = length(var.public_subnet_cidr_block)
  vpc_id                  = aws_vpc.lab_2-vpc.id
  cidr_block              = var.public_subnet_cidr_block[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "lab_2-public-subnet"
  }
}

# Route Table   
resource "aws_route_table" "lab_2-public-route-table" {
  count  = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.lab_2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_2-igw.id
  }

  tags = {
    Name = "lab_2-public-route-table-${count.index + 1}"
  }
}

# Route Table Association
resource "aws_route_table_association" "lab_2-public-route-table-association" {
  count          = length(var.public_subnet_cidr_block)
  subnet_id      = aws_subnet.lab_2-public-subnet[count.index].id
  route_table_id = aws_route_table.lab_2-public-route-table[count.index].id
}

# Private Subnet
resource "aws_subnet" "lab_2-private-subnet" {
  count             = length(var.private_subnet_cidr_block)
  vpc_id            = aws_vpc.lab_2-vpc.id
  cidr_block        = var.private_subnet_cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "lab_2-private-subnet"
  }
}

