resource "github_branch_protection" "elden_mail_banner" {
  repository_id = github_repository.elden_mail_banner.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
