resource "aws_launch_configuration" "this" {
  image_id                     = "ami-0022f774911c1d690"
  instance_type           = var.instance_type
  security_groups = var.security_group_ids

  user_data = var.user_data
  # <<-EOF
  #           #!/bin/bash
  #           echo "Hello, World im instance" > index.html
  #           nohup busybox httpd -f -p ${var.web_server_port} &
  #           EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.this.name
  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [var.lb_arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 4

  tag {
    key                 = "asg name"
    value               = var.asg_name
    propagate_at_launch = true
  }
}

