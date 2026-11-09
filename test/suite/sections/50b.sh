#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

summ_pkg=corpus/packages/m34_summary
summ_vuna=$(command -v "$VUNA" 2>/dev/null || true)
[ -n "$summ_vuna" ] || summ_vuna="$VUNA"
repo_cache="$tmp/summary-repo-cache"
mkdir -p "$repo_cache"
# 44i) 依赖可见性收敛（S6）：dep 的 trait/实例在**未被 import** 的模块里时，摘要路径与全量
#      路径必须一致拒绝（不能把整包模块并入视图）；import 后两条路径都必须接受。
vis_base="$tmp/vis-base"
cp -r "$VUNA_BASE" "$vis_base"
vis_pkgdir="$tmp/vis-pkg"
rm -rf "$vis_pkgdir"
cp -r corpus/packages/vis_scope/. "$vis_pkgdir/"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$vis_base|" "$vis_pkgdir/dep/vuna.toml" "$vis_pkgdir/root/vuna.toml" "$vis_pkgdir/root2/vuna.toml"
vis_cache="$tmp/vis-cache"
if TMPDIR="$vis_cache" "$VUNA" check "$vis_base" >/dev/null 2>&1 && TMPDIR="$vis_cache" "$VUNA" check "$vis_pkgdir/dep" >/dev/null 2>&1; then
  vis_root_sum=$(TMPDIR="$vis_cache" "$VUNA" build --no-compile --out "$tmp/vis-root-out" "$vis_pkgdir/root" 2>&1); vis_root_sum_exit=$?
  vis_root_full=$(TMPDIR="$vis_cache" VUNA_ELAB_FULL=1 "$VUNA" build --no-compile --out "$tmp/vis-root-out-full" "$vis_pkgdir/root" 2>&1); vis_root_full_exit=$?
  if [ "$vis_root_sum_exit" -ne 0 ] && [ "$vis_root_full_exit" -ne 0 ]; then ok; else bad "summary vis root rejected" "nonzero/nonzero" "summary=$vis_root_sum_exit full=$vis_root_full_exit"; fi
  check_contains "summary vis root error code" "$vis_root_sum" "unbound variable"
  vis_root2_sum=$(TMPDIR="$vis_cache" "$VUNA" build --no-compile --out "$tmp/vis-root2-out" "$vis_pkgdir/root2" 2>&1); vis_root2_sum_exit=$?
  vis_root2_full=$(TMPDIR="$vis_cache" VUNA_ELAB_FULL=1 "$VUNA" build --no-compile --out "$tmp/vis-root2-out-full" "$vis_pkgdir/root2" 2>&1); vis_root2_full_exit=$?
  check_eq "summary vis root2 accepted (summary)" "0" "$vis_root2_sum_exit"
  check_eq "summary vis root2 accepted (full)" "0" "$vis_root2_full_exit"
else
  bad "summary vis fixture warmup" "0" "base/dep check failed"
fi

# 44j) 单元缓存按 entry 分桶 + GC（S7）：同一包上下文里不同入口文件各占一个桶；切换入口
#      时旧桶被 GC 清掉，同一入口（路径不变、内容变了）重建仍能命中单元缓存。
uj_pkg="$tmp/unit-entry-pkg"
mkdir -p "$uj_pkg"
printf '[package]\nname = "unit-entry-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$uj_pkg/vuna.toml"
printf 'main : Int\nmain = 1\n' >"$uj_pkg/A.vuna"
printf 'main : Int\nmain = 2\n' >"$uj_pkg/B.vuna"
uj_cache="$tmp/unit-cache-j"
rm -rf "$uj_cache" "$tmp/unit-j1" "$tmp/unit-j2"
if TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" compile "$uj_pkg/A.vuna" "$tmp/unit-j1" >/dev/null 2>&1; then
  printf '\n-- probe\n' >>"$uj_pkg/A.vuna"
  uj_log=$(TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 VUNA_DEBUG_PERF=1 "$summ_vuna" compile "$uj_pkg/A.vuna" "$tmp/unit-j1" 2>&1)
  uj_hits=$(printf %s "$uj_log" | grep -c "unit-cache-hit" || true)
  if [ "$uj_hits" -ge 1 ]; then ok; else bad "summary unit cache same-entry hits" ">=1" "hits=$uj_hits"; fi
  if TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" compile "$uj_pkg/B.vuna" "$tmp/unit-j2" >/dev/null 2>&1; then
    uj_buckets=$(find "$uj_cache"/vuna-cache -path "*split-units/e-*" -name "*.unit" 2>/dev/null | xargs -r -n1 dirname | sort -u | wc -l)
    check_eq "summary unit cache one entry bucket" "1" "$uj_buckets"
  else
    bad "summary unit cache entry B compile" "0" "failed"
  fi
