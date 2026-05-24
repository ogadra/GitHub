resource "github_branch_protection" "empty_variable_in_wrangler" {
  repository_id = github_repository.empty_variable_in_wrangler.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
