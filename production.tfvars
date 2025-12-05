# VPC
vpc_name = "main-vpc"
vpc_cidr_block = "10.0.0.0/16"
enable_nat_gateway = true
single_nat_gateway = true
one_nat_gateway_per_az = false
azs = ["us-west-1a","us-west-1c"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

# EC2
ec2_instance_name = "web_instance"
ec2_ami = "ami-03978d951b279ec0b"
ec2_instance_type = "t3.micro"
# ec2_key_name = "main"
ec2_associate_public_ip_address = true

# RDS
db_engine = "mysql"
db_engine_version = "8.0"
db_instance_class = "db.t3.micro"
db_username = "admin"
db_password = "admin123"
db_parameter_group_name = "default.mysql8.0"
db_skip_final_snapshot = true

# SECURITY GROUP NAMES
sg_ec2_name = "ec2-security-group"
sg_rds_name = "rds-security-group"
