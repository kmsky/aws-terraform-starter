resource "aws_iam_role" "ec2_role" {
  name               = "${var.project_name}-ec2-role"
  assume_role_policy = file("${path.module}/policies/ec2_role.json")
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  name   = "${var.project_name}-ec2-role-policy"
  role   = aws_iam_role.ec2_role.name
  policy = file("${path.module}/policies/ec2_policy.json")
}