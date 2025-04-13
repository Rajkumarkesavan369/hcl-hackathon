
variable "aws_cluster_name" {
  description = "The cluster name of Fargate"
  default     = "hcl-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default = "myEcsAutoScaleRole"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "repository_name" {
  description = "The Name Of the Repository"
  default = "hcl-project"
}

variable "protocol" {
  description = "The Name of the protocol"
  default = "HTTP"
}

variable "aws_alb_target_group" {
  description = "The Name Of the TG"
  default = "hcl-target-group"
}

variable "aws_alb" {
  description = "The Name Of the ALB"
  default = "hcl-load-balancer"
}

variable "health_check_path" {
  default = "/"
}

variable "aws_sglb_name" {
  description = "The name of the security group"
  default = "hcl-load-balancer-security-group"
}

variable "aws_sgecstask_name" {
  description = "The name of the security group for ecs task"
  default     = "hcl-ecs-task-security-group"
}