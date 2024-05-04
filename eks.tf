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
  control_plane_subnet_ids = module.vpc.private_subnets
  #module.vpc.intra_subnets

  #enable_efa_support = true
  create_cluster_security_group = false
  create_node_security_group = false

  cluster_security_group_additional_rules = {
    name        = "Allow all"
    description = "Allow all traffic"
    ingress = {
      description = "Allow all inbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress = {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      
    }

    tags = {
      Name = "Home to bastion"
    }
  }

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
     
      capacity_type  = "SPOT"

      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  
  enable_cluster_creator_admin_permissions = true

  tags = var.tags
}
