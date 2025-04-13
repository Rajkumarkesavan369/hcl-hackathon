resource "aws_ecs_cluster" "main" {
  name = var.aws_cluster_name
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "appointment-app"
      image     = var.image_url
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
        }
      ]
    },
    {
      name      = "second"
      image     = "service-second"
      cpu       = 10
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-south-1a, ap-south-1b]"
  }
}

resource "aws_iam_role" "hcl" {
  name = "ecs-fargate-profile"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role = aws_iam_role.hcl.arn

}

resource "aws_ecs_service" "main" {
  name            = "hcl-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups   = var.sg_ecs_task_id
    subnets           = var.private_subnet_ids
    assign_public_ip  = false
  }

  load_balancer {
    target_group_arn = var.alb_app_tg_id
    container_name   = "appointment-app"
    container_port   = var.app_port
  }

}