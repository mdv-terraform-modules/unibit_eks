module "global" {
  source = "github.com/mdv-terraform-modules/unibit_eks//global?ref=v0.1"

  vpc_cidr                 = "10.0.0.0/16"
  owner                    = "UniBit"
  environment              = "STAGING"
  cluster_iam_role_name    = "UniBit-EKS-cluster-role"
  node_group_iam_role_name = "UniBit-EKS-node-group-role"
}


module "eks_frontend" {
  source = "github.com/mdv-terraform-modules/unibit_eks//eks?ref=v0.1"

  vpc_id          = module.global.vpc_id
  common_tags     = module.global.common_tags
  cluster_name    = "UniBit-EKS-frontend"
  node_group_name = "UniBit-EKS-frontend-ng"
  role_arn        = module.global.cluster_iam_role_arn
  node_role_arn   = module.global.nodes_iam_role_arn
  subnet_ids      = module.global.subnet_ids
  instance_types  = "t3.medium"
  desired_size    = 1
  max_size        = 1
  min_size        = 1

  depends_on = [module.global]
}


module "eks_backend" {
  source = "github.com/mdv-terraform-modules/unibit_eks//eks?ref=v0.1"

  vpc_id          = module.global.vpc_id
  common_tags     = module.global.common_tags
  cluster_name    = "UniBit-EKS-backend"
  node_group_name = "UniBit-EKS-backend-ng"
  role_arn        = module.global.cluster_iam_role_arn
  node_role_arn   = module.global.nodes_iam_role_arn
  subnet_ids      = module.global.subnet_ids
  instance_types  = "t3.medium"
  desired_size    = 1
  max_size        = 1
  min_size        = 1

  depends_on = [module.global]
}
