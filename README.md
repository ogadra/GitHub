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

repository ごとに Terraform root と state を分けています。

```bash
cd repositories/github
terraform plan
terraform apply
```

S3 backend の key は `repositories/<repository>/terraform.tfstate` です。

既存の全体 state から分割 state へ移行する場合は [docs/state-migration.md](docs/state-migration.md) を参照してください。

## ラベル管理

ラベルは `github_issue_labels` リソース（authoritative）で管理します。
デフォルトラベルを含め、このリソースに定義されていないラベルはすべて削除します。

## Secretsの更新

`github_actions_secret` は `ignore_changes` を設定しているため、通常の `terraform apply` では値が更新されません。
Secretの値を更新する場合は `-replace` を指定してください。

```bash
terraform apply -replace="github_actions_secret.github[\"SECRET_NAME\"]"
```