else
  bad "summary unit cache entry A compile" "0" "failed"
fi

# 44k) M34.6 工具链惰性闭包完整性（默认开启）：同包模块自己 import 的依赖包模块必须
#      进闭包（否则 Loader 从源码加载它们却没有 artifact，假报 TC_UnknownName）；本包
#      manifest 缺失/新增模块时安全阀回退全量，诊断仍正确。
kk_root="$tmp/iface-k-root"
kk_dep="$tmp/iface-k-dep"
kk_cache="$tmp/iface-k-cache"
mkdir -p "$kk_dep/lib" "$kk_root/lib" "$kk_root/app"
printf '[package]\nname = "iface-k-dep"\n\n[export]\nmodules = ["KDep"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$kk_dep/vuna.toml"
printf 'module KDep (kdepVal, KBox(..), unKBox) where\n\ndata KBox : Type where\n  MkKBox : Int -> KBox\n\nunKBox : KBox -> Int\nunKBox (MkKBox n) = n\n\nkdepVal : Int\nkdepVal = 42\n' >"$kk_dep/lib/KDep.vuna"
printf '[package]\nname = "iface-k-root"\n\n[dependencies]\niface-k-dep = "%s"\nvuna-base = "%s"\n' "$kk_dep" "$VUNA_BASE" >"$kk_root/vuna.toml"
printf 'module KInner (innerVal) where\n\nimport KDep\n\ninnerVal : Int\ninnerVal = kdepVal\n' >"$kk_root/lib/KInner.vuna"
printf 'module KOuter (outerVal) where\n\nimport KInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$kk_root/lib/KOuter.vuna"
printf 'import KOuter\n\nmain : Int\nmain = outerVal\n' >"$kk_root/app/Main.vuna"
if TMPDIR="$kk_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 && TMPDIR="$kk_cache" "$summ_vuna" check "$kk_dep" >/dev/null 2>&1 && TMPDIR="$kk_cache" "$summ_vuna" check "$kk_root" >/dev/null 2>&1; then
  kk_repl_default=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_DEBUG_PERF=1 sh -c 'printf "import KOuter\nouterVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface default lazy closure" "$kk_repl_default" "iface-tool-lazy modules="
  check_contains "tool iface default eval" "$kk_repl_default" "43"
  case "$kk_repl_default" in
    *TC_UnknownName*) bad "tool iface closure has no false unknown-name" "no TC_UnknownName" "$kk_repl_default" ;;
    *) ok ;;
  esac
  kk_repl_full=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_IFACE_TOOL=0 sh -c 'printf "import KOuter\nouterVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface full path eval" "$kk_repl_full" "43"
  # 依赖包的 data/ctor 在接口路径下必须能被 REPL 表达式求值看到（S7 组装 DtProgram 时
  # 漏补依赖 datas ⇒ `[1,2,3]`/构造子报假 TC_UnknownName）。
  kk_repl_ctor=$( cd "$kk_root" && TMPDIR="$kk_cache" sh -c 'printf "import KDep\nunKBox (MkKBox 7)\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface repl dep ctor eval" "$kk_repl_ctor" "7"
  case "$kk_repl_ctor" in
    *TC_UnknownName*) bad "tool iface repl dep ctor no false unknown-name" "no TC_UnknownName" "$kk_repl_ctor" ;;
    *) ok ;;
  esac
  # 安全阀：新增一个不在本包 manifest 里的模块，它的依赖无法从 manifest 闭包推出；
  # 加载后必须回退全量（iface-fallback=repl）且结果仍正确。
  printf 'module KNew (newVal) where\n\nimport KDep\n\nnewVal : Int\nnewVal = kdepVal + 1\n' >"$kk_root/lib/KNew.vuna"
  kk_repl_new=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_DEBUG_PERF=1 sh -c 'printf "import KNew\nnewVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface safety valve fallback" "$kk_repl_new" "iface-fallback=repl missing="
  check_contains "tool iface safety valve eval" "$kk_repl_new" "43"
