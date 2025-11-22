provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = "devops-vpc"
  cidr = "10.0.0.0/16"
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
}

data "aws_availability_zones" "available" {}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "devops-eks"
  cluster_version = "1.28"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}
