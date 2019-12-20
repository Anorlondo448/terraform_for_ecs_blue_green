resource "aws_codecommit_repository" "repository" {
  repository_name = var.app-name
  description     = "repository for sample app code."
}