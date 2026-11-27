#!/usr/bin/env bash
# GitHub 合并队列的常用操作。gh CLI 没有查看 / 移出队列的子命令，这里统一走 GraphQL。
#
# 用法:
#   nix/tools/merge-queue.sh status [branch]
#   nix/tools/merge-queue.sh enqueue <pr> [--jump]
#   nix/tools/merge-queue.sh dequeue <pr>
#   nix/tools/merge-queue.sh wait <pr> [timeout-seconds]
#   nix/tools/merge-queue.sh arm <pr>
#   nix/tools/merge-queue.sh disarm <pr>
#   nix/tools/merge-queue.sh sweep [--dry-run] [<pr>...]
#
# 依赖：gh（已登录，且有 pull-requests: write）、jq。
#
# 说明：正常合并只需 arm auto-merge（automerge.yml 会做）；enqueue / dequeue 用于手动干预。
# stack 的 arm/disarm 用 includeStack 覆盖整条；入队走 REST merge-async（GraphQL 没有
# stack 参数）。sweep 补 enqueue：GitHub 回归（community#209348）后，已 arm 的 PR 在
# required checks 变绿时不会自动进入规则集合并队列，需要外部再调用一次 enqueue。
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
  arm <pr>                   arm auto-merge；stack 用 includeStack 覆盖整条
  disarm <pr>                关闭 auto-merge；stack 用 includeStack 覆盖整条
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
          id
          state
          mergedAt
          isDraft
          isInMergeQueue
          isMergeQueueEnabled
          mergeStateStatus
          labels(first:50) { nodes { name } }
          stack {
            number
            size
            entries(first:50) {
              nodes {
                position
                pullRequest {
                  id
                  number
                  state
                  isDraft
                  isInMergeQueue
                  mergeStateStatus
                  headRefOid
                  labels(first:50) { nodes { name } }
                  autoMergeRequest(includeStack: true) { mergeMethod }
                }
              }
            }
          }
          autoMergeRequest { mergeMethod }
          stackAutoMergeRequest: autoMergeRequest(includeStack: true) { mergeMethod }
          mergeQueueEntry { position state estimatedTimeToMerge }
        }
      }
    }'
}

stack_number_of() {
  jq -r '.data.repository.pullRequest.stack.number // empty' <<<"$1"
}

# stack 里最上层 open、非 draft 的 PR：number<TAB>id<TAB>headRefOid
stack_top_open() {
  jq -r '
    [.data.repository.pullRequest.stack.entries.nodes[]
     | select(.pullRequest.state == "OPEN" and .pullRequest.isDraft == false)] as $open
    | if ($open | length) == 0 then empty
      else ($open | max_by(.position).pullRequest | [.number, .id, .headRefOid] | @tsv)
      end'
}

# stack 可以 arm：有 open 层、都不是 draft、没有 hold 标签（checks 可以还没绿）。
stack_armable() {
  jq -e '
    [.data.repository.pullRequest.stack.entries.nodes[]
     | select(.pullRequest.state == "OPEN")] as $open
    | ($open | length) > 0
      and all($open[]; (.pullRequest.isDraft | not))
      and all($open[]; ([.pullRequest.labels.nodes[].name]
            | map(select(. == "blocked" or . == "needs-info" or . == "wontfix"))
            | length) == 0)' >/dev/null <<<"$1"
}

# 所有 open 层都可合并：非 draft、不在队列、checks 绿、没有 hold 标签。
stack_ready() {
  jq -e '
    [.data.repository.pullRequest.stack.entries.nodes[]
     | select(.pullRequest.state == "OPEN")] as $open
    | ($open | length) > 0
      and all($open[]; (.pullRequest.isDraft | not))
      and all($open[]; (.pullRequest.isInMergeQueue | not))
      and all($open[]; (.pullRequest.mergeStateStatus == "CLEAN"
                       or .pullRequest.mergeStateStatus == "UNSTABLE"))
      and all($open[]; ([.pullRequest.labels.nodes[].name]
            | map(select(. == "blocked" or . == "needs-info" or . == "wontfix"))
            | length) == 0)' >/dev/null <<<"$1"
}

