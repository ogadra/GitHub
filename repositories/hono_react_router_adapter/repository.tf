resource "github_repository" "hono_react_router_adapter" {
  name        = "hono-react-router-adapter"
  description = "Hono <-> React Router Adapter"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "yusukebe"
  source_repo  = "hono-react-router-adapter"

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
