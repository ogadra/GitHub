resource "github_branch_protection" "site_error_checker" {
  repository_id = github_repository.site_error_checker.node_id
  pattern       = "branch"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
