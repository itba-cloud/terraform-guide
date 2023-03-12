# ---------------------------------------------------------------------------
# Main resources - baseline configuration for s3
# ---------------------------------------------------------------------------
resource "random_pet" "this" {
  length = 2
}

locals {
  bucket_name = "static-site-${random_pet.this.id}"
}

module "site_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  force_destroy = true
  bucket        = local.bucket_name

  # Bucket policies
  attach_policy = true
  policy        = data.aws_iam_policy_document.site.json
  # attach_deny_insecure_transport_policy = true
  # attach_require_latest_tls_policy      = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  acl = "public-read" # "acl" conflicts with "grant" and "owner"

  versioning = {
    status     = true
    mfa_delete = false
  }

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }


  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_object" "data" {
  for_each = { for file in local.file_with_type : "${file.file_name}.${file.mime}" => file }

  bucket       = module.site_bucket.s3_bucket_id
  key          = each.value.file_name
  
  source       = "${var.static_resources}/${each.value.file_name}"
  etag         = filemd5("${var.static_resources}/${each.value.file_name}")
  content_type = each.value.mime
}

