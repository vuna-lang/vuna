#!/usr/bin/env bash
# 跨编译器 conformance：用自举出来的 native 编译器跑 check 与夹具。
#
# 三个 scope（口径见 docs/reference/testing.md「后端自举 conformance」）：
#   selfhost  用该编译器检查整个仓库（workspace 根；机器格式诊断走进程内顺序检查）
#   parity    test/corpus/pure_cross/*.vuna 在 ocaml / wasm / native 三个输出目标上对拍
#   corpus    test/corpus 的每个夹具：负例比结构化诊断，正例要求零 error
#
# 用法:
#   backend-check --compiler native [--scope selfhost,parity,corpus] [--jobs N]
#                 [--target ocaml,wasm,native] [--filter PAT] [--compiler-bin PATH]
#                 [--keep] [--list]
#
# 依赖 PATH：wasm-tools / wasmtime / cc / ocamlopt / jq（由 `nix run .#backend-check` 注入）。
set -euo pipefail

compiler=
compiler_bin=
scopes=
targets=ocaml,wasm,native
jobs=${VUNA_BACKEND_JOBS:-8}
filter=
keep=0
list=0

usage() {
  sed -n '2,13p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

while [ $# -gt 0 ]; do
  case $1 in
    --compiler) compiler=${2:-}; shift 2 ;;
    --compiler-bin) compiler_bin=${2:-}; shift 2 ;;
    --scope) scopes=${2:-}; shift 2 ;;
    --target) targets=${2:-}; shift 2 ;;
    --jobs) jobs=${2:-}; shift 2 ;;
    --filter) filter=${2:-}; shift 2 ;;
    --keep) keep=1; shift ;;
    --list) list=1; shift ;;
    -h|--help) usage 0 ;;
    *) printf 'backend-check: unknown argument %s\n' "$1" >&2; usage 2 ;;
  esac
done

case $compiler in
  native) ;;
  "") printf 'backend-check: --compiler native is required\n' >&2; usage 2 ;;
  *) printf 'backend-check: unknown compiler %s\n' "$compiler" >&2; exit 2 ;;
esac

if [ -z "$scopes" ]; then scopes=selfhost,parity; fi
case ",$scopes," in
  *,all,*) scopes=selfhost,parity,corpus ;;
esac

needs() {
  case ",$scopes," in *",$1,"*) return 0 ;; esac
  return 1
}

# 仓库根：向上找 test/suite.toml（与 nix/build/run-tests.nix 同口径）。
repo=$PWD
while [ ! -f "$repo/test/suite.toml" ]; do
  if [ "$repo" = / ]; then
    printf 'backend-check: cannot find test/suite.toml (run from the vuna repo)\n' >&2
    exit 2
  fi
  repo=$(dirname "$repo")
done
base=$repo/packages/base
suite=$repo/test/suite

if [ -z "$compiler_bin" ]; then
  var="VUNA_ALT_${compiler^^}"
  compiler_bin=${!var:-}
fi
if [ -z "$compiler_bin" ] || [ ! -x "$compiler_bin" ]; then
  printf 'backend-check: compiler binary for %s not found (set VUNA_ALT_%s or --compiler-bin)\n' \
    "$compiler" "${compiler^^}" >&2
  exit 2
fi
alt=$compiler_bin

export VUNA_BASE="$base"

work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-backend-check.XXXXXX")
cleanup() {
  if [ "$keep" = 1 ]; then
    printf 'backend-check: work dir kept at %s\n' "$work"
  else
    rm -rf "$work"
  fi
}
trap cleanup EXIT

matches_filter() {
  [ -z "$filter" ] && return 0
  case "$1" in *"$filter"*) return 0 ;; esac
  return 1
}

