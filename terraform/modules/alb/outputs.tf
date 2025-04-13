output "aws_alb" {
  description = "ALB name"
  value       = aws_alb.main.name
}

output "aws_app_tg_id" {
  description = "ALB ID"
  value       = aws_alb_target_group.app.id
}

output "aws_alb_listener" {
  description = "ALB Listener"
  value       = aws_alb_listener.front_end.id
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB Target Group"
  value       = aws_alb_target_group.app.arn
}