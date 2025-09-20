variable "alb_dns_name" {}
variable "alb_zone_id" {}
variable "root_domain" {}
variable "frontend_subdomain" {}
variable "backend_subdomain" {}
variable "load_balancer_type" {
  description = "Type of load balancer: application or network"
  type        = string
  default     = "application"
}
variable "backend_port" {
  description = "Backend port for NLB direct access"
  type        = number
  default     = 8000
}