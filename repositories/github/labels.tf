resource "github_issue_labels" "github" {
  repository = github_repository.github.name

  label {
    name        = "add-or-update"
    color       = "1d76db"
    description = "Terraform plan includes resource additions or updates"
  }

  label {
    name        = "destroy"
    color       = "d93f0b"
    description = "Terraform plan includes resource deletions or replacements"
  }

  label {
    name        = "no-changes"
    color       = "0e8a16"
    description = "Terraform plan has no changes"
  }

  label {
    name        = "dependencies"
    color       = "0366d6"
    description = "Pull requests that update a dependency file"
  }

  label {
    name        = "github_actions"
    color       = "000000"
    description = "Pull requests that update GitHub Actions code"
  }
}
