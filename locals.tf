locals {

  # AWS VPC Configuration
  aws_vpc_network = "10.0.0.0/16"
  aws_az_count    = 2
  web_user_data   = "scripts/web_server_user_data.sh"
  static_resources = "resources"
}