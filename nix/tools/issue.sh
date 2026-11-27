#!/usr/bin/env bash
# issue 原生元数据的统一入口。
#
# status / priority / relates-to 没有 gh 原生 flag，走 REST；其余关系直接用 gh：
#   gh issue edit <n> --type Epic | --parent <p> | --add-sub-issue <c> | --add-blocked-by <m>
#   gh issue close <n> --reason duplicate --duplicate-of <m>
#
# 用法:
#   nix/tools/issue.sh [--repo OWNER/REPO] show <n>
#   nix/tools/issue.sh [--repo OWNER/REPO] status <n> <状态> [--duplicate-of <m>]
#   nix/tools/issue.sh [--repo OWNER/REPO] priority <n> <级别>
#   nix/tools/issue.sh [--repo OWNER/REPO] relate <n> <m>
#   nix/tools/issue.sh [--repo OWNER/REPO] list [--state S] [--status S] [--type T] [--priority P]
#   nix/tools/issue.sh [--repo OWNER/REPO] audit
#
# 状态: backlog | todo | in-progress | in-review | done | not-planned | duplicate
# 优先级: P0..P3 或 Urgent | High | Medium | Low（Priority 字段里显示为后者）
set -euo pipefail

usage() {
  sed -n '2,18p' "$0" | sed 's/^# \{0,1\}//'
}

die() {
  echo "issue.sh: $*" >&2
  exit 1
}

repo=""
while [ $# -gt 0 ]; do
  case "$1" in
    --repo)
      repo="${2:?--repo 需要 OWNER/REPO}"
      shift 2
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *) break ;;
  esac
done

command -v gh >/dev/null 2>&1 || die "需要 gh"

if [ -z "$repo" ]; then
  repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
