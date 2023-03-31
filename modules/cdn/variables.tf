variable "domain_name" {
  description = "target domain name of the S3 bucket"
  type = string
}

variable "bucket_regional_domain_name" {
  description = "target domain name of the S3 bucket"
  type = string
}
variable "bucket_id" {
  description = "target domain name of the S3 bucket"
  type = string
}

variable "alb_dns_name" {
  description = "target dns name of the S3 bucket"
  type = string
}

variable "aliases" {
  description = "Aliases for the distribution"
  type = set(string)
  default = []
}

variable "certificate_arn" {
  description = "ARN of the certificate associated with domain name"
  type = string
}
