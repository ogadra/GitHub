resource "github_repository" "phrase_cutter" {
  # checkov:skip=CKV2_GIT_1: archived repository, branch protection not applicable
  name        = "phrase_cutter"
  description = ""
  visibility  = "public"
  topics      = []

  archived = true

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
