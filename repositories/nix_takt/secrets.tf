data "github_actions_public_key" "nix_takt" {
  repository = github_repository.nix_takt.name
}

data "external" "encrypted_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_actions_public_key.nix_takt.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_actions_secret" "nix_takt" {
  for_each = data.external.encrypted_secrets.result

  repository      = github_repository.nix_takt.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}

data "github_dependabot_public_key" "nix_takt" {
  repository = github_repository.nix_takt.name
}

data "external" "encrypted_dependabot_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_dependabot_public_key.nix_takt.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_dependabot_secret" "nix_takt" {
  for_each = data.external.encrypted_dependabot_secrets.result

  repository      = github_repository.nix_takt.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}
