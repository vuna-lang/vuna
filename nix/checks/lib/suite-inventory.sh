#!/bin/sh
# suite 清单门禁：driver 清单（test/suite.toml）必须覆盖所有包的独立 suite；
# 每个 suite 必须带 owner 与正的 min_cases；每个 family 必须声明非空 areas。
#
# 背景：suite 拆到 packages/*/test 后，某个 suite 没被 driver 收录、或整份文件丢失，
# 都表现为「其余 suite 全绿」。这里不跑 case，只校验清单与最低限度的自描述字段。
# `areas` 是 PR 增量切片（nix/checks/slices.nix）的选择依据；缺了只有 nightly 全量
# 能跑到，PR 上会静默漏掉。
set -eu

root=$(pwd)
cd "$root"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

[ -f test/suite.toml ] || {
  echo "suite-inventory: missing test/suite.toml (driver 清单)" >&2
  exit 1
}

find packages -path '*/test/suite.toml' | sort >"$tmp/found.txt"

awk '
  /^suites[[:space:]]*=[[:space:]]*\[/ { inlist = 1 }
  inlist {
    line = $0
    sub(/^[^[]*\[/, "", line)
    sub(/\].*$/, "", line)
    n = split(line, a, ",")
    for (i = 1; i <= n; i++) {
      gsub(/[[:space:]"]/, "", a[i])
      if (a[i] != "") print a[i]
    }
    if ($0 ~ /\]/) inlist = 0
  }
' test/suite.toml | sort >"$tmp/declared.txt"

missing=$(comm -23 "$tmp/found.txt" "$tmp/declared.txt" || true)
if [ -n "$missing" ]; then
  echo "suite-inventory: these suites are not declared in test/suite.toml:" >&2
  printf '  %s\n' $missing >&2
  exit 1
fi

extra=$(comm -13 "$tmp/found.txt" "$tmp/declared.txt" || true)
if [ -n "$extra" ]; then
  echo "suite-inventory: driver lists suites that do not exist:" >&2
  printf '  %s\n' $extra >&2
  exit 1
fi

bad=0
while IFS= read -r suite; do
  [ -n "$suite" ] || continue
  if ! grep -q '^owner = ' "$suite"; then
    echo "suite-inventory: $suite has no [suite].owner" >&2
    bad=1
  fi
  min=$(sed -n 's/^min_cases = \([0-9][0-9]*\).*/\1/p' "$suite" | head -1)
  if [ -z "$min" ] || [ "$min" -le 0 ]; then
    echo "suite-inventory: $suite needs a positive [suite].min_cases" >&2
    bad=1
  fi
  # 每个 [family.X] 段落必须带非空 `areas = [...]`（切片选择依据）。
  no_areas=$(awk '
    /^\[family\./ { if (fam != "" && !has) print fam; fam = $0; has = 0; next }
    /^\[/ { if (fam != "" && !has) print fam; fam = ""; has = 0; next }
    fam != "" && /^areas[[:space:]]*=/ {
      if ($0 !~ /^areas[[:space:]]*=[[:space:]]*\[[[:space:]]*\][[:space:]]*$/) has = 1
    }
    END { if (fam != "" && !has) print fam }
  ' "$suite")
  if [ -n "$no_areas" ]; then
    echo "suite-inventory: $suite families without areas:" >&2
    printf '  %s\n' $no_areas >&2
    bad=1
  fi
done <"$tmp/found.txt"
[ "$bad" -eq 0 ] || exit 1

echo "suite-inventory: ok ($(wc -l <"$tmp/found.txt" | tr -d ' ') suite(s), all declared)"
