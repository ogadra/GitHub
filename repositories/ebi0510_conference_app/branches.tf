resource "github_branch_protection" "ebi0510_conference_app" {
  repository_id = github_repository.ebi0510_conference_app.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
