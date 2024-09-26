output "Ip_EC2" {
  description = "Ip publico da instancia TodoList"
  value       = aws_instance.web_application.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = aws_db_instance.RDS.endpoint
}
