resource "github_repository" "ojicord" {
  name        = "ojicord"
  description = "Give birth to dystopia on Discord"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "tsuzu"
  source_repo  = "ojicord"

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
