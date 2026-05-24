resource "github_repository" "self_hosted_runner" {
  name        = "self-hosted-runner"
  description = "GitHub Actions Self-Hosted Runner構築用リポジトリ"
  visibility  = "public"
  topics      = []

  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = false
  delete_branch_on_merge = true

  vulnerability_alerts = true
}
