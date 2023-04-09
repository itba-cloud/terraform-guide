# Output variable definitions

output "cloudfront_distribution" {
  description = "The cloudfront distribution for the deployment"
  value       = aws_cloudfront_distribution.this
}

output "web_site_OAI" {
  description = "OAI used for web site"
  value = aws_cloudfront_origin_access_identity.oai.iam_arn
  # value = aws_cloudfront_origin_access_identity.this["web-site"].iam_arn
}