# Network module
output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC."

}

output "public_subnet_id" {
  value       = module.network.public_subnet_id
  description = "The ID of the public subnet."

}

output "private_subnet_id" {
  value       = module.network.private_subnet_id
  description = "The ID of the private subnet."

}

# Security module
output "alb_security_group_id" {
  value       = module.security.alb_security_group_id
  description = "Security Group ID for the ALB."

}

output "ec2_security_group_id" {
  value       = module.security.ec2_security_group_id
  description = "Security Group ID for EC2 instances."

}

# Public compute module
output "alb_dns_name" {
  value       = module.compute-public.alb_dns_name
  description = "The DNS name of the Application Load Balancer."

}

output "alb_arn" {
  value       = module.compute-public.alb_arn
  description = "The ARN of the Application Load Balancer."

}

output "asg_name" {
  value       = module.compute-public.asg_name
  description = "The name of the Auto Scaling Group."

}

output "launch_template_id" {
  value       = module.compute-public.launch_template_id
  description = "The ID of the Launch Template."

}

output "target_group_arn" {
  value       = module.compute-public.target_group_arn
  description = "The ARN of the Target Group."

}