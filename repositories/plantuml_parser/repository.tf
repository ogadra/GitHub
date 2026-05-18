resource "github_repository" "plantuml_parser" {
  name        = "plantuml-parser"
  description = "Parse PlantUML with JavaScript or TypeScript"
  visibility  = "public"
  topics      = []

  fork         = true
  source_owner = "Enteee"
  source_repo  = "plantuml-parser"

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
