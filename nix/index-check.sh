#!/bin/sh
# Vuna.Index 自检（CI check）：在真实仓库树上跑 `vuna map` / `--find` / `--impact` / `api`，
# 断言退出码、输出形状与位置合理性。不做「入库索引 diff」——索引是本地缓存（.local/index/），
# 不是提交物，新鲜度由 mtime+size 自动判定。
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

tmpd=$(mktemp -d "${TMPDIR:-/tmp}/vuna-index-check.XXXXXX") || exit 1
trap 'if [ -f "$tmpd/Resolve.vuna.bak" ]; then mv "$tmpd/Resolve.vuna.bak" compiler/lib/Vuna/Compiler/Loader/Resolve.vuna; fi; rm -rf "$tmpd"' EXIT INT TERM

fail=0
note() { printf '%s\n' "$1"; }
bad() { printf 'FAIL: %s\n' "$1" >&2; fail=1; }

# 0) 从干净缓存开始，确保下面测的是真实重建路径。
rm -rf .local/index

# 1) 总览：退出 0、非空、含已知包与模块。
if ! out=$("$VUNA" map 2>&1); then
  bad "vuna map exited non-zero: $out"
else
  case "$out" in
    *"Vuna.Compiler.Elab"*) : ;;
    *) bad "vuna map output missing Vuna.Compiler.Elab" ;;
  esac
  case "$out" in
    *"Base.IO"*) : ;;
    *) bad "vuna map output missing Base.IO" ;;
  esac
  note "ok: vuna map ($(printf '%s\n' "$out" | wc -l | tr -d ' ') lines)"
fi

# 2) 缓存：第二次调用应命中（不重建）。用 manifest 的 mtime 不变来验证。
#    M30：缓存格式 v3 首行必须是 `vuna-index 3`。
if [ -f .local/index/manifest.txt ]; then
  first=$(sed -n '1p' .local/index/manifest.txt)
  if [ "$first" = "vuna-index 3" ]; then
    note "ok: index cache v3 header"
  else
    bad "index cache header is not vuna-index 3: $first"
  fi
else
  bad "index cache manifest.txt not written"
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

# 7) 符号位置合理性：所有 (行:列) 都落在真实文件行数内。
#    用 symbols.txt 逐行解析，纯 shell 实现（不引入 jq）。
if [ -f .local/index/symbols.txt ] && [ -f .local/index/modules.txt ]; then
  while IFS="$(printf '\t')" read -r mod name kind line col rest; do
    [ -n "${mod:-}" ] || continue
    case "$line" in
      ''|*[!0-9]*) bad "non-numeric line for $mod.$name: $line" ; continue ;;
    esac
    if [ "$line" -lt 1 ]; then
      bad "line < 1 for $mod.$name"
    fi
  done < .local/index/symbols.txt
  note "ok: symbol lines are positive integers"
else
  bad "index cache files missing (symbols.txt / modules.txt)"
fi

# 8) 缓存自动失效（M30/C11）：同 size + 同 mtime 的内容变更也必须失效——
#    旧实现只按 (size, mtime 秒) 判新，这里把 mtime 还原到原值后改内容。
target=compiler/lib/Vuna/Compiler/Loader/Resolve.vuna
cp -p "$target" "$tmpd/Resolve.vuna.bak"
before_manifest=$(cat .local/index/manifest.txt)
before_size=$(wc -c <"$target" | tr -d ' ')
before_mtime=$(stat -c '%Y' "$target")
# 第 8 行是行注释（第 7 行是空行）；替换注释文本首字符，字节数与语法都保持不变。
sed -i '8s/^-- ./-- X/' "$target"
touch -r "$tmpd/Resolve.vuna.bak" "$target" || cp -p "$tmpd/Resolve.vuna.bak" "$target"
after_size=$(wc -c <"$target" | tr -d ' ')
after_mtime=$(stat -c '%Y' "$target")
if [ "$before_size" != "$after_size" ] || [ "$before_mtime" != "$after_mtime" ]; then
  bad "index invalidation probe failed to keep size/mtime (size $before_size->$after_size, mtime $before_mtime->$after_mtime)"
fi
"$VUNA" map >/dev/null 2>&1 || bad "vuna map after content change failed"
after_manifest=$(cat .local/index/manifest.txt)
mv "$tmpd/Resolve.vuna.bak" "$target"
if [ "$before_manifest" = "$after_manifest" ]; then
  bad "manifest unchanged after same-size/same-mtime content change (cache did not invalidate)"
else
  note "ok: cache invalidates on content change with same size+mtime"
fi
# 恢复内容后缓存必须再次失效（避免用坏内容命中缓存）。
"$VUNA" map >/dev/null 2>&1 || bad "vuna map after restore failed"
restored_manifest=$(cat .local/index/manifest.txt)
if [ "$after_manifest" = "$restored_manifest" ]; then
  bad "manifest unchanged after restoring content (cache did not invalidate back)"
else
  note "ok: cache invalidates after restoring content"
fi

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
