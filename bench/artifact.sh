#!/usr/bin/env bash
# vuna-artifacts：三端产物基线（`nix run .#vuna-artifacts`）。
#
# 与其它基准的分工：
#   * bench/run.sh    —— 26 个真实程序的运行时（ocaml/native/wasm vs 手写 OCaml）；
#   * bench/compiler.sh / native.sh —— 工具链命令墙钟；
#   * 本脚本 —— 产物的静态指标与产出它的构建时间，按程序规模分档：
#       - 中间文本（ocaml `.ml` / native `.s` / wasm `main.wat`）：文件树、文件数、字节、行数；
#       - 最终二进制（`prog` / `main.wasm`）大小；
#       - 分段构建时间：`vuna compile` 的 codegen 与外部工具链（ocamlopt / cc / wasm-tools），
#         外加一次热工具链调用（ocaml 走 build.sh 内容哈希；native 为重链；wasm 为重新汇编）。
#
# 可比性：
#   * 生成物不含绝对路径/时间戳；build.sh 进入产物目录、用相对模块名编译，因此
#     OCaml 产物调试信息里是相对路径。`ocamlopt`/`cc`/`wasm-tools` 由 flake 固定版本，
#     所以字节/行数/文件数/二进制大小可跨机器比较；
#   * 构建耗时只与同机（arch + nproc）基线比较，且是**软判定**：尺寸 FAIL 才影响退出码，
#     耗时行只报告；基线 <100ms 的耗时行不判定（调度噪声与读数同量级）。
#
# 用法（仓库根目录）：
#   sh bench/artifact.sh                          # 测全部用例 × 三端
#   sh bench/artifact.sh --only hello --target all
#   sh bench/artifact.sh --json bench/baselines/artifacts.json   # 重标
#   sh bench/artifact.sh --check                  # 与基线比（尺寸 5% WARN / 20% FAIL）
#   sh bench/artifact.sh --quick                  # 跳过 self
#   sh bench/artifact.sh --keep                   # 保留临时构建目录（打印路径）
set -euo pipefail

RUNS=1
SIZE_THRESHOLD=5
SIZE_FAIL_THRESHOLD=20
TIMING_THRESHOLD=20
TIMING_FAIL_THRESHOLD=50
LIST=0
CHECK=0
SAVE=0
QUICK=0
KEEP=0
JSON_OUT=""
BASELINE=""
ONLY=""
TARGET=all
VUNA_BIN=${VUNA:-vuna}
OCAMLOPT_BIN=${OCAMLOPT:-ocamlopt}
CC_BIN=${CC:-cc}

usage() {
  cat <<'EOF'
usage: vuna-artifacts [options]

在仓库根目录运行。产物指标（文件树/字节/行数/二进制）与构建时间，按规模分档。

options:
  --runs N                  每用例构建重复次数（默认 1；尺寸取最后一次，时间取中位）
  --target T                ocaml / native / wasm / both / all（默认 all）
  --only CASE               只跑一个用例（可重复）：hello / defs-10 / defs-100 /
                            defs-1000 / mods-10 / mods-100 / self
  --quick                   等价于跳过 self（最慢的一项）
  --list                    列出用例与目标，不测量
  --compiler PATH           被测 vuna（默认 PATH 里的 vuna / $VUNA）
  --cc PATH                 native 链接器（默认 PATH 里的 cc / $CC）
  --json FILE|-             写出 JSON 报告；`-` 表示只输出 JSON
  --baseline FILE           基线 JSON（默认 bench/baselines/artifacts.json）
  --check                   与基线对比；尺寸 5%/20%（FAIL 退出 1），时间 20%/50%
                            （软判定，只报告；耗时基线 <100ms 的行只报告）
  --size-threshold N        尺寸 WARN 阈值（默认 5%）
  --size-fail-threshold N   尺寸 FAIL 阈值（默认 20%）
  --timing-threshold N      耗时 WARN 阈值（默认 20%，仅同机）
  --timing-fail-threshold N 耗时 FAIL 阈值（默认 50%，仅同机）
  --keep                    保留临时目录（打印路径）
  -h, --help                显示帮助

环境：
  VUNA / OCAMLOPT / CC      工具路径
  TMPDIR                    临时目录根（默认 /tmp）
EOF
}

