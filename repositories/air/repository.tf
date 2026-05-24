resource "github_repository" "air" {
  name        = "air"
  description = "☁️ Live reload for Go apps"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "air-verse"
  source_repo  = "air"

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
