#!/usr/bin/env bash
# 把 main 的分支保护落到 GitHub：PR 必需、必需检查、合并队列、线性历史、
# 禁止 force push / 删除，并关闭 merge commit / squash（只留 rebase merge）。
#
# 必需检查默认是 `pr / run`（快速门禁）与 `gates / run`（PR 上是 type + area 子集，
# merge_group 上是完整 gate + units + area）。合并队列负责在最新 main + 队列前序 PR
# 的组合 head 上重跑必需检查；因此默认关闭 strict up-to-date，避免进队列前还要手动 rebase。
#
# 依赖：gh（已登录，且有仓库 admin 权限）、jq。
#
# 用法:
#   nix/tools/github-branch-protection.sh [--dry-run] [--consolidate] [--no-repo-settings]
#     [--no-merge-queue] [--repo OWNER/REPO] [--branch main]
#     [--checks "pr / run,gates / run"] [--approvals N]
#
# 默认只创建/更新名为 main-pr-flow 的 ruleset；--consolidate 会删除旧的
# disable-force-push-main / liner-commit（新 ruleset 已包含它们的规则）。
# --no-merge-queue 用于回滚：移除 merge_queue 并恢复 strict up-to-date。
set -euo pipefail

usage() {
  cat <<'EOF'
usage: github-branch-protection.sh [options]

  --dry-run            打印将写入的 ruleset / 仓库设置，不做修改
  --consolidate        创建新 ruleset 后删除旧的 disable-force-push-main / liner-commit
  --no-repo-settings   不改仓库的 merge 方式设置
  --no-merge-queue     不启用合并队列，并恢复 strict up-to-date
  --repo OWNER/REPO    默认取当前仓库
  --branch NAME        受保护分支，默认 main
  --checks LIST        逗号分隔的必需检查，默认 "pr / run,gates / run"
  --approvals N        必需 approve 数，默认 0
  -h, --help           显示本帮助
EOF
}

repo=""
branch="main"
ruleset_name="main-pr-flow"
required_checks="pr / run,gates / run"
approvals="0"
dry_run=0
consolidate=0
repo_settings=1
merge_queue=1

while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) dry_run=1 ;;
    --consolidate) consolidate=1 ;;
    --no-repo-settings) repo_settings=0 ;;
    --no-merge-queue) merge_queue=0 ;;
    --repo) repo="${2:?--repo 需要 OWNER/REPO}"; shift ;;
    --branch) branch="${2:?--branch 需要分支名}"; shift ;;
    --checks) required_checks="${2:?--checks 需要检查列表}"; shift ;;
    --approvals) approvals="${2:?--approvals 需要数字}"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "github-branch-protection: 未知参数 $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

command -v gh >/dev/null 2>&1 || { echo "github-branch-protection: 需要 gh" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "github-branch-protection: 需要 jq（nix develop 提供）" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "github-branch-protection: gh 未登录" >&2; exit 1; }

if [ -z "$repo" ]; then
  repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
fi

case "$approvals" in
  ''|*[!0-9]*) echo "github-branch-protection: --approvals 必须是非负整数" >&2; exit 2 ;;
esac

checks_json=$(printf '%s' "$required_checks" |
  jq -R 'split(",") | map(gsub("^\\s+|\\s+$"; "")) | map(select(length > 0)) | map({context: .})')

if [ "$checks_json" = "[]" ]; then
  echo "github-branch-protection: 必需检查为空" >&2
  exit 2
fi

