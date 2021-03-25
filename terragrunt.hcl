locals {
  env = yamldecode(file("${get_parent_terragrunt_dir()}/.env.yml"))

  remote = {
    ak      = local.alicloud.ak
    sk      = local.alicloud.sk
    region  = local.alicloud.region
    backend = "oss"
    bucket  = local.env.remote_bucket
    prefix  = local.env.remote_prefix
    key     = "terraform.tfstate"
  }

  alicloud = {
    ak     = local.env.alicloud_access_key
    sk     = local.env.alicloud_secret_key
    region = local.env.alicloud_region
  }
}

inputs = {
  global = {
    remote   = local.remote
    alicloud = local.alicloud
  }
}

remote_state {
  backend = local.remote.backend
  config = {
    access_key = local.remote.ak
    secret_key = local.remote.sk
    region     = local.remote.region
    bucket     = local.remote.bucket
    encrypt    = true
    prefix     = "${local.remote.prefix}/${path_relative_to_include()}"
    key        = local.remote.key
  }
}


generate "terragrunt" {
  path      = "_terragrunt.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
variable "global" {
  type = any
}

variable "deps" {
  type = any
  default = {}
}
EOF
}
