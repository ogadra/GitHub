resource "github_issue_labels" "nix_takt" {
  repository = github_repository.nix_takt.name
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
