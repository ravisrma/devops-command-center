output "alb_dns_name"     { value = var.use_nlb_fallback ? aws_lb.nlb_fallback[0].dns_name : aws_lb.main[0].dns_name }
output "alb_zone_id"      { value = var.use_nlb_fallback ? aws_lb.nlb_fallback[0].zone_id : aws_lb.main[0].zone_id }
output "tg_arn_backend"   { value = aws_lb_target_group.tg_backend.arn }
output "tg_arn_frontend"  { value = aws_lb_target_group.tg_frontend.arn }
output "load_balancer_type" { value = var.use_nlb_fallback ? "network" : "application" }