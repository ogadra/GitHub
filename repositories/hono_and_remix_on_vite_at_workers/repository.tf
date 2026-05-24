resource "github_repository" "hono_and_remix_on_vite_at_workers" {
  name        = "hono-and-remix-on-vite-at-workers"
  description = ""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "yusukebe"
  source_repo  = "hono-and-remix-on-vite"

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
