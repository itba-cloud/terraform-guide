module "dns" {
  source = "./modules/dns"

  base_domain = var.base_domain
  app_domain  = local.app_domain
  cdn         = module.cdn.cloudfront_distribution
}

module "certificate" {
  source = "./modules/certificate"

  base_domain = var.base_domain
  app_domain  = local.app_domain
}
