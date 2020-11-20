provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "rds_mod" {
  source     = "./rds"
  rds_sn_id_priv  = module.vpc_mod.private_subnet_id
  rds_sn_id_pub = module.vpc_mod.public_subnet_id
  rds_sg_id  = module.vpc_mod.security_group_id
  rds_vpc_id = module.vpc_mod.id_vpc
}

module "ec2_mod" {
  source                = "./ec2"
  instance_sn_id        = module.vpc_mod.public_subnet_id
  instance_sg_id        = module.vpc_mod.security_group_id
  ec2_vpc_id = module.vpc_mod.id_vpc
  public_ip_association = true
}

module "vpc_mod" {
  source = "./vpc"
}
