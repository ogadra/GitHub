resource "github_repository" "ebi0510_conference_app" {
  name        = "ebi0510ConferenceApp"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "ebi0510"
  source_repo  = "ConferenceApp"

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
