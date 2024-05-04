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
  default     = "10.123.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"] 
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["10.123.1.0/24", "10.123.2.0/24"] 
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.123.3.0/24", "10.123.4.0/24"] 
}

variable "intra_subnets" {
  description = "List of intra subnets"
  type        = list(string)
  default     = ["10.123.5.0/24", "10.123.6.0/24"] 
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
  default     = ["t3.large"]
}

variable "capacity_type" {
  description = "Type of capacity for EKS node groups"
  type        = string
  default     = "SPOT"
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
         
