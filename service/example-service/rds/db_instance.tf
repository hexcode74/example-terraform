resource "aws_db_instance" "example-rds"{
  identifier = var.name
  allocated_storage = 8
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  username = "admin"
  password = "test_1234"
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.example-db-subnet-group.id
  vpc_security_group_ids = [ aws_security_group.example-rds.id ]
  allow_major_version_upgrade = true
  parameter_group_name = aws_db_parameter_group.example-mysql-parameter-group.name
  multi_az = true

  tags = merge(
  var.default_tags,
  {Service = "rds"},
  {Name = "example-rds"}
  )
}
