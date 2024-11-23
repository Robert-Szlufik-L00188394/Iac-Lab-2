variable "ami_id" {
  description = "The AMI ID to use for the instance."

}

variable "instance_type" {
  description = "The type of instance to launch."

}

variable "subnet_ids" {
  type        = list(string)
  description = "The ID of the subnet in which to launch the instance."

}

variable "security_group_id" {
  description = "The ID of the security group to assign to the instance."

}

variable "key_name" {
  description = "The name of the key pair to use for the instance."

}