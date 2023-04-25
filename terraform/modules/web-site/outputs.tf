# Output variable definitions
output "s3_bucket_website_domain" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_website_domain
}

output "s3_bucket_domain_name" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_bucket_domain_name
}
output "s3_bucket_website_endpoint" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_website_endpoint
}
output "s3_bucket_regional_domain_name" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_bucket_regional_domain_name
}

output "arn" {
  description = "bucket arn"
  value       = module.site_bucket.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "bucket id"
  value       = module.site_bucket.s3_bucket_id
}
