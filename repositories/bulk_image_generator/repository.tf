resource "github_repository" "bulk_image_generator" {
  name        = "bulk-image-generator"
  description = "Bulk-generates chair images using an RTX 5070 Ti"
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
