#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 57) iface 布局（S8）：默认与源码同目录（`lib/Base/Int.vuna` 旁 `Int.iface` + 包级
#     `.vuna-iface`）；`VUNA_IFACE_DIR` 覆盖时镜像到外部根，读侧两种布局都能消费。
iface_beside="$tmp/iface-beside"
iface_beside_cache="$tmp/iface-beside-cache"
cp -r "$VUNA_BASE" "$iface_beside"
if ( unset VUNA_IFACE_DIR; TMPDIR="$iface_beside_cache" "$summ_vuna" check "$iface_beside" >/dev/null 2>&1 ); then
  if [ -f "$iface_beside/lib/Base/Int.iface" ] && [ -f "$iface_beside/.vuna-iface" ]; then ok; else bad "iface beside source layout" "lib/Base/Int.iface + .vuna-iface" "missing under $iface_beside"; fi
else
  bad "iface beside source check" "0" "check failed"
fi
rm -rf "$iface_beside_cache"/vuna-cache/*/check
iface_beside_log=$( unset VUNA_IFACE_DIR; TMPDIR="$iface_beside_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$iface_beside" --debug-perf 2>&1 )
check_contains "iface beside rewrite skip" "$iface_beside_log" "iface-write=0/"
check_contains "iface beside selftest" "$iface_beside_log" "iface-selftest=ok"

# 57b) 覆盖模式：镜像布局；依赖包接口按包目录（不是包名哈希）定位，根包走摘要路径。
iface_mirror_pkg="$PWD/corpus/packages/m34_summary"
iface_mirror_root="$tmp/iface-mirror-root"
iface_mirror_cache="$tmp/iface-mirror-cache"
iface_mirror_base=$(mirror_under "$iface_mirror_root" "$VUNA_BASE")
if TMPDIR="$iface_mirror_cache" VUNA_IFACE_DIR="$iface_mirror_root" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 \
  && TMPDIR="$iface_mirror_cache" VUNA_IFACE_DIR="$iface_mirror_root" "$summ_vuna" check "$iface_mirror_pkg/dep" >/dev/null 2>&1; then
  if [ -f "$iface_mirror_base/lib/Base/Int.iface" ] && [ -f "$iface_mirror_base/.vuna-iface" ]; then ok; else bad "iface mirror layout" "mirror lib/Base/Int.iface + .vuna-iface" "missing under $iface_mirror_base"; fi
  iface_mirror_root_log=$(TMPDIR="$iface_mirror_cache" VUNA_IFACE_DIR="$iface_mirror_root" "$summ_vuna" check "$iface_mirror_pkg/root" --debug-perf 2>&1)
  check_contains "iface mirror dep consumed" "$iface_mirror_root_log" "cache-path=summary deps=2"
else
  bad "iface mirror warmup" "0" "base/dep check failed"
fi

# 57c) 入口写法归一：`check base` / `check ./base` / `check <绝对路径>` 命中同一镜像目录。
iface_enum_root="$tmp/iface-enum-root"
iface_enum_cache="$tmp/iface-enum-cache"
if ( cd .. && TMPDIR="$iface_enum_cache" VUNA_IFACE_DIR="$iface_enum_root" "$summ_vuna" check base >/dev/null 2>&1 && TMPDIR="$iface_enum_cache" VUNA_IFACE_DIR="$iface_enum_root" "$summ_vuna" check ./base >/dev/null 2>&1 ); then
  iface_enum_n=$(find "$iface_enum_root" -name '.vuna-iface' 2>/dev/null | wc -l)
  check_eq "iface entry form one mirror" "1" "$iface_enum_n"
  rm -rf "$iface_enum_cache"/vuna-cache/*/check
  iface_enum_log=$(TMPDIR="$iface_enum_cache" VUNA_IFACE_DIR="$iface_enum_root" "$summ_vuna" check "$VUNA_BASE" --debug-perf 2>&1)
  check_contains "iface entry form absolute hits" "$iface_enum_log" "iface-write=0/"
else
  bad "iface entry form warmup" "0" "check failed"
fi

# 57d) 同名不同目录：同一镜像根下各占一棵树，不互相覆盖（旧实现按包名哈希会互踩）。
iface_same_root="$tmp/iface-same-root"
iface_same_cache="$tmp/iface-same-cache"
same_a="$tmp/iface-same-a"
same_b="$tmp/iface-same-b"
mkdir -p "$same_a/lib" "$same_b/lib"
printf '[package]\nname = "iface-same"\n\n[export]\nmodules = ["SA"]\n' >"$same_a/vuna.toml"
printf '[package]\nname = "iface-same"\n\n[export]\nmodules = ["SB"]\n' >"$same_b/vuna.toml"
printf 'module SA (saVal) where\n\nsaVal : Int\nsaVal = 1\n' >"$same_a/lib/SA.vuna"
printf 'module SB (sbVal) where\n\nsbVal : Int\nsbVal = 2\n' >"$same_b/lib/SB.vuna"
if TMPDIR="$iface_same_cache" VUNA_IFACE_DIR="$iface_same_root" "$summ_vuna" check "$same_a" >/dev/null 2>&1 \
  && TMPDIR="$iface_same_cache" VUNA_IFACE_DIR="$iface_same_root" "$summ_vuna" check "$same_b" >/dev/null 2>&1; then
  if [ -f "$(mirror_under "$iface_same_root" "$same_a")/.vuna-iface" ] && [ -f "$(mirror_under "$iface_same_root" "$same_b")/.vuna-iface" ]; then ok; else bad "iface same-name dirs coexist" "two mirrors" "missing"; fi
else
  bad "iface same-name dirs check" "0" "check failed"
fi


finish
