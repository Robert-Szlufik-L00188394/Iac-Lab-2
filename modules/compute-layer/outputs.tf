output "alb_dns_name" {
  value       = aws_lb.application_load_balancer.dns_name
  description = "The DNS name of the Application Load Balancer."
  
}

output "alb_arn" {
  value       = aws_lb.application_load_balancer.arn
  description = "The ARN of the Application Load Balancer."

}

output "asg_name" {
  value       = aws_autoscaling_group.autoscaling_group.name
  description = "The name of the Auto Scaling Group."

}

output "launch_template_id" {
  value       = aws_launch_template.launch_template.id
  description = "The ID of the Launch Template."
  
}

output "target_group_arn" {
  value       = aws_lb_target_group.target_group.arn
  description = "The ARN of the Target Group."
  
}