resource "github_repository" "ja_docs_11_x" {
  name        = "ja-docs-11.x"
  description = "https://github.com/laravel-ja/ja-docs-11.x"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "laravel-ja"
  source_repo  = "ja-docs-11.x"

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
