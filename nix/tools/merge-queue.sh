#!/usr/bin/env bash
# GitHub 合并队列的常用操作。gh CLI 没有查看 / 移出队列的子命令，这里统一走 GraphQL。
#
# 用法:
#   nix/tools/merge-queue.sh status [branch]
#   nix/tools/merge-queue.sh enqueue <pr> [--jump]
#   nix/tools/merge-queue.sh dequeue <pr>
#   nix/tools/merge-queue.sh wait <pr> [timeout-seconds]
#   nix/tools/merge-queue.sh sweep [--dry-run] [<pr>...]
#
# 依赖：gh（已登录，且有 pull-requests: write）、jq。
#
# 说明：正常合并只需 arm auto-merge（automerge.yml 会做）；enqueue / dequeue 用于手动干预。
# sweep 补 enqueue：GitHub 回归（community#209348）后，已 arm 的 PR 在 required checks
# 变绿时不会自动进入规则集合并队列，需要外部再调用一次 enqueuePullRequest。
# wait 会阻塞轮询，适合明确要等结果的终端会话；agent 会话 arm 完即可退出。
# shellcheck disable=SC2016
set -euo pipefail

usage() {
  cat <<'EOF'
usage: merge-queue.sh <command> [args]

  status [branch]            查看队列（默认 main）
  enqueue <pr> [--jump]      手动入队；--jump 插到队首（会重建后面的组）
  dequeue <pr>               移出队列
  wait <pr> [timeout]        等待合并 / 被移除，默认 1800 秒
  sweep [--dry-run] [<pr>...] 把已 arm 且可合并的 PR 补入队列（默认扫全部 open）
EOF
}

require_number() {
  case "${1:-}" in
    ''|*[!0-9]*) echo "merge-queue: 需要正整数，收到: ${1:-<空>}" >&2; exit 2 ;;
  esac
}

command -v gh >/dev/null 2>&1 || { echo "merge-queue: 需要 gh" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "merge-queue: 需要 jq（nix develop 提供）" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "merge-queue: gh 未登录" >&2; exit 1; }

cmd="${1:-}"
[ -n "$cmd" ] || { usage >&2; exit 2; }
shift

repo="${GH_REPO:-$(gh repo view --json nameWithOwner --jq .nameWithOwner)}"
owner="${repo%/*}"
name="${repo#*/}"

gql() {
  gh api graphql -f owner="$owner" -f name="$name" "$@"
}

pr_state() {
  local pr="$1"
  gql -F number="$pr" -f query='
    query($owner:String!,$name:String!,$number:Int!){
      repository(owner:$owner,name:$name){
        pullRequest(number:$number){
          state
          mergedAt
          isDraft
          isInMergeQueue
          mergeStateStatus
          labels(first:50) { nodes { name } }
          stack { number }
          autoMergeRequest { mergeMethod }
          mergeQueueEntry { position state estimatedTimeToMerge }
        }
      }
    }'
}

