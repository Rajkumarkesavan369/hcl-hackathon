
variable "aws_cluster_name" {
  description = "The cluster name of Fargate"
  type = string
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  type = number
}

variable "app_count" {
  description = "Number of docker containers to run"
  type = number
}

variable "sg_ecs_task_id" {
  description = "SG ECS TASK ID"
  type        = list(string)
}

variable "alb_app_tg_id" {
  description = "SG ECS TASK ID"
  type        = string
}

variable "alb_listener" {
  description = "SG ECS TASK ID"
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "image_url" {
  type = list(string)
}