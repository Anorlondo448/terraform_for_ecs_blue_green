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

resource "aws_security_group" "ecs_service" {
  name        = "${var.app-name}-ecs-service"
  description = "Allow HTTP from ALB"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "${var.app-name}-ecs-service"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups      = [aws_security_group.alb.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}