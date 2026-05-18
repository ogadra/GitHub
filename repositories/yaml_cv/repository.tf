resource "github_repository" "yaml_cv" {
  name        = "yaml_cv"
  description = "YAMLによる履歴書作成スクリプト"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "kaityo256"
  source_repo  = "yaml_cv"

  has_issues      = false
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
