variable "region" {
  description = "The region in which the resources will be created."
  default     = "us-east-1"

}

variable "availability_zone" {
  description = "The availability zone in which the resources will be created."
  default     = "us-east-1a"

}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"

}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  default     = "10.0.1.0/24"

}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  default     = "10.0.10.0/24"

}