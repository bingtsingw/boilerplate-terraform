# Terragrunt Demo

A simple example for using [terragrunt](https://github.com/gruntwork-io/terragrunt) with remote backend and [dotenv](https://github.com/motdotla/dotenv) like variables management.

## Usage

```shell
cp .env.yml.example .env.yml
# set environment variables in .env.yml file
cd prod/aliyun-dns && terragrunt apply
```

## Explanation

### Dotenv

In fact, `terraform` or `terragrunt` does not support `dotenv`, so we cannot use a `.env` file directly.

Instead, we can borrow the idea behind `dotenv`. Just parse a `.env.yml` file with `terragrunt`'s `yamldecode` function to simulate this feature.
