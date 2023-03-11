# Input variable definitions

variable "bucket_name" {
  description = "Name for the web-site bucket"
  type        = string
}

variable "static_resources" {
  description = "path to static resources"
  type        = string
}