die() { printf 'vuna-artifacts: %s\n' "$*" >&2; exit 2; }
note() {
  if [ "$JSON_OUT" = "-" ]; then printf '%s\n' "$*" >&2; else printf '%s\n' "$*"; fi
}

while [ $# -gt 0 ]; do
  case $1 in
    --runs) [ $# -ge 2 ] || die "--runs needs a value"; RUNS=$2; shift 2 ;;
    --runs=*) RUNS=${1#*=}; shift ;;
    --target) [ $# -ge 2 ] || die "--target needs a value"; TARGET=$2; shift 2 ;;
    --target=*) TARGET=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
    --quick) QUICK=1; shift ;;
    --list) LIST=1; shift ;;
    --compiler) [ $# -ge 2 ] || die "--compiler needs a value"; VUNA_BIN=$2; shift 2 ;;
    --compiler=*) VUNA_BIN=${1#*=}; shift ;;
    --cc) [ $# -ge 2 ] || die "--cc needs a value"; CC_BIN=$2; shift 2 ;;
    --cc=*) CC_BIN=${1#*=}; shift ;;
    --json|--save) [ $# -ge 2 ] || die "$1 needs a value"; JSON_OUT=$2; shift 2 ;;
    --json=*|--save=*) JSON_OUT=${1#*=}; shift ;;
    --baseline) [ $# -ge 2 ] || die "--baseline needs a value"; BASELINE=$2; shift 2 ;;
    --baseline=*) BASELINE=${1#*=}; shift ;;
    --check) CHECK=1; shift ;;
    --size-threshold) [ $# -ge 2 ] || die "--size-threshold needs a value"; SIZE_THRESHOLD=$2; shift 2 ;;
    --size-threshold=*) SIZE_THRESHOLD=${1#*=}; shift ;;
    --size-fail-threshold) [ $# -ge 2 ] || die "--size-fail-threshold needs a value"; SIZE_FAIL_THRESHOLD=$2; shift 2 ;;
    --size-fail-threshold=*) SIZE_FAIL_THRESHOLD=${1#*=}; shift ;;
    --timing-threshold) [ $# -ge 2 ] || die "--timing-threshold needs a value"; TIMING_THRESHOLD=$2; shift 2 ;;
    --timing-threshold=*) TIMING_THRESHOLD=${1#*=}; shift ;;
    --timing-fail-threshold) [ $# -ge 2 ] || die "--timing-fail-threshold needs a value"; TIMING_FAIL_THRESHOLD=$2; shift 2 ;;
    --timing-fail-threshold=*) TIMING_FAIL_THRESHOLD=${1#*=}; shift ;;
    --keep) KEEP=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac
for v in SIZE_THRESHOLD SIZE_FAIL_THRESHOLD TIMING_THRESHOLD TIMING_FAIL_THRESHOLD; do
  eval "case \$$v in ''|*[!0-9]*) die \"--$v must be a non-negative integer\";; esac"
done
[ "$SIZE_FAIL_THRESHOLD" -ge "$SIZE_THRESHOLD" ] || die "--size-fail-threshold must be >= --size-threshold"
[ "$TIMING_FAIL_THRESHOLD" -ge "$TIMING_THRESHOLD" ] || die "--timing-fail-threshold must be >= --timing-threshold"

case $TARGET in
  ocaml) TARGETS="vuna_ocaml" ;;
  native) TARGETS="native" ;;
  wasm) TARGETS="wasm" ;;
  both) TARGETS="vuna_ocaml native" ;;
  all) TARGETS="vuna_ocaml native wasm" ;;
  *) die "--target must be ocaml, native, wasm, both or all" ;;
esac

REPO=$PWD
[ -d "$REPO/bench/artifacts/cases" ] || die "run from the repo root (bench/artifacts/cases not found)"
[ -d "$REPO/packages/base" ] || die "run from the repo root (packages/base not found)"

. "$REPO/bench/lib/targets.sh"

