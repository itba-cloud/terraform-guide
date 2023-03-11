module "web-site" {
  source = "./modules/web-site"

  bucket_name  = var.ws_bucket_name
  static_resources   = local.static_resources
  
}
