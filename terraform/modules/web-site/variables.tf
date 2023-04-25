# Input variable definitions

variable "static_resources" {
  description = "path to static resources"
  type        = string
}

variable "bucket_access_OAI" {
  description = "OAI of authorized bucket accessors"
  type        = list(string)
}