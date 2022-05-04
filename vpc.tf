data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name           = var.vpc_name
  cidr           = var.vpc_cidr
  azs            = var.vpc_azs
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets


  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = var.vpc_tags
}