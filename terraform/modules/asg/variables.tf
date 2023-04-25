variable "subnet_ids" {
  description = "The VPC subnet ids"
  type        = list(any)
}

variable "ami" {
  description = "ec2-ami to use"
  type        = string
}

variable "web_server_port" {
  description = "port to locate the server"
  type        = string
  default     = "80"
}

variable "instance_type" {
  description = "ec2-ami to use"
  type        = string
}

variable "security_group_ids" {
  description = "Security Groups"
  type        = list(string)
}

variable "instance_name" {
  description = "The ec2 instance name"
  type        = string
  default     = "default ec2 name"
}

variable "asg_name" {
  description = "The asg instance name"
  type        = string
  default     = "default asg name"
}

variable "lb_arn" {
  description = "The lb arn"
  type        = string
}

variable "user_data" {
  description = "User data for web server inizialization"
  type        = string
  # sensitive   = true
}
