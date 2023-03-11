#Upload files of your static website
resource "aws_s3_object" "data" {
  for_each = { for file in local.file_with_type : "${file.file_name}.${file.mime}" => file }

  bucket       = module.site_bucket.s3_bucket_id
  key          = each.value.file_name
  
  source       = "${var.src}/${each.value.file_name}"
  etag         = filemd5("${var.src}/${each.value.file_name}")
  content_type = each.value.mime
}
resource "aws_s3_object" "constants" {

  bucket       = module.site_bucket.s3_bucket_id
  key          = "scripts/constants.js"
  content      = local.constants
  etag         = sha512(local.constants)
  content_type = "application/javascript"
}