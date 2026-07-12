resource "github_repository" "uuid_janken_tie" {
  name         = "uuid-janken-tie"
  description  = "UUIDじゃんけん(uuid-janken.mimifuwa.cc)を常にあいこにするChrome拡張機能"
  homepage_url = "https://chromewebstore.google.com/detail/uuid%E3%81%82%E3%81%84%E3%81%93/mlaihdbehockndegmgpbpmgcomgpledl"
  visibility   = "public"
  topics       = []

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
