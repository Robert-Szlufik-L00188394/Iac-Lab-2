output "public_alb_security_group_id" {
  value       = aws_security_group.public_alb_sg.id
  description = "Security Group ID for the ALB."

}

output "public_ec2_security_group_id" {
  value       = aws_security_group.public_ec2_sg.id
  description = "Security Group ID for EC2 instances."

}

output "private_alb_security_group_id" {
  value       = aws_security_group.private_alb_security_group.id
  description = "Security Group ID for the private ALB."
  
}

output "private_ec2_security_group_id" {
  value       = aws_security_group.private_ec2_security_group.id
  description = "Security Group ID for private EC2 instances."
  
}

output "jump_box_security_group_id" {
  value       = aws_security_group.jump_box_security_group.id
  description = "Security Group ID for the jump box."
  
}