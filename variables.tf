###
#
# Variables
#

## 識別子として名前を指定します
variable "app-name" {
  type    = "string"
  default = "anorlondo448"
}

## 識別子として環境を指定します
variable "env-short" {
  type    = "string"
  default = "dev"
}

## AWS上で使用するリージョンを指定します
variable "region" {
  type    = "string"
  default = "ap-northeast-1"
}

data "aws_caller_identity" "current" {}