# ---------------------------------------------------------------- 工具与临时目录
command -v "$VUNA_BIN" >/dev/null 2>&1 || die "vuna not found: $VUNA_BIN"
command -v "$OCAMLOPT_BIN" >/dev/null 2>&1 || die "ocamlopt not found: $OCAMLOPT_BIN"
command -v "$CC_BIN" >/dev/null 2>&1 || die "cc not found: $CC_BIN"
WASM_RUNNER=${WASM_RUNNER:-$REPO/wasm-host/run.mjs}
NODE_BIN=${NODE:-node}
case " $TARGETS " in
  *" native "*)
    bash -c 'ulimit -s unlimited' 2>/dev/null || die "native 产物需要 ulimit -s unlimited"
    ;;
esac
case " $TARGETS " in
  *" wasm "*)
    command -v wasm-tools >/dev/null 2>&1 || die "wasm-tools not found（wasm 产物需要 wasm-tools parse）"
    command -v "$NODE_BIN" >/dev/null 2>&1 || die "node not found（wasm 产物用 JS 宿主执行）"
    [ -f "$WASM_RUNNER" ] || die "wasm JS host runner not found: $WASM_RUNNER"
    ;;
esac

TMPROOT=${TMPDIR:-/tmp}
mkdir -p "$TMPROOT" 2>/dev/null || true
WORK=$(mktemp -d "$TMPROOT/vuna-art.XXXXXX" 2>/dev/null) || die "cannot create temp dir under $TMPROOT (set TMPDIR)"
mkdir -p "$WORK/src" "$WORK/out"
cleanup() {
  if [ "$KEEP" = 1 ]; then printf 'kept: %s\n' "$WORK" >&2; else rm -rf "$WORK"; fi
}
trap cleanup EXIT INT TERM

# 单文件用例（无 manifest 祖先）走 base-only 上下文。
export VUNA_BASE="$REPO/packages/base"

TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ARCH=$(uname -m)
NPROC=$(getconf _NPROCESSORS_ONLN 2>/dev/null || printf 'unknown')
LOADAVG=$(cut -d' ' -f1 /proc/loadavg 2>/dev/null || printf 'unknown')
OCAMLOPT_VERSION=$("$OCAMLOPT_BIN" -version 2>/dev/null || printf 'unknown')
CC_VERSION=$("$CC_BIN" --version 2>/dev/null | head -n 1 || printf 'unknown')
WASM_TOOLS_VERSION=$(wasm-tools --version 2>/dev/null || printf 'unknown')
VUNA_VERSION=$("$VUNA_BIN" --version 2>/dev/null || printf 'unknown')
GIT_HEAD=unknown
GIT_DIRTY=false
if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
  GIT_HEAD=$(git rev-parse HEAD 2>/dev/null || printf 'unknown')
  if [ -n "$(git status --porcelain 2>/dev/null || true)" ]; then GIT_DIRTY=true; fi
fi

