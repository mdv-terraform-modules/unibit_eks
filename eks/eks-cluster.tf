# EKS Cluster Resources

data "aws_caller_identity" "current" {}

#=================== Cluster Security Group ===============

resource "aws_security_group" "cluster_sg" {
  name        = "${var.cluster_name}-SG"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  egress {
    from_port   = var.any_port
    to_port     = var.any_port
    protocol    = var.any_protocol
    cidr_blocks = [var.any_cidr]
  }

  tags = merge(var.common_tags, { Name = "${var.cluster_name}-SG" })
}

resource "aws_security_group_rule" "cluster_sg_ingress" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = var.ssl_port
  protocol          = var.protocol
  security_group_id = aws_security_group.cluster_sg.id
  to_port           = var.ssl_port
  type              = "ingress"
}

#=================== EKS Cluster ======================

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.role_arn

  vpc_config {
    security_group_ids = [aws_security_group.cluster_sg.id]
    subnet_ids         = var.subnet_ids
  }
  tags = merge(var.common_tags, { Account = local.account_id })
}
