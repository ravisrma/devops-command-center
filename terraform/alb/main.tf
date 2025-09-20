# Application Load Balancer (preferred)
resource "aws_lb" "main" {
  count              = var.use_nlb_fallback ? 0 : 1
  name               = "main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets
}

# Network Load Balancer (fallback)
resource "aws_lb" "nlb_fallback" {
  count              = var.use_nlb_fallback ? 1 : 0
  name               = "main-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "tg_backend" {
  name         = "tg-backend"
  port         = 8000
  protocol     = var.use_nlb_fallback ? "TCP" : "HTTP"
  vpc_id       = var.vpc_id
  target_type  = "ip"
  
  dynamic "health_check" {
    for_each = var.use_nlb_fallback ? [] : [1]
    content {
      path                = "/"
      interval            = 30
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
      matcher             = "200-399"
    }
  }

  dynamic "health_check" {
    for_each = var.use_nlb_fallback ? [1] : []
    content {
      protocol            = "TCP"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}

resource "aws_lb_target_group" "tg_frontend" {
  name         = "tg-frontend"
  port         = 3000
  protocol     = var.use_nlb_fallback ? "TCP" : "HTTP"
  vpc_id       = var.vpc_id
  target_type  = "ip"
  
  dynamic "health_check" {
    for_each = var.use_nlb_fallback ? [] : [1]
    content {
      path                = "/"
      interval            = 30
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
      matcher             = "200-399"
    }
  }

  dynamic "health_check" {
    for_each = var.use_nlb_fallback ? [1] : []
    content {
      protocol            = "TCP"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = var.use_nlb_fallback ? aws_lb.nlb_fallback[0].arn : aws_lb.main[0].arn
  port              = 80
  protocol          = var.use_nlb_fallback ? "TCP" : "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_frontend.arn
  }
}

# Listener rule only works with ALB, not NLB
resource "aws_lb_listener_rule" "api_path" {
  count        = var.use_nlb_fallback ? 0 : 1
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_backend.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
}

# For NLB, we need separate listeners for backend
resource "aws_lb_listener" "nlb_backend" {
  count             = var.use_nlb_fallback ? 1 : 0
  load_balancer_arn = aws_lb.nlb_fallback[0].arn
  port              = 8000
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_backend.arn
  }
}