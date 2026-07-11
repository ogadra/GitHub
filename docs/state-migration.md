# State migration

This document describes how to split the current aggregated Terraform state into
one state per repository.

## Backend keys

Each repository root uses this S3 backend key:

```text
repositories/<repository>/terraform.tfstate
```

For example, `repositories/github` uses:

```text
repositories/github/terraform.tfstate
```

## Address mapping

Resources currently live under the aggregated module path:

```text
module.repositories.module.<module_name>.<resource_address>
```

After migration, each repository directory is a Terraform root, so the target
address drops the module prefix:

```text
<resource_address>
```

Most module names match the repository directory name. These two directories use
different module names in the old state:

| Repository directory | Old module name |
| --- | --- |
| `repositories/20260220_lambda_demo` | `lambda_demo_20260220` |
| `repositories/20260327_cli_demo` | `cli_demo_20260327` |

## Procedure

Run these commands from the repository root.

1. Build the encryption helper used by repositories with secrets.

```bash
go build -C tools/encrypt .
```

2. Create a temporary backend config for the old aggregated state and pull a
   backup.

```bash
backend_config="$(pwd)/config.s3.tfbackend"
mkdir -p tmp/state-migration
mkdir -p tmp/state-migration/source
cat > tmp/state-migration/source/backend.tf <<'EOF'
terraform {
  backend "s3" {}
}
EOF

TF_CLI_ARGS_init= terraform -chdir=tmp/state-migration/source init -upgrade \
  -backend-config="$backend_config" \
  -backend-config=key=terraform.tfstate

terraform -chdir=tmp/state-migration/source state pull > tmp/state-migration/aggregated.tfstate
cp tmp/state-migration/aggregated.tfstate tmp/state-migration/aggregated.backup.tfstate
```

3. Move one repository module into a local split state file.

Replace `github` with the repository directory and module name. For the two
exceptions in the table above, use the old module name for `module_name` and the
directory name for `repository`.

```bash
repository=github
module_name=github

terraform state list \
  -state=tmp/state-migration/aggregated.tfstate \
  "module.repositories.module.${module_name}" \
  | while read -r old_address; do
      new_address="${old_address#module.repositories.module.${module_name}.}"
      terraform state mv \
        -state=tmp/state-migration/aggregated.tfstate \
        -state-out="tmp/state-migration/${repository}.tfstate" \
        "$old_address" \
        "$new_address"
    done
```

4. Push the split state to the repository backend.

```bash
TF_CLI_ARGS_init= terraform -chdir="repositories/${repository}" init -upgrade \
  -backend-config="$backend_config" \
  -backend-config="key=repositories/${repository}/terraform.tfstate"

terraform -chdir="repositories/${repository}" state push \
  "../../tmp/state-migration/${repository}.tfstate"
```

5. Confirm that the migrated repository is a no-op.

```bash
terraform -chdir="repositories/${repository}" plan
```

6. Repeat steps 3 to 5 for every repository.

7. Confirm the aggregated state no longer contains repository module resources.

```bash
terraform state list -state=tmp/state-migration/aggregated.tfstate
```

8. Keep `tmp/state-migration/aggregated.backup.tfstate` until every split state
   has been checked. Do not push an emptied aggregated state until all repository
   plans are confirmed no-op.
