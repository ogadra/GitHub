data "github_actions_public_key" "github" {
  repository = github_repository.github.name
}

data "external" "encrypted_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_actions_public_key.github.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_actions_secret" "github" {
  for_each = data.external.encrypted_secrets.result

  repository      = github_repository.github.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}
