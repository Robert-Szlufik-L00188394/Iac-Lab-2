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

  vpc_id                   = module.network.vpc_id
  allow_ingress_cidr       = var.allow_ingress_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  cidr_block               = var.cidr_block
  allow_ingress_jumpbox_cidr = var.allow_ingress_jumpbox_cidr

}

module "compute-public" {
  source = "./modules/compute-layer"

  vpc_id                = module.network.vpc_id
  subnet_id             = module.network.public_subnet_id
  is_internal           = false
  instance_type         = var.public_instance_type
  ami_id                = var.public_ami_id
  asg_desired_capacity  = var.asg_desired_capacity
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  alb_security_group_id = module.security.public_alb_security_group_id
  ec2_security_group_id = module.security.public_ec2_security_group_id

}


module "compute-private" {
  source = "./modules/compute-layer"

  vpc_id                = module.network.vpc_id
  subnet_id             = module.network.private_subnet_id
  is_internal           = true
  instance_type         = var.private_instance_type
  ami_id                = var.private_ami_id
  asg_desired_capacity  = var.asg_desired_capacity
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  alb_security_group_id = module.security.private_alb_security_group_id
  ec2_security_group_id = module.security.private_ec2_security_group_id

}