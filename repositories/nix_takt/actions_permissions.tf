resource "github_workflow_repository_permissions" "nix_takt" {
  repository                       = github_repository.nix_takt.name
  default_workflow_permissions     = "write"
  can_approve_pull_request_reviews = true
}
