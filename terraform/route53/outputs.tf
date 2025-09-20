output "frontend_url" {
  value = "http://${var.frontend_subdomain}.${var.root_domain}"
}

output "backend_url" {
  value = var.load_balancer_type == "network" ? "http://${var.backend_subdomain}.${var.root_domain}:${var.backend_port}" : "http://${var.backend_subdomain}.${var.root_domain}/api"
}

output "load_balancer_info" {
  value = {
    type = var.load_balancer_type
    frontend_access = "http://${var.frontend_subdomain}.${var.root_domain}"
    backend_access = var.load_balancer_type == "network" ? "http://${var.backend_subdomain}.${var.root_domain}:${var.backend_port}" : "http://${var.backend_subdomain}.${var.root_domain}/api"
    note = var.load_balancer_type == "network" ? "NLB: Backend accessible on port ${var.backend_port}" : "ALB: Backend accessible via /api path"
  }
}