# Input variable definitions

variable "src" {
  description = "Path of static site src folder"
  type        = string
}

variable "bucket_access_OAI" {
  description = "OAI of authorized bucket accessors"
  type        = list(string)
}

variable "constants" {
  description = "constants for js"
  type        = map(string)
}