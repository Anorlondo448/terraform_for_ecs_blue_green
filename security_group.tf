###
#
# Security Group
#

resource "aws_security_group" "alb" {
  name        = "${var.app-name}-alb"
  description = "Allow HTTP from Any"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.app-name}-alb"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}