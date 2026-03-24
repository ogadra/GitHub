data "github_actions_public_key" "cli_demo_20260327" {
  repository = github_repository.cli_demo_20260327.name
}

data "external" "encrypted_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_actions_public_key.cli_demo_20260327.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_actions_secret" "cli_demo_20260327" {
  for_each = data.external.encrypted_secrets.result

  repository      = github_repository.cli_demo_20260327.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}

data "github_dependabot_public_key" "cli_demo_20260327" {
  repository = github_repository.cli_demo_20260327.name
}

data "external" "encrypted_dependabot_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_dependabot_public_key.cli_demo_20260327.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_dependabot_secret" "cli_demo_20260327" {
  for_each = data.external.encrypted_dependabot_secrets.result

  repository      = github_repository.cli_demo_20260327.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}
