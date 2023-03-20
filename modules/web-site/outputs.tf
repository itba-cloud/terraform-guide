# Output variable definitions
output "s3_bucket_website_domain" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_website_domain
}

output "arn" {
  description = "bucket arn"
  value       = module.site_bucket.s3_bucket_arn
}