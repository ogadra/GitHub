resource "github_repository" "cf_infra" {
  name        = "cf-infra"
  description = "Terraform repository to manage Cloudflare"
  visibility  = "public"
  topics = [
    "terraform",
    "cloudflare",
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
