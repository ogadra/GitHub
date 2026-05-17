resource "github_repository" "awesome_matching" {
  name        = "awesome-matching"
  description = "2026年4月のトレンドで作成されたマッチングアプリ風ジョークの一覧"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "PenguinCabinet"
  source_repo  = "awesome-matching"

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
