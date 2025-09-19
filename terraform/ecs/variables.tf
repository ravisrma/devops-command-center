variable "cluster_name" {}
variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "ecs_sg_id" {}
variable "backend_repo_url" {}
variable "frontend_repo_url" {}
variable "tg_arn_backend" {}
variable "tg_arn_frontend" {}