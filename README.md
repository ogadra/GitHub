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
