###
#
# Subnet(Private)
#
resource "aws_subnet" "private-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-private-1a-cidr
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.app-name}-private-1a"
  }
}

resource "aws_subnet" "private-1c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-private-1c-cidr
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.app-name}-private-1c"
  }
}

resource "aws_subnet" "private-1d" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet-private-1d-cidr
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.app-name}-private-1d"
  }
}