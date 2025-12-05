variable "ec2_ami" {
  description = "AMI ID used for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# variable "ec2_key_name" {
#   description = "EC2 key pair name"
#   type        = string
# }

variable "security_groups" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
}

variable "ec2_subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = list(string)
  default     = []

}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "WebServerInstance"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance"
  type        = bool
  default     = true
}

variable "secretsmanager" {
  description = "List of Secrets Manager secret ARNs the instance must be allowed to read"
  type        = list(string)
  default = [ ]
}