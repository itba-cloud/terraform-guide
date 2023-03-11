# Output variable definitions
output "domain_name" {
  description = "buckeet domain name"
  value       = aws_s3_bucket.this.bucket_domain_name
}
