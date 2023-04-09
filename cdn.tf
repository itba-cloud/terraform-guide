module "cdn" {
  source = "./modules/cdn"

  domain_name        = local.web_site_domain
  bucket_regional_domain_name = module.web-site.s3_bucket_regional_domain_name
  bucket_id          = module.web-site.s3_bucket_id
  # alb_dns_name       = module.alb.alb_dns_name
  aliases            = ["www.${local.web_site_domain}", local.web_site_domain]
  # certificate_arn    = module.certificate.arn
}