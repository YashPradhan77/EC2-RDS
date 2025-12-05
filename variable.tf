variable "vpc_name" {
description = "The name of the VPC to be created."
}
variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC."
}
variable "enable_nat_gateway" {
    description = "Enable NAT Gateway for private subnets."
}
variable "single_nat_gateway" {
    description = "Use a single NAT Gateway for all private subnets."  
}
variable "one_nat_gateway_per_az" {
    description = "Create one NAT Gateway per availability zone."
}
variable "azs" {
    description = "List of availability zones to use for the VPC."
}
variable "public_subnets" {
    description = "List of CIDR blocks for public subnets."
}
variable "private_subnets" {
    description = "List of CIDR blocks for private subnets."
}
variable "ec2_instance_name" {
    description = "Name tag for the EC2 instance"
}
variable "ec2_ami" {
    description = "AMI ID for the EC2 instance"
}
variable "ec2_instance_type" {
    description = "Instance type for the EC2 instance"
}
variable "ec2_associate_public_ip_address" {
    description = "Whether to associate a public IP address with the EC2 instance"
}
variable "db_engine" {
    description = "The database engine to use for the RDS instance"
}
variable "db_engine_version" {
    description = "The version of the database engine"
}
variable "db_instance_class" {
    description = "The instance class for the RDS instance"
}
variable "db_username" {
    description = "Username for the RDS instance"
}
variable "db_password" {
    description = "Password for the RDS instance"
}
variable "db_parameter_group_name" {
    description = "Parameter group name for the RDS instance"
}
variable "db_skip_final_snapshot" {
    description = "Whether to skip the final snapshot when deleting the RDS instance"
}
variable "sg_ec2_name" {
    description = "Name of the security group for EC2 instances"
}
variable "sg_rds_name" {
    description = "Name of the security group for RDS instances"
}
