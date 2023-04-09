# module "dns" {
#   source = "./modules/dns"

#   base_domain = var.web_site_domain
#   app_domain  = local.web_site_domain
#   cdn         = module.cdn.cloudfront_distribution
# }

# module "certificate" {
#   source = "./modules/certificate"
#   base_domain = var.web_site_domain
# }
