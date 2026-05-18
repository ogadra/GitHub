resource "github_branch_protection" "word_difference_rate" {
  repository_id = github_repository.word_difference_rate.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
