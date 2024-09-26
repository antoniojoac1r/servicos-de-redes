resource "aws_instance" "servidor_de_teste" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = "vockey"
  security_groups = [ aws_security_group.bastion.name ]

  tags = {
    Name = var.instance_name
  }
}
