resource "github_repository" "claude_code_action" {
  name        = "claude-code-action"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "anthropics"
  source_repo  = "claude-code-action"

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
