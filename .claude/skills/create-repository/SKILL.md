---
name: create-repository
description: Add a new GitHub repository module to this Terraform repo and open a PR. Use when the user wants to create/manage a new repository via Terraform, or mentions "create repository", "新しいリポジトリ", "リポジトリ作成", "repository を Terraform で管理".
allowed-tools: Bash(git switch:*), Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git push:*), Bash(git branch:*), Bash(terraform fmt:*), Bash(terraform validate:*), Bash(terraform init:*), Bash(tflint:*), Bash(checkov:*), Bash(gitleaks:*), Bash(gh pr create:*), Write, Edit, Read
---

# Add Repository

このリポジトリ（`integrations/github` provider で GitHub リポジトリ群を Terraform 管理）に、新しいリポジトリを作成するモジュールを追加し、PR を作成する。

各リポジトリは `repositories/<module_name>/` 配下の 1 モジュールとして管理され、`repositories/main.tf` から参照される。

## 入力の確認

ユーザーから以下を確認する（不明なものはデフォルト/空で進めてよい）。

- **リポジトリ名**（必須, 例: `cf-infra`）
- 説明 `description`（任意, 空文字可）
- トピック `topics`（任意, 例: `["terraform", "cloudflare"]`）
- fork かどうか（fork の場合は `source_owner` / `source_repo` が必要）
- 可視性 `visibility` - `public`以外許容しない。privateリポジトリはこのリポジトリで管理しない。

## 手順

### 1. ブランチを作成

```bash
git switch -c feat/add-<module_name>-repository
```

### 2. モジュールディレクトリと 3 ファイルを作成

`repositories/<module_name>/repository.tf`:

```hcl
resource "github_repository" "<module_name>" {
  name        = "<repo-name>"
  description = "<description>"
  visibility  = "public"
  topics = [
    # "terraform",
  ]

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

`repositories/<module_name>/providers.tf`:

```hcl
terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}
```

### 3. main.tf にモジュールを登録

`repositories/main.tf` に、モジュール名のアルファベット順になる位置へ挿入する:

```hcl
module "<module_name>" {
  source = "./<module_name>"
}
```

### 4. 検証（プロジェクトの lefthook / CI と同条件）

```bash
terraform fmt -recursive
terraform init -backend=false
terraform validate
tflint
checkov -d . --external-checks-dir ./custom_policies --quiet --compact
```

`git add` の前に `git status` / `git diff` で差分を確認し、その後:

```bash
git add repositories/<module_name> repositories/main.tf
gitleaks protect --staged --verbose
```

すべて pass することを確認する。fmt は差分を出さない状態に、checkov は `Failed checks: 0` を確認する。

### 5. コミットと PR

```bash
git commit -m "feat: create <repo-name> repository"
git push -u origin feat/create-<module_name>-repository
gh pr create --title "feat: create <repo-name> repository" --body "<概要>"
```

コミットメッセージは conventional commits（英語）。
