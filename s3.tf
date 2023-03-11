# resource "random_pet" "this" {
#   length = 2
# }

# locals {
#   bucket_name = "example-s3-bucket-${random_pet.this.id}"
# }


# data "aws_iam_role" "this" {
#   name = "LabRole"
# }

# data "aws_iam_policy_document" "this" {
#   statement {
#     actions   = ["s3:*"]
#     resources = ["arn:aws:s3:::${local.bucket_name}/*"]

#     principals {
#       type        = "AWS"
#       identifiers = [data.aws_iam_role.this.arn]
#     }
#   }
# }

# module "s3" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   force_destroy = true
#   bucket        = local.bucket_name

#   # Bucket policies
#   attach_policy = true
#   policy        = data.aws_iam_policy_document.this.json

#   # S3 bucket-level Public Access Block configuration
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true

#   cors_rule = [
#     {
#       allowed_methods = ["PUT", "GET", "POST"]
#       allowed_origins = ["*"]
#       allowed_headers = ["*"]
#       expose_headers  = ["ETag"]
#       max_age_seconds = 3000
#     }
#   ]

#   acl = "private"

#   versioning = {
#     status     = true
#     mfa_delete = false
#   }

#   server_side_encryption_configuration = {
#     rule = {
#       apply_server_side_encryption_by_default = {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }

# resource "aws_s3_bucket_object" "object1" {
#   for_each = fileset("uploads/", "*")
#   bucket = module.s3.s3_bucket_id
#   key = each.value
#   source = "uploads/${each.value}"
# }
