output "vpc_id" {
  value = aws_vpc.main.id
}
output "common_tags" {
  value = var.common_tags
}
output "subnet_ids" {
  value = aws_subnet.public[*].id
}
output "cluster_iam_role_arn" {
  value = aws_iam_role.kube_cluster.arn
}
output "nodes_iam_role_arn" {
  value = aws_iam_role.worker_node.arn
}
locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH


apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.worker_node.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH
}

output "config_map_aws_auth" {
  value = local.config_map_aws_auth
}
