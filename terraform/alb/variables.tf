variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "alb_sg_id" {}
variable "use_nlb_fallback" {
  description = "Use Network Load Balancer instead of Application Load Balancer if ALB is not available"
  type        = bool
  default     = false
}