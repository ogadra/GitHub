resource "github_repository" "intern_line_bot" {
  name        = "intern-line-bot"
  description = "LINE BOT（オウム返し）のプロジェクト"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "kymtgt"
  source_repo  = "intern-line-bot"

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
