variable "ec2_sg_name" {
  description = "Name of the security group for EC2 instances"
  type        = string
  default     = "ec2-security-group"
}

variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "rds_sg_name" {
  description = "Name of the security group for RDS instances"
  type        = string
  default     = "rds-security-group"
}