#!/usr/bin/env bash
# issue 侧的状态机与 epic 子任务同步。
#
# 用法:
#   nix/tools/issue-triage.sh <owner/repo> <issue-number> <action> [event-label]
#
# action 来自 issues 事件。脚本幂等，标签事件重复触发也不会产生第二个 status。
set -euo pipefail

usage() {
  sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

repo=${1:?需要 owner/repo}
issue=${2:?需要 issue 编号}
action=${3:-edited}
event_label=${4:-}

command -v gh >/dev/null 2>&1 || { echo "issue-triage: 需要 gh" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "issue-triage: 需要 jq" >&2; exit 1; }

issue_json=$(gh issue view "$issue" --repo "$repo" --json labels,state,body)
labels=$(jq -r '.labels[].name' <<<"$issue_json")
state=$(jq -r '.state' <<<"$issue_json")
body=$(jq -r '.body // ""' <<<"$issue_json")

has_label() {
  printf '%s\n' "$labels" | grep -Fqx "$1"
}

add_label() {
  if ! has_label "$1"; then
    gh issue edit "$issue" --repo "$repo" --add-label "$1"
    labels+=$'\n'"$1"
  fi
}

remove_label() {
  if has_label "$1"; then
    gh issue edit "$issue" --repo "$repo" --remove-label "$1"
  fi
}

status_labels() {
  printf '%s\n' "$labels" | grep -E '^status:' || true
}

set_status() {
  local wanted="$1" label
  add_label "$wanted"
  while IFS= read -r label; do
    [ -n "$label" ] || continue
    if [ "$label" != "$wanted" ]; then
      remove_label "$label"
    fi
  done < <(status_labels)
}

if [ "$state" = "CLOSED" ]; then
  while IFS= read -r label; do
    [ -n "$label" ] || continue
    remove_label "$label"
  done < <(status_labels)
  exit 0
fi

case "$action" in
  opened)
    if [ -z "$(status_labels)" ]; then
      set_status status:backlog
    fi
    if ! printf '%s\n' "$labels" | grep -Eq '^type:' &&
      ! has_label needs-refinement; then
      add_label needs-refinement
    fi
    ;;
  assigned|milestoned)
    if [ -z "$(status_labels)" ] || has_label status:backlog; then
      set_status status:todo
    fi
    ;;
  reopened)
    if [ -z "$(status_labels)" ]; then
      set_status status:todo
    fi
    ;;
  labeled)
    case "$event_label" in
      status:*) set_status "$event_label" ;;
    esac
    ;;
  unlabeled)
    case "$event_label" in
      status:*)
        if [ -z "$(status_labels)" ]; then
          set_status status:backlog
        fi
        ;;
    esac
    ;;
esac

# epic 的 `- [ ] #N` 任务列表同步为 GitHub sub-issue；接口不支持时保留正文链接。
if has_label type:epic || [ "$event_label" = "type:epic" ]; then
  while IFS= read -r child; do
    [ -n "$child" ] || continue
    child_id=$(gh api "repos/$repo/issues/$child" --jq '.id' 2>/dev/null || true)
    [ -n "$child_id" ] || continue
    gh api -X POST "repos/$repo/issues/$issue/sub_issues" \
      -F sub_issue_id="$child_id" >/dev/null 2>&1 || true
  done < <(printf '%s\n' "$body" | grep -Eo '^\s*-\s*\[[ xX]\]\s*#[0-9]+' | grep -Eo '[0-9]+' | sort -u)
fi