# ---------------------------------------------------------------------------
# selfhost：整个 workspace 用该编译器自检
# ---------------------------------------------------------------------------
run_selfhost() {
  printf '== selfhost: %s check . (workspace root)\n' "$compiler"
  local out="$work/selfhost.json" err="$work/selfhost.err" status=0 errors
  ( cd "$repo" && "$alt" check "$repo" --error-format json >"$out" 2>"$err" ) || status=$?
  if [ ! -s "$out" ]; then
    printf 'FAIL selfhost: no json document (exit %s)\n' "$status" >&2
    sed -n '1,20p' "$err" >&2 || true
    return 1
  fi
  errors=$(jq '[.diagnostics[] | select(.severity == "error")] | length' "$out")
  if [ "$errors" != 0 ]; then
    printf 'FAIL selfhost: %s error diagnostic(s)\n' "$errors" >&2
    jq -r '.diagnostics[] | select(.severity == "error")
           | "  \(.labels[0].span.file // "?"):\(.labels[0].span.start.line // 0): [\(.code)] \(.message)"' \
      "$out" | head -20 >&2
    return 1
  fi
  if [ "$status" != 0 ]; then
    printf 'FAIL selfhost: exit %s with no diagnostics\n' "$status" >&2
    return 1
  fi
  return 0
}

# ---------------------------------------------------------------------------
# parity：三个输出目标逐字对拍（单文件夹具：compile + 宿主工具链执行）
# ---------------------------------------------------------------------------
parity_one() {
  local stem=$1 target=$2
  local fixture="$repo/test/corpus/pure_cross/$stem.vuna"
  local outdir="$work/parity/$stem-$target" want got status=0
  want=$(cat "$repo/test/corpus/pure_cross/$stem.out")
  mkdir -p "$outdir"
  cp "$fixture" "$outdir/src.vuna"

  case $target in
    ocaml)
      "$alt" compile "$outdir/src.vuna" "$outdir/o" --target ocaml >"$outdir/build.log" 2>&1 || status=$?
      if [ "$status" = 0 ]; then
        ( cd "$outdir/o" && sh build.sh prog ) >>"$outdir/build.log" 2>&1 || status=$?
      fi
      if [ "$status" = 0 ]; then got=$("$outdir/o/prog" 2>&1) || status=$?; fi
      ;;
    wasm)
      "$alt" compile "$outdir/src.vuna" "$outdir/w" --target wasm >"$outdir/build.log" 2>&1 || status=$?
      if [ "$status" = 0 ]; then
        wasm-tools parse "$outdir/w/main.wat" -o "$outdir/w/main.wasm" >>"$outdir/build.log" 2>&1 || status=$?
      fi
      if [ "$status" = 0 ]; then
        got=$(wasmtime run -W stack-switching=y -W gc=y -W function-references=y "$outdir/w/main.wasm" 2>&1) || status=$?
      fi
      ;;
    native)
      "$alt" compile "$outdir/src.vuna" "$outdir/n" --target native >"$outdir/build.log" 2>&1 || status=$?
      if [ "$status" = 0 ]; then
        cc -static -nostdlib -no-pie -Wl,--build-id=none -o "$outdir/n/prog" "$outdir/n/main.s" >>"$outdir/build.log" 2>&1 || status=$?
      fi
      if [ "$status" = 0 ]; then got=$("$outdir/n/prog" 2>&1) || status=$?; fi
      ;;
    *) printf 'backend-check: unknown target %s\n' "$target" >&2; return 0 ;;
  esac

  if [ "$status" != 0 ]; then
    printf 'FAIL parity/%s [%s]: exit %s\n' "$stem" "$target" "$status" >&2
    sed -n '1,10p' "$outdir/build.log" >&2 || true
    printf 'bad\tparity/%s [%s]\n' "$stem" "$target"
    return 0
  fi
  if [ "$got" != "$want" ]; then
    printf 'FAIL parity/%s [%s]: expected [%s] got [%s]\n' "$stem" "$target" "$want" "$got" >&2
    printf 'bad\tparity/%s [%s]\n' "$stem" "$target"
    return 0
  fi
  printf 'ok\tparity/%s [%s]\n' "$stem" "$target"
}

