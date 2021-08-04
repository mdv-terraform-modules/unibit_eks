output "config_map_aws_auth" {
  value = module.global.config_map_aws_auth
}
output "kubeconfig_frontend" {
  value = module.eks_frontend.kubeconfig
}
output "kubeconfig_backend" {
  value = module.eks_backend.kubeconfig
}
