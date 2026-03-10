module "network" {
  source = "../modules/network"

  project_name   = var.project_name
  environment    = var.environment
  container_port = var.container_port
}

module "alb" {
  source = "../modules/alb"

  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = module.network.vpc_id
  subnets        = module.network.public_subnets
  security_group = module.network.alb_sg
  container_port = var.container_port
}

module "ecs" {
  source = "../modules/ecs"

  project_name     = var.project_name
  environment      = var.environment
  docker_image     = var.docker_image
  image_tag        = var.image_tag
  container_port   = var.container_port
  aws_region       = var.aws_region
  desired_count    = var.desired_count
  subnets          = module.network.public_subnets
  security_group   = module.network.ecs_sg
  target_group_arn = module.alb.target_group_arn
}