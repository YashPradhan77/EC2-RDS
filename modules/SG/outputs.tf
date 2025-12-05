output "ec2_sg_id" {
  description = "The ID of the EC2 security group"
  value       = aws_security_group.ec2-sg.id
}

output "rds_sg_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.rds-sg.id
}