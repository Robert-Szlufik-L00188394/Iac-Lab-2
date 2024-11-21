variable "vpc_id" {
  description = "The ID of the VPC."
}

variable "public_subnet_id" {
  description = "The ID of the public subnet."
}

variable "alb_security_group_id" {
  description = "Security Group ID for the ALB."
}

variable "ec2_security_group_id" {
  description = "Security Group ID for EC2 instances."
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances in the public ASG."
}

variable "instance_type" {
  description = "The EC2 instance type for the public ASG."
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the public ASG."
}

variable "asg_min_size" {
  description = "Minimum size for the public ASG."
}

variable "asg_max_size" {
  description = "Maximum size for the public ASG."
}
