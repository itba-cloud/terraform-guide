variable "subnet_ids" {
  description = "The VPC subnet ids"
  type        = list(any)
}

variable "vpc_id" {
  description = "The VPC id"
  type        = string
}

# variable "certificate" {
#   description = "The certificate arn"
#   type        = string
# }

variable "domain_name" {
  description = "The VPC id"
  type        = string
}

variable "security_group_ids" {
  description = "Security Groups"
  type        = list(string)
}

variable "alb_name" {
  description = "The alb instance name"
  type        = string
  default     = "default alb name"
}

variable "web_server_port" {
  description = "port to locate the server"
  type        = string
  default     = "80"
}