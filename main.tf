
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  # vpc_name      = "tagged"
}

module "auto_scaling_group" {
  source           = "./modules/auto_scaling_group"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity
  # vpc_subnet_ids      = var.vpc_subnet_ids
  example_subnet = module.vpc.subnet_ids
  vpc_id         = module.vpc.vpc_id
  instance_profile = "test_profile"
}

module "iam" {
  source         = "./modules/iam"
  s3_bucket_name = "${var.s3_bucket_name}-${var.env}"
}

module "s3_bucket" {
  source          = "./modules/s3_bucket"
  bucket_name     = "${var.s3_bucket_name}-${var.env}"
  log_bucket_name = "${var.log_bucket_name}-${var.env}"

}



