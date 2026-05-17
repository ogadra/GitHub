resource "github_repository" "development_guide" {
  name        = "development-guide"
  description = "Guides for developing software in WillBooster Inc. (in Japanese)"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "WillBooster"
  source_repo  = "development-guide"

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
