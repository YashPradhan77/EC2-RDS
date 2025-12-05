# terraform {
#   backend "s3" {
#     bucket         = ""
#     key            = "terraform/state"
#     dynamodb_table = "terraform-state-lock-dynamo"
#     region         = "us-west-1"
#     encrypt        = true
#     acl            = "bucket-owner-full-control"
#     profile =       "my-sso"
#   }
# }

