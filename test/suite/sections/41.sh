#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 41) M30 workspace 检查/构建单元 + 确定性/增量构建
# 41a) 成员错误不能再被根 check 忽略。
member_err=$("$VUNA" check corpus/packages/m30_ws_member_error 2>&1)
member_code=$?
if [ "$member_code" -ne 0 ]; then ok; else bad "workspace member check exit" "non-zero" "$member_code"; fi
check_contains "workspace member check names package" "$member_err" "[bad]"

# 41b) workspace build：根包构建、库成员跳过；产物可运行。
ws_pkg=corpus/packages/m30_ws_build
ws_out1="$tmp/ws-build-1"
ws_out2="$tmp/ws-build-2"
if ! ws_build=$("$VUNA" build --out "$ws_out1" "$ws_pkg" 2>&1); then
  bad "workspace build" "exit 0" "$ws_build"
else
  check_contains "workspace build skips library member" "$ws_build" "skipped (library): member"
  if [ -x "$ws_out1/ws-build/bin/ws-build" ]; then
    check_eq "workspace build binary runs" "\"hello from member\"" "$(run_bin "$ws_out1/ws-build/bin/ws-build" 2>&1)"
  else
    bad "workspace build binary" "executable" "missing"
  fi
  # 41c) 同哈希跳过。
  ws_build2=$("$VUNA" build --out "$ws_out1" "$ws_pkg" 2>&1)
  check_contains "workspace build up to date" "$ws_build2" "up to date:"
  # 41d) --package 只建指定包（库成员只 check/skip）。
  ws_pkg_build=$("$VUNA" build --package member --out "$tmp/ws-build-pkg" "$ws_pkg" 2>&1)
  ws_pkg_code=$?
  if [ "$ws_pkg_code" -eq 0 ]; then ok; else bad "workspace build --package" "exit 0" "$ws_pkg_build"; fi
  check_contains "workspace build --package library skip" "$ws_pkg_build" "skipped (library): member"
  # 41e) 确定性：同源两次 build 的 .ml/build.sh/meta 逐字节一致。
  if ! "$VUNA" build --out "$ws_out2" "$ws_pkg" >/dev/null 2>&1; then
    bad "workspace build second" "exit 0" "failed"
  else
    det_ok=1
    for f in "$ws_out1/ws-build"/*.ml "$ws_out1/ws-build/build.sh" "$ws_out1/ws-build/build-meta.json"; do
      base=$(basename "$f")
      if ! cmp -s "$f" "$ws_out2/ws-build/$base"; then
        det_ok=0
        bad "workspace build deterministic: $base" "identical" "differs"
      fi
    done
    [ "$det_ok" -eq 1 ] && ok
  fi
fi


finish
