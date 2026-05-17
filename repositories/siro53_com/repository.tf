resource "github_repository" "siro53_com" {
  name        = "siro53.com"
  description = "ホームページ"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "siro53"
  source_repo  = "siro53.com"

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
