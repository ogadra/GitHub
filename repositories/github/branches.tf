resource "github_branch_protection" "github_main" {
  repository_id = github_repository.github.node_id
  pattern       = "main"

  allows_force_pushes    = false # force push禁止
  allows_deletions       = false # ブランチ削除禁止
  require_signed_commits = true  # 署名付きコミット必須

  # mainへの直接pushを禁止し、PRを必須にする
  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
