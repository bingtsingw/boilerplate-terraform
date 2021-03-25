# Terraform Boilerplate

This is a simple example for using terraform with [terragrunt](https://github.com/gruntwork-io/terragrunt).

## Features

- [x] [dotenv](https://github.com/motdotla/dotenv) like variables management.
- [x] remote backend with alicloud.

## Usage

```shell
# set environment variables in .env.yml file
cp .env.yml.example .env.yml

# run terragrunt commmand with make
make plan
```

## Explanation for Dotenv

In fact, `terraform` or `terragrunt` does not support `dotenv`, so we cannot use a `.env` file directly.

Instead, we can borrow the idea behind `dotenv`. Just parse a `.env.yml` file with `terragrunt`'s `yamldecode` function to simulate this feature.
