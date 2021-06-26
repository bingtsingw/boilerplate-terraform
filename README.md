# boilerplate-terraform

> I CHANGED MY WORKFLOW AND IT'S NOT SUTABLE FOR OPEN SOURCE ANYMORE, SO I MAKE THIS PROJECT AS ARCHIVED.

> 我调整了工作流, 新的boilerplate涉及私钥, 已经不适合开源了, 这个项目也不再维护. 有兴趣交流使用terraform的, 可以加我微信bingtsingw

This is a boilerplate using [terraform](https://www.terraform.io) with [terragrunt](https://github.com/gruntwork-io/terragrunt).

## Features

- [dotenv](https://github.com/motdotla/dotenv)-like variables management.
- remote backend with alicloud oss.
- built-in `Makefile` to simplify daily work.

## Usage

```shell
# set environment variables in .env.yml file
cp .env.yml.example .env.yml

# run make command
make module-clone MODULE_NAME=xxx
make plan
make apply
```

## Explanation for Dotenv

In fact, `terraform` or `terragrunt` does not support `dotenv`, so we cannot use a `.env` file directly.

Instead, we can borrow the idea behind `dotenv`. Just parse a `.env.yml` file with `terragrunt`'s `yamldecode` function to simulate this feature.

## TODO

- [ ] add tests
- [ ] add backend supoprt for aws
- [x] add workflow for style lint
