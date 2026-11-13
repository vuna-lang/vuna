#!/bin/sh
# Vuna.Index 自检（CI check）：在真实仓库树上跑 `vuna map` / `--find` / `--impact` / `api`，
# 断言退出码、输出形状与位置合理性。不做「入库索引 diff」——索引是本地缓存（`$TMPDIR/vuna-cache` 的 `index:<dir>` 节点 + blob），
# 不是提交物，新鲜度由查询图依赖表判定（CLI 逐文件内容哈希；REPL stat 键 + 安全窗内哈希）。
#
# 用法: sh nix/index-check.sh <vuna> [REPO]
#   vuna  产品 CLI（需要 map / api 子命令）
#   REPO  仓库根，默认当前目录
set -eu

VUNA=${1:?usage: index-check.sh <vuna> [repo]}
REPO=${2:-.}

# 先转绝对路径：下面的「非 workspace」用例会 cd 到临时目录再调用 $VUNA。
case "$VUNA" in
  */*)
    case "$VUNA" in
      /*) ;;
      *) VUNA=$(CDPATH= cd -- "$(dirname -- "$VUNA")" && pwd)/$(basename -- "$VUNA") ;;
    esac
    ;;
  *) VUNA=$(command -v "$VUNA" 2>/dev/null || printf '%s' "$VUNA") ;;
esac

cd "$REPO"

# 缓存根 = 对象库根（与 `Store` 同一口径）。
cache=${VUNA_STORE:-${TMPDIR:-/tmp}/vuna-store}

tmpd=$(mktemp -d "${TMPDIR:-/tmp}/vuna-index-check.XXXXXX") || exit 1
trap 'if [ -f "$tmpd/Resolve.vuna.bak" ]; then mv "$tmpd/Resolve.vuna.bak" compiler/lib/Vuna/Compiler/Loader/Resolve.vuna; fi; rm -rf "$tmpd"' EXIT INT TERM

fail=0
note() { printf '%s\n' "$1"; }
bad() { printf 'FAIL: %s\n' "$1" >&2; fail=1; }

# 0) 从干净缓存开始，确保下面测的是真实重建路径（索引缓存是查询图节点 + blob）。
rm -rf "$cache"

# 1) 总览：退出 0、非空、含已知包与模块。
if ! out=$("$VUNA" map 2>&1); then
  bad "vuna map exited non-zero: $out"
else
  case "$out" in
    *"Vuna.Compiler.Elab"*) : ;;
    *) bad "vuna map output missing Vuna.Compiler.Elab" ;;
  esac
  case "$out" in
    *"Base.IORef"*) : ;;
    *) bad "vuna map output missing Base.IORef" ;;
  esac
  note "ok: vuna map ($(printf '%s\n' "$out" | wc -l | tr -d ' ') lines)"
fi

# 2) 缓存：第二次调用应命中（`index-path=cache`），索引载荷落在查询图 blob 树。
blob_count_before=$(find "$cache/blobs" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$blob_count_before" -ge 1 ]; then
  note "ok: index payload blob written ($blob_count_before blobs)"
else
  bad "index payload blob missing"
fi
map_dbg_out=$(VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1)
case "$map_dbg_out" in
  *"index-path=cache"*) note "ok: index cache hit (query graph node)" ;;
  *) bad "second vuna map did not hit the index node" ;;
esac
if [ "$(find "$cache/blobs" -type f 2>/dev/null | wc -l | tr -d ' ')" = "$blob_count_before" ]; then
  note "ok: cache hit keeps blob set"
else
  bad "cache hit changed the blob set"
fi

# 2b) 非 workspace 目录：map 必须有可读错误并非 0（C12；不是静默空输出）。
empty="$tmpd/empty"
mkdir -p "$empty"
if ( cd "$empty" && "$VUNA" map >"$tmpd/map.out" 2>&1 ); then
  bad "map outside a workspace should exit non-zero"
else
  if grep -q "vuna.toml\|workspace" "$tmpd/map.out"; then
    note "ok: map outside workspace gives readable error"
  else
    bad "map outside workspace error is not readable: $(cat "$tmpd/map.out")"
  fi
fi

# 3) --find 全名：命中且有行号。M24：HM 删除后改用仍然存在的 DT 精化入口。
if ! found=$("$VUNA" map --find Vuna.Compiler.Elab.Driver.elabProgramFull 2>&1); then
  bad "map --find <full name> failed: $found"
else
  case "$found" in
    *"Vuna.Compiler.Elab.Driver.elabProgramFull"*) : ;;
    *) bad "map --find output missing symbol name: $found" ;;
  esac
  # 形如 (...(2623:1)...)，必须带 行:列
  case "$found" in
    *"("*":"*")"*) : ;;
    *) bad "map --find output missing line:col: $found" ;;
  esac
  note "ok: map --find full name"
fi

# 4) --find 不存在：退出非 0，且给出提示。
if "$VUNA" map --find definitely_not_a_symbol_xyz >/dev/null 2>&1; then
  bad "map --find <missing> should exit non-zero"
else
  note "ok: map --find missing exits non-zero"
fi

# 5) --impact：给出引用者与测试标签。
if ! imp=$("$VUNA" map --impact Vuna.Compiler.Elab.Driver.elabProgramFull 2>&1); then
  bad "map --impact failed: $imp"
else
  case "$imp" in
    *"readers:"*) : ;;
    *) bad "map --impact output missing readers: $imp" ;;
  esac
  case "$imp" in
    *"tests:"*) : ;;
    *) bad "map --impact output missing tests: $imp" ;;
  esac
  note "ok: map --impact"
fi

# 6) api：某模块签名面含行号。
if ! api=$("$VUNA" api Vuna.Compiler.Loader.Resolve 2>&1); then
  bad "api failed: $api"
else
  case "$api" in
    *"builtinArity"*) : ;;
    *) bad "api output missing builtinArity" ;;
  esac
  note "ok: api <module>"
fi

# 7) 符号位置合理性：`vuna api` 的输出里每条都带 `-- line N`，行号必须是正整数。
#    （索引载荷是查询图 blob，没有可解析的自制文本；api 的渲染就是同一份数据的投影。）
api_lines=$( "$VUNA" api Vuna.Compiler.Loader.Resolve 2>&1 | grep -o 'line [0-9]*' | head -5 )
if [ -z "$api_lines" ]; then
  bad "index api output has no 'line N' annotations"
else
  bad7=0
  for ln in $api_lines; do
    n=${ln#line }
    if [ "$n" -lt 1 ] 2>/dev/null; then bad7=1; fi
  done
  if [ "$bad7" -eq 0 ]; then
    note "ok: symbol lines are positive integers"
  else
    bad "symbol line < 1 in api output"
  fi
fi

# 8) 缓存自动失效（M30/C11）：同 size + 同 mtime 的内容变更也必须失效——
#    安全窗内回落内容哈希，因此依赖表变化 ⇒ `index-path=build`。
target=compiler/lib/Vuna/Compiler/Loader/Resolve.vuna
cp -p "$target" "$tmpd/Resolve.vuna.bak"
before_size=$(wc -c <"$target" | tr -d ' ')
before_mtime=$(stat -c '%Y' "$target")
# 取文件里第一条行注释（`-- ` 开头）而不是硬编码行号：模块头/导出表增删项会平移行号，
# 硬编码会让本断言在无关改动上误报。替换注释文本首字符，字节数与语法都保持不变。
probe_line=$(grep -n '^-- ' "$target" | head -1 | cut -d: -f1)
if [ -z "${probe_line:-}" ]; then
  bad "index invalidation probe: no line comment found in $target"
  probe_line=8
fi
sed -i "${probe_line}s/^-- ./-- X/" "$target"
touch -r "$tmpd/Resolve.vuna.bak" "$target" || cp -p "$tmpd/Resolve.vuna.bak" "$target"
after_size=$(wc -c <"$target" | tr -d ' ')
after_mtime=$(stat -c '%Y' "$target")
if [ "$before_size" != "$after_size" ] || [ "$before_mtime" != "$after_mtime" ]; then
  bad "index invalidation probe failed to keep size/mtime (size $before_size->$after_size, mtime $before_mtime->$after_mtime)"
fi
change_dbg_out=$(VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1)
case "$change_dbg_out" in
  *"index-path=build"*) note "ok: cache invalidates on content change with same size+mtime" ;;
  *) bad "index cache did not invalidate on same-size/same-mtime content change" ;;
esac
# 恢复内容后缓存必须再次失效（避免用坏内容命中缓存）。
mv "$tmpd/Resolve.vuna.bak" "$target"
restore_dbg_out=$(VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1)
case "$restore_dbg_out" in
  *"index-path=build"*) note "ok: cache invalidates after restoring content" ;;
  *) bad "index cache did not invalidate after restoring content" ;;
esac

# 9) 索引不含生成物 / 夹具：seed/ 与 test/ 不应出现在模块清单里。
if "$VUNA" map --modules 2>&1 | grep -q -E '(^|/)seed/|(^|/)test/'; then
  bad "module list includes seed/ or test/ paths"
else
  note "ok: index excludes seed/ and test/"
fi

# 10) 索引不得进入 seed 闭包（工具链不进 TCB 的守卫之一）。
if [ -e seed/Vuna_dIndex.ml ]; then
  bad "seed/ contains Vuna_dIndex.ml (Index must never enter TCB)"
else
  note "ok: Index not in seed closure"
fi

if [ "$fail" -ne 0 ]; then
  printf 'index-check: FAILED\n' >&2
  exit 1
fi
printf 'index-check: passed\n'
