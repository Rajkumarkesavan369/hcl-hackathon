output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_alb.main.dns_name
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB Target Group"
  value       = module.alb.alb_target_group_arn
}

output "ecs_cluster_id" {
  description = "The ECS Cluster ID"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  description = "The ECS Service Name"
  value       = module.ecs.ecs_service_name
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr.repository_url
}

output "security_group_lb_id" {
  description = "The security group ID for the ALB"
  value       = module.securitygroup.lb_id
}

output "security_group_ecs_task_id" {
  description = "The security group ID for ECS tasks"
  value       = module.ecs_task_id
}
