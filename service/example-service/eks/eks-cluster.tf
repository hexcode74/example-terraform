#
# EKS Cluster Resources
#  * EKS Cluster
#

resource "aws_eks_cluster" "example-eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.example-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.example-cluster.id]
    subnet_ids         = [data.terraform_remote_state.example-vpc.outputs.example-subnet-public1-2a_id,
                          data.terraform_remote_state.example-vpc.outputs.example-subnet-public2-2b_id ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-cluster-AmazonEKSVPCResourceController,
  ]
  
  tags = merge(
  var.default_tags,
  {Service = "eks"},
  {Name = "example-eks-cluster"}
  )
}
