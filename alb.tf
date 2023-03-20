module "alb" {
  source = "./modules/alb"

  subnet_ids  = module.vpc.public_subnets_ids
  security_group_ids = [aws_security_group.alb.id]
  vpc_id      = module.vpc.vpc_id
  alb_name =  "web-server-lb"
  domain_name = local.alb_domain_name
  certificate = module.certificate.arn
  # web_server_port = var.server_port
}

resource "aws_security_group" "alb" {
  name = "terraform-example-alb"
   vpc_id = module.vpc.vpc_id
  # Allow inbound HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
