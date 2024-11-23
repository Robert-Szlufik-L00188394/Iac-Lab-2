output "jump_instance_public_ip" {
  value       = aws_instance.jumpbox.public_ip
  description = "The public IP address of the jump box."

}

output "jumpbox_instance_id" {
  value       = aws_instance.jumpbox.id
  description = "The ID of the jump box instance."

}