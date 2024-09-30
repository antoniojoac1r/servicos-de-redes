output "ec2_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.ec2_instance.public_ip
}

output "rds_endpoint" {
  description = "Endpoint da instância RDS PostgreSQL"
  value       = aws_db_instance.rds_postgres.endpoint
}