# ---------------------------------------------------------------------------
# corpus：每个夹具一条 check 断言（负例比结构诊断，正例要求零 error）
# ---------------------------------------------------------------------------
# 诊断投影（与 suite 同口径：只比 (severity, code, file, line, col) 多重集）。
# `file` 只比 basename：完整路径的投影规则由 suite 的 `Expect.projFile` 负责，这里不重复实现
# （目录夹具的期望里带 cwd 前缀，逐字比会引入与后端无关的噪声）。
jq_project() {
  jq -c '
    [ .diagnostics[] | {
        severity: .severity,
        code: .code,
        file: ((.labels[0].span.file // "")
          | (if . == "" then "" else (split("/") | last) end)),
        line: (.labels[0].span.start.line // 0),
        column: (.labels[0].span.start.column // 0)
      } ] | sort_by(.file, .line, .column, .code)'
}

corpus_entry() {
  if [ -f "$1/app/Main.vuna" ]; then printf '%s\n' "$1/app/Main.vuna"
  elif [ -f "$1/lib/Main.vuna" ]; then printf '%s\n' "$1/lib/Main.vuna"
  else return 1; fi
}

corpus_one() {
  local entry=$1 expect=$2 kind=$3 label=$4 mode=$5 root=$6
  local out err status=0 got want errors use_compile=0 target
  out="$work/corpus.$BASHPID.json"
  err="$work/corpus.$BASHPID.err"
  # 包模式交目录（ad-hoc 单文件与包语义不同：lib/ 模块、包诊断码）；单文件夹具交文件。
  if [ "$mode" = pkg ]; then target=$root; else target=$entry; fi

  # 期望含 codegen 阶段诊断（CG_* / phase=codegen）时改走 compile（与 suite 负例口径一致）
  if [ "$kind" = negative ] && jq -e '[.diagnostics[] | select((.code | startswith("CG_")) or .phase == "codegen")] | length > 0' "$expect" >/dev/null 2>&1; then
    use_compile=1
  fi

  if [ "$use_compile" = 1 ]; then
    ( cd "$repo" && "$alt" compile "$target" "$work/out.$BASHPID" --error-format json --warnings >"$out" 2>"$err" ) || status=$?
  else
    ( cd "$repo" && "$alt" check "$target" --error-format json --warnings >"$out" 2>"$err" ) || status=$?
  fi

  if [ ! -s "$out" ]; then
    printf 'FAIL corpus/%s: no json document (exit %s)\n' "$label" "$status" >&2
    sed -n '1,10p' "$err" >&2 || true
    printf 'bad\tcorpus/%s\n' "$label"
    return 0
  fi

  if [ "$kind" = negative ]; then
    got=$(jq_project <"$out")
    want=$(jq_project <"$expect")
    if [ "$got" != "$want" ]; then
      printf 'FAIL corpus/%s: diagnostics differ\n  expected: %s\n  actual:   %s\n' \
        "$label" "$want" "$got" >&2
      printf 'bad\tcorpus/%s\n' "$label"
      return 0
    fi
  else
    errors=$(jq '[.diagnostics[] | select(.severity == "error")] | length' "$out")
    if [ "$errors" != 0 ]; then
      printf 'FAIL corpus/%s: %s error diagnostic(s)\n' "$label" "$errors" >&2
      jq -r '.diagnostics[] | select(.severity == "error")
             | "  \(.labels[0].span.file // "?"):\(.labels[0].span.start.line // 0): [\(.code)] \(.message)"' \
        "$out" | head -10 >&2
      printf 'bad\tcorpus/%s\n' "$label"
      return 0
    fi
  fi
  rm -f "$out" "$err"
  printf 'ok\tcorpus/%s\n' "$label"
}

# corpus 里只跑「程序语义」夹具：工具链家族（fmt/lint/fix/doc/cli/repl/search/codegen/cst）
# 的 `.out` 是工具输出而非程序输出；pkg_err / packages 是包诊断与多包/workspace 语义，
# 期望路径与运行方式由 suite 的包上下文夹具专门覆盖（runner 侧也无法派生进程）。
corpus_skip_family() {
  case $1 in
    fmt|lint|fix|doc|cli|repl|search|lsp|codegen|cst|packages) return 0 ;;
  esac
  return 1
}

corpus_family() {
  local rel=${1#"$repo/test/corpus/"}
  printf '%s\n' "${rel%%/*}"
}

collect_jobs() {
  local exp dir entry stem name rel family mode
  while IFS= read -r exp; do
    matches_filter "$exp" || continue
    rel=${exp#"$repo/test/corpus/"}
    family=$(corpus_family "$exp")
    if corpus_skip_family "$family"; then
      printf 'skip\t-\t-\tfamily:%s/%s\t-\t-\n' "$family" "${exp#"$repo/"}"
      continue
    fi
    dir=$(dirname "$exp")
    name=$(basename "$exp")
    if [ "$name" = expected.diag.json ]; then
      entry=$(corpus_entry "$dir") || { printf 'skip\t-\t-\tno-entry:%s\t-\t-\n' "${dir#"$repo/"}"; continue; }
      mode="pkg"
    else
      stem=${exp%.diag.json}
      if [ -f "$stem.vuna" ]; then entry=$stem.vuna; else entry=$(corpus_entry "$dir") || { printf 'skip\t-\t-\tno-entry:%s\t-\t-\n' "${dir#"$repo/"}"; continue; }; fi
      mode="file"
    fi
    printf 'negative\t%s\t%s\t%s\t%s\t%s\n' "$entry" "$exp" "${exp#"$repo/"}" "$mode" "$dir"
  done < <(find "$repo/test/corpus" -name '*.diag.json' | sort)

  while IFS= read -r exp; do
    matches_filter "$exp" || continue
    family=$(corpus_family "$exp")
    if corpus_skip_family "$family"; then
      printf 'skip\t-\t-\tfamily:%s/%s\t-\t-\n' "$family" "${exp#"$repo/"}"
      continue
    fi
    dir=$(dirname "$exp")
    name=$(basename "$exp")
    if [ "$name" = expected.out ]; then
      entry=$(corpus_entry "$dir") || { printf 'skip\t-\t-\tno-entry:%s\t-\t-\n' "${dir#"$repo/"}"; continue; }
      mode="pkg"
    else
      stem=${exp%.out}
      stem=${stem%.run}
      stem=${stem%.interp}
      [ -f "$stem.vuna" ] || continue
      entry=$stem.vuna
      mode="file"
    fi
    printf 'positive\t%s\t%s\t%s\t%s\t%s\n' "$entry" "$exp" "${exp#"$repo/"}" "$mode" "$dir"
  done < <(find "$repo/test/corpus" -name '*.out' | sort)
}

export repo base suite alt compiler targets work filter
export -f parity_one corpus_one corpus_entry jq_project matches_filter

if [ "$list" = 1 ]; then
  printf 'compiler: %s (%s)\nscopes: %s\ntargets: %s\n' "$compiler" "$alt" "$scopes" "$targets"
  exit 0
fi

printf 'backend-check: compiler=%s (%s)\n' "$compiler" "$alt"
results="$work/results.tsv"
: >"$results"
status=0

if needs selfhost; then
  if run_selfhost; then printf 'ok\tselfhost\n' >>"$results"; else printf 'bad\tselfhost\n' >>"$results"; status=1; fi
fi

if needs parity; then
  printf '== parity: %s x target(s) %s\n' "$(find "$repo/test/corpus/pure_cross" -name '*.vuna' | wc -l)" "$targets"
  for fixture in "$repo"/test/corpus/pure_cross/*.vuna; do
    matches_filter "$fixture" || continue
    stem=$(basename "$fixture" .vuna)
    for target in ${targets//,/ }; do printf '%s\t%s\n' "$stem" "$target"; done
  done |
    xargs -d '\n' -P "$jobs" -I{} bash -c '
      IFS=$'"'"'\t'"'"' read -r stem target <<< "{}"
      parity_one "$stem" "$target"
    ' >>"$results" || status=1
fi

if needs corpus; then
  printf '== corpus: check-only conformance\n'
  collect_jobs >"$work/corpus-jobs"
  xargs -d '\n' -P "$jobs" -I{} bash -c '
    IFS=$'"'"'\t'"'"' read -r kind entry expect label mode root <<< "{}"
    if [ "$kind" = skip ]; then printf "skip\t%s\n" "$label"; else corpus_one "$entry" "$expect" "$kind" "$label" "$mode" "$root"; fi
  ' <"$work/corpus-jobs" >>"$results" || status=1
fi

passed=$(grep -c '^ok' "$results" || true)
failed=$(grep -c '^bad' "$results" || true)
skipped=$(grep -c '^skip' "$results" || true)
printf '\nbackend-check[%s]: %s passed, %s failed, %s skipped\n' \
  "$compiler" "$passed" "$failed" "$skipped"
if [ "$failed" != 0 ]; then
  printf 'failed:\n'
  grep '^bad' "$results" | cut -f2- | sed 's/^/  /'
  exit 1
fi
exit "$status"