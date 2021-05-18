terraform {
  backend "oss" {}

  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
    }
  }
}

provider "alicloud" {
  access_key = var.global.alicloud.ak
  secret_key = var.global.alicloud.sk
  region     = var.global.alicloud.region
}
