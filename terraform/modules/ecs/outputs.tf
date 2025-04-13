
output "ecs_service_name" {
  description = "The ECS service name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_cluster_id" {
  description = "The ECS Cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.hcl.arn
}
