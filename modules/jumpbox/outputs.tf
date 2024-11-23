output "jump_instance_public_ips" {
  value       = aws_instance.jumpbox[*].public_ip
  description = "The public IP address of the jump box."

}

output "jumpbox_instance_ids" {
  value       = aws_instance.jumpbox[*].id
  description = "The ID of the jump box instance."

}