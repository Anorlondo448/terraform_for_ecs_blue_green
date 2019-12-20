###
#
# ECS Service
#
resource "aws_ecs_service" "service" {
  name          = var.app-name
  cluster       = aws_ecs_cluster.cluster.id
  desired_count = 1
  launch_type = "FARGATE"
  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 100
  health_check_grace_period_seconds = 300

  deployment_controller {
    type = "CODE_DEPLOY" 
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_blue.arn
    container_name   = var.app-name
    container_port   = 80
  }

  task_definition = aws_ecs_task_definition.task.arn
  lifecycle {
    ignore_changes = [
      task_definition,
    ]
  }
  network_configuration {
    subnets         = [aws_subnet.public-1a.id, aws_subnet.public-1c.id, aws_subnet.public-1d.id]
    security_groups = [aws_security_group.ecs_service.id]
    assign_public_ip = false
  }
}