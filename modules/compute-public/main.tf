# Application Load Balancer
resource "aws_lb" "public_alb" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = [var.public_subnet_id]

  tags = {
    Name = "Public ALB"
  }
}

#Launch Template
resource "aws_launch_template" "public_lt" {
  name_prefix   = "public-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type


  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ec2_security_group_id]
    device_index = 0
  }

  # tag_specifications {
  #   tags = {
  #     Name = "Public LT"
  #   }
  # }
  
}

# Target Group
resource "aws_lb_target_group" "public_tg" {
  name     = "public-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "Public TG"
  }
  
}

# Auto Scaling Group
resource "aws_autoscaling_group" "public_asg" {
  desired_capacity = var.asg_desired_capacity
  max_size         = var.asg_max_size
  min_size         = var.asg_min_size

  vpc_zone_identifier = [var.public_subnet_id]

  launch_template {
    id      = aws_launch_template.public_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.public_tg.arn]

    tag {
        key                 = "Name"
        value               = "Public ASG"
        propagate_at_launch = true
    }
}
