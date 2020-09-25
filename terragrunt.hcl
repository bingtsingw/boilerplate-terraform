locals {
  env = yamldecode(file("${get_parent_terragrunt_dir()}/.env.yml"))

  remote = {
    ak      = local.aliyun.ak
    sk      = local.aliyun.sk
    region  = local.aliyun.region
    backend = "oss"
    bucket  = local.env.remote_bucket
    prefix  = local.env.remote_prefix
    key     = "terraform.tfstate"
  }

  aliyun = {
    ak     = local.env.aliyun_access_key
    sk     = local.env.aliyun_secret_key
    region = local.env.aliyun_region
  }
}

inputs = {
  global = {
    remote = local.remote
    aliyun = local.aliyun
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
