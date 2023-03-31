resource "aws_launch_template" "this" {
  name_prefix =          "instance-"
  image_id                     = var.ami
  instance_type           = var.instance_type
  # key_name = var.key_name
  user_data = var.user_data

  network_interfaces {
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }
}

resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [var.lb_arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 2

  launch_template {
    id      = aws_launch_template.this.id
    version = aws_launch_template.this.latest_version
  }

  tag {
    key                 = "asg name"
    value               = var.asg_name
    propagate_at_launch = true
  }
}

