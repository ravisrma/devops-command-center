variable "aws_region" {}
variable "root_domain" {}
variable "frontend_repo_name" {}
variable "backend_repo_name" {}
variable "cluster_name" {}
variable "frontend_subdomain" {}
variable "backend_subdomain" {}
variable "use_nlb_fallback" {
  description = "Use Network Load Balancer instead of Application Load Balancer"
  type        = bool
  default     = true
}