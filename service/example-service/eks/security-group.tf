#
# EKS Cluster 
#  * EC2 Security Group to allow networking traffic with EKS cluster
#

resource "aws_security_group" "example-cluster" {
  name        = "example-eks-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = data.terraform_remote_state.example-vpc.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
  var.default_tags,
  {Service = "sg"},
  {Name = "example-eks-sg"}
  )
}

resource "aws_security_group_rule" "example-cluster-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.example-cluster.id
  to_port           = 443
  type              = "ingress"
}

