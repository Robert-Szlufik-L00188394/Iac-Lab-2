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
