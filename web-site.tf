module "web-site" {
  source = "./modules/web-site"

  static_resources   = local.static_resources
  bucket_access_OAI = [module.cdn.static_site_OAIs_arn]
}
