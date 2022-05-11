resource "aws_db_subnet_group" "example-db-subnet-group" {
  description = "Created from the RDS Management Console"
  name        = "example-db-subnet-group"
  subnet_ids  = [data.terraform_remote_state.example-vpc.outputs.example-subnet-private1-2a_id,
                 data.terraform_remote_state.example-vpc.outputs.example-subnet-private2-2b_id ]

  tags = merge(
  var.default_tags,
  {Service = "rdb"},
  {Name = "example-rdb-sunet-group"}
  )
}
