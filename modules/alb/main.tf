# resource "aws_lb" "this" {
#   name               = var.alb_name
#   load_balancer_type = "application"
#   subnets            = var.subnet_ids
#   security_groups    = var.security_group_ids
# }

# resource "aws_lb_target_group" "asg" {
#   name     = "terraform-asg-tg"
#   port     = var.web_server_port
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id
#   target_type = "ip"

#   health_check {
#     path                = "/"
#     protocol            = "HTTP"
#     matcher             = "200"
#     interval            = 15
#     timeout             = 3
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }
# }


# resource "aws_lb_listener" "alb_listener" {
#   load_balancer_arn = aws_lb.this.arn
#   port              = 80
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.asg.arn
#   }
# }