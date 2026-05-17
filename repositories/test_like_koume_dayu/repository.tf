resource "github_repository" "test_like_koume_dayu" {
  name        = "test-like-koume-dayu"
  description = "Vitest custom matcher displaying error messages in Koume Dayu's comedy style: \"〜かと思ったら〜でした〜チクショー！！\""
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "ygkn"
  source_repo  = "test-like-koume-dayu"

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
