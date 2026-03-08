.PHONY: init auth

# Initialize the project
init:
	direnv allow

# Authenticate with GitHub CLI with required scopes for Terraform
auth:
	gh auth login --scopes "repo" --web
