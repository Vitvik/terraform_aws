
// VPC 
/*
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}
output "public_subnets" {
  description = "LList of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}
*/

// EKS 
output "eks_cluster_id" {
  description = "The ID of the EKS cluster. Note: currently a value is returned only for local EKS clusters created on Outposts"
  value = module.eks.cluster_id
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_ip_family" {
  description = "The IP family used by the cluster (e.g. `ipv4` or `ipv6`)"
  value       = module.eks.cluster_ip_family
}

output "cluster_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the cluster security group"
  value       = module.eks.cluster_security_group_arn
}

output "cluster_security_group_id" {
  description = "ID of the cluster security group"
  value       = module.eks.cluster_security_group_id
}

output "node_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the node shared security group"
  value       = module.eks.node_security_group_arn
}

output "node_security_group_id" {
  description = "ID of the node shared security group"
  value       = module.eks.node_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM role name of the EKS cluster"
  value       = module.eks.cluster_iam_role_name
}
output "cluster_certificate_authority_data" {
  description = "cluster_certificate_authority_data"
  value       = module.eks.cluster_certificate_authority_data
}

/*
//ECR
output "ecr_repository_url" {
  value = aws_ecr_repository.vitvik_ecr_back.repository_url
}
*/
// S3 
/*
output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  value = module.s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  value = module.s3.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_hosted_zone_id" {
  value = module.s3.s3_bucket_hosted_zone_id
}

output "s3_bucket_id" {
  value = module.s3.s3_bucket_id
}

output "s3_bucket_lifecycle_configuration_rules" {
  value = module.s3.s3_bucket_lifecycle_configuration_rules
}

output "s3_bucket_policy" {
  value = module.s3.s3_bucket_policy
}

output "s3_bucket_region" {
  value = module.s3.s3_bucket_region
}

output "s3_bucket_website_domain" {
  value = module.s3.s3_bucket_website_domain
}

output "s3_bucket_website_endpoint" {
  value = module.s3.s3_bucket_website_endpoint
}
*/
//cloudfront
/*
output "cloudfront_distribution_id" {
  description = "The identifier for the distribution."
  value       = module.cloudfront.cloudfront_distribution_id
}

output "cloudfront_distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the distribution."
  value       = module.cloudfront.cloudfront_distribution_arn
}  

output "cloudfront_distribution_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
  value       = module.cloudfront.cloudfront_distribution_caller_reference
}

output "cloudfront_distribution_status" {
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value       = module.cloudfront.cloudfront_distribution_status
}

output "cloudfront_distribution_trusted_signers" {
  description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs"
  value       = module.cloudfront.cloudfront_distribution_trusted_signers
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = module.cloudfront.cloudfront_distribution_domain_name
}

output "cloudfront_distribution_last_modified_time" {
  description = "The date and time the distribution was last modified."
  value       = module.cloudfront.cloudfront_distribution_last_modified_time
}

output "cloudfront_distribution_in_progress_validation_batches" {
  description = "The number of invalidation batches currently in progress."
  value       = module.cloudfront.cloudfront_distribution_in_progress_validation_batches
}

output "cloudfront_distribution_etag" {
  description = "The current version of the distribution's information."
  value       = module.cloudfront.cloudfront_distribution_etag
}

output "cloudfront_distribution_hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to."
  value       = module.cloudfront.cloudfront_distribution_hosted_zone_id
}

output "cloudfront_origin_access_identities" {
  description = "The origin access identities created"
  value       = module.cloudfront.cloudfront_origin_access_identities
}

output "cloudfront_origin_access_identity_ids" {
  description = "The IDS of the origin access identities created"
  value       = module.cloudfront.cloudfront_origin_access_identity_ids
}

output "cloudfront_origin_access_identity_iam_arns" {
  description = "The IAM arns of the origin access identities created"
  value       = module.cloudfront.cloudfront_origin_access_identity_iam_arns
}

output "cloudfront_monitoring_subscription_id" {
  description = " The ID of the CloudFront monitoring subscription, which corresponds to the `distribution_id`."
  value       = module.cloudfront.cloudfront_monitoring_subscription_id
}

output "cloudfront_distribution_tags" {
  description = "Tags of the distribution's"
  value       = module.cloudfront.cloudfront_distribution_tags
}

output "cloudfront_origin_access_controls" {
  description = "The origin access controls created"
  value       = module.cloudfront.cloudfront_origin_access_controls
}

output "cloudfront_origin_access_controls_ids" {
  description = "The IDS of the origin access identities created"
  value       = module.cloudfront.cloudfront_origin_access_controls_ids
}
*/