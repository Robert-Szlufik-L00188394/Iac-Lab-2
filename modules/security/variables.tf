variable "vpc_id" {
  description = "The ID of the VPC."

}

variable "allow_ingress_cidr" {
  description = "CIDR blocks allowed to access the ALB."

}

variable "cidr_block" {
  description = "The CIDR block for the VPC."

}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."

}

variable "allow_ingress_jumpbox_cidr" {
  description = "CIDR blocks allowed to access the jump box."
  
}