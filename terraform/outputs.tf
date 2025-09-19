output "backend_ecr_repo_url"  { value = module.ecr.backend_repo_url }
output "frontend_ecr_repo_url" { value = module.ecr.frontend_repo_url }
output "alb_dns_name"          { value = module.alb.alb_dns_name }
output "backend_url"           { value = module.route53.backend_url }
output "frontend_url"          { value = module.route53.frontend_url }