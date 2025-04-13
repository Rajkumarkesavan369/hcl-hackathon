
output "lb_id" {
  description = "LB ID"
  value       = aws_security_group.lb.arn
}

output "ecs_task_id" {
  description = "ECS TASK ID"
  value       = aws_security_group.ecs_tasks.id
}
