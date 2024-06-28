resource "aws_ecr_repository" "ecr_repository" {
  name = var.project_name

  tags = {
    Name = var.project_name
  }
}