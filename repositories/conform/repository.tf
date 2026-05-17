resource "github_repository" "conform" {
  name        = "conform"
  description = "A type-safe form validation library utilizing web fundamentals to progressively enhance HTML Forms with full support for server frameworks like Remix and Next.js."
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "edmundhung"
  source_repo  = "conform"

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
