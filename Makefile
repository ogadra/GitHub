.PHONY: init auth

# Initialize the project
init:
	direnv allow
	terraform init

# Authenticate with GitHub CLI with required scopes for Terraform
auth:
	gh auth login --scopes "repo" --web
