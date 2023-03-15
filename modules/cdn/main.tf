data "aws_cloudfront_cache_policy" "optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "this" {
  # Si se usa www hay problemas de permisos, la policy dice que solo cloudfront lee pega a site
  origin {
    domain_name = var.bucket_domain_name
    origin_id   = local.origin_id["web-site"].name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this["web-site"].cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = false
  comment             = "cdn"
  default_root_object = "index.html"
  aliases             = var.aliases

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id["web-site"].name
    cache_policy_id        = data.aws_cloudfront_cache_policy.optimized.id
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = length(var.aliases) == 0

    acm_certificate_arn      = var.certificate_arn
    minimum_protocol_version = length(var.aliases) > 0 ? "TLSv1.2_2021" : null
    ssl_support_method       = length(var.aliases) > 0 ? "sni-only" : null
  }
}

resource "aws_cloudfront_origin_access_identity" "this" {
  for_each = local.origin_id
  
  comment = each.value.name
}
