# Network Load Balancer (NLB)
resource "aws_lb" "nlb" {
  name               = "main-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "main-nlb"
  }
}

# Backend target group for NLB - using new name to avoid state conflicts
resource "aws_lb_target_group" "backend_nlb" {
  name        = "backend-nlb-tg"
  port        = 8000
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  
  health_check {
    protocol            = "TCP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
  }

  tags = {
    Name = "backend-nlb-target-group"
  }
}

# Frontend target group for NLB - using new name to avoid state conflicts
resource "aws_lb_target_group" "frontend_nlb" {
  name        = "frontend-nlb-tg"
  port        = 3000
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  
  health_check {
    protocol            = "TCP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
  }

  tags = {
    Name = "frontend-nlb-target-group"
  }
}

# Frontend listener (port 80)
resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_nlb.arn
  }
}

# Backend listener (port 8000)
resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "8000"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_nlb.arn
  }
}