provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "ecr" {
  source = "./ecr"
  frontend_repo_name = var.frontend_repo_name
  backend_repo_name  = var.backend_repo_name
}

module "alb" {
  source         = "./alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "ecs" {
  source             = "./ecs"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  private_subnets    = module.vpc.private_subnets
  ecs_sg_id          = module.sg.ecs_sg_id
  backend_repo_url   = module.ecr.backend_repo_url
  frontend_repo_url  = module.ecr.frontend_repo_url
  tg_arn_backend     = module.alb.tg_arn_backend
  tg_arn_frontend    = module.alb.tg_arn_frontend
}

module "route53" {
  source             = "./route53"
  alb_dns_name       = module.alb.alb_dns_name
  alb_zone_id        = module.alb.alb_zone_id
  root_domain        = var.root_domain
  frontend_subdomain = var.frontend_subdomain
  backend_subdomain  = var.backend_subdomain
}