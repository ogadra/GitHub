resource "github_repository" "github" {
  # GitHubリポジトリ名。 github.com/ogadra/GitHub になる。
  name = "GitHub"

  # aboutセクションに表示されるリポジトリ説明
  description = "Terraform repository to manage GitHub"

  # リポジトリの公開設定。 public, private, internal(organizationの場合)のいずれかを指定
  visibility = "public"

  # リポジトリのトピックタグ
  topics = [
    "terraform",
    "github",
  ]

  has_issues      = true  # Issue有効
  has_discussions = false # Discussion無効
  has_projects    = false # Project無効
  has_wiki        = false # Wiki無効

  allow_merge_commit     = true  # マージコミット可
  allow_squash_merge     = false # スカッシュマージ不可
  allow_rebase_merge     = false # リベースマージ不可
  allow_auto_merge       = false # 自動マージ不可
  delete_branch_on_merge = true  # マージ後ブランチ削除

  vulnerability_alerts = true # 脆弱性アラート有効
}

resource "github_branch_protection" "github_main" {
  repository_id = github_repository.github.node_id
  pattern       = "main"

  allows_force_pushes    = false # force push禁止
  allows_deletions       = false # ブランチ削除禁止
  require_signed_commits = true  # 署名付きコミット必須

  # mainへの直接pushを禁止し、PRを必須にする
  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}

resource "github_issue_labels" "github" {
  repository = github_repository.github.name

  label {
    name        = "add-or-update"
    color       = "1D76DB"
    description = "Terraform plan includes resource additions or updates"
  }

  label {
    name        = "destroy"
    color       = "D93F0B"
    description = "Terraform plan includes resource deletions or replacements"
  }

  label {
    name        = "no-changes"
    color       = "0E8A16"
    description = "Terraform plan has no changes"
  }
}


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
