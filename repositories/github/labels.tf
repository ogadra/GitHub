resource "github_issue_labels" "github" {
  repository = github_repository.github.name

  label {
    name        = "add-or-update"
    color       = "1D76DB"
    description = "Terraform plan includes resource additions or updates"
  }

  label {
    name        = "destroy"
    color       = "D93F0B"
    description = "Terraform plan includes resource deletions or replacements"
  }

  label {
    name        = "no-changes"
    color       = "0E8A16"
    description = "Terraform plan has no changes"
  }
}
