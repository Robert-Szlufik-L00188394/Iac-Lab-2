output "alb_security_group_id" {
  value       = aws_security_group.alb_sg.id
  description = "Security Group ID for the ALB."

}

output "ec2_security_group_id" {
  value       = aws_security_group.ec2_sg.id
  description = "Security Group ID for EC2 instances."

}
