resource "aws_instance" "ec2_instance" {
  ami           = "ami-0e86e20dae9224db8" # AMI Ubuntu 24.04
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = [aws_security_group.rules_todolist.id]
  tags = {
    Name = "todolist"
  }
}
