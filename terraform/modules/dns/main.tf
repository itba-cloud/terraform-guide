# data "aws_route53_zone" "this" {
#   name = var.base_domain
# }

# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.this.zone_id
#   name    = "www.${var.base_domain}"
#   type    = "CNAME"
#   ttl     = 900

#   records = ["${var.base_domain}"]

#   depends_on = [
#     aws_route53_record.base
#   ]
# }

# resource "aws_route53_record" "base" {
#   zone_id = data.aws_route53_zone.this.zone_id
#   name    = var.app_domain
#   type    = "A"

#   alias {
#     name                   = var.cdn.domain_name
#     zone_id                = var.cdn.hosted_zone_id
#     evaluate_target_health = false
#   }
# }