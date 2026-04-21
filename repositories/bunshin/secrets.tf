data "github_actions_public_key" "bunshin" {
  repository = github_repository.bunshin.name
}

data "external" "encrypted_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_actions_public_key.bunshin.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_actions_secret" "bunshin" {
  for_each = data.external.encrypted_secrets.result

  repository      = github_repository.bunshin.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}

data "github_dependabot_public_key" "bunshin" {
  repository = github_repository.bunshin.name
}

data "external" "encrypted_dependabot_secrets" {
  program = ["${path.root}/tools/encrypt/encrypt"]

  query = {
    key  = data.github_dependabot_public_key.bunshin.key
    file = "${path.module}/secrets.json"
  }
}

resource "github_dependabot_secret" "bunshin" {
  for_each = data.external.encrypted_dependabot_secrets.result

  repository      = github_repository.bunshin.name
  secret_name     = each.key
  encrypted_value = each.value

  lifecycle {
    ignore_changes = [encrypted_value]
  }
}
