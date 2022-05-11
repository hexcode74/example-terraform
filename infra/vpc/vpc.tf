resource "aws_vpc" "example-vpc" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = var.cidr_block

  tags = merge(
  var.default_tags,
  {Service = "vpc"},
  {Name = "example-vpc"}
  )

}
