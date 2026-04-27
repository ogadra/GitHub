resource "github_repository" "nix_takt" {
  name       = "nix-takt"
  visibility = "public"
  topics = [
    "nix",
  ]

  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = true
  delete_branch_on_merge = true

  vulnerability_alerts = true
}
