data "aws_caller_identity" "user_ci" {}

output "account_id" {
  value = data.aws_caller_identity.user_ci
}