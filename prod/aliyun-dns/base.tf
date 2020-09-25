terraform {
  backend "oss" {}

  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = ">= 1.98"
    }
  }
}

provider "alicloud" {
  access_key = var.global.aliyun.ak
  secret_key = var.global.aliyun.sk
  region     = var.global.aliyun.region
}
