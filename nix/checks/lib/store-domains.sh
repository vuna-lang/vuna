#!/bin/sh
# checks.store-domains：对象库域名的结构守卫。
#
# 规则（docs/reference/cache.md「准入判据」）：
#   * 域名 = 阶段模型类型名，没有类型的产物不建域；
#   * 中间表示（Cst / Ast / Rast / Core / Ir / 效应机器）不得建域。
#
# 做法：扫 `storeObject*Eff "<kind>"` 的字面 kind 与 `*Kind = "<kind>"` 的常量定义，
# 与 `nix/checks/data/store-domains.txt` 白名单比对；出现白名单外的域即失败。
set -eu
export LC_ALL=C

OUT=${1:?usage: store-domains.sh OUT}
cd "$(pwd)"

allow="nix/checks/data/store-domains.txt"
[ -f "$allow" ] || { echo "store-domains: missing $allow" >&2; exit 1; }

kinds=$(
  {
    grep -rhoE 'storeObject[A-Za-z]*Eff "[a-z-]+"' packages/ | sed -E 's/.*"([a-z-]+)".*/\1/'
    grep -rhoE '^(orderKind|pkgIfaceSummaryKind) = "[a-z-]+"' packages/ | sed -E 's/.*"([a-z-]+)".*/\1/'
  } | sort -u
)

bad=0
for k in $kinds; do
  if ! grep -qx "$k" "$allow"; then
    echo "store-domains: unknown object domain '$k' (add it to $allow only if it meets the admission rules)" >&2
    bad=1
  fi
done

{
  echo "# store-domains: domains=$(echo "$kinds" | wc -w | tr -d ' ')"
} > "$OUT/store-domains.txt"

exit "$bad"
