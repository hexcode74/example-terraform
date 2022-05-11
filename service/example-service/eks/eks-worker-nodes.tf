#
# EKS Worker Nodes Resources
#  * EKS Node Group to launch worker nodes
#

resource "aws_eks_node_group" "example-node" {
  cluster_name    = aws_eks_cluster.example-eks.name
  node_group_name = "example-node"
  node_role_arn   = aws_iam_role.example-node.arn
  subnet_ids      = [data.terraform_remote_state.example-vpc.outputs.example-subnet-public1-2a_id,
                     data.terraform_remote_state.example-vpc.outputs.example-subnet-public2-2b_id ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-node-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = merge(
  var.default_tags,
  {Service = "eks"},
  {Name = "example-eks-node"}
  )
}
