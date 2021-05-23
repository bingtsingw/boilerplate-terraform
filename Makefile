default: fmt

fmt-check:
	terraform fmt -recursive -check .template && \
	terraform fmt -recursive -check modules && \
	terraform fmt -recursive -check prod && \
	terragrunt hclfmt --terragrunt-check

fmt:
	terraform fmt -recursive .template && \
	terraform fmt -recursive modules && \
	terraform fmt -recursive prod && \
	terragrunt hclfmt

provider-upgrade:
	terragrunt run-all init --upgrade

# make module-upgrade MODULE_VERSION=0.1.0
module-upgrade:
	find . -type f -name "*.tf" -print0 | xargs -0 sed -i '' -e 's/ref=v.*"/ref=v$(MODULE_VERSION)"/g'

# usage: make module-clone MODULE_NAME=xxx
module-clone:
	mkdir -p prod/${MODULE_NAME} && cp .template/aliyun/{base.tf,main.tf,outputs.tf,terragrunt.hcl} prod/${MODULE_NAME}

env-example:
	sed 's/".*"/""/' .env.yml > .env.yml.example && \
	sed -i 's/remote_key\: ""/remote_key\: "terraform\.tfstate"/' .env.yml.example

graph:
	terragrunt graph-dependencies | dot -Tsvg > graph.svg

plan:
	terragrunt run-all plan

output:
	terragrunt run-all output

apply:
	terragrunt run-all apply

.PHONY: fmt provider-upgrade module-upgrade graph plan output apply
