#!/usr/bin/env bash
# issue 打开时的原生元数据同步：标题前缀 -> issue type；epic 进入 Todo；
# 没有类型且未标记的 issue 补 needs-refinement。
#
# 用法:
#   nix/tools/issue-triage.sh <owner/repo> <issue-number> <action>
set -euo pipefail

usage() {
  sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//'
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

repo=${1:?需要 owner/repo}
issue=${2:?需要 issue 编号}
action=${3:-opened}

ROOT=$(CDPATH='' cd -- "$(dirname -- "$0")/../.." && pwd)
issue_tool="$ROOT/nix/tools/issue.sh"

command -v gh >/dev/null 2>&1 || { echo "issue-triage: 需要 gh" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "issue-triage: 需要 jq" >&2; exit 1; }

[ "$action" = "opened" ] || exit 0

meta=$(gh api "repos/$repo/issues/$issue" --jq '{
  state,
  title,
  type: (.type.name // ""),
  status: (.status.name // ""),
  has_refinement: ([.labels[].name] | index("needs-refinement") != null)
}')
state=$(jq -r .state <<<"$meta")
[ "$state" = "open" ] || exit 0

title=$(jq -r .title <<<"$meta")
type=$(jq -r .type <<<"$meta")
status=$(jq -r .status <<<"$meta")

type_for_title() {
  case "$1" in
    "[bug]"*) echo "Bug" ;;
    "[feat]"* | "[feature]"*) echo "Feature" ;;
    "[chore]"*) echo "Chore" ;;
    "[epic]"*) echo "Epic" ;;
    *) return 1 ;;
  esac
}

if [ -z "$type" ]; then
  if type=$(type_for_title "$title"); then
    gh api -X PATCH "repos/$repo/issues/$issue" -f type="$type" >/dev/null
    echo "issue-triage: #$issue type -> $type"
  else
    type=""
  fi
fi

if [ "$type" = "Epic" ] && { [ -z "$status" ] || [ "$status" = "Backlog" ]; }; then
  "$issue_tool" --repo "$repo" status "$issue" todo >/dev/null
  echo "issue-triage: #$issue -> Todo（epic 默认排期）"
fi

if [ -z "$type" ] && [ "$(jq -r .has_refinement <<<"$meta")" != "true" ]; then
  gh issue edit "$issue" --repo "$repo" --add-label needs-refinement >/dev/null
  echo "issue-triage: #$issue 缺少类型，标记 needs-refinement"
fi