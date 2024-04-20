/*
module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
  
  bucket = var.aws_s3_bucket
  acl    = var.acl

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  //false - public access
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true

  # Allow deletion of non-empty bucket
  force_destroy = true
  versioning = {
    enabled = true
  }
  tags = var.tags
}
*/