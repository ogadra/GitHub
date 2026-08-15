---
name: create-repository
description: Add a new GitHub repository module to this Terraform repo and open a PR. Use when the user wants to create/manage a new repository via Terraform, or mentions "create repository", "新しいリポジトリ", "リポジトリ作成", "fork", "repository を Terraform で管理".
allowed-tools: Bash(git switch:*), Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git push:*), Bash(git branch:*), Bash(terraform fmt:*), Bash(terraform validate:*), Bash(terraform init:*), Bash(tflint:*), Bash(checkov:*), Bash(gitleaks:*), Bash(gh repo view:*), Bash(gh pr create:*), Write, Edit, Read
---

# Create Repository

このリポジトリ（`integrations/github` provider で GitHub リポジトリ群を Terraform 管理）に、新しいリポジトリを作成する root module を追加し、PR を作成する。

`repositories/<module_name>/` がそれぞれ独立した Terraform root であり、state も repository ごとに分かれている（S3 backend の key は `providers.tf` の backend ブロックに書く）。集約用の root module は存在しないため、ディレクトリを追加するだけで CI の plan 対象になる。

`<module_name>` はリポジトリ名を snake_case にしたもの（`cf-infra` → `cf_infra`、`ebi0510ConferenceApp` → `ebi0510_conference_app`）。

## 入力の確認

ユーザーから以下を確認する（不明なものはデフォルト/空で進めてよい）。

- **リポジトリ名**（必須, 例: `cf-infra`）
- 説明 `description`（任意, 空文字可）
- ホームページ `homepage_url`（任意）
- トピック `topics`（任意, 例: `["terraform", "cloudflare"]`）
- fork かどうか（fork の場合は `source_owner` / `source_repo` が必要）
- 可視性 `visibility`（`public` 固定。private リポジトリはここでは管理しない）

fork の場合は `gh repo view <owner>/<repo> --json description,homepageUrl,defaultBranchRef,visibility,repositoryTopics` で fork 元のメタデータを確認し、`description` と branch protection の `pattern`（default branch 名）を揃える。

## 手順

### 1. ブランチを作成

```bash
git switch -c feat/create-<module_name>-repository
```

fork の場合は `fork/<owner>-<repo>` を使う。

### 2. モジュールディレクトリと 3 ファイルを作成

`repositories/<module_name>/repository.tf`:

```hcl
resource "github_repository" "<module_name>" {
  name        = "<repo-name>"
  description = "<description>"
  visibility  = "public"
  topics      = []

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
```

fork の場合は `topics` の後に追記する:

```hcl
  fork         = true
  source_owner = "<owner>"
  source_repo  = "<repo>"
```

`repositories/<module_name>/branches.tf`:

```hcl
resource "github_branch_protection" "<module_name>" {
  repository_id = github_repository.<module_name>.node_id
  pattern       = "main"

  allows_force_pushes    = false
  allows_deletions       = false
  require_signed_commits = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }
}
```

`repositories/<module_name>/providers.tf`（既存 repository と同じ内容にする。version は他のディレクトリからコピーして揃える）:

```hcl
terraform {
  required_version = ">= 1.14"

  backend "s3" {
    key = "repositories/<module_name>/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "= 6.11.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "= 2.3.5"
    }
  }
}

provider "github" {
  owner = "ogadra"
}
```

Actions secret を管理する場合のみ、`secrets.tf` と `secrets.json.example` を既存 repository（`repositories/github/` など）から複製する。

### 3. 検証（プロジェクトの lefthook / CI と同条件）

```bash
terraform fmt -recursive
terraform -chdir=repositories/<module_name> init -backend=false -upgrade
terraform -chdir=repositories/<module_name> validate
tflint --recursive --minimum-failure-severity=notice
checkov -d . --external-checks-dir ./custom_policies --quiet --compact
```

`git add` の前に `git status` / `git diff` で差分を確認し、その後:

```bash
git add repositories/<module_name>
gitleaks protect --staged --verbose
```

すべて pass することを確認する。fmt は差分を出さない状態に、checkov は `Failed checks: 0` を確認する。
`custom_policies/CKV_GIT_LABEL_1.py` によりラベルの色は小文字のみ許可されるため、`github_issue_labels` を書く場合は色を小文字にする。

### 4. コミットと PR

```bash
git commit -m "feat: create <repo-name> repository"
git push -u origin feat/create-<module_name>-repository
gh pr create --title "feat: create <repo-name> repository" --body "<概要>"
```

fork の場合のコミットメッセージは `feat: add fork of <owner>/<repo>`。
コミットメッセージは conventional commits（英語）。

### 5. マージ後の apply

apply する GitHub Actions のワークフローは無いため、マージ後に手元で apply する。

```bash
terraform -chdir=repositories/<module_name> init
terraform -chdir=repositories/<module_name> apply
```

## CI の挙動

PR の plan は変更された `repositories/<module_name>/` だけを matrix で回す。
`repositories/` 配下以外（`tools/`、ワークフロー、README など）を変更した場合は全 repository が対象になる。
差分が無い repository には tfcmt がコメントしない。
