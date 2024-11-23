provider "aws" {
  region = var.region
}

module "network" {
  source = "../../modules/network"

  region                    = var.region
  cidr_block                = var.vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_blocks
  private_subnet_cidr_block = var.private_subnet_cidr_blocks
  availability_zone         = var.availability_zones

}

module "security" {
  source = "../../modules/security"

  vpc_id                     = module.network.vpc_id
  allow_ingress_cidr         = var.allow_ingress_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  cidr_block                 = var.vpc_cidr_block
  allow_ingress_jumpbox_cidr = var.allow_ingress_jumpbox_cidr

}

module "compute-public" {
  source = "../../modules/compute-layer"

  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.public_subnet_ids
  is_internal           = false
  instance_type         = var.public_instance_type
  ami_id                = var.public_ami_id
  asg_desired_capacity  = var.asg_desired_capacity
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  alb_security_group_id = module.security.public_alb_security_group_id
  ec2_security_group_id = module.security.public_ec2_security_group_id
  key_name              = var.jumpbox_key_name

}


module "compute-private" {
  source = "../../modules/compute-layer"

  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.private_subnet_ids
  is_internal           = true
  instance_type         = var.private_instance_type
  ami_id                = var.private_ami_id
  asg_desired_capacity  = var.asg_desired_capacity
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  alb_security_group_id = module.security.private_alb_security_group_id
  ec2_security_group_id = module.security.private_ec2_security_group_id
  key_name              = var.jumpbox_key_name

}

module "jumpbox" {
  source = "../../modules/jumpbox"

  subnet_ids        = module.network.public_subnet_ids
  instance_type     = var.jumpbox_instance_type
  ami_id            = var.jumpbox_ami_id
  key_name          = var.jumpbox_key_name
  security_group_id = module.security.jump_box_security_group_id

}