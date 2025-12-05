variable "db_allocated_storage" {
  description = "Size of the RDS storage in GB"
  type        = number
  default     = 10
}

variable "db_name" {
  description = "Initial database name to create"
  type        = string
  default     = "mydb"
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master password for RDS (sensitive)"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  description = "DB parameter group name"
  type        = string
  default     = "default.mysql8.0"
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot on destroy (true for dev only)"
  type        = bool
  default     = true
}

# Networking inputs
variable "db_subnet_ids" {
  description = "List of subnet IDs for RDS subnet group (private subnets)"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs to associate with the RDS instance"
  type        = list(string)
}
# Operational / optional
variable "db_multi_az" {
  type    = bool
  default = false
}

variable "db_backup_retention_days" {
  type    = number
  default = 7
}

variable "db_backup_window" {
  type    = string
  default = "03:00-04:00"
}

variable "db_maintenance_window" {
  type    = string
  default = "sun:05:00-sun:06:00"
}

variable "db_deletion_protection" {
  type    = bool
  default = false
}

variable "db_max_allocated_storage" {
  type    = number
  default = 0
}

variable "storage_encrypted" {
  description = "Enable storage encryption for RDS"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key id to use for encryption (optional)"
  type        = string
  default     = ""
}
