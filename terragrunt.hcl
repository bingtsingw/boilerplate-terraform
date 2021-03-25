locals {
  env = yamldecode(file("${get_parent_terragrunt_dir()}/.env.yml"))

  remote = {
    backend = local.env.remote_backend
    ak      = local.env.remote_access_key
    sk      = local.env.remote_secret_key
    region  = local.env.remote_region
    bucket  = local.env.remote_bucket
    prefix  = local.env.remote_prefix
    key     = local.env.remote_key
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
