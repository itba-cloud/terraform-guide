variable "aws_region" {
  description = "AWS Region in which to deploy the application"
  type        = string
}

variable "web_site_domain" {
  description = "The web site domain"
  type        = string
}

variable "alb_domain_name" {
  description = "The alb domain name"
  type        = string
}
