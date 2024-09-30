resource "aws_db_instance" "rds_postgres" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15.4"
  instance_class       = "db.t3.medium"
  db_name              = "todolist_db_rds"
  username             = "postgresrds"
  password             = "rdsdb12435"
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rules_todolist.id]

  tags = {
    Name = "todolist_rdspostgres"
  }
}
