#
# EC2 SG
#  * EC2 Security Group to allow networking traffic 
#

resource "aws_security_group" "example-ec2" {
  name        = "example-ec2-sg"
  description = "EC2 Security Group to allow networking traffic"
  vpc_id      = data.terraform_remote_state.example-vpc.outputs.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
  var.default_tags,
  {Service = "ec2"},
  {Name = "example-ec2-sg"}
  )
}

