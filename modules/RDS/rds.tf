resource "aws_db_subnet_group" "db_subnet_group" {
  count       = length(var.db_subnet_ids) > 0 ? 1 : 0
  name        = "${replace(join("-", var.db_subnet_ids), "/", "-")}-rds-subnet-group"
  subnet_ids  = var.db_subnet_ids
  description = "RDS subnet group"
}

resource "aws_db_instance" "rds" {
  allocated_storage      = var.db_allocated_storage
  db_name                = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = random_password.rds.result
  parameter_group_name   = var.db_parameter_group_name
  skip_final_snapshot    = var.db_skip_final_snapshot

  db_subnet_group_name   = try(aws_db_subnet_group.db_subnet_group[0].name, null)
  vpc_security_group_ids = var.security_groups

  publicly_accessible    = false
  multi_az               = var.db_multi_az
  backup_retention_period = var.db_backup_retention_days
  backup_window           = var.db_backup_window
  maintenance_window      = var.db_maintenance_window
  deletion_protection     = var.db_deletion_protection
  max_allocated_storage   = var.db_max_allocated_storage

  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id != "" ? var.kms_key_id : null

  lifecycle {
    prevent_destroy = false
  }
}

resource "random_password" "rds" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "rds_password" {
  name = "rds-master-password"
}

resource "aws_secretsmanager_secret_version" "rds_password" {
  secret_id     = aws_secretsmanager_secret.rds_password.id

  secret_string = jsonencode({
    username = var.db_username
    password = random_password.rds.result
  })
} 