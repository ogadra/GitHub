resource "github_repository" "cli_demo_20260327" {
  name       = "20260327-cli-demo"
  visibility = "public"
  topics = [
    "cli",
    "go",
    "react",
    "terraform",
  ]

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