json_escape() {
  local s=$1
  s=${s//\\/\\\\}
  s=${s//\"/\\\"}
  s=${s//$'\n'/\\n}
  s=${s//$'\t'/\\t}
  printf '%s' "$s"
}

# ---------------------------------------------------------------- 用例
ALL_CASES="hello defs-10 defs-100 defs-1000 mods-10 mods-100 self"
[ "$QUICK" = 1 ] && ALL_CASES=${ALL_CASES% self}
CASES=""
case_selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}
for c in $ALL_CASES; do
  if case_selected "$c"; then CASES="$CASES $c"; fi
done
[ -n "$CASES" ] || die "no case selected (see --list)"

# self：wasm 后端不支持编译器目标，静态跳过。
case_targets() {
  local t out=""
  for t in $TARGETS; do
    [ "$1" = self ] && [ "$t" = wasm ] && continue
    out="$out $t"
  done
  printf '%s' "${out# }"
}
target_requested() {
  case " $(case_targets "$1") " in
    *" $2 "*) return 0 ;;
    *) return 1 ;;
  esac
}

# 平衡加法树：`a + b + c ...` 的深左嵌套会让精化在同一条表达式上耗尽 fuel；
# 平衡树深度是 log N，且不改变定义数量（行数/字节仍随 N 线性）。
balanced_sum() {
  local -a cur=("$@") next
  local i
  while [ "${#cur[@]}" -gt 1 ]; do
    next=()
    for ((i = 0; i < ${#cur[@]}; i += 2)); do
      if [ $((i + 1)) -lt "${#cur[@]}" ]; then
        next+=("(${cur[i]} + ${cur[i + 1]})")
      else
        next+=("${cur[i]}")
      fi
    done
    cur=("${next[@]}")
  done
  printf '%s' "${cur[0]}"
}

gen_defs() { # n out
  local n=$1 out=$2 i
  local -a terms=()
  {
    printf '%s\n' '-- 由 bench/artifact.sh 生成：N 个顶层定义（文本行数/字节斜率）。'
    for ((i = 0; i < n; i++)); do
      printf 'f%s : Int\nf%s = %s\n' "$i" "$i" "$i"
      terms+=("f$i")
    done
    printf 'main : Int\nmain = %s\n' "$(balanced_sum "${terms[@]}")"
  } >"$out"
}

gen_mods() { # n dir
  local n=$1 dir=$2 i
  local -a terms=()
  mkdir -p "$dir/app" "$dir/lib/Art"
  {
    printf '[package]\nname = "art-mods-%s"\n\n[dependencies]\nvuna-base = "../pkgs/base"\n' "$n"
  } >"$dir/vuna.toml"
  for ((i = 0; i < n; i++)); do
    printf 'module Art.Mod%s where\n\nexport value : Int\nvalue = %s\n' "$i" "$i" \
      >"$dir/lib/Art/Mod$i.vuna"
    terms+=("M$i.value")
  done
  {
    printf '%s\n' '-- 由 bench/artifact.sh 生成：N 个库模块 + 入口（文件树斜率）。'
    for ((i = 0; i < n; i++)); do printf 'import Art.Mod%s as M%s\n' "$i" "$i"; done
    printf '\nmain : Int\nmain = %s\n' "$(balanced_sum "${terms[@]}")"
  } >"$dir/app/Main.vuna"
}

prepare_case() { # case → 输入路径
  local c=$1 n
  case $c in
    hello) printf '%s' "$REPO/bench/artifacts/cases/hello.vuna" ;;
    defs-*)
      n=${c#defs-}
      gen_defs "$n" "$WORK/src/$c.vuna"
      printf '%s' "$WORK/src/$c.vuna"
      ;;
    mods-*)
      n=${c#mods-}
      mkdir -p "$WORK/src/pkgs"
      ln -sfn "$REPO/packages/base" "$WORK/src/pkgs/base"
      gen_mods "$n" "$WORK/src/$c"
      printf '%s' "$WORK/src/$c"
      ;;
    self) printf '%s' "$REPO/packages/compiler" ;;
  esac
}

expected_output() { # case → 期望 stdout（空 = 不校验）
  local c=$1 n
  case $c in
    hello) cat "$REPO/bench/artifacts/cases/hello.out" ;;
    defs-*)
      n=${c#defs-}
      printf '%s\n' $((n * (n - 1) / 2))
      ;;
    mods-*)
      n=${c#mods-}
      printf '%s\n' $((n * (n - 1) / 2))
      ;;
    self) : ;;
  esac
}

source_bytes() {
  if [ -f "$1" ]; then
    wc -c <"$1" | tr -d ' '
  else
    find "$1" -name '*.vuna' -type f -exec cat {} + | wc -c | tr -d ' '
  fi
}
source_lines() {
  if [ -f "$1" ]; then wc -l <"$1" | tr -d ' '; else
    find "$1" -name '*.vuna' -type f -exec cat {} + | wc -l | tr -d ' '
  fi
}

# ---------------------------------------------------------------- 测量
declare -A SRC_BYTES SRC_LINES SRC_KIND \
  ART_FILES ART_BYTES ART_LINES MAX_PATH MAX_BYTES MAX_LINES \
  BIN_PATH BIN_BYTES CG_MS CG_CPU TC_MS TC_CPU TCW_MS TCW_CPU RUN_OK SKIP
ORDER=()

if [ "$LIST" = 1 ]; then
  printf '  %-10s %-24s %s\n' case targets source
  for c in $CASES; do
    case $c in
      hello) s="single-file" ;;
      defs-*) s="single-file (generated)" ;;
      mods-*) s="package (generated)" ;;
      self) s="package (compiler)" ;;
    esac
    printf '  %-10s %-24s %s\n' "$c" "$(case_targets "$c")" "$s"
  done
  exit 0
