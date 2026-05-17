resource "github_repository" "poke_controller_modified" {
  name        = "Poke-Controller-Modified"
  description = "Pokemon sword & shild controller using LUFA Project (AVR), serial communication and video capture for the Nintendo Switch."
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "Rokkoku"
  source_repo  = "Poke-Controller-Modified"

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
