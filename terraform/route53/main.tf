data "aws_route53_zone" "main" {
  name = var.root_domain
}

# Frontend DNS record - works the same for both ALB and NLB
resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.frontend_subdomain}.${var.root_domain}"
  type    = "A"
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# Backend DNS record for ALB (path-based routing)
resource "aws_route53_record" "backend_alb" {
  count   = var.load_balancer_type == "application" ? 1 : 0
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.backend_subdomain}.${var.root_domain}"
  type    = "A"
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

# Backend DNS record for NLB (port-based routing)
resource "aws_route53_record" "backend_nlb" {
  count   = var.load_balancer_type == "network" ? 1 : 0
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.backend_subdomain}.${var.root_domain}"
  type    = "A"
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
