module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

}

module "ec2" {
  source = "./modules/EC2"

  instance_name       = var.ec2_instance_name
  ec2_ami             = var.ec2_ami
  ec2_instance_type   = var.ec2_instance_type
  ec2_subnet_id       = module.vpc.public_subnets
  security_groups     = [module.sg.ec2_sg_id]
  associate_public_ip = var.ec2_associate_public_ip_address
  secretsmanager = [module.rds.secretsmanager_arn]
}

module "rds" {
  source = "./modules/RDS"

  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_instance_class       = var.db_instance_class
  db_username             = var.db_username
  db_password             = var.db_password
  db_parameter_group_name = var.db_parameter_group_name
  db_skip_final_snapshot  = var.db_skip_final_snapshot

  db_subnet_ids   = module.vpc.private_subnets
  security_groups = [module.sg.rds_sg_id]
}

module "sg" {
  source = "./modules/SG"

  vpc_id      = module.vpc.vpc_id
  ec2_sg_name = var.sg_ec2_name
  rds_sg_name = var.sg_rds_name

}
