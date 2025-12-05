resource "aws_instance" "web" {
    ami           = var.ec2_ami
    instance_type = var.ec2_instance_type
    subnet_id     = var.ec2_subnet_id[0]
    vpc_security_group_ids = var.security_groups
    # key_name = var.ec2_key_name
    associate_public_ip_address = var.associate_public_ip
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
}

resource "aws_eip" "public_ip" {
  count = var.associate_public_ip ? 1 : 0
  instance = aws_instance.web.id
  domain = "vpc"
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2-secrets-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = "EC2 role scoped to read specific Secrets Manager secrets"
}

# Build the least-privilege policy document
data "aws_iam_policy_document" "secrets_access" {
    count = length(var.secretsmanager) > 0 ? 1 : 0
  statement {
    sid    = "AllowSecretsManagerRead"
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = var.secretsmanager
  }
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-profile"
  role = aws_iam_role.ec2_role.name
}