

variable "region" {
  description = "AWS region"    
  
}
variable "cidr_block" {
  description = "CIDR block for the VPC"

}

variable "public_subnet_cidr_block" {
  description = "CIDR blocks for public subnets"

}

variable "private_subnet_cidr_block" {
  description = "CIDR blocks for private subnets"

}

variable "availability_zone" {
  description = "List of availability zones"

}
