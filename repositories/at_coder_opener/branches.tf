resource "github_branch_protection" "at_coder_opener" {
  repository_id = github_repository.at_coder_opener.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
