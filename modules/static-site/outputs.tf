# Output variable definitions

output "domain_name" {
  description = "buckeet domain name"
  value       = module.site_bucket.s3_bucket_bucket_domain_name
}
