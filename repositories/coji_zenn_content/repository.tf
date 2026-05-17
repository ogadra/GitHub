resource "github_repository" "coji_zenn_content" {
  name        = "coji-zenn-content"
  description = "@coji's zenn-content"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "coji"
  source_repo  = "zenn-content"

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
