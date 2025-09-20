output "alb_dns_name"     { value = aws_lb.nlb.dns_name }
output "alb_zone_id"      { value = aws_lb.nlb.zone_id }
output "alb_arn"          { value = aws_lb.nlb.arn }
output "tg_arn_backend"   { value = aws_lb_target_group.backend_nlb.arn }
output "tg_arn_frontend"  { value = aws_lb_target_group.frontend_nlb.arn }
output "load_balancer_type" { value = "network" }