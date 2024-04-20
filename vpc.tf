module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  intra_subnets = var.intra_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true
  
  enable_nat_gateway = true
  
  enable_vpn_gateway = true
  one_nat_gateway_per_az = false

  # Required for public EKS nodes. 
  map_public_ip_on_launch = true

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"               = 1
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"                        = 1
    "kubernetes.io/cluster/${var.eks_name}" = "owned"
  }

  tags = var.tags
}