# outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "web_server_public_ips" {
  description = "Public IP addresses of web servers"
  value       = aws_instance.web[*].public_ip
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.web.dns_name
}

output "database_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.main.endpoint
}

# output "database_name" {
#   description = "Name of the database"
#   value       = aws_db_instance.main.db_name

# }