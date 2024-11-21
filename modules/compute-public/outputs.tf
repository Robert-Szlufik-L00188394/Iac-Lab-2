output "alb_dns_name" {
  value       = aws_lb.public_alb.dns_name
  description = "The DNS name of the Application Load Balancer."
  
}

output "alb_arn" {
  value       = aws_lb.public_alb.arn
  description = "The ARN of the Application Load Balancer."

}

output "asg_name" {
  value       = aws_autoscaling_group.public_asg.name
  description = "The name of the Auto Scaling Group."

}

output "launch_template_id" {
  value       = aws_launch_template.public_lt.id
  description = "The ID of the Launch Template."
  
}

output "target_group_arn" {
  value       = aws_lb_target_group.public_tg.arn
  description = "The ARN of the Target Group."
  
}