fi

collect_target() { # case target
  local c=$1 t=$2
  local dir=$WORK/out/$c/$t/last
  local key val
  while IFS=$'\t' read -r key val; do
    case $key in
      files) ART_FILES["$c:$t"]=$val ;;
      bytes) ART_BYTES["$c:$t"]=$val ;;
      lines) ART_LINES["$c:$t"]=$val ;;
      max_path) MAX_PATH["$c:$t"]=$val ;;
      max_bytes) MAX_BYTES["$c:$t"]=$val ;;
      max_lines) MAX_LINES["$c:$t"]=$val ;;
      binary) BIN_BYTES["$c:$t"]=$val ;;
    esac
  done < <(vuna_artifact_stats "$t" "$dir")
  BIN_PATH["$c:$t"]=$(basename "$(vuna_binary_path "$t" "$dir")")
}

for c in $CASES; do
  src=$(prepare_case "$c")
  ORDER+=("$c")
  SRC_BYTES["$c"]=$(source_bytes "$src")
  SRC_LINES["$c"]=$(source_lines "$src")
  if [ -f "$src" ]; then SRC_KIND["$c"]="single-file"; else SRC_KIND["$c"]="package"; fi
  expect=$(expected_output "$c")
  note "== $c =="

  for t in $(case_targets "$c"); do
    if ! target_requested "$c" "$t"; then continue; fi
    cg_list=""
    tc_list=""
    cg_cpu_list=""
    tc_cpu_list=""
    for ((r = 1; r <= RUNS; r++)); do
      dir=$WORK/out/$c/$t/last
      if [ "$r" -lt "$RUNS" ]; then dir=$WORK/out/$c/$t/r$r; fi
      if ! vuna_build_target "$src" "$t" "$dir" >&2; then
        note "  $c ($t): build failed (see $dir.codegen.log / $dir.toolchain.log)"
        die "build failed: $c ($t)"
      fi
      cg_list="$cg_list $LAST_CODEGEN_MS"
      tc_list="$tc_list $LAST_TOOLCHAIN_MS"
      [ -n "$LAST_CODEGEN_CPU_MS" ] && cg_cpu_list="$cg_cpu_list $LAST_CODEGEN_CPU_MS"
      [ -n "$LAST_TOOLCHAIN_CPU_MS" ] && tc_cpu_list="$tc_cpu_list $LAST_TOOLCHAIN_CPU_MS"
    done
    # 尺寸只在最后一次构建上收集（同一输入应逐字节一致）。
    collect_target "$c" "$t"
    CG_MS["$c:$t"]=$(vuna_median $cg_list)
    TC_MS["$c:$t"]=$(vuna_median $tc_list)
    CG_CPU["$c:$t"]=$(vuna_median $cg_cpu_list)
    TC_CPU["$c:$t"]=$(vuna_median $tc_cpu_list)
    if ! vuna_toolchain_warm "$t" "$dir"; then die "warm toolchain failed: $c ($t)"; fi
    TCW_MS["$c:$t"]=$LAST_WARM_MS
    TCW_CPU["$c:$t"]=$LAST_WARM_CPU_MS

    if [ -n "$expect" ]; then
      actual=$(vuna_capture_target "$t" "$(vuna_binary_path "$t" "$dir")" || true)
      if [ "$actual" != "$expect" ]; then
        printf 'expected: %s\nactual:   %s\n' "$(printf '%s' "$expect" | head -c 200)" "$(printf '%s' "$actual" | head -c 200)" >&2
        die "output mismatch: $c ($t)"
      fi
      RUN_OK["$c:$t"]=true
    else
      RUN_OK["$c:$t"]=skipped
    fi

    note "  $(printf '%-7s files=%-4s text=%-9s lines=%-7s max=%-9s binary=%-8s cg=%-6s tc=%-6s warm=%-6s cpu(cg/tc)=%s/%s' \
      "$t" "${ART_FILES["$c:$t"]}" "${ART_BYTES["$c:$t"]}" "${ART_LINES["$c:$t"]}" \
      "${MAX_BYTES["$c:$t"]}" "${BIN_BYTES["$c:$t"]}" "${CG_MS["$c:$t"]}" "${TC_MS["$c:$t"]}" "${TCW_MS["$c:$t"]}" \
      "${CG_CPU["$c:$t"]:-n/a}" "${TC_CPU["$c:$t"]:-n/a}")"
  done
  if [ "$c" = self ]; then
    case " $TARGETS " in
      *" wasm "*) note "  wasm skipped (backend does not target the compiler)" ;;
    esac
  fi
