resource "github_repository" "spotify_via_terminal" {
  name        = "spotify-via-terminal"
  description = "Simple spotify control via command-line"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "madeyexz"
  source_repo  = "spotify-via-terminal"

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
