resource "github_branch_protection" "go_rest_sample" {
  repository_id = github_repository.go_rest_sample.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
