# Input variable definitions
variable "base_domain" {
  description = "The base domain of the application. Should be a subdomain of an existing domain."
  type        = string
}

variable "app_domain" {
  description = "Application subdomain"
  type        = string
}

variable "cdn" {
  description = "The cloudfront distribution for the primary deployment"
}
