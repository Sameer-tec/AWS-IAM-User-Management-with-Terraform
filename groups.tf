resource "aws_iam_group" "educatiom" {
  name = "Education"
  path = "/groups/"
}

resource "aws_iam_group" "hr" {
  name = "hr"
  path = "/groups/"
}



resource "aws_iam_group_membership" "hr_members" {
  name = "hr-group-membership"

  users = [
    for user in aws_iam_user.users : user.name if user.tags.Department == "HR"

    
  ]

  group = aws_iam_group.hr.name
}










