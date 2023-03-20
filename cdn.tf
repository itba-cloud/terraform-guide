module "cdn" {
  source = "./modules/cdn"

  bucket_domain_name = module.web-site.s3_bucket_website_domain
  aliases            = ["www.${local.web_site_domain}", local.web_site_domain]
  certificate_arn    = module.certificate.arn
}