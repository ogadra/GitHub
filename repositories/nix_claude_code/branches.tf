resource "github_branch_protection" "nix_claude_code" {
  repository_id = github_repository.nix_claude_code.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