else
  bad "tool iface closure fixture warmup" "0" "dep/root check failed"
fi

# 44l) M34.6（5a/5c）LSP 单文件增量精化 + 会话缓存：
#      - LSP-only 会话（依赖已 check、本包未 check）didOpen 成功后写回当前模块接口；
#      - 接口路径与全量路径（VUNA_IFACE_TOOL=0）对同一 buffer 的诊断逐字节一致；
#      - 外部修改同包依赖模块后，**同一 LSP 进程**的下一次请求必须失效并重报；
#      - 大闭包文件（仓库根包 lib/）的 LSP 诊断在接口路径与全量路径一致；
#      - REPL 同进程多次求值复用 termAux 缓存，结果不变。
#
# LSP 帧驱动：Content-Length 精确字节（body 后没有换行）；didOpen/didChange 都是 Full 同步。
lsp_inc_json_escape() { # file -> 单行 JSON 字符串内容（只处理换行；夹具源码不含引号/反斜杠）
  sed -e 's/$/\\n/' "$1" | tr -d '\n'
}

lsp_inc_frame() { # body -> 完整帧
  printf 'Content-Length: %s\r\n\r\n%s' "$(printf '%s' "$1" | wc -c)" "$1"
}

lsp_inc_last_diags() { # 日志 -> 最后一条 publishDiagnostics 的 diagnostics 数组
  grep -o '"diagnostics":\[[^]]*\]' "$1" | tail -1 | sed 's/^"diagnostics"://'
}

