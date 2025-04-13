
variable "protocol" {
  description = "The Name of the protocol"
  type = string
}

variable "aws_alb_target_group" {
  description = "The Name Of the TG"
  type = string
}

variable "aws_alb" {
  description = "The Name Of the ALB"
  type = string
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  type = number
}

variable "health_check_path" {
  type = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "securitygroup_lb_id" {
  description = "SG"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}