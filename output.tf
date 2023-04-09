# output "alb_dns_name" {
#   value       = module.alb.alb_dns_name
#   description = "The domain name of the load balancer"
# }

output "static_site_name" {
  value       = module.web-site.s3_bucket_regional_domain_name
  description = "The domain name of the bucket"
}

output "static_website_endpoint" {
  value       = module.web-site.s3_bucket_website_endpoint
  description = "The domain name of the bucket"
}