lsp_inc_single() { # $1=iface(1|0) $2=cache $3=cwd $4=uri $5=textfile $6=log
  _init=$(printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":"file://%s","capabilities":{}}}' "$3")
  _open=$(printf '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"%s","languageId":"vuna","version":1,"text":"%s"}}}' "$4" "$(lsp_inc_json_escape "$5")")
  _shut='{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  _exit='{"jsonrpc":"2.0","method":"exit","params":null}'
  {
    lsp_inc_frame "$_init"
    lsp_inc_frame '{"jsonrpc":"2.0","method":"initialized","params":{}}'
    lsp_inc_frame "$_open"
    sleep 0.3
    lsp_inc_frame "$_shut"
    lsp_inc_frame "$_exit"
  } | ( cd "$3" && TMPDIR="$2" VUNA_IFACE_TOOL="$1" "$summ_vuna" lsp >"$6" 2>/dev/null )
  lsp_inc_last_diags "$6"
}

# A) LSP-only 写回：依赖接口预热、本包不 check；didOpen 后 manifest 里出现当前模块接口。
lsp_wb="$tmp/lsp-inc-wb"
lsp_wb_cache="$tmp/lsp-inc-wb-cache"
mkdir -p "$lsp_wb/app" "$lsp_wb/lib"
printf '[package]\nname = "lsp-inc-wb"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$lsp_wb/vuna.toml"
printf 'module WInner (innerVal) where\n\ninnerVal : Int\ninnerVal = 41\n' >"$lsp_wb/lib/WInner.vuna"
printf 'module WOuter (outerVal) where\n\nimport WInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$lsp_wb/lib/WOuter.vuna"
printf 'import WOuter\n\nmain : Int\nmain = outerVal\n' >"$lsp_wb/app/Main.vuna"
if TMPDIR="$lsp_wb_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1; then
  lsp_wb_uri="file://$lsp_wb/lib/WOuter.vuna"
  lsp_wb_diags=$(lsp_inc_single 1 "$lsp_wb_cache" "$lsp_wb" "$lsp_wb_uri" "$lsp_wb/lib/WOuter.vuna" "$tmp/lsp-inc-wb.log")
  check_eq "lsp incremental cold clean diagnostics" "[]" "$lsp_wb_diags"
  if find "$(iface_mirror_dir "$lsp_wb")" -name 'WOuter.iface' 2>/dev/null | grep -q .; then ok; else bad "lsp incremental writes back module iface" "WOuter.iface" "missing"; fi
else
  bad "lsp incremental writeback warmup base" "0" "base check failed"
fi

# B) 会话失效：warm 包（Inner/Outer 都有接口）里，外部把 Inner 改成 Bool——
#    同一 LSP 进程的下一次请求必须重读并报出 Outer 的类型错误（不能复用陈旧接口）。
lsp_s="$tmp/lsp-inc-sess"
lsp_s_cache="$tmp/lsp-inc-sess-cache"
mkdir -p "$lsp_s/app" "$lsp_s/lib"
printf '[package]\nname = "lsp-inc-sess"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$lsp_s/vuna.toml"
printf 'module SInner (innerVal) where\n\ninnerVal : Int\ninnerVal = 41\n' >"$lsp_s/lib/SInner.vuna"
printf 'module SOuter (outerVal) where\n\nimport SInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$lsp_s/lib/SOuter.vuna"
printf 'import SOuter\n\nmain : Int\nmain = outerVal\n' >"$lsp_s/app/Main.vuna"
if TMPDIR="$lsp_s_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 && TMPDIR="$lsp_s_cache" "$summ_vuna" check "$lsp_s" >/dev/null 2>&1; then
  # 诊断一致性：错误 buffer 下接口路径与全量路径逐字节一致。
  printf 'module SOuter (outerVal) where\n\nimport SInner\n\nouterVal : Int\nouterVal = innerVal + True\n' >"$tmp/lsp-inc-err.vuna"
  lsp_s_uri="file://$lsp_s/lib/SOuter.vuna"
  lsp_s_iface=$(lsp_inc_single 1 "$lsp_s_cache" "$lsp_s" "$lsp_s_uri" "$tmp/lsp-inc-err.vuna" "$tmp/lsp-inc-iface.log")
  lsp_s_full=$(lsp_inc_single 0 "$tmp/lsp-inc-full-cache" "$lsp_s" "$lsp_s_uri" "$tmp/lsp-inc-err.vuna" "$tmp/lsp-inc-full.log")
  check_contains "lsp incremental error diagnostic" "$lsp_s_iface" "TC_"
  check_eq "lsp incremental/full diagnostics identical" "$lsp_s_full" "$lsp_s_iface"

  # 同一进程：先 didOpen（无错），外部改 SInner 后 didChange（无错文本 + 注释）⇒ 报错。
  lsp_s_out="$tmp/lsp-inc-sess.out"
  lsp_s_in="$tmp/lsp-inc-sess.in"
  rm -f "$lsp_s_in" "$lsp_s_out"
  mkfifo "$lsp_s_in"
  ( cd "$lsp_s" && TMPDIR="$lsp_s_cache" "$summ_vuna" lsp <"$lsp_s_in" >"$lsp_s_out" 2>"$tmp/lsp-inc-sess.err" ) &
  lsp_s_pid=$!
  exec 8>"$lsp_s_in"
  lsp_s_send() { lsp_inc_frame "$1" >&8; }
  lsp_s_init=$(printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":"file://%s","capabilities":{}}}' "$lsp_s")
  lsp_s_open=$(printf '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"%s","languageId":"vuna","version":1,"text":"%s"}}}' "$lsp_s_uri" "$(lsp_inc_json_escape "$lsp_s/lib/SOuter.vuna")")
  lsp_s_send "$lsp_s_init"
  lsp_s_send '{"jsonrpc":"2.0","method":"initialized","params":{}}'
  lsp_s_send "$lsp_s_open"
  lsp_s_wait() { # $1=expected diag count
    _i=0
    while [ "$_i" -lt 400 ]; do
      _c=$(grep -o '"method":"textDocument/publishDiagnostics"' "$lsp_s_out" 2>/dev/null | wc -l)
      [ "$_c" -ge "$1" ] && return 0
      sleep 0.05
      _i=$((_i + 1))
    done
    return 1
  }
  if lsp_s_wait 1; then ok; else bad "lsp session first diagnostics" "1" "timeout"; fi
  check_eq "lsp session first diagnostics empty" "[]" "$(grep -o '"diagnostics":\[[^]]*\]' "$lsp_s_out" | sed -n '1p' | sed 's/^"diagnostics"://')"
  # 外部修改依赖模块（类型从 Int 变 Bool）。
  printf 'module SInner (innerVal) where\n\ninnerVal : Bool\ninnerVal = True\n' >"$lsp_s/lib/SInner.vuna"
  # didChange 的 buffer 文本必须变化（否则命中进程内诊断帧缓存）：在磁盘文本后加一行注释。
  cp "$lsp_s/lib/SOuter.vuna" "$tmp/lsp-inc-sess-change.vuna"
  printf '\n-- lsp session touch\n' >>"$tmp/lsp-inc-sess-change.vuna"
  lsp_s_change=$(printf '{"jsonrpc":"2.0","method":"textDocument/didChange","params":{"textDocument":{"uri":"%s","version":2},"contentChanges":[{"text":"%s"}]}}' "$lsp_s_uri" "$(lsp_inc_json_escape "$tmp/lsp-inc-sess-change.vuna")")
  lsp_s_send "$lsp_s_change"
  if lsp_s_wait 2; then ok; else bad "lsp session external-change diagnostics" "2" "timeout"; fi
  lsp_s_second=$(grep -o '"diagnostics":\[[^]]*\]' "$lsp_s_out" | sed -n '2p' | sed 's/^"diagnostics"://')
  case "$lsp_s_second" in
    *TC_*) ok ;;
    *) bad "lsp session invalidates on external change" "TC_ diagnostic" "$lsp_s_second" ;;
  esac
  lsp_s_send '{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  lsp_s_send '{"jsonrpc":"2.0","method":"exit","params":null}'
  exec 8>&-
  wait "$lsp_s_pid" 2>/dev/null || true
  rm -f "$lsp_s_in"
