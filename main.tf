resource "aws_iam_user" "users" {
  for_each = { for user in local.users: "${user.first_name} ${user.last_name}" => user}
  name = lower("${substr(each.value.first_name,0,1)}.${each.value.last_name}")
  path = "/users/"

  tags = {
    Name = each.value.first_name
    Department = each.value.department 
    JobTitle = each.value.job_title
  }
}









resource "aws_iam_account_password_policy" "user_passwd_policy" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}


  


resource "aws_iam_user_login_profile" "user_lp" {
    for_each = aws_iam_user.users
  user    = each.value.name
  password_reset_required = true

}

