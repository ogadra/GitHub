resource "github_repository" "stop_twitter" {
  name        = "stop-twitter"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "a-kifumi"
  source_repo  = "stop-twitter"

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
