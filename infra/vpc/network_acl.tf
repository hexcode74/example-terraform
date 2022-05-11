resource "aws_default_network_acl" "example-nacl" {
  default_network_acl_id = aws_vpc.example-vpc.default_network_acl_id

  subnet_ids             = [
    aws_subnet.example-subnet-private1-2a.id,
    aws_subnet.example-subnet-private2-2b.id,
    aws_subnet.example-subnet-public1-2a.id,
    aws_subnet.example-subnet-public2-2b.id
  ]


  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 0
    to_port    = 0
  }

  // 900~ any open (0.0.0.0/0)
  // 80, 443
  ingress {
    protocol   = "tcp"
    rule_no    = 900
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 901
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1025
    to_port    = 65535
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    var.default_tags,
    {Service = "nacl"},
    {Name = "example-nacl"}
  )
}

