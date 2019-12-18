###
#
# Variables
#

# AWSのIDなどを取得するdata
data "aws_caller_identity" "current" {}

## 識別子として名前を指定します
variable "app-name" {
  default = "ecs-blue-green"
}

## AWS上で使用するリージョンを指定します
variable "region" {
  default = "ap-northeast-1"
}

# VPCのCIDR
variable "vpc-cidr" {
  default = "10.1.0.0/16"
}

# Subnet(Public)のCIDR
variable "subnet-public-1a-cidr" {
  default = "10.1.1.0/24"
}
variable "subnet-public-1c-cidr" {
  default = "10.1.2.0/24"
}
variable "subnet-public-1d-cidr" {
  default = "10.1.3.0/24"
}

# Subnet(Private)のCIDR
variable "subnet-private-1a-cidr" {
  default = "10.1.11.0/24"
}
variable "subnet-private-1c-cidr" {
  default = "10.1.12.0/24"
}
variable "subnet-private-1d-cidr" {
  default = "10.1.13.0/24"
}