# 把 PR 加入队列；成功输出 position / state。已在队列视为成功。
enqueue_pr() {
  local pr="$1" jump="${2:-false}"
  local pr_json pr_id head out s
  s=$(pr_state "$pr")
  if [ "$(jq -r '.data.repository.pullRequest.isInMergeQueue // false' <<<"$s")" = "true" ]; then
    echo "merge-queue: PR #$pr 已在队列中"
    return 0
  fi
  stack_number=$(jq -r '.data.repository.pullRequest.stack.number // empty' <<<"$s")
  if [ -n "$stack_number" ]; then
    echo "merge-queue: PR #$pr 属于 stack #$stack_number，整条入队尚未接入" >&2
    return 1
  fi
  pr_json=$(gh pr view "$pr" --repo "$repo" --json id,headRefOid,isDraft,state)
  if [ "$(jq -r '.isDraft' <<<"$pr_json")" = "true" ]; then
    echo "merge-queue: PR #$pr 是 draft，不能入队" >&2
    return 1
  fi
  if [ "$(jq -r '.state' <<<"$pr_json")" != "OPEN" ]; then
    echo "merge-queue: PR #$pr 不是 open 状态" >&2
    return 1
  fi
  pr_id=$(jq -r '.id' <<<"$pr_json")
  head=$(jq -r '.headRefOid' <<<"$pr_json")
  if ! out=$(gql -f id="$pr_id" -f head="$head" -F jump="$jump" -f query='
    mutation($id:ID!,$head:GitObjectID,$jump:Boolean!){
      enqueuePullRequest(input:{
        pullRequestId:$id,
        expectedHeadOid:$head,
        jump:$jump
      }){
        mergeQueueEntry { position state }
      }
    }' 2>&1); then
    echo "$out" >&2
    s=$(pr_state "$pr")
    if [ "$(jq -r '.data.repository.pullRequest.isInMergeQueue // false' <<<"$s")" = "true" ]; then
      echo "merge-queue: PR #$pr 已在队列中" >&2
      return 0
    fi
    return 1
  fi
  jq -r '.data.enqueuePullRequest.mergeQueueEntry |
    "merge-queue: PR #'"$pr"' 已入队 position=\(.position) state=\(.state)"' <<<"$out"
}

# 分支是否启用了合并队列。
queue_present() {
  gql -f branch="${1:-main}" -f query='
    query($owner:String!,$name:String!,$branch:String!){
      repository(owner:$owner,name:$name){
        mergeQueue(branch:$branch){ id }
      }
    }' | jq -r '.data.repository.mergeQueue != null'
}

case "$cmd" in
  status|ls)
    branch="${1:-main}"
    json=$(gql -f branch="$branch" -f query='
      query($owner:String!,$name:String!,$branch:String!){
        repository(owner:$owner,name:$name){
          mergeQueue(branch:$branch){
            entries(first:50){
              nodes{
                position
                state
                estimatedTimeToMerge
                enqueuedAt
                pullRequest{ number title }
              }
            }
          }
        }
      }')
    if [ "$(jq -r '.data.repository.mergeQueue == null' <<<"$json")" = "true" ]; then
      echo "merge-queue: $repo 的 $branch 没有启用合并队列" >&2
      exit 1
    fi
    nodes=$(jq -c '.data.repository.mergeQueue.entries.nodes // []' <<<"$json")
    if [ "$nodes" = "[]" ]; then
      echo "merge-queue: $branch 队列为空"
      exit 0
    fi
    printf '%-4s %-16s %-8s %-8s %s\n' POS STATE ETA_SEC PR TITLE
    jq -r '.[] |
      [ .position,
        .state,
        (.estimatedTimeToMerge // "-"),
        ("#" + (.pullRequest.number | tostring)),
        .pullRequest.title ] | @tsv' <<<"$nodes" |
      while IFS=$'\t' read -r pos state eta pr title; do
        printf '%-4s %-16s %-8s %-8s %s\n' "$pos" "$state" "$eta" "$pr" "$title"
      done
    ;;

  enqueue)
    pr="${1:-}"
    require_number "$pr"
    jump=false
    if [ "${2:-}" = "--jump" ]; then jump=true; fi
    enqueue_pr "$pr" "$jump" || exit 1
    ;;

  dequeue)
    pr="${1:-}"
    require_number "$pr"
    pr_id=$(gh pr view "$pr" --repo "$repo" --json id --jq .id)
    if ! gql -f id="$pr_id" -f query='
      mutation($id:ID!){
        dequeuePullRequest(input:{id:$id}){ clientMutationId }
      }' >/dev/null 2>&1; then
      s=$(pr_state "$pr")
      if [ "$(jq -r '.data.repository.pullRequest.isInMergeQueue // false' <<<"$s")" = "true" ]; then
        echo "merge-queue: PR #$pr 移出队列失败" >&2
        exit 1
      fi
      echo "merge-queue: PR #$pr 不在队列中" >&2
      exit 0
    fi
    echo "merge-queue: PR #$pr 已移出队列"
    ;;

  wait)
    pr="${1:-}"
    require_number "$pr"
    timeout="${2:-1800}"
    require_number "$timeout"
    deadline=$(( $(date +%s) + timeout ))
    while :; do
      json=$(pr_state "$pr")
      state=$(jq -r '.data.repository.pullRequest.state' <<<"$json")
      merged=$(jq -r '.data.repository.pullRequest.mergedAt // empty' <<<"$json")
      if [ -n "$merged" ] || [ "$state" = "MERGED" ]; then
        echo "merge-queue: PR #$pr 已合并"
        exit 0
      fi
      if [ "$state" = "CLOSED" ]; then
        echo "merge-queue: PR #$pr 已关闭（未合并）" >&2
        exit 1
      fi
      in_queue=$(jq -r '.data.repository.pullRequest.isInMergeQueue // false' <<<"$json")
      if [ "$in_queue" != "true" ]; then
        echo "merge-queue: PR #$pr 不在队列中（可能已被移除）" >&2
        exit 1
      fi
      pos=$(jq -r '.data.repository.pullRequest.mergeQueueEntry.position // "-"' <<<"$json")
      qstate=$(jq -r '.data.repository.pullRequest.mergeQueueEntry.state // "-"' <<<"$json")
      eta=$(jq -r '.data.repository.pullRequest.mergeQueueEntry.estimatedTimeToMerge // "-"' <<<"$json")
      printf '%s position=%s state=%s eta=%s\n' "$(date -u +%H:%M:%S)" "$pos" "$qstate" "$eta"
      if [ "$(date +%s)" -ge "$deadline" ]; then
        echo "merge-queue: 等待 PR #$pr 超时（${timeout}s）" >&2
        exit 124
      fi
      sleep 10
    done
    ;;

  sweep)
    dry_run=false
    prs=()
    for arg in "$@"; do
      case "$arg" in
        --dry-run) dry_run=true ;;
        -h|--help) usage; exit 0 ;;
        *) require_number "$arg"; prs+=("$arg") ;;
      esac
    done
    if [ "$(queue_present main)" != "true" ]; then
      echo "merge-queue: main 没有启用合并队列，sweep 跳过"
      exit 0
    fi
    if [ "${#prs[@]}" -eq 0 ]; then
      mapfile -t prs < <(gh pr list --repo "$repo" --state open --json number --jq '.[].number')
    fi
    if [ "${#prs[@]}" -eq 0 ]; then
      echo "merge-queue: 没有 open PR"
      exit 0
    fi

    queued=0
    skipped=0
    failed=0
    for pr in "${prs[@]}"; do
      s=$(pr_state "$pr")
      state=$(jq -r '.data.repository.pullRequest.state // "UNKNOWN"' <<<"$s")
      draft=$(jq -r '.data.repository.pullRequest.isDraft // false' <<<"$s")
      in_queue=$(jq -r '.data.repository.pullRequest.isInMergeQueue // false' <<<"$s")
      armed=$(jq -r '.data.repository.pullRequest.autoMergeRequest != null' <<<"$s")
      ms=$(jq -r '.data.repository.pullRequest.mergeStateStatus // "UNKNOWN"' <<<"$s")
      stack=$(jq -r '.data.repository.pullRequest.stack.number // empty' <<<"$s")
      hold=$(jq -r '[.data.repository.pullRequest.labels.nodes[].name]
        | map(select(. == "blocked" or . == "needs-info" or . == "wontfix"))
        | first // empty' <<<"$s")

      if [ "$state" != "OPEN" ] || [ "$draft" = "true" ]; then
        echo "sweep: #$pr 跳过（state=$state draft=$draft）"
        skipped=$((skipped + 1))
        continue
      fi
      if [ -n "$stack" ]; then
        echo "sweep: #$pr 跳过（属于 stack #$stack，整条入队待接入）"
        skipped=$((skipped + 1))
        continue
      fi
      if [ -n "$hold" ]; then
        echo "sweep: #$pr 跳过（hold=$hold）"
        skipped=$((skipped + 1))
        continue
      fi
      if [ "$in_queue" = "true" ]; then
        echo "sweep: #$pr 跳过（已在队列）"
        skipped=$((skipped + 1))
        continue
      fi
      if [ "$armed" != "true" ]; then
        echo "sweep: #$pr 跳过（未 arm auto-merge）"
        skipped=$((skipped + 1))
        continue
      fi
      if [ "$ms" != "CLEAN" ] && [ "$ms" != "UNSTABLE" ]; then
        echo "sweep: #$pr 跳过（mergeStateStatus=$ms）"
        skipped=$((skipped + 1))
        continue
      fi

      if [ "$dry_run" = "true" ]; then
        echo "sweep: #$pr 需要入队（--dry-run）"
        queued=$((queued + 1))
        continue
      fi
      if enqueue_pr "$pr"; then
        queued=$((queued + 1))
      else
        echo "sweep: #$pr 入队失败" >&2
        failed=$((failed + 1))
      fi
    done
    if [ "$dry_run" = "true" ]; then
      echo "merge-queue: 待处理 ${#prs[@]} 个 PR，其中 $queued 个需要入队，跳过 $skipped 个（--dry-run 未改动）"
    else
      echo "merge-queue: 处理 ${#prs[@]} 个 PR，入队 $queued 个，跳过 $skipped 个，失败 $failed 个"
    fi
    [ "$failed" -eq 0 ] || exit 1
    ;;

  -h|--help|help)
    usage
    ;;
  *)
    echo "merge-queue: 未知命令 $cmd" >&2
    usage >&2
    exit 2
    ;;
esac