else
  bad "lsp session fixture warmup" "0" "base/pkg check failed"
fi

# C) 大闭包文件：仓库根包 lib/ 文件的 LSP 诊断在接口路径与全量路径一致（用 44e 的 repo 缓存）。
if TMPDIR="$repo_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1; then
  lsp_big_uri="file://$(cd .. && pwd)/lib/Vuna/Interp.vuna"
  lsp_big_iface=$(lsp_inc_single 1 "$repo_cache" ".." "$lsp_big_uri" "../lib/Vuna/Interp.vuna" "$tmp/lsp-big-iface.log")
  lsp_big_full=$(lsp_inc_single 0 "$tmp/lsp-big-full-cache" ".." "$lsp_big_uri" "../lib/Vuna/Interp.vuna" "$tmp/lsp-big-full.log")
  check_eq "lsp big-closure incremental/full diagnostics identical" "$lsp_big_full" "$lsp_big_iface"
else
  bad "lsp big-closure warmup" "0" "base check failed"
fi

# D) REPL：同进程多次求值复用 termAux 缓存（依赖接口路径），结果不变。
repl_inc=$( cd .. && printf 'import Vuna.Compiler.Driver.Dt\n1 + 1\n2 + 2\n3 + 3\n:q\n' | TMPDIR="$repo_cache" "$summ_vuna" repl 2>&1 )
check_contains "repl aux cache first eval" "$repl_inc" "vuna> 2"
check_contains "repl aux cache second eval" "$repl_inc" "vuna> 4"
check_contains "repl aux cache third eval" "$repl_inc" "vuna> 6"
case "$repl_inc" in
  *TC_*) bad "repl aux cache no diagnostics" "no TC_" "$repl_inc" ;;
  *) ok ;;
esac
repl_inc_reset=$( cd .. && printf 'import Vuna.Compiler.Driver.Dt\n1 + 1\n:reset\n2 + 2\n:q\n' | TMPDIR="$repo_cache" "$summ_vuna" repl 2>&1 )
check_contains "repl reset clears cache state" "$repl_inc_reset" "vuna> 4"


finish

