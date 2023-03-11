# ---------------------------------------------------------------------------
# Main resources - baseline configuration for s3
# ---------------------------------------------------------------------------
resource "random_pet" "this" {
  length = 2
}

locals {
  bucket_name = "static-site-${random_pet.this.id}"
}

resource "aws_s3_bucket" "this" {
    # provider = aws.aws

    bucket              = local.bucket_name
    object_lock_enabled = false
}

resource "aws_s3_bucket_policy" "this" {
    # provider = aws.aws

    bucket = aws_s3_bucket.this.id
    policy = data.aws_iam_policy_document.this.json
}

resource "aws_s3_bucket_website_configuration" "this" {
    # provider = aws.aws

    bucket = aws_s3_bucket.this.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_acl" "this" {
    # provider = aws.aws

    bucket = aws_s3_bucket.this.id
    acl    = "public-read"
}

resource "aws_s3_object" "data" {
  for_each = { for file in local.file_with_type : "${file.file_name}.${file.mime}" => file }

  bucket       = aws_s3_bucket.this.id
  key          = each.value.file_name
  
  source       = "${var.static_resources}/${each.value.file_name}"
  etag         = filemd5("${var.static_resources}/${each.value.file_name}")
  content_type = each.value.mime
}
