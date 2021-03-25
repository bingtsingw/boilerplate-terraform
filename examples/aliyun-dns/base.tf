terraform {
  backend "oss" {}

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
    }
  }
}

provider "alicloud" {
  access_key = var.global.aliyun.ak
  secret_key = var.global.aliyun.sk
  region     = var.global.aliyun.region
}
