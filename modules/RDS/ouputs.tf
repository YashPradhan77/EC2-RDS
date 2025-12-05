output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.rds.endpoint
}

output "secretsmanager_arn" {
  description = "The ARN of the Secrets Manager secret for RDS password"
  value       = aws_secretsmanager_secret.rds_password.arn
}