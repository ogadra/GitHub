resource "github_repository" "playwright_mcp" {
  name        = "playwright-mcp"
  description = "Playwright MCP server"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "microsoft"
  source_repo  = "playwright-mcp"

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
