locals {
  public_cidr = cidrsubnet(aws_vpc.this.cidr_block, 1, 1)

  # public_cidr = cidrsubnet(aws_vpc.this.cidr_block, 1, 2)
}