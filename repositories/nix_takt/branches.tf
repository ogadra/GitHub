resource "github_branch_protection" "nix_takt" {
  repository_id = github_repository.nix_takt.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_status_checks {
    strict = false
    contexts = [
      "gitleaks",
      "fmt-check",
      "typecheck",
      "build-and-test (ubuntu-latest)",
      "build-and-test (ubuntu-24.04-arm)",
      "build-and-test (macos-latest)",
    ]
  }

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
