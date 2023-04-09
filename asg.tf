# module "asg" {
#   source = "./modules/asg"

#   ami = local.aws_ec2_ami
#   instance_type = local.aws_ec2_type

#   subnet_ids  = module.vpc.public_subnets_ids
#   security_group_ids = [aws_security_group.this.id]
#   lb_arn = module.alb.alb_arn
#   user_data = filebase64(local.aws_ec2_web_user_data)
#   instance_name =  "web-server"
#   asg_name =  "asg-web-server"
# }

# resource "aws_security_group" "this" {
#   name = "allow_tcp_sg"
#   vpc_id = module.vpc.vpc_id
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#    ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
