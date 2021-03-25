default: fmt

fmt:
	terraform fmt -recursive && terragrunt hclfmt

provider-upgrade:
	terragrunt run-all init --upgrade

# make module-upgrade MODULE_VERSION=0.1.0
module-upgrade:
	find . -type f -name "*.tf" -print0 | xargs -0 sed -i '' -e 's/ref=v.*"/ref=v$(MODULE_VERSION)"/g'

graph:
	terragrunt graph-dependencies | dot -Tsvg > graph.svg

plan:
	terragrunt run-all plan

output:
	terragrunt run-all output

apply:
	terragrunt run-all apply

.PHONY: fmt provider-upgrade module-upgrade graph plan output apply
