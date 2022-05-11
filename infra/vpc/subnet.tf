resource "aws_subnet" "example-subnet-private1-2a" {
  vpc_id            = aws_vpc.example-vpc.id
  cidr_block        = var.subnet.private[0]
  availability_zone = "${var.region}a"

  tags = merge(
  var.default_tags,
  {Service = "subnet"},
  {Name = "example-subnet-private1-2a"}
  )
}

resource "aws_subnet" "example-subnet-private2-2b" {
  vpc_id            = aws_vpc.example-vpc.id
  cidr_block        = var.subnet.private[1]
  availability_zone = "${var.region}b"

  tags = merge(
  var.default_tags,
  {Service = "subnet"},
  {Name = "example-subnet-private2-2b"}
  )
}

resource "aws_subnet" "example-subnet-public1-2a" {
  vpc_id            = aws_vpc.example-vpc.id
  cidr_block        = var.subnet.public[0]
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = merge(
  var.default_tags,
  {Service = "subnet"},
  {Name = "example-subnet-public1-2a"}
  )
}

resource "aws_subnet" "example-subnet-public2-2b" {
  vpc_id            = aws_vpc.example-vpc.id
  cidr_block        = var.subnet.public[1]
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = merge(
  var.default_tags,
  {Service = "subnet"},
  {Name = "example-subnet-public2-2b"}
  )
}
