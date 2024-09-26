resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Grupo de Seguranca"

  tags = {
    Name = "bastion"
  }
}

resource "aws_vpc_security_group_ingress_rule" "permitir_ssh_ipv4" {
  security_group_id = aws_security_group.bastion.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
