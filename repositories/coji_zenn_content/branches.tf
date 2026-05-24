resource "github_branch_protection" "coji_zenn_content" {
  repository_id = github_repository.coji_zenn_content.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
