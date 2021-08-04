variable "vpc_cidr" {}
variable "owner" {}
variable "environment" {}
variable "cluster_iam_role_name" {}
variable "node_group_iam_role_name" {}
variable "num_subnets" {
  type    = number
  default = 3
}
variable "newbits" {
  type    = number
  default = 8
}
variable "netnum" {
  type    = number
  default = 30
}
variable "common_tags" {
  type = map(string)
  default = {
    installer = "terraform"
    WARNING   = "Do not edit this object manually"
  }
}
variable "any_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
