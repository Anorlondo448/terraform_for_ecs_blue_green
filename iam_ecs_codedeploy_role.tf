###
#
# IAM Role for CodeDeploy for ECS
#
resource "aws_iam_role" "codedeploy_role" {
  name = "${var.app-name}-codedeploy-role"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_codedeploy.json
  description = "Allows CodeDeploy to call AWS services on your behalf."

  tags = {
    Name = var.app-name
  }
}

###
#
# IAM Policy Document for CodeDeploy
#
data "aws_iam_policy_document" "assume_role_codedeploy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = [
        "codepipeline.amazonaws.com",
        "codedeploy.amazonaws.com",
      ]
      type = "Service"
    }
  }
}

###
#
# Attach policy for Task Role
#
resource "aws_iam_role_policy_attachment" "codedeploy_role" {
  role = aws_iam_role.codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS"
}