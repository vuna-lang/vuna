#!/usr/bin/env bash
# PR 侧的标签继承与 issue 状态流转。
#
# 用法:
#   nix/tools/pr-triage.sh <owner/repo> <pr-number> <action> [merged]
#
# action 来自 pull_request_target 的事件；merged 是 closed 事件的布尔值。
# 脚本幂等：重复运行不会重复加标签或评论。
set -euo pipefail

usage() {
  sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

repo=${1:?需要 owner/repo}
pr=${2:?需要 PR 编号}
action=${3:-edited}
merged=${4:-false}

ROOT=$(CDPATH='' cd -- "$(dirname -- "$0")/../.." && pwd)
labels_tool="$ROOT/nix/tools/pr-labels.sh"
issue_tool="$ROOT/nix/tools/issue.sh"

command -v gh >/dev/null 2>&1 || { echo "pr-triage: 需要 gh" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "pr-triage: 需要 jq" >&2; exit 1; }

pr_json=$(gh pr view "$pr" --repo "$repo" --json title,body,isDraft,labels,files,milestone)
title=$(jq -r '.title // ""' <<<"$pr_json")
body=$(jq -r '.body // ""' <<<"$pr_json")
is_draft=$(jq -r '.isDraft' <<<"$pr_json")
pr_milestone=$(jq -r '.milestone.title // empty' <<<"$pr_json")
current_labels=$(jq -r '.labels[].name' <<<"$pr_json")
files=$(jq -r '.files[].path' <<<"$pr_json")

type_from_title() {
  local value="$1" prefix
  prefix=$(printf '%s' "$value" | sed -nE 's/^([A-Za-z]+)(\([^)]*\))?!?:.*/\1/p' | tr '[:upper:]' '[:lower:]')
  case "$prefix" in
    feat|feature) echo type:feature ;;
    fix|bug|revert) echo type:bug ;;
    docs|refactor|perf|test|chore) echo "type:$prefix" ;;
    build|ci|style) echo type:chore ;;
    epic) echo type:epic ;;
  esac
}

linked_issues() {
  printf '%s\n' "$body" |
    grep -Eio '(close[sd]?|fix(e[sd])?|resolve[sd]?|refs?|references?)[[:space:]]+#[0-9]+' |
    grep -Eo '[0-9]+' | sort -u || true
}

mapfile -t issues < <(linked_issues)

type_from_issue_type() {
  case "$1" in
    Bug) echo type:bug ;;
    Feature) echo type:feature ;;
    Task) echo type:chore ;;
    Refactor) echo type:refactor ;;
    Perf) echo type:perf ;;
    Docs) echo type:docs ;;
    Test) echo type:test ;;
    Epic) echo type:epic ;;
  esac
}

issue_labels=""
issue_milestone=""
issue_type_label=""
for n in "${issues[@]}"; do
  [ -n "$n" ] || continue
  issue_json=$(gh api "repos/$repo/issues/$n")
  issue_labels+=$'\n'$(jq -r '.labels[].name | select(test("^(pkg|area):"))' <<<"$issue_json")
  if [ -z "$issue_type_label" ]; then
    issue_type_label=$(type_from_issue_type "$(jq -r '.type.name // empty' <<<"$issue_json")")
  fi
  if [ -z "$issue_milestone" ]; then
    issue_milestone=$(jq -r '.milestone.title // empty' <<<"$issue_json")
  fi
done

type_label=$(type_from_title "$title")
if [ -z "$type_label" ]; then
  type_label=$(printf '%s\n' "$current_labels" | grep -E '^type:' | head -n 1 || true)
fi
if [ -z "$type_label" ]; then
  type_label="$issue_type_label"
fi

path_labels=$(printf '%s\n' "$files" | "$labels_tool")

# 先移除过期的 type，再加上标题/issue 决定的 type。
while IFS= read -r label; do
  case "$label" in
    type:*)
      if [ "$label" != "$type_label" ]; then
        gh pr edit "$pr" --repo "$repo" --remove-label "$label" || true
      fi
      ;;
  esac
done <<<"$current_labels"

issue_meta_labels=$(printf '%s\n' "$issue_labels" | grep -E '^(pkg|area):' || true)
wanted_labels=$(printf '%s\n' "$path_labels" "$issue_meta_labels" "$type_label" | grep -v '^$' | sort -u)
while IFS= read -r label; do
  [ -n "$label" ] || continue
  if ! printf '%s\n' "$current_labels" | grep -Fqx "$label"; then
    gh pr edit "$pr" --repo "$repo" --add-label "$label"
  fi
done <<<"$wanted_labels"

if [ -z "$pr_milestone" ] && [ -n "$issue_milestone" ]; then
  gh pr edit "$pr" --repo "$repo" --milestone "$issue_milestone"
fi

set_issue_status() {
  local number="$1" wanted="$2" state
  state=$(gh api "repos/$repo/issues/$number" --jq .state)
  [ "$state" = "OPEN" ] || return 0
  "$issue_tool" --repo "$repo" status "$number" "$wanted" >/dev/null
}

if [ "$action" = "closed" ] && [ "$merged" = "true" ]; then
  # Closes #N 由 GitHub 原生关闭；Refs #N 保持 In review，等验证后手动关闭。
  exit 0
fi

if [ "$action" = "closed" ]; then
  for n in "${issues[@]}"; do
    [ -n "$n" ] || continue
    set_issue_status "$n" todo
    gh issue comment "$n" --repo "$repo" \
      --body "PR #$pr 已关闭但未合并，任务回到 \`Todo\`。" >/dev/null || true
  done
  exit 0
fi

if [ "$is_draft" = "true" ]; then
  status=in-progress
else
  status=in-review
fi

for n in "${issues[@]}"; do
  [ -n "$n" ] || continue
  set_issue_status "$n" "$status"
done