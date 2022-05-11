### VPC
output "vpc_id" {
  value = aws_vpc.example-vpc.id
}

output "example-subnet-private1-2a_id" {
  value = aws_subnet.example-subnet-private1-2a.id
}
output "example-subnet-private2-2b_id" {
  value = aws_subnet.example-subnet-private2-2b.id
}
output "example-subnet-public1-2a_id" {
  value = aws_subnet.example-subnet-public1-2a.id
}
output "example-subnet-public2-2b_id" {
  value = aws_subnet.example-subnet-public2-2b.id
}
