output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.customthreads_vpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "web_server_public_ips" {
  description = "Public IP addresses of web servers"
  value       = aws_instance.web_servers[*].public_ip
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.web_lb.dns_name
}

output "database_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.customthreads_db.endpoint
}

output "database_name" {
  description = "Name of the database"
  value       = aws_db_instance.customthreads_db.db_name
}