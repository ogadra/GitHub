resource "github_repository" "voice_notify_bot" {
  name        = "voice-notify-bot"
  description = "Discordで通話が始まったときにお知らせするBot"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "Yuukin256"
  source_repo  = "voice-notify-bot"

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
