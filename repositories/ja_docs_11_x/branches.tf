resource "github_branch_protection" "ja_docs_11_x" {
  repository_id = github_repository.ja_docs_11_x.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
