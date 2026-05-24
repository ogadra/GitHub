resource "github_branch_protection" "spotify_via_terminal" {
  repository_id = github_repository.spotify_via_terminal.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
