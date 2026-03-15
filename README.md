# GitHub

ogadraのGitHubをTerraformで管理するリポジトリ。

## セットアップ

```bash
make init
```

## GitHub CLIの認証

Terraformを実行するには、`repo`スコープを持つGitHubトークンが必要です。

```bash
make auth
```

## 使い方

```bash
terraform plan
terraform apply
```

## Secretsの更新

`github_actions_secret` は `ignore_changes` を設定しているため、通常の `terraform apply` では値が更新されません。
Secretの値を更新する場合は `-replace` を指定してください。

```bash
terraform apply -replace="github_actions_secret.github[\"SECRET_NAME\"]"
```
