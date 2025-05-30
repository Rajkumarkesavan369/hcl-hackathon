resource "aws_alb" "main" {
  name            = var.aws_alb
  subnets         = var.public_subnet_ids
  security_groups = var.securitygroup_lb_id
}

resource "aws_alb_target_group" "app" {
  name        = var.aws_alb_target_group
  port        = 80
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = var.protocol
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port
  protocol          = var.protocol

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = "forward"
  }
}