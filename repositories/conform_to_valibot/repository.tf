resource "github_repository" "conform_to_valibot" {
  # checkov:skip=CKV2_GIT_1: archived repository, branch protection not applicable
  name        = "conform-to-valibot"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "chimame"
  source_repo  = "conform-to-valibot"

  archived = true

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
