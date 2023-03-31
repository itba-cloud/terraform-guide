# ---------------------------------------------------------------------------
# Main resources - baseline configuration for s3
# ---------------------------------------------------------------------------
resource "random_pet" "this" {
  length = 2
}

locals {
  bucket_name = "web-site-${random_pet.this.id}"
}

# data "aws_iam_policy_document" "site" {
#   statement {
#     sid = "PublicReadGetObject"
#     actions   = ["s3:GetObject"]
#     resources = ["arn:aws:s3:::${local.bucket_name}/*"]
#     effect = "Allow"

#     principals {
#       type        = "AWS"
#       identifiers = var.bucket_access_OAI
#     }
#   }
# }
data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]
    resources = [
      module.site_bucket.s3_bucket_arn,
      "${module.site_bucket.s3_bucket_arn}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = var.bucket_access_OAI
    }
  }
}

module "site_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  force_destroy = true
  bucket        = local.bucket_name

  # Bucket policies
  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy_document.json
  # attach_deny_insecure_transport_policy = true
  # attach_require_latest_tls_policy      = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  acl = "private" # "acl" conflicts with "grant" and "owner"

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

