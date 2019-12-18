###
#
# Subnet(Public)
#
resource "aws_subnet" "public-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-public-1a-cidr
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.app-name}-public-1a"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-public-1c-cidr
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.app-name}-public-1c"
  }
}
resource "aws_subnet" "public-1d" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-public-1d-cidr
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.app-name}-public-1d"
  }
}