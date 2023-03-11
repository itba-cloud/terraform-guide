output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The domain name of the load balancer"
}

output "static_site_name" {
  value       = module.web-site.domain_name
  description = "The domain name of the bucket"
}