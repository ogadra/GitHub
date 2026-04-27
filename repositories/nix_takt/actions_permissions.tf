resource "github_workflow_repository_permissions" "nix_takt" {
  repository                       = github_repository.nix_takt.name
  can_approve_pull_request_reviews = true
}
