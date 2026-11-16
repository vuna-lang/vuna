#!/bin/sh
# checks.vuna-checks-inventory：nix/checks/*.sh 与 default.nix 的登记必须一一对应。
# 共享实现放在 nix/checks/lib/，不入登记面；顶层脚本漏登记或引用不存在都失败。
set -eu

registered=$(grep -oE '\./[A-Za-z0-9._-]+\.sh' nix/checks/default.nix | sed 's|^\./||' | sort -u)

fail=0
for f in nix/checks/*.sh; do
  name=$(basename "$f")
  if ! printf '%s\n' "$registered" | grep -qx "$name"; then
    echo "inventory: $name 未在 nix/checks/default.nix 登记" >&2
    fail=1
  fi
done

for name in $registered; do
  if [ ! -f "nix/checks/$name" ]; then
    echo "inventory: default.nix 引用了不存在的 nix/checks/$name" >&2
    fail=1
  fi
done

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "inventory: ok ($(printf '%s\n' "$registered" | wc -l | tr -d ' ') 个登记脚本)"
