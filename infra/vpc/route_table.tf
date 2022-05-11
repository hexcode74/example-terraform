
# 기본라우팅 테이블 만들기 
resource "aws_route_table" "example-route" {
  vpc_id = aws_vpc.example-vpc.id

  route {
    cidr_block = var.any_rt_block
    gateway_id = aws_internet_gateway.example_igw.id
  }
  
  tags = merge(
  var.default_tags,
  {Service = "route-table"},
  {Name = "example-route"}
  )
}

# 기본 라우팅 테이블에 서브넷 구간 결합 
resource "aws_route_table_association" "example-subnet-private1-2a" {
  subnet_id      = aws_subnet.example-subnet-private1-2a.id
  route_table_id = aws_route_table.example-route.id
}

resource "aws_route_table_association" "example-subnet-private2-2b" {
  subnet_id      = aws_subnet.example-subnet-private2-2b.id
  route_table_id = aws_route_table.example-route.id
}

resource "aws_route_table_association" "example-subnet-public1-2a" {
  subnet_id      = aws_subnet.example-subnet-public1-2a.id
  route_table_id = aws_route_table.example-route.id
}

resource "aws_route_table_association" "example-subnet-public2-2b" {
  subnet_id      = aws_subnet.example-subnet-public2-2b.id
  route_table_id = aws_route_table.example-route.id
}
