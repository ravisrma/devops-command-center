output "frontend_url" {
  value = "http://${var.frontend_subdomain}.${var.root_domain}"
}
output "backend_url" {
  value = "http://${var.backend_subdomain}.${var.root_domain}"
}