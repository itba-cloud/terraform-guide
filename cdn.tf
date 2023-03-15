module "cdn" {
  source = "./modules/cdn"

  bucket_domain_name = module.web-site.domain_name
  aliases            = ["www.${local.app_domain}", local.app_domain]
  certificate_arn    = module.certificate.arn
}