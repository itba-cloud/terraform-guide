# Output variable definitions

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.this.cidr_block
}

output "public_subnets_ids" {
  value = [
    for k, v in aws_subnet.public : v.id
  ]
}
