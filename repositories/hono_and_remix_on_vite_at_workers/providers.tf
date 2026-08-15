terraform {
  required_version = ">= 1.14"

  backend "s3" {
    key = "repositories/hono_and_remix_on_vite_at_workers/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "= 6.11.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "= 2.3.5"
    }
  }
}

provider "github" {
  owner = "ogadra"
}
