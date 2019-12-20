###
#
# ELB (Application Load Balancer)
#
resource "aws_lb" "alb" {
  name               = var.app-name
  internal           = false
  load_balancer_type = "application"
  subnets         = [aws_subnet.public-1a.id, aws_subnet.public-1c.id, aws_subnet.public-1d.id]
  security_groups = [aws_security_group.alb.id]

  enable_deletion_protection = false

  tags = {
    Name = var.app-name
  }
}

###
#
# Listener for ALB
#
resource "aws_lb_listener" "alb" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_blue.arn
  }
}

resource "aws_lb_listener_rule" "alb" {
  listener_arn = aws_lb_listener.alb.arn

  action {
    type             = "forward"
    # CodeDeployによるBlue/Greenで変更されるが、初期値はBlueとしておく
    target_group_arn = aws_lb_target_group.target_blue.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

###
#
# Target Group for Listener
#
resource "aws_lb_target_group" "target_blue" {
  name     = "${var.app-name}-target-blue"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  target_type = "ip"

  # コンテナへの死活監視設定
  health_check {
    port = 80
    path = "/"
  }
}

resource "aws_lb_target_group" "target_green" {
  name     = "${var.app-name}-target-green"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  target_type = "ip"

  # コンテナへの死活監視設定
  health_check {
    port = 80
    path = "/"
  }
}
