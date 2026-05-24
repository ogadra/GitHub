resource "github_branch_protection" "adverb" {
  repository_id = github_repository.adverb.node_id
  pattern       = "master"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
