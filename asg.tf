data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


module "asg" {
  source = "./modules/asg"

  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  subnet_ids  = module.vpc.public_subnets_ids
  security_group_ids = [aws_security_group.this.id]
  lb_arn = module.alb.alb_arn
  user_data = local.web_user_data
  instance_name =  "web-server"
  asg_name =  "asg-web-server"
}

resource "aws_security_group" "this" {
  name = "allow_tcp_sg"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
