#
# RDS SG
#  * RDS Security Group to allow networking traffic 
#

resource "aws_security_group" "example-rds" {
  name        = "example-rds-sg"
  description = "RDS Security Group to allow networking traffic"
  vpc_id      = data.terraform_remote_state.example-vpc.outputs.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
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
  {Service = "rds"},
  {Name = "example-rds-sg"}
  )
}

