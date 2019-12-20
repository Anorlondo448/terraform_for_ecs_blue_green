###
#
# ECS Task Definition
#
data "aws_ecs_task_definition" "task" {
  task_definition = aws_ecs_task_definition.task.arn
}

resource "aws_ecs_task_definition" "task" {
  family = var.app-name
  container_definitions    = data.template_file.task_definitions.rendered
  # タスクが他AWSリソースへのアクセスが必要な場合にRoleを作成・付与する
  # task_role_arn            = aws_iam_role.task_role
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  network_mode             = "awsvpc"
  memory                   = "2048"
  cpu                      = "1024"
  requires_compatibilities = ["FARGATE"]
  tags = {
    Name = var.app-name
  }
}

data "template_file" "task_definitions" {
  template = <<EOF
[
    {
      "environment": [],
      "name": "${var.app-name}",
      "image": "${aws_ecr_repository.app.repository_url}:latest",
      "cpu": 128,
      "portMappings": [
        {
            "containerPort": 80,
            "hostPort": 80
        }
      ],
      "memory": 256,
      "command": [
      ],
      "essential": true
    }
  ]
  EOF
}

