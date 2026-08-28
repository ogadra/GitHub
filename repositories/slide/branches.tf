resource "github_branch_protection" "slide" {
  repository_id = github_repository.slide.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_status_checks {
    strict = true
    contexts = [
      "check",
      "test",
      "build",
      "e2e",
    ]
  }
}
