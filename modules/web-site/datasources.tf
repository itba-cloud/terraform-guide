data "aws_iam_policy_document" "site" {

    statement {
        sid = "PublicReadGetObject"
        effect = "Allow"
        actions = ["s3:GetObject"]
        principals {
            type        = "AWS"
            identifiers = ["*"]
        }
        resources = ["${module.site_bucket.s3_bucket_arn}/*"]
    }
}