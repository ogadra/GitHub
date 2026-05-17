resource "github_repository" "elden_mail_banner" {
  name        = "elden_mail_banner"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "MettiFire"
  source_repo  = "elden_mail_banner"

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
