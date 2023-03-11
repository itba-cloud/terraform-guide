data "aws_iam_policy_document" "this" {
    # provider     = aws.aws

    statement {
        sid = "PublicReadGetObject"
        effect = "Allow"
        actions = ["s3:GetObject"]
        principals {
            type        = "AWS"
            identifiers = ["*"]
        }
        resources = ["${aws_s3_bucket.this.arn}/*"]
    }
}