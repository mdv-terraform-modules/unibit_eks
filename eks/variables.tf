variable "vpc_id" {}
variable "common_tags" {}
variable "cluster_name" {}
variable "role_arn" {}


variable "node_group_name" {}
variable "node_role_arn" {}
variable "subnet_ids" {}
variable "instance_types" {}
variable "any_port" {
  default = 0
}
variable "any_protocol" {
  default = "-1"
}
variable "any_cidr" {
  default = "0.0.0.0/0"
}
variable "ssl_port" {
  default = 443
}
variable "protocol" {
  default = "tcp"
}
variable "desired_size" {
  default = 1
}
variable "max_size" {
  default = 1
}
variable "min_size" {
  default = 1
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}
