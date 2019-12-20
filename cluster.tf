###
#
# ECS Cluster
#
resource "aws_ecs_cluster" "cluster" {
  name = var.app-name
}
