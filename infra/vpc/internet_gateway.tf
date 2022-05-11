resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example-vpc.id

  tags = merge(
      var.default_tags,
      {Service = "igw"},
      {Name = "example-igw"}
  )
}
