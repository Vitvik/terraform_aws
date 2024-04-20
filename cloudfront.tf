/*
module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "3.4.0"
  enabled             = true
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = var.default_root_object
  comment             = var.comment
  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_front = "My CloudFront can access to s3 Front"
  }
 
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

resource "aws_s3_bucket_policy" "allow_access_cloudfront" {
  bucket = module.s3.s3_bucket_id
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
}
*/