###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-terraform-ecs-blue-green"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    profile = "default"
  }
}