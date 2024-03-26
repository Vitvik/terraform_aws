variable "region" {
  #default region to deploy infrastructure
  type    = string
  default = "eu-west-1"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Test"
    Terraform   = "true"
  }
}

// VPC
/*
variable "vpc_id" {
  type = string
}
*/
variable "vpc_name" {
  description = "default vpc name"
  type    = string
  default = "vitvik-test-vpc"
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}


variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
//ECS
variable "eks_name" {
  description = "Name of the Amazon EKS cluster"
  type        = string
  default     = "vitvik-test-cluster"
}
variable "eks_version" {
  description = "Version of the Amazon EKS cluster"
  type        = string
  default     = "1.29"
}
variable "instance_types" {
  description = "List of EC2 instance types for your EKS node groups"
  type        = list(string)
  default     = ["t2.micro", "t3.micro"]
}

variable "capacity_type" {
  description = "Type of capacity for EKS node groups"
  type        = string
  default     = "ON_DEMAND"
}

variable "principal_arn" {
  description = "ARN of the principal to whom access is granted to the Amazon EKS cluster"
  type        = string
  default     = "arn:aws:iam::638436445856:role/VitVikEksClusterRole"
}
variable "policy_arn" {
  description = "ARN of the IAM policy to associate with the access entry"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


//ECR
variable "ecr_name" {
  description = "Name of the Elastic Container Registry (ECR) repository"
  type        = string
  default     = "vitvik_ecr_back_images"
}
//S3
variable "aws_s3_bucket" {
  #default bucket name
  type    = string
  default = "vitvik-test-front"
}

variable "acl" {
  #default acl // private public-read
  type    = string
  default = "private"
}

// CloudFront
variable "default_root_object" {
  #default_root_object
  type    = string
  default = "index.html"
}

variable "comment" {
  #comment
  type    = string
  default = "Terraform CFD created"
}
            
