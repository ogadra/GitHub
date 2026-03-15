terraform {
  required_version = ">= 1.14"

  backend "s3" {}

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.11"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }
  }
}

provider "github" {
  owner = "ogadra"
}
