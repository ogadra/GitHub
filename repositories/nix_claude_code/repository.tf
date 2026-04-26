resource "github_repository" "nix_claude_code" {
  name       = "nix-claude-code"
  visibility = "public"
  topics = [
    "nix",
  ]

  fork         = true
  source_owner = "ryoppippi"
  source_repo  = "nix-claude-code"

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
