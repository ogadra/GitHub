#!/usr/bin/env bash
# terraform plan/apply for all repositories/* roots, 8 at a time.
# Per-root output goes to tmp/tf-logs/<repo>.log.
# apply shows the diffs of all roots with changes, then applies the saved
# plans after a single confirmation.
set -euo pipefail
cd "$(dirname "$0")/.."

export LOG_DIR=tmp/tf-logs
mkdir -p "$LOG_DIR"

roots() {
	find repositories -mindepth 1 -maxdepth 1 -type d -not -name .terraform | sort
}

plan_all() {
	roots | xargs -P 8 -I{} sh -c '
		log=$LOG_DIR/$(basename {}).log
		if terraform -chdir={} plan -input=false -out=.tfplan >"$log" 2>&1; then
			echo "PLAN {}"
		else
			echo "FAIL {} (log: $log)"
			exit 1
		fi'
}

apply_all() {
	roots | xargs -P 8 -I{} sh -c '
		log=$LOG_DIR/$(basename {}).log
		if terraform -chdir={} apply .tfplan >>"$log" 2>&1; then
			echo "OK   {}"
		else
			echo "FAIL {} (log: $log)"
			exit 1
		fi'
}

show_diffs() {
	grep -l "^Plan:" "$LOG_DIR"/*.log 2>/dev/null | xargs -r cat || true
}

case "${1:-}" in
	plan)
		plan_all
		show_diffs
		;;
	apply)
		plan_all
		show_diffs
		printf "Apply all? [y/N] "
		read -r ans
		[ "$ans" = y ]
		apply_all
		;;
	*)
		echo "usage: $0 plan|apply" >&2
		exit 1
		;;
esac
