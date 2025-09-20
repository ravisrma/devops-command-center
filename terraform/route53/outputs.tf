output "frontend_url" {
  value = "http://${var.frontend_subdomain}.${var.root_domain}"
}

output "backend_url" {
  value = "http://${var.backend_subdomain}.${var.root_domain}:8000"
}

output "load_balancer_info" {
  value = {
    type = "network"
    frontend_access = "http://${var.frontend_subdomain}.${var.root_domain}"
    backend_access = "http://${var.backend_subdomain}.${var.root_domain}:8000"
    note = "NLB: Frontend on port 80, Backend on port 8000"
  }
}