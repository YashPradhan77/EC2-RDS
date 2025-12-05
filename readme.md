# 1. Overview

This project provisions an AWS VPC, an EC2 instance, and an RDS database using a modular Terraform design.
The configuration follows established infrastructure best practices, including:

* Remote state management (S3 backend)

* State locking (DynamoDB)

* Variable standardization

* Locals for shared or repeated values

* Reusable, isolated modules

Module Behavior :-

Each module creates AWS resources following a predictable pattern.

Outputs from one module can be passed as inputs to another.

Modules avoid implicit dependencies; explicit variables control relationships.

---

# Secure Credential Management

RDS database credentials are generated using the Terraform random_password resource, eliminating the possibility of hard-coded or reused secrets.

The generated password, along with the database username, is automatically stored in AWS Secrets Manager as a managed secret. Terraform injects metadata tags tied to the active workspace, ensuring secrets remain environment-specific.

The EC2 instance retrieves the credentials programmatically at runtime using:

An IAM role with least-privilege access to the specific secret

The AWS Systems Manager or AWS CLI runtime access pattern

This prevents plaintext credentials from ever being embedded in Terraform logs, Git repositories, or user input.

---

# Backend Requirements (remote state)

You must pre-create:

* An S3 bucket for remote state

* A DynamoDB table for state locking (partition key LockID)

---

# Deployment Instructions
## **1. Initialize Terraform**
``` bash
terraform init
```
## **2. Validate Terraform**
```bash
terraform validate
```
## **3. Plan & Apply Infrastructure**
```bash
terraform plan
terraform apply
```
---

# Managing Environments with Terraform Workspaces

This project uses Terraform workspaces to separate state and configuration across environments such as staging and production. The active workspace name is automatically applied to resource tags and module configuration using terraform.workspace.

Create and switch workspaces as follows:
```bash
terraform workspace new staging
terraform workspace new production

terraform workspace select staging
terraform plan  -var-file="staging.tfvars"
terraform apply -var-file="staging.tfvars"

terraform workspace select production
terraform plan  -var-file="production.tfvars"
terraform apply -var-file="production.tfvars"
```
---

# Best Practices and Design Choices

Load Balancer Recommendation:- 

* Placing EC2 behind an ALB or NLB is a better design choice for:

* Zero-downtime deployments

* Health checks

* Controlled ingress

* Scalability

While not force-enabled, this is strongly recommended.