done

# ---------------------------------------------------------------- JSON
emit_tree() { # target dir
  local target=$1 dir=$2 first=1 rel b l
  while IFS=$'\t' read -r rel b l; do
    [ "$first" = 1 ] || printf ', '
    first=0
    printf '{ "path": "%s", "bytes": %s, "lines": %s }' "$(json_escape "$rel")" "$b" "$l"
  done < <(vuna_artifact_tree "$target" "$dir")
}

emit_backend_json() { # case target
  local c=$1 t=$2 indent='          '
  local dir=$WORK/out/$c/$t/last
  printf '%s"%s": {\n' "$indent" "$t"
  printf '%s  "artifact": { "files": %s, "bytes": %s, "lines": %s, "max_file": { "path": "%s", "bytes": %s, "lines": %s }, "tree": [' \
    "$indent" "${ART_FILES["$c:$t"]}" "${ART_BYTES["$c:$t"]}" "${ART_LINES["$c:$t"]}" \
    "$(json_escape "${MAX_PATH["$c:$t"]}")" "${MAX_BYTES["$c:$t"]}" "${MAX_LINES["$c:$t"]}"
  emit_tree "$t" "$dir"
  printf '] },\n'
  printf '%s  "binary": { "path": "%s", "bytes": %s },\n' \
    "$indent" "${BIN_PATH["$c:$t"]}" "${BIN_BYTES["$c:$t"]}"
  printf '%s  "build": { "codegen_ms": %s, "codegen_cpu_ms": %s, "toolchain_ms": %s, "toolchain_cpu_ms": %s, "toolchain_warm_ms": %s, "toolchain_warm_cpu_ms": %s },\n' \
    "$indent" "${CG_MS["$c:$t"]}" "${CG_CPU["$c:$t"]:-null}" \
    "${TC_MS["$c:$t"]}" "${TC_CPU["$c:$t"]:-null}" \
    "${TCW_MS["$c:$t"]}" "${TCW_CPU["$c:$t"]:-null}"
  if [ "${RUN_OK["$c:$t"]}" = skipped ]; then
    printf '%s  "run": { "ok": "skipped" }\n' "$indent"
  else
    printf '%s  "run": { "ok": true }\n' "$indent"
  fi
  printf '%s}' "$indent"
}

emit_json() {
  printf '{\n'
  printf '  "schema": 1,\n'
  printf '  "meta": {\n'
  printf '    "timestamp": "%s",\n' "$TIMESTAMP"
  printf '    "git_head": "%s",\n' "$GIT_HEAD"
  printf '    "git_dirty": %s,\n' "$GIT_DIRTY"
  printf '    "compiler": "%s",\n' "$(json_escape "$VUNA_VERSION")"
  printf '    "ocamlopt": "%s",\n' "$(json_escape "$OCAMLOPT_VERSION")"
  printf '    "cc": "%s",\n' "$(json_escape "$CC_VERSION")"
  printf '    "wasm_tools": "%s",\n' "$(json_escape "$WASM_TOOLS_VERSION")"
  printf '    "arch": "%s",\n' "$(json_escape "$ARCH")"
  printf '    "nproc": %s,\n' "$(case $NPROC in ''|*[!0-9]*) printf 'null' ;; *) printf '%s' "$NPROC" ;; esac)"
  printf '    "loadavg": "%s",\n' "$(json_escape "$LOADAVG")"
  printf '    "runs": %s,\n' "$RUNS"
  printf '    "target": "%s"\n' "$TARGET"
  printf '  },\n'
  printf '  "cases": {\n'
  local first_c=1 c t first_t
  for c in "${ORDER[@]}"; do
    [ "$first_c" = 1 ] || printf ',\n'
    first_c=0
    printf '    "%s": {\n' "$c"
    printf '      "source": { "kind": "%s", "bytes": %s, "lines": %s },\n' \
      "${SRC_KIND["$c"]}" "${SRC_BYTES["$c"]}" "${SRC_LINES["$c"]}"
    printf '      "targets": {\n'
    first_t=1
    for t in $(case_targets "$c"); do
      if ! target_requested "$c" "$t"; then continue; fi
      [ "$first_t" = 1 ] || printf ',\n'
      first_t=0
      emit_backend_json "$c" "$t"
    done
    if [ "$c" = self ]; then
      case " $TARGETS " in
        *" wasm "*)
          [ "$first_t" = 1 ] || printf ',\n'
          printf '        "wasm": { "skip_reason": "backend does not target the compiler" }'
          ;;
      esac
    fi
    printf '\n      }\n'
    printf '    }'
  done
  printf '\n  }\n}\n'
}

