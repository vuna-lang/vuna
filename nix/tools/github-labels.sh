#!/usr/bin/env bash
# 仓库标签同步与旧标签迁移。
#
# 用法:
#   nix/tools/github-labels.sh [--sync] [--migrate] [--prune] [--dry-run]
#                              [--repo OWNER/REPO] [--file PATH]
#
#   --sync     按 .github/labels.yml 创建/更新标签（默认）
#   --migrate  先把旧标签批量迁移到新标签，再 --sync 一次
#   --prune    删除 labels.yml 里没有的标签（危险，需显式开启）
#   --dry-run  只打印将执行的命令
#
# 迁移不在 GitHub 上重命名标签，而是「先给 issue/PR 加新标签，再删旧标签」：
# 这样目标标签已存在、旧标签仍被少量对象引用时也能收敛。
set -euo pipefail

usage() {
  sed -n '2,18p' "$0" | sed 's/^# \{0,1\}//'
}

repo=""
file=""
mode="sync"
prune=0
dry_run=0

ROOT=$(CDPATH='' cd -- "$(dirname -- "$0")/../.." && pwd)
file="$ROOT/.github/labels.yml"

while [ $# -gt 0 ]; do
  case "$1" in
    --sync) mode="sync" ;;
    --migrate) mode="migrate" ;;
    --prune) prune=1 ;;
    --dry-run) dry_run=1 ;;
    --repo) repo="${2:?--repo 需要 OWNER/REPO}"; shift ;;
    --file) file="${2:?--file 需要路径}"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "github-labels: 未知参数 $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

command -v gh >/dev/null 2>&1 || { echo "github-labels: 需要 gh" >&2; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "github-labels: 需要 python3" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "github-labels: gh 未登录" >&2; exit 1; }

if [ -z "$repo" ]; then
  repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
fi

run() {
  if [ "$dry_run" -eq 1 ]; then
    printf 'would run:'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

# 旧的自由标签 -> 新的受管标签。逗号分隔表示一个旧标签映射到多个新标签。
# 这份表只服务一次性迁移；新增标签请直接改 labels.yml。
migrate_aliases() {
  cat <<'EOF'
bug=type:bug
增强=type:feature
文档=type:docs
重构=type:refactor
性能=type:perf
编译器前端=area:compiler-frontend,pkg:compiler
编译器后端=area:codegen-ocaml,pkg:target-ocaml
工具链=pkg:toolchain
重复=duplicate
无效=invalid
EOF
}

# labels.yml 的固定形状解析：只认 `- name:` / `color:` / `description:`。
# 输出 TSV，交给下面的 while read 使用。
read_labels() {
  python3 - "$file" <<'PY'
import json
import re
import sys

path = sys.argv[1]
items = []
current = None
with open(path, encoding="utf-8") as fh:
    for raw in fh:
        line = raw.rstrip("\n")
        m = re.match(r'\s*-\s*name:\s*"?(.*?)"?\s*$', line)
        if m:
            if current is not None:
                items.append(current)
            current = {"name": m.group(1)}
            continue
        if current is None:
            continue
        m = re.match(r'\s*color:\s*"?(.*?)"?\s*$', line)
        if m:
            current["color"] = m.group(1)
            continue
        m = re.match(r'\s*description:\s*"?(.*?)"?\s*$', line)
        if m:
            current["description"] = m.group(1)
            continue
if current is not None:
    items.append(current)

for item in items:
    for key in ("name", "color", "description"):
        if not item.get(key):
            sys.exit(f"labels.yml: 条目缺少 {key}: {json.dumps(item, ensure_ascii=False)}")
    print(f'{item["name"]}\t{item["color"]}\t{item["description"]}')
PY
}

sync_labels() {
  echo "github-labels: sync $file -> $repo" >&2
  while IFS=$'\t' read -r name color description; do
    [ -n "$name" ] || continue
    run gh label create "$name" \
      --repo "$repo" \
      --color "$color" \
      --description "$description" \
      --force
  done < <(read_labels)
}

existing_labels() {
  gh label list --repo "$repo" --limit 200 --json name --jq '.[].name'
}

migrate_labels() {
  local existing
  existing=$(existing_labels)
  echo "github-labels: migrate legacy labels in $repo" >&2

  while IFS='=' read -r old new_list; do
    [ -n "$old" ] || continue
    if ! printf '%s\n' "$existing" | grep -Fqx "$old"; then
      continue
    fi

    local new
    IFS=',' read -ra targets <<<"$new_list"
    for new in "${targets[@]}"; do
      if ! printf '%s\n' "$existing" | grep -Fqx "$new"; then
        echo "github-labels: 跳过 $old -> $new（目标标签尚未同步）" >&2
        continue
      fi

      local number
      while IFS= read -r number; do
        [ -n "$number" ] || continue
        run gh issue edit "$number" --repo "$repo" --add-label "$new" --remove-label "$old"
      done < <(gh issue list --repo "$repo" --state all --label "$old" --limit 1000 --json number --jq '.[].number')

      while IFS= read -r number; do
        [ -n "$number" ] || continue
        run gh pr edit "$number" --repo "$repo" --add-label "$new" --remove-label "$old"
      done < <(gh pr list --repo "$repo" --state all --label "$old" --limit 1000 --json number --jq '.[].number')
    done

    run gh label delete "$old" --repo "$repo" --yes
  done < <(migrate_aliases)
}

prune_labels() {
  local keep
  keep=$(read_labels | cut -f1 | sort)
  echo "github-labels: prune labels not in $file" >&2
  while IFS= read -r name; do
    [ -n "$name" ] || continue
    if ! printf '%s\n' "$keep" | grep -Fqx "$name"; then
      run gh label delete "$name" --repo "$repo" --yes
    fi
  done < <(existing_labels)
}

if [ "$mode" = "migrate" ]; then
  sync_labels
  migrate_labels
  sync_labels
else
  sync_labels
fi

if [ "$prune" -eq 1 ]; then
  prune_labels
fi