# 最上层 open 的 PR 已经带上 stack auto-merge 请求。
stack_armed() {
  jq -e '
    [.data.repository.pullRequest.stack.entries.nodes[]
     | select(.pullRequest.state == "OPEN" and .pullRequest.isDraft == false)] as $open
    | ($open | length) > 0
      and (($open | max_by(.position).pullRequest.autoMergeRequest) != null)' \
    >/dev/null <<<"$1"
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

  stack_number=$(stack_number_of "$s")
  if [ -n "$stack_number" ]; then
    if [ "$jump" = "true" ]; then
      echo "merge-queue: stack #$stack_number 不支持 --jump" >&2
      return 1
    fi
    # GraphQL 没有 stack 入队能力；merge-async 会把该 PR 及所有 open 的下层一起入队。
    if ! out=$(gh api --method PUT \
      -H "X-GitHub-Api-Version: 2026-03-10" \
      -H "Accept: application/vnd.github+json" \
      "repos/$repo/pulls/$pr/merge-async" \
      -f merge_action=merge_queue -f sha="$head" 2>&1); then
      echo "$out" >&2
      return 1
    fi
    echo "merge-queue: PR #$pr（stack #$stack_number）已提交入队"
    return 0
  fi

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
                pullRequest{ number title stack{number} stackEntry{position} }
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
    printf '%-4s %-16s %-8s %-8s %-8s %s\n' POS STATE ETA_SEC PR STACK TITLE
    jq -r '.[] |
      [ .position,
        .state,
        (.estimatedTimeToMerge // "-"),
        ("#" + (.pullRequest.number | tostring)),
        (if .pullRequest.stack
         then "\(.pullRequest.stack.number)/\(.pullRequest.stackEntry.position)"
         else "-" end),
        .pullRequest.title ] | @tsv' <<<"$nodes" |
      while IFS=$'\t' read -r pos state eta pr stack title; do
        printf '%-4s %-16s %-8s %-8s %-8s %s\n' "$pos" "$state" "$eta" "$pr" "$stack" "$title"
      done
    ;;

  enqueue)
    pr="${1:-}"
    require_number "$pr"
    jump=false
    if [ "${2:-}" = "--jump" ]; then jump=true; fi
    enqueue_pr "$pr" "$jump" || exit 1
    ;;

  arm)
    pr="${1:-}"
    require_number "$pr"
    s=$(pr_state "$pr")
    stack_number=$(stack_number_of "$s")
    queue_enabled=$(jq -r '.data.repository.pullRequest.isMergeQueueEnabled // false' <<<"$s")

    if [ -n "$stack_number" ]; then
      is_stack=true
      if ! stack_armable "$s"; then
        echo "merge-queue: stack #$stack_number 有 draft / hold，不能 arm" >&2
        exit 1
      fi
      if stack_armed "$s"; then
        echo "merge-queue: stack #$stack_number 已 arm"
        exit 0
      fi
      top=$(stack_top_open "$s")
      target_pr=$(cut -f1 <<<"$top")
      target_id=$(cut -f2 <<<"$top")
    else
      is_stack=false
      state=$(jq -r '.data.repository.pullRequest.state' <<<"$s")
      draft=$(jq -r '.data.repository.pullRequest.isDraft' <<<"$s")
      if [ "$state" != "OPEN" ] || [ "$draft" = "true" ]; then
        echo "merge-queue: PR #$pr 不是 open 或仍是 draft" >&2
        exit 1
      fi
      if [ "$(jq -r '.data.repository.pullRequest.autoMergeRequest != null' <<<"$s")" = "true" ]; then
        echo "merge-queue: PR #$pr 已 arm"
        exit 0
      fi
      target_pr="$pr"
      target_id=$(jq -r '.data.repository.pullRequest.id' <<<"$s")
    fi

    if [ "$is_stack" = "true" ]; then
      if [ "$queue_enabled" = "true" ]; then
        # 队列自己决定 merge 方法；只保留 includeStack 语义。
        if ! gql -f id="$target_id" -F includeStack=true -f query='
          mutation($id:ID!,$includeStack:Boolean!){
            enablePullRequestAutoMerge(input:{pullRequestId:$id,includeStack:$includeStack}){
              clientMutationId
            }
          }' >/dev/null; then
          echo "merge-queue: stack #$stack_number arm 失败" >&2
          exit 1
        fi
      else
        if ! gql -f id="$target_id" -F includeStack=true -f method=REBASE -f query='
          mutation($id:ID!,$includeStack:Boolean!,$method:PullRequestMergeMethod!){
            enablePullRequestAutoMerge(input:{
              pullRequestId:$id,includeStack:$includeStack,mergeMethod:$method
            }){clientMutationId}
          }' >/dev/null; then
          echo "merge-queue: stack #$stack_number arm 失败" >&2
          exit 1
        fi
      fi
    else
      if [ "$queue_enabled" = "true" ]; then
        gh pr merge "$pr" --repo "$repo" --auto
      else
        gh pr merge "$pr" --repo "$repo" --auto --rebase
      fi
    fi
    echo "merge-queue: PR #$target_pr 已 arm${stack_number:+（stack #$stack_number）}"
    ;;

  disarm)
    pr="${1:-}"
    require_number "$pr"
    s=$(pr_state "$pr")
    stack_number=$(stack_number_of "$s")
    if [ -n "$stack_number" ]; then
      is_stack=true
      top=$(stack_top_open "$s")
      target_pr=$(cut -f1 <<<"$top")
      target_id=$(cut -f2 <<<"$top")
      if ! stack_armed "$s"; then
        echo "merge-queue: stack #$stack_number 未 arm"
        exit 0
      fi
    else
      is_stack=false
      target_pr="$pr"
      target_id=$(jq -r '.data.repository.pullRequest.id' <<<"$s")
      if [ "$(jq -r '.data.repository.pullRequest.autoMergeRequest != null' <<<"$s")" != "true" ]; then
        echo "merge-queue: PR #$pr 未 arm"
        exit 0
      fi
    fi
    if [ "$is_stack" = "true" ]; then
      if ! gql -f id="$target_id" -F includeStack=true -f query='
        mutation($id:ID!,$includeStack:Boolean!){
          disablePullRequestAutoMerge(input:{pullRequestId:$id,includeStack:$includeStack}){
            clientMutationId
          }
        }' >/dev/null; then
        echo "merge-queue: stack #$stack_number disarm 失败" >&2
        exit 1
      fi
    else
      gh pr merge "$pr" --repo "$repo" --disable-auto
    fi
    echo "merge-queue: PR #$target_pr 已 disarm${stack_number:+（stack #$stack_number）}"
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
    declare -A seen_stacks=()
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
        if [ -n "${seen_stacks[$stack]:-}" ]; then
          continue
        fi
        seen_stacks[$stack]=1
        if ! stack_ready "$s"; then
          echo "sweep: stack #$stack 跳过（有 draft / hold / 未绿 / 已在队列的层）"
          skipped=$((skipped + 1))
          continue
        fi
        if ! stack_armed "$s"; then
          echo "sweep: stack #$stack 跳过（未 arm stack auto-merge）"
          skipped=$((skipped + 1))
          continue
        fi
        top=$(stack_top_open "$s")
        top_pr=$(cut -f1 <<<"$top")
        if [ "$dry_run" = "true" ]; then
          echo "sweep: stack #$stack 需要入队 top #$top_pr（--dry-run）"
          queued=$((queued + 1))
          continue
        fi
        if enqueue_pr "$top_pr"; then
          queued=$((queued + 1))
        else
          echo "sweep: stack #$stack 入队失败（top #$top_pr）" >&2
          failed=$((failed + 1))
        fi
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