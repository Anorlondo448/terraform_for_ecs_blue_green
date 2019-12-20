# タスクが他AWSリソースへのアクセスが必要な場合にRoleを作成・付与する
# ###
# #
# # IAM Role for Task
# #
# resource "aws_iam_role" "task_role" {
#   name = "${var.app-name}-task-role"
#   path = "/"
#   assume_role_policy = data.aws_iam_policy_document.task_assume_role.json
#   description = "Allows ECS tasks to call AWS services on your behalf."

#   tags = {
#     Name = var.app-name
#   }
# }

# ###
# #
# # IAM Policy Document for ECS Task Role
# #
# data "aws_iam_policy_document" "task_assume_role" {
#   statement {
#     effect = "Allow"
#     actions = ["sts:AssumeRole"]

#     principals {
#       identifiers = ["ecs-tasks.amazonaws.com"]
#       type = "Service"
#     }
#   }
# }

# ###
# #
# # Attach policy for Task Role
# #
# resource "aws_iam_role_policy_attachment" "task_role" {
#   role = aws_iam_role.task_role.name
#   policy_arn = ""
# }