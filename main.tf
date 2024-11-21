provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  region                    = var.region
  cidr_block                = var.cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  availability_zone         = var.availability_zone

}

# Add outputs for the VPC ID, public subnet ID, and private subnet ID.

output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC."
}

output "public_subnet_id" {
  value       = module.network.public_subnet_id
  description = "The ID of the public subnet."
}

output "private_subnet_id" {
  value       = module.network.private_subnet_id
  description = "The ID of the private subnet."
}