fi
owner=${repo%%/*}

[ $# -gt 0 ] || {
  usage >&2
  exit 2
}
cmd=$1
shift

status_name() {
  case "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')" in
    backlog) echo "Backlog" ;;
    todo) echo "Todo" ;;
    in-progress | "in progress") echo "In progress" ;;
    in-review | "in review") echo "In review" ;;
    done | completed) echo "Done" ;;
    not-planned | "not planned") echo "Not planned" ;;
    duplicate) echo "Duplicate" ;;
    *) return 1 ;;
  esac
}

priority_name() {
  case "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')" in
    p0 | urgent) echo "Urgent" ;;
    p1 | high) echo "High" ;;
    p2 | medium) echo "Medium" ;;
    p3 | low) echo "Low" ;;
    *) return 1 ;;
  esac
}

priority_field_id() {
  gh api "orgs/$owner/issue-fields" 2>/dev/null |
    jq -r '.[] | select(.name == "Priority") | .id' 2>/dev/null ||
    gh api "users/$owner/issue-fields" |
      jq -r '.[] | select(.name == "Priority") | .id'
}

issue_id() {
  gh api "repos/$repo/issues/$1" --jq .id
}

# 子任务进入 In progress / In review 时，把父 issue 从 Backlog/Todo 推到 In progress。
advance_parent() {
  local n=$1 want=$2 parent meta
  case "$want" in
    "In progress" | "In review") ;;
    *) return 0 ;;
  esac
  [ "${ISSUE_SKIP_PARENT:-0}" = 1 ] && return 0
  parent=$(gh issue view "$n" --repo "$repo" --json parent --jq '.parent.number // empty')
  [ -n "$parent" ] || return 0
  meta=$(gh api "repos/$repo/issues/$parent" --jq '{state, status: .status.name}')
  [ "$(jq -r .state <<<"$meta")" = "OPEN" ] || return 0
  case "$(jq -r .status <<<"$meta")" in
    Backlog | Todo | "") ;;
    *) return 0 ;;
  esac
  gh api -X PATCH "repos/$repo/issues/$parent" -f status="In progress" >/dev/null
  echo "#$parent -> In progress"
}

cmd_show() {
  local n=${1:?show 需要 issue 号} issue relations relates parent
  issue=$(gh api "repos/$repo/issues/$n" --jq '{
    number,
    state,
    status: (.status.name // "-"),
    type: (.type.name // "-"),
    priority: ([.issue_field_values[]? | select(.issue_field_name == "Priority") | (.single_select_option.name // (.value | tostring))] | first // "-"),
    subs: (.sub_issues_summary.completed | tostring) + "/" + (.sub_issues_summary.total | tostring)
  }')
  relations=$(gh issue view "$n" --repo "$repo" --json parent,blockedBy,blocking)
  relates=$(gh api "repos/$repo/issues/$n/relates_to" --jq '[.[].number] | join(", ")')

  printf '#%s  %s  status=%s  type=%s  priority=%s\n' \
    "$(jq -r .number <<<"$issue")" \
    "$(jq -r .state <<<"$issue")" \
    "$(jq -r .status <<<"$issue")" \
    "$(jq -r .type <<<"$issue")" \
    "$(jq -r .priority <<<"$issue")"
  parent=$(jq -r '.parent.number // 0' <<<"$relations")
  [ "$parent" != "0" ] && echo "parent: #$parent"
  echo "sub-issues: $(jq -r .subs <<<"$issue")"
  blocked=$(jq -r '[.blockedBy.nodes[].number] | join(", ")' <<<"$relations")
  echo "blocked by: ${blocked:--}"
  blocking=$(jq -r '[.blocking.nodes[].number] | join(", ")' <<<"$relations")
  echo "blocking: ${blocking:--}"
  echo "relates to: ${relates:--}"
}

cmd_status() {
  local n=${1:?status 需要 issue 号} want meta state cur dup="" dup_id
  shift
  want=$(status_name "${1:-}") || die "未知状态 ${1:-}；可用 backlog|todo|in-progress|in-review|done|not-planned|duplicate"
  shift || true
  while [ $# -gt 0 ]; do
    case "$1" in
      --duplicate-of)
        dup="${2:?--duplicate-of 需要 issue 号}"
        shift 2
        ;;
      *) die "status 未知参数 $1" ;;
    esac
  done

  meta=$(gh api "repos/$repo/issues/$n" --jq '{state, status: .status.name}')
  state=$(jq -r .state <<<"$meta")
  cur=$(jq -r .status <<<"$meta")

  case "$want" in
    Backlog | Todo | "In progress" | "In review")
      [ "$state" = "OPEN" ] || die "#$n 已关闭；设为 $want 会重新打开"
      ;;
  esac

  if [ "$want" = "Duplicate" ]; then
    [ -n "$dup" ] || die "设置 Duplicate 需要 --duplicate-of <n>"
    dup_id=$(issue_id "$dup")
    gh api -X PATCH "repos/$repo/issues/$n" \
      -f status="Duplicate" -F duplicate_issue_id="$dup_id" >/dev/null
  elif [ "$cur" = "$want" ]; then
    echo "#$n 已是 $want"
    return 0
  else
    gh api -X PATCH "repos/$repo/issues/$n" -f status="$want" >/dev/null
  fi

  echo "#$n -> $want"
  advance_parent "$n" "$want"
}

cmd_priority() {
  local n=${1:?priority 需要 issue 号} name field payload
  name=$(priority_name "${2:-}") || die "未知优先级 ${2:-}；可用 P0..P3 或 Urgent|High|Medium|Low"
  field=$(priority_field_id)
  [ -n "$field" ] || die "找不到 Priority 字段"
  payload=$(jq -n --argjson field "$field" --arg value "$name" \
    '{issue_field_values: [{field_id: $field, value: $value}]}')
  printf '%s' "$payload" |
    gh api -X PATCH "repos/$repo/issues/$n" --input - >/dev/null
  echo "#$n priority -> $name"
}

cmd_relate() {
  local n=${1:?relate 需要 issue 号} m=${2:?relate 需要目标 issue 号} id
  id=$(issue_id "$m")
  gh api -X POST "repos/$repo/issues/$n/relates_to" -F issue_id="$id" >/dev/null
  echo "#$n relates to #$m"
}

cmd_list() {
  local state=open status="" type="" priority="" path filter=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --state)
        state="${2:?--state 需要 open|closed|all}"
        shift 2
        ;;
      --status)
        status=$(status_name "${2:?--status 需要状态名}") || die "未知状态 $2"
        shift 2
        ;;
      --type)
        type="${2:?--type 需要类型名}"
        shift 2
        ;;
      --priority)
        priority=$(priority_name "${2:?--priority 需要级别}") || die "未知优先级 $2"
        shift 2
        ;;
      *) die "list 未知参数 $1" ;;
    esac
  done

  path="repos/$repo/issues?state=$state&per_page=100"
  [ -n "$type" ] && path="$path&type=$type"
  [ -n "$priority" ] && path="$path&issue_field_values=priority:$priority"

  gh api --paginate "$path" --jq '
    .[] | select(.pull_request == null) |
    [.number, .status.name, (.type.name // "-"), .title] | @tsv' |
    if [ -n "$status" ]; then
      awk -F'\t' -v want="$status" '$2 == want'
    else
      cat
    fi |
    sort -k1,1n |
    while IFS=$'\t' read -r num st ty title; do
      printf '#%s\t%s\t%s\t%s\n' "$num" "$st" "$ty" "$title"
    done
}

cmd_audit() {
  local bad=0 types residual texty untyped

  types=$(gh api "orgs/$owner/issue-types" --jq '[.[].name] | join(",")' 2>/dev/null ||
    gh api "users/$owner/issue-types" --jq '[.[].name] | join(",")')
  for want in Task Bug Feature Refactor Perf Docs Test Epic; do
    if ! printf '%s\n' "$types" | tr ',' '\n' | grep -Fxq "$want"; then
      echo "缺少 issue type: $want" >&2
      bad=$((bad + 1))
    fi
  done

  residual=$(gh issue list --repo "$repo" --state all --limit 1000 --json number,labels --jq '
    .[] | select([.labels[].name] | any(test("^(status|priority|type):"))) | .number' | sort -n)
  if [ -n "$residual" ]; then
    echo "仍有 status/priority/type label 的 issue:" >&2
    printf '  #%s\n' $residual >&2
    bad=$((bad + 1))
  fi

  texty=$(gh issue list --repo "$repo" --state all --limit 1000 --json number,body --jq '
    .[] | select((.body // "") | test("(?im)^\\s*-\\s*(Parent|Blocked by|Blocks|Related)[:：]")) | .number' | sort -n)
  if [ -n "$texty" ]; then
    echo "正文里仍有关系文本的 issue:" >&2
    printf '  #%s\n' $texty >&2
    bad=$((bad + 1))
  fi

  untyped=$(gh api --paginate "repos/$repo/issues?state=open&per_page=100" --jq '
    .[] | select(.pull_request == null and .type == null
      and ([.labels[].name] | any(startswith("debt")) | not)) | .number' | sort -n)
  if [ -n "$untyped" ]; then
    echo "缺 issue type 的 open issue:" >&2
    printf '  #%s\n' $untyped >&2
    bad=$((bad + 1))
  fi

  if [ "$bad" -eq 0 ]; then
    echo "issue audit: ok"
  else
    exit 1
  fi
}

case "$cmd" in
  show) cmd_show "$@" ;;
  status) cmd_status "$@" ;;
  priority) cmd_priority "$@" ;;
  relate) cmd_relate "$@" ;;
  list) cmd_list "$@" ;;
  audit) cmd_audit ;;
  *)
    die "未知子命令 $cmd"
    ;;
esac