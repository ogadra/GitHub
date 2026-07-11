.PHONY: init auth

BACKEND_CONFIG ?= $(abspath config.s3.tfbackend)

# Initialize all repository Terraform roots
init:
	direnv allow
	find repositories -mindepth 1 -maxdepth 1 -type d -not -name .terraform \
		| sort \
		| while read -r repository; do \
			name="$$(basename "$$repository")"; \
			TF_CLI_ARGS_init= terraform -chdir="$$repository" init -upgrade \
				-backend-config=$(BACKEND_CONFIG) \
				-backend-config="key=repositories/$$name/terraform.tfstate"; \
	done
	git config --local core.hooksPath .git/hooks
	lefthook install --force

# Authenticate with GitHub CLI with required scopes for Terraform
auth:
	gh auth login --scopes "repo" --web
