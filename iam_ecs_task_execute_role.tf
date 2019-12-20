###
#
# IAM Role for Task Execution
#
resource "aws_iam_role" "task_execution_role" {
  name               = "${var.app-name}-task-execution-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_task_execution.json
  description        = "Allows ECS tasks to call AWS services on your behalf."

  tags = {
    Name = var.app-name
  }
}

###
#
# IAM Policy Document for ECS Task Execution Role
#
data "aws_iam_policy_document" "assume_role_task_execution" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type        = "Service"
    }
  }
}

###
#
# Attach policy for Task Role
#
resource "aws_iam_role_policy_attachment" "task_execution_role" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}