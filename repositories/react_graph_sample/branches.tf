resource "github_branch_protection" "react_graph_sample" {
  repository_id = github_repository.react_graph_sample.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
