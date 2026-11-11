#!/bin/sh
# test/corpus/packages/12_trust_points/check.sh：D28 定义级信任点（`[trust] unsafe`）。
#
# 用法: sh check.sh <vuna>
#
# 覆盖：
#   - 正例（顶层 12_trust_points 包本身）：unsafe + trust，信任点直调 `runIO` → check 0；
#   - 负例 1（neg_untrusted）：未列入信任点的定义直调 `runIO` 别名 → exit 1 + 明确消息；
#   - 负例 2（neg_fake）：信任点列表写不存在的定义 → exit 1；
#   - 负例 3（neg_no_unsafe）：有 `[trust]` 但能力表没有 `unsafe` → exit 1；
#   - 负例 4（neg_entry_direct）：入口定义直调 `runIO`（入口不能作为信任点）→ exit 1；
#   - 正例 5（non_strict）：有 `unsafe` 能力、没有 `[trust]` → 不启用定义级检查，check 0。
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
  *) VUNA=$(command -v "$VUNA" 2>/dev/null || printf '%s' "$VUNA") ;;
esac

here=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-trust-points.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

pass=0
fail=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1" >&2
}
check_eq() { if [ "$2" = "$3" ]; then ok; else bad "$1 (expected [$2] got [$3])"; fi; }
check_contains() {
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1 (missing [$3] in: $2)" ;;
  esac
}

# 1) 正例：信任点被接受。
out=$("$VUNA" check "$here" 2>&1)
check_eq "trust positive check exit" "0" "$?"
check_eq "trust positive output" "" "$out"

# 2) 负例：未列入信任点的定义直调 runIO 别名。
out=$("$VUNA" check "$here/neg_untrusted" 2>&1)
check_eq "untrusted definition exit" "1" "$?"
check_contains "untrusted definition message name" "$out" "TrustLib.probeAlias"
check_contains "untrusted definition message trigger" "$out" "prim_schedNewScope"
check_contains "untrusted definition message fix" "$out" "is not a trust point"

# 2b) 负例：未列入信任点的定义直调 `prim_schedNewScope` 内建。
out=$("$VUNA" check "$here/neg_untrusted_prim" 2>&1)
check_eq "untrusted primitive exit" "1" "$?"
check_contains "untrusted primitive message name" "$out" "TrustLib.probePrim"
check_contains "untrusted primitive message trigger" "$out" "prim_schedNewScope"

# 3) 负例：信任点列表里的假定义。
out=$("$VUNA" check "$here/neg_fake" 2>&1)
check_eq "fake trust point exit" "1" "$?"
check_contains "fake trust point message" "$out" "TrustLib.doesNotExist"
check_contains "fake trust point wording" "$out" "is not a definition of this package"

# 4) 负例：[trust] 但没有 unsafe 能力。
out=$("$VUNA" check "$here/neg_no_unsafe" 2>&1)
check_eq "trust without unsafe exit" "1" "$?"
check_contains "trust without unsafe message" "$out" "[trust] unsafe requires capability \"unsafe\""

# 5) 负例：入口定义不能作为信任点。
out=$("$VUNA" check "$here/neg_entry_direct" 2>&1)
check_eq "entry direct use exit" "1" "$?"
check_contains "entry direct use definition" "$out" "definition \`main\`"
check_contains "entry direct use fix" "$out" "move this definition into a package library module"

# 6) 正例：非严格模式（没有 [trust]）不受定义级限制。
out=$("$VUNA" check "$here/non_strict" 2>&1)
check_eq "non-strict package check exit" "0" "$?"
check_eq "non-strict package output" "" "$out"

printf '%s passed, %s failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]