# 显式固定 unattributed commits 的额外审批：GitHub 当前默认 true，这里写出来避免默认值漂移。
# 有合并队列时 strict 必须关闭：队列会在最新 main + 前序 PR 的组合 head 上重跑必需检查，
# 再要求 PR 自己跟上 main 只会把 rebase 风暴带回来。
payload=$(jq -n \
  --arg name "$ruleset_name" \
  --arg branch "$branch" \
  --argjson checks "$checks_json" \
  --argjson approvals "$approvals" \
  --argjson merge_queue "$merge_queue" \
  '{
    name: $name,
    target: "branch",
    enforcement: "active",
    conditions: {ref_name: {include: ["refs/heads/\($branch)"], exclude: []}},
    bypass_actors: [],
    rules: ([
      {type: "deletion"},
      {type: "non_fast_forward"},
      {type: "required_linear_history"},
      {type: "pull_request", parameters: {
        required_approving_review_count: $approvals,
        dismiss_stale_reviews_on_push: false,
        require_code_owner_review: false,
        require_last_push_approval: false,
        require_extra_approval_for_unattributed_changes: true,
        required_review_thread_resolution: true,
        allowed_merge_methods: ["rebase"]
      }},
      {type: "required_status_checks", parameters: {
        strict_required_status_checks_policy: ($merge_queue == 0),
        do_not_enforce_on_create: false,
        required_status_checks: $checks
      }}
    ] + (if $merge_queue == 1 then [{
      type: "merge_queue",
      parameters: {
        check_response_timeout_minutes: 90,
        grouping_strategy: "HEADGREEN",
        max_entries_to_build: 2,
        max_entries_to_merge: 6,
        merge_method: "REBASE",
        min_entries_to_merge: 2,
        min_entries_to_merge_wait_minutes: 5
      }
    }] else [] end))
  }')

echo "github-branch-protection: repo=$repo branch=$branch ruleset=$ruleset_name" >&2
echo "github-branch-protection: required checks=$required_checks approvals=$approvals" >&2
if [ "$merge_queue" -eq 1 ]; then
  echo "github-branch-protection: merge queue=REBASE HEADGREEN min=2 max=6 wait=5m" >&2
else
  echo "github-branch-protection: merge queue=disabled (strict up-to-date restored)" >&2
fi

if [ "$dry_run" -eq 1 ]; then
  if [ "$repo_settings" -eq 1 ]; then
    cat >&2 <<'EOF'
would patch repo: allow_merge_commit=false allow_squash_merge=false
                  allow_rebase_merge=true delete_branch_on_merge=true
EOF
  fi
  printf '%s\n' "$payload"
  exit 0
fi

if [ "$repo_settings" -eq 1 ]; then
  gh api --method PATCH "repos/$repo" \
    -F allow_merge_commit=false \
    -F allow_squash_merge=false \
    -F allow_rebase_merge=true \
    -F delete_branch_on_merge=true >/dev/null
  echo "github-branch-protection: 仓库合并设置已更新（仅 rebase merge）" >&2
fi

ruleset_id=$(gh api "repos/$repo/rulesets" --jq ".[] | select(.name == \"$ruleset_name\") | .id")

if [ -n "$ruleset_id" ]; then
  method=PUT
  url="repos/$repo/rulesets/$ruleset_id"
  echo "github-branch-protection: 更新已有 ruleset ($ruleset_id)" >&2
else
  method=POST
  url="repos/$repo/rulesets"
  echo "github-branch-protection: 创建 ruleset" >&2
fi

response=$(printf '%s' "$payload" | gh api --method "$method" "$url" --input -)
ruleset_id=$(printf '%s' "$response" | jq -r .id)
[ -n "$ruleset_id" ] && [ "$ruleset_id" != "null" ] || {
  echo "github-branch-protection: ruleset 写入失败" >&2
  exit 1
}

if [ "$consolidate" -eq 1 ]; then
  for legacy in disable-force-push-main liner-commit; do
    legacy_id=$(gh api "repos/$repo/rulesets" --jq ".[] | select(.name == \"$legacy\") | .id")
    if [ -n "$legacy_id" ] && [ "$legacy_id" != "$ruleset_id" ]; then
      gh api --method DELETE "repos/$repo/rulesets/$legacy_id" >/dev/null
      echo "github-branch-protection: 已删除旧 ruleset $legacy ($legacy_id)" >&2
    fi
  done
fi

gh api "repos/$repo/rulesets/$ruleset_id" --jq '{
  name,
  enforcement,
  bypass_actors: (.bypass_actors | length),
  rules: [.rules[].type],
  checks: [.rules[] | select(.type == "required_status_checks") | .parameters.required_status_checks[].context],
  strict: [.rules[] | select(.type == "required_status_checks") | .parameters.strict_required_status_checks_policy][0],
  merge_queue: ([.rules[] | select(.type == "merge_queue") | .parameters][0] // null),
  merge_methods: [.rules[] | select(.type == "pull_request") | .parameters.allowed_merge_methods][]
}'