resource "aws_db_parameter_group" "example-mysql-parameter-group" {
  name        = "example-mysql-parameter-group"
  description = "Terraform example parameter group for mysql5.7"
  family      = "mysql5.7"
  parameter {
      name = "character_set_client"
      value = "utf8"
  }
  parameter {
      name = "character_set_connection"
      value = "utf8"
  }
  parameter {
      name = "character_set_database"
      value = "utf8mb4"
  }
  parameter {
      name = "character_set_filesystem"
      value = "utf8mb4"
  }
  parameter {
      name = "character_set_results"
      value = "utf8"
  }
  parameter {
      name = "character_set_server"
      value = "utf8mb4"
  }
  parameter {
      name = "collation_connection"
      value = "utf8_general_ci"
  }
  parameter {
      name = "collation_server"
      value = "utf8mb4_unicode_ci"
  }
  parameter {
      name = "max_connections"
      value = "2000"
   }
}