# ---------------------------------------------------------------- 对比基线
judge_delta() { # cur base threshold fail
  awk -v c="$1" -v b="$2" -v th="$3" -v ft="$4" 'BEGIN {
    if (b + 0 == 0) { print "n/a new"; exit }
    d = (c - b) / b * 100
    if (d > ft) printf "%.1f FAIL\n", d;
    else if (d > th) printf "%.1f WARN\n", d;
    else printf "%.1f ok\n", d;
  }'
}

base_value() { # case target jq-expression
  jq -r --arg c "$1" --arg t "$2" ".cases[\$c].targets[\$t] | $3 // empty" "$BASELINE"
}

compare_baseline() {
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-artifacts)"
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  jq -e . "$BASELINE" >/dev/null 2>&1 || die "baseline is not valid JSON: $BASELINE"

  local base_arch base_nproc base_load
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  base_load=$(jq -r '.meta.loadavg // "unknown"' "$BASELINE")
  local same_machine=0
  [ "$base_arch" = "$ARCH" ] && [ "$base_nproc" = "$NPROC" ] && same_machine=1
  local same_arch=0
  [ "$base_arch" = "$ARCH" ] && same_arch=1

  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  note "size: WARN ${SIZE_THRESHOLD}% / FAIL ${SIZE_FAIL_THRESHOLD}%；timing: WARN ${TIMING_THRESHOLD}% / FAIL ${TIMING_FAIL_THRESHOLD}%（同机才判）"
  note "loadavg: 当前 ${LOADAVG} / 基线 ${base_load}"

  local size_warn=0 size_fail=0 time_warn=0 time_fail=0 news=0 missing=0 ok=0
  local c t key cur basev delta verdict
  local -a size_keys=(artifact.bytes artifact.files artifact.lines binary.bytes)
  local suffix cur_c cur_w base_c base_w cpu_key wall_key
  printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' case target metric cur base delta result
  for c in "${ORDER[@]}"; do
    for t in $(case_targets "$c"); do
      if ! target_requested "$c" "$t"; then continue; fi
      for key in "${size_keys[@]}"; do
        case $key in
          artifact.bytes) cur=${ART_BYTES["$c:$t"]:-} ;;
          artifact.files) cur=${ART_FILES["$c:$t"]:-} ;;
          artifact.lines) cur=${ART_LINES["$c:$t"]:-} ;;
          binary.bytes) cur=${BIN_BYTES["$c:$t"]:-} ;;
        esac
        basev=$(base_value "$c" "$t" ".$key")
        if [ -z "$basev" ]; then
          printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' "$c" "$t" "$key" "$cur" "-" "-" "new"
          news=$((news + 1))
          continue
        fi
        if [ "$key" = binary.bytes ] && [ "$same_arch" != 1 ]; then
          printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' "$c" "$t" "$key" "$cur" "$basev" "-" "arch-mismatch"
          continue
        fi
        read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$SIZE_THRESHOLD" "$SIZE_FAIL_THRESHOLD")"
        case $verdict in WARN) size_warn=$((size_warn + 1)) ;; FAIL) size_fail=$((size_fail + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
        printf '  %-10s %-11s %-20s %12s %12s %8s%%  %s\n' "$c" "$t" "$key" "$cur" "$basev" "$delta" "$verdict"
      done
      for suffix in codegen toolchain toolchain_warm; do
        case $suffix in
          codegen) cur_c=${CG_CPU["$c:$t"]:-}; cur_w=${CG_MS["$c:$t"]:-} ;;
          toolchain) cur_c=${TC_CPU["$c:$t"]:-}; cur_w=${TC_MS["$c:$t"]:-} ;;
          toolchain_warm) cur_c=${TCW_CPU["$c:$t"]:-}; cur_w=${TCW_MS["$c:$t"]:-} ;;
        esac
        cpu_key="build.${suffix}_cpu_ms"
        wall_key="build.${suffix}_ms"
        base_c=$(base_value "$c" "$t" ".$cpu_key")
        base_w=$(base_value "$c" "$t" ".$wall_key")
        if [ -n "$cur_c" ] && [ -n "$base_c" ]; then
          key=$cpu_key
          cur=$cur_c
          basev=$base_c
        elif [ -n "$cur_w" ] && [ -n "$base_w" ]; then
          key=$wall_key
          cur=$cur_w
          basev=$base_w
        else
          key=$wall_key
          cur=$cur_w
          basev=""
        fi
        if [ -z "$basev" ]; then
          printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' "$c" "$t" "$key" "$cur" "-" "-" "new"
          news=$((news + 1))
          continue
        fi
        if [ "$same_machine" != 1 ]; then
          printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' "$c" "$t" "$key" "$cur" "$basev" "-" "different-machine"
          continue
        fi
        # 亚 100ms 的耗时读数噪声与进程调度同量级，只报告不判定。
        if [ "$basev" -lt 100 ] 2>/dev/null; then
          printf '  %-10s %-11s %-20s %12s %12s %9s  %s\n' "$c" "$t" "$key" "$cur" "$basev" "-" "below-100ms"
          continue
        fi
        read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$TIMING_THRESHOLD" "$TIMING_FAIL_THRESHOLD")"
        case $verdict in WARN) time_warn=$((time_warn + 1)) ;; FAIL) time_fail=$((time_fail + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
        printf '  %-10s %-11s %-20s %12s %12s %8s%%  %s\n' "$c" "$t" "$key" "$cur" "$basev" "$delta" "$verdict"
      done
    done
  done

  # 基线里有、本次没跑（--only / --target 过滤）的用例只报告。
  local missing_names=""
  while read -r c; do
    [ -n "$c" ] || continue
    case " $CASES " in *" $c "*) ;; *) missing_names="$missing_names $c" ;; esac
  done < <(jq -r '.cases | keys[]' "$BASELINE")
  if [ -n "$missing_names" ]; then
    missing=$(printf '%s\n' $missing_names | wc -w | tr -d ' ')
    note "missing (本次未跑):$missing_names"
  fi

  note ""
  note "summary: size ok=$ok warn=$size_warn fail=$size_fail; timing warn=$time_warn fail=$time_fail（软，不影响退出码）; new=$news missing=$missing"
  if [ "$size_fail" -gt 0 ]; then
    note "PERF-CHECK-FAIL（尺寸 $size_fail 项超过阈值）"
    return 1
  fi
  if [ "$size_warn" -gt 0 ] || [ "$time_warn" -gt 0 ] || [ "$time_fail" -gt 0 ]; then
    note "PERF-CHECK-WARN（尺寸 $size_warn 项 / 耗时 $((time_warn + time_fail)) 项超过 WARN 阈值）"
    return 0
  fi
  note "PERF-CHECK-OK"
  return 0
}

# ---------------------------------------------------------------- 输出
if [ -n "$CHECK" ] && [ -z "$BASELINE" ]; then
  BASELINE=$REPO/bench/baselines/artifacts.json
fi

if [ "$JSON_OUT" = "-" ]; then
  emit_json
  rc=0
  if [ "$CHECK" = 1 ]; then compare_baseline >&2 || rc=$?; fi
  exit $rc
fi

if [ -n "$JSON_OUT" ]; then
  if [ "$GIT_DIRTY" = true ]; then
    note "warning: 工作树有未提交改动，基线会记 git_dirty=true（$JSON_OUT）" >&2
  fi
  emit_json >"$JSON_OUT"
  note "json: $JSON_OUT"
fi

rc=0
if [ "$CHECK" = 1 ]; then compare_baseline || rc=$?; fi
exit $rc