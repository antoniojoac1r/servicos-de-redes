variable "instance_name" {
  description = "instance name"
  type = string
  default = "js-trying"
}

output "public_ip" {
   value = aws_instance.servidor_de_teste.public_ip
   description = "Ip publico"
}

output "instance_id" {
  value       = aws_instance.servidor_de_teste.id
  description = "Identificador da Instancia"
}
