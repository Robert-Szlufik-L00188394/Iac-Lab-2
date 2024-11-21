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

module "security" {
  source = "./modules/security"

  vpc_id             = module.network.vpc_id
  allow_ingress_cidr = var.allow_ingress_cidr_block

}

module "compute-public" {
  source = "./modules/compute-public"

  vpc_id                = module.network.vpc_id
  public_subnet_id      = module.network.public_subnet_id
  instance_type         = var.instance_type
  ami_id                = var.ami_id
  asg_desired_capacity  = var.asg_desired_capacity
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  alb_security_group_id = module.security.alb_security_group_id
  ec2_security_group_id = module.security.ec2_security_group_id

}
