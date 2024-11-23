output "vpc_id" {
  value       = aws_vpc.lab_2-vpc.id
  description = "The ID of the VPC."
}

output "public_subnet_id" {
  value       = aws_subnet.lab_2-public-subnet.id
  description = "The ID of the public subnet."
}

output "private_subnet_id" {
  value       = aws_subnet.lab_2-private-subnet.id
  description = "The ID of the private subnet."
}

output "route_table_id" {
  value       = aws_route_table.lab_2-public-route-table.id
  description = "The ID of the public route table."
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.lab_2-igw.id
  description = "The ID of the Internet Gateway."
}


