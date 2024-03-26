provider "aws" {
  #region is using variables.tf file
  region = var.region
}
/*
module "vpc" {
  source = "./modules/vpc"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = var.tags
}
*/
/*
module "eks" {
  source  = "./modules/eks"

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
    example = {
      min_size     = 1
      max_size     = 10
      desired_size = 2

      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # One access entry with a policy associated
    example = {
      principal_arn     = var.principal_arn
      policy_associations = {
        example = {
          policy_arn = var.policy_arn
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
        }
        }
      }
    }
  }

  tags = var.tags
}
*/
/*
//ECR
resource "aws_ecr_repository" "vitvik_ecr_back" {
  name = var.ecr_name
}
*/

// S3
module "s3" {
  source = "./modules/s3-bucket"
  bucket = var.aws_s3_bucket
  acl    = var.acl

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  //false - public access
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true

#"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1J8JCHSCPEG4Z"
#"Resource": "arn:aws:s3:::vitvik-test-front/*"
  policy = <<EOF
{
  "Version": "2008-10-17",
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${element(module.cloudfront.cloudfront_origin_access_identity_iam_arns, 0)}"
      },
      "Action": "s3:GetObject",
      "Resource": "${module.s3.s3_bucket_arn}/*"
    }
  ]
}
EOF
  # Allow deletion of non-empty bucket
  force_destroy = true
  versioning = {
    enabled = true
  }
  tags = var.tags
}
// CloudFront
module "cloudfront" {
  source = "./modules/cloudfront"
  enabled             = true
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = var.default_root_object
  comment             = var.comment
  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_front = "My CloudFront can access to s3 Front"
  }
  /*
  logging_config = {
    bucket = "logs-my-cdn.s3.amazonaws.com"
  }
*/
  origin = {
 
    s3_front = {
      domain_name = module.s3.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket_front"
      }
    }
  }
  default_cache_behavior = {
    target_origin_id           = "s3_front"
    viewer_protocol_policy     = "allow-all"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }
  tags = var.tags
}

