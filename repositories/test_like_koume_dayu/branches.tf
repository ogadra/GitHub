resource "github_branch_protection" "test_like_koume_dayu" {
  repository_id = github_repository.test_like_koume_dayu.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
