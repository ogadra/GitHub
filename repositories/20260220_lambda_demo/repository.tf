resource "github_repository" "lambda_demo_20260220" {
  name        = "20260220-lambda-demo"
  description = ""
  visibility  = "public"
  topics      = []

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
