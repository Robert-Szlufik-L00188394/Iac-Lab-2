
variable "stack_name" {
  description = "The name of the stack."
  default     = "dev"

}

# General
variable "region" {
  description = "The region in which the resources will be created."
  default     = "us-east-1"

}

variable "availability_zones" {
  type        = list(string)
  description = "The availability zone in which the resources will be created."
  default     = ["us-east-1a", "us-east-1b"]

}

variable "jumpbox_key_name" {
  description = "The name of the key pair to use for the instance."
  default     = "JumpboxKeyPair"
}

# Netowrk module
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"

}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR block for the public subnet."
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR block for the private subnet."
  default     = ["10.0.10.0/24", "10.0.20.0/24"]

}

# Security group module
variable "allow_ingress_cidr_block" {
  description = "CIDR blocks to allow ingress traffic from."
  default     = ["0.0.0.0/0"]

}

# Public compute module 
variable "public_instance_type" {
  description = "The type of instance to launch."
  default     = "t2.micro"

}

variable "public_ami_id" {
  description = "The AMI ID to use for the instance."
  default     = "ami-012967cc5a8c9f891"
}

# Private compute module
variable "private_instance_type" {
  description = "The type of instance to launch."
  default     = "t2.micro"

}

variable "private_ami_id" {
  description = "The AMI ID to use for the instance."
  default     = "ami-012967cc5a8c9f891"

}

# Common for both public and private compute modules
variable "asg_desired_capacity" {
  description = "Desired capacity for the public ASG."
  default     = 1
}

variable "asg_min_size" {
  description = "Minimum size for the public ASG."
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum size for the public ASG."
  default     = 3
} #

variable "allow_ingress_jumpbox_cidr" {
  description = "CIDR blocks to allow ingress traffic from."
  default     = ["0.0.0.0/0"]

}

# Jumpbox module
variable "jumpbox_ami_id" {
  description = "The AMI ID to use for the instance."
  default     = "ami-012967cc5a8c9f891"
}

variable "jumpbox_instance_type" {
  description = "The type of instance to launch."
  default     = "t2.micro"
}

