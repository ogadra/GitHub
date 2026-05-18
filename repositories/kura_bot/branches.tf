resource "github_branch_protection" "kura_bot" {
  repository_id = github_repository.kura_bot.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
