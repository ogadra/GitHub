resource "github_repository" "siro53_com" {
  # checkov:skip=CKV2_GIT_1: archived repository, branch protection not applicable
  name        = "siro53.com"
  description = "ホームページ"
  visibility  = "public"
  topics      = []

  archived = true

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
