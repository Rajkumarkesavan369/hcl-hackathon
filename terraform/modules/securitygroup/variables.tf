variable "aws_sglb_name" {
  description = "The name of the security group for LB"
  type        = string
}

variable "aws_sgecstask_name" {
  description = "The name of the security group for ecs task"
  type        = string
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  type = number
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

