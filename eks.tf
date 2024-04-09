module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = var.eks_name
  cluster_version = var.eks_version
  

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.instance_types
  }

  eks_managed_node_groups = {
    vitvik_mn = {
      min_size     = 1
      max_size     = 6
      desired_size = 1

      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  tags = var.tags
}