# Network module
output "vpc_id" {
  value       = "stack-${var.stack_name}:  ${module.network.vpc_id}"
  description = "The ID of the VPC."

}

output "public_subnet_ids" {
  value       = [for subnet_id in module.network.public_subnet_ids : "stack-${var.stack_name}: ${subnet_id}"]
  description = "The ID of the public subnet."

}

output "private_subnet_ids" {
  value       = [for subnet_id in module.network.public_subnet_ids : "stack-${var.stack_name}: ${subnet_id}"]
  description = "The ID of the private subnet."

}

# Security module
output "public_alb_security_group_id" {
  value       = "stack-${var.stack_name}:  ${module.security.public_alb_security_group_id}"
  description = "Security Group ID for the ALB."

}

output "public_ec2_security_group_id" {
  value       = "stack-${var.stack_name}:  ${module.security.public_ec2_security_group_id}"
  description = "Security Group ID for EC2 instances."

}

output "private_alb_security_group_id" {
  value       = "stack-${var.stack_name}:  ${module.security.private_alb_security_group_id}"
  description = "Security Group ID for the private ALB."

}

output "private_ec2_security_group_id" {
  value       = "stack-${var.stack_name}:  ${module.security.private_ec2_security_group_id}"
  description = "Security Group ID for private EC2 instances."

}

output "jump_box_security_group_id" {
  value       = "stack-${var.stack_name}:  ${module.security.jump_box_security_group_id}"
  description = "Security Group ID for the jump box."

}

# Public compute module
output "public_alb_dns_name" {
  value       = "stack-${var.stack_name}:  ${module.compute-public.alb_dns_name}"
  description = "The DNS name of the Application Load Balancer."

}

output "public_alb_arn" {
  value       = "stack-${var.stack_name}:  ${module.compute-public.alb_arn}"
  description = "The ARN of the Application Load Balancer."

}

output "public_asg_name" {
  value       = "stack-${var.stack_name}:  ${module.compute-public.asg_name}"
  description = "The name of the Auto Scaling Group."

}

output "public_launch_template_id" {
  value       = "stack-${var.stack_name}:  ${module.compute-public.launch_template_id}"
  description = "The ID of the Launch Template."

}

output "public_target_group_arn" {
  value       = "stack-${var.stack_name}:  ${module.compute-public.target_group_arn}"
  description = "The ARN of the Target Group."

}

# Private compute module
output "private_alb_dns_name" {
  value       = "stack-${var.stack_name}:  ${module.compute-private.alb_dns_name}"
  description = "The DNS name of the Application Load Balancers."

}

output "private_alb_arn" {
  value       = "stack-${var.stack_name}:  ${module.compute-private.alb_arn}"
  description = "The ARN of the Application Load Balancers."

}

output "private_asg_name" {
  value       = "stack-${var.stack_name}:  ${module.compute-private.asg_name}"
  description = "The name of the Auto Scaling Group."

}

output "private_launch_template_id" {
  value       = "stack-${var.stack_name}:  ${module.compute-private.launch_template_id}"
  description = "The ID of the Launch Template."

}

output "private_target_group_arn" {
  value       = "stack-${var.stack_name}:  ${module.compute-private.target_group_arn}"
  description = "The ARN of the Target Group."

}
