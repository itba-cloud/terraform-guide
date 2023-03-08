resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count             = var.zones_count
  cidr_block        = cidrsubnet(local.public_cidr, ceil(log(var.zones_count, 2)), count.index)
  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_${count.index}"
  }
}
