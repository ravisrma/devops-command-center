output "alb_dns_name"     { value = aws_lb.main.dns_name }
output "alb_zone_id"      { value = aws_lb.main.zone_id }
output "tg_arn_backend"   { value = aws_lb_target_group.tg_backend.arn }
output "tg_arn_frontend"  { value = aws_lb_target_group.tg_frontend.arn }