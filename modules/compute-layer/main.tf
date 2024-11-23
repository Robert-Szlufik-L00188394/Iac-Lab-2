# Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.is_internal ? "private" : "public"}-alb"
  internal           = var.is_internal
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = [var.subnet_id]

  tags = {
    Name = "${var.is_internal ? "Private" : "Public"} Application Load Balancer"
  }
}

#Launch Template
resource "aws_launch_template" "launch_template" {
  name_prefix   = "lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type


  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ec2_security_group_id]
    device_index                = 0
  }

  # tag_specifications {
  #   tags = {
  #     Name = "Public LT"
  #   }
  # }

}

# Target Group
resource "aws_lb_target_group" "target_group" {
  name     = "${var.is_internal ? "private" : "public"}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "${var.is_internal ? "Private" : "Public"} Target Group"
  }

}

# Auto Scaling Group
resource "aws_autoscaling_group" "autoscaling_group" {
  desired_capacity = var.asg_desired_capacity
  max_size         = var.asg_max_size
  min_size         = var.asg_min_size
  name             = "${var.is_internal ? "private" : "public"}-asg"

  vpc_zone_identifier = [var.subnet_id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.target_group.arn]

  tag {
    key                 = "Name"
    value               = "${var.is_internal ? "Private" : "Public"} Auto Scaling Group"
    propagate_at_launch = true
  }
}
