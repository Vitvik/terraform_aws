module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = var.eks_name
  cluster_version = var.eks_version
  cluster_endpoint_private_access = true
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
  control_plane_subnet_ids = module.vpc.intra_subnets

  enable_efa_support = true

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["m5.large"]
    #

    attach_cluster_primary_security_group = true
  }
  
  eks_managed_node_groups = {
    vitvik_mn = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.large"]
      #t3.large t2.micro
      capacity_type  = "SPOT"

      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  
  enable_cluster_creator_admin_permissions = true

  tags = var.tags
}