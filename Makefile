.PHONY: init auth

# Initialize the project
init:
	direnv allow
	terraform init
	lefthook install

# Authenticate with GitHub CLI with required scopes for Terraform
auth:
	gh auth login --scopes "repo" --web
