terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "hcl-terraform-ecs-state-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hcl-dynamo-db-table"
    use_lockfile   = true
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  aws_cluster_name     = var.aws_cluster_name
}

module "ecs" {
  source = "./modules/ecs"

  aws_cluster_name          = var.aws_cluster_name
  app_port                  = var.app_port
  app_count                 = var.app_count
  private_subnet_ids        = module.vpc.private_subnet_ids
  public_subnet_ids         = module.vpc.public_subnet_ids
  image_url                 = ["${module.ecr.repository_url}:latest"]
  sg_ecs_task_id            = ["${module.securitygroup.ecs_task_id}"]
  alb_app_tg_id             = module.alb.aws_app_tg_id
  alb_listener              = module.alb.aws_alb_listener
  depends_on                = [ module.alb ]
}

module "alb" {
  source = "./modules/alb"

  protocol                = var.protocol
  aws_alb_target_group    = var.aws_alb_target_group
  aws_alb                 = var.aws_alb
  app_port                = var.app_port
  health_check_path       = var.health_check_path
  public_subnet_ids       = module.vpc.public_subnet_ids
  securitygroup_lb_id     = ["${module.securitygroup.lb_id}"]
  vpc_id                  = module.vpc.vpc_id
  depends_on              = [module.securitygroup]
  
}

module "ecr" {
  source = "./modules/ecr"

  repository_name   = var.repository_name
}

module "securitygroup" {
  source = "./modules/securitygroup"

  aws_sglb_name         = var.aws_sglb_name
  aws_sgecstask_name    = var.aws_sgecstask_name
  app_port              = var.app_port
  vpc_id                = module.vpc.vpc_id

}