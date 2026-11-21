#!/usr/bin/env bash
# 三端产物构建与度量（`bench/run.sh` 与 `bench/artifact.sh` 共用）。
#
# 调用方在 source 前设置：VUNA_BIN、CC_BIN、WASM_RUNNER、WASM_OPT_BIN、WASM_OPT_FLAGS、
# WASM_OPT_LEVEL、NODE_BIN、REPO。
# 本文件只负责「编译一个输入 → 布局确定的产物目录 → 收集文件树 / 二进制 / 耗时」，
# 不解析命令行、不打印表格。
#
# 产物口径：
#   * vuna_ocaml：`vuna compile` 写 `.ml` 文件集 + `build.sh`，`build.sh`（ocamlopt）链接出 `prog`；
#   * native：`vuna compile` 写 `.s` 文件集，`cc` 按固定参数链接出静态 `prog`；
#   * wasm：`vuna compile` 写 `main.wat`，`wasm-tools parse` 汇编成 `main.wasm`，
#           再经 `wasm-opt -O3` 优化（与 `build.sh` 的默认阶段一致）。
#
# 字节可比性：生成物不含绝对路径/时间戳；`build.sh` 先进入产物目录、用相对模块名编译，
# 因此 OCaml 产物调试信息里记录的是相对路径，二进制字节也不随构建目录漂移。
# `cc` / `ocamlopt` / `wasm-tools` 由 flake 固定版本，故大小可跨机器比较。

vuna_now_ms() { date +%s%3N; }

# vuna_time_cmd <log> <cmd...>：输出重定向到 log，设置
#   LAST_WALL_MS（墙钟）、LAST_CPU_MS（user+sys，毫秒）。
# 用 bash 内建 `time`（`TIMEFORMAT='%R %U %S'`）测量，因此 `cmd` 可以是 shell 函数
# （外部 GNU time 无法 exec 函数）。CPU 时间不受宿主负载影响，可与同机基线直接比；
# 墙钟只在机器空闲时参考。
vuna_time_cmd() {
  local log=$1
  shift
  local tf rc wall user sys saved_tf
  tf=$(mktemp "$(dirname "$log")/.vuna-time.XXXXXX" 2>/dev/null) || {
    "$@" >"$log" 2>&1
    LAST_WALL_MS=0
    LAST_CPU_MS=""
    return $?
  }
  saved_tf=${TIMEFORMAT-}
  TIMEFORMAT='%R %U %S'
  { time "$@" >"$log" 2>&1; } 2>"$tf"
  rc=$?
  TIMEFORMAT=$saved_tf
  if [ -s "$tf" ]; then
    read -r wall user sys <"$tf"
    LAST_WALL_MS=$(awk -v s="$wall" 'BEGIN { printf "%d", s * 1000 }')
    LAST_CPU_MS=$(awk -v u="$user" -v s="$sys" 'BEGIN { printf "%d", (u + s) * 1000 }')
  else
    LAST_WALL_MS=0
    LAST_CPU_MS=""
  fi
  rm -f "$tf"
  return "$rc"
}

vuna_target_ext() {
  case $1 in
    vuna_ocaml) printf 'ml' ;;
    native) printf 's' ;;
    wasm) printf 'wat' ;;
    *) printf '' ;;
  esac
}

# 单独跑该后端的工具链（编译已由 vuna 完成）。用于测量热重链/重新汇编。
vuna_toolchain() { # target dir [extra.c ...]
  local target=$1 dir=$2
  shift 2
  local -a csrcs=("$@")
  case $target in
    vuna_ocaml) ( cd "$dir" && sh build.sh prog "${csrcs[@]}" ) ;;
    native)
      ( cd "$dir" && "$CC_BIN" -static -nostdlib -no-pie -Wl,--build-id=none -o prog \
          $(find . -name '*.s' -type f | LC_ALL=C sort) "${csrcs[@]}" )
      ;;
    wasm) ( cd "$dir" && wasm-tools parse main.wat -o main.wasm ) ;;
    *) return 2 ;;
  esac
}

# 后处理：只对 wasm 有一步（binaryen 的 `-ON`）；其它目标不动产物。
# 与 `build.sh` 里的阶段一致（`wasm-tools parse` 之后、`mv` 之前）。
vuna_postprocess() { # target dir
  local target=$1 dir=$2
  case $target in
    wasm)
      ( cd "$dir" && "$WASM_OPT_BIN" $WASM_OPT_FLAGS -g -O"$WASM_OPT_LEVEL" \
          main.wasm -o main.wasm.tmp 2>opt.log && mv main.wasm.tmp main.wasm && rm -f opt.log )
      ;;
    *) return 0 ;;
  esac
}

# vuna_build_target <src> <target> <dir> [extra.c ...]
# 成功返回 0；LAST_CODEGEN_MS / LAST_CODEGEN_CPU_MS / LAST_TOOLCHAIN_MS /
# LAST_TOOLCHAIN_CPU_MS 记录本次编译 / 工具链耗时。
vuna_build_target() {
  local src=$1 target=$2 dir=$3
  shift 3
  local -a csrcs=("$@")
  mkdir -p "$dir"
  if ! vuna_time_cmd "$dir.codegen.log" \
      "$VUNA_BIN" compile "$src" "$dir" --target "$(vuna_target_name "$target")"; then
    printf 'codegen failed (%s): %s\n' "$target" "$dir.codegen.log" >&2
    tail -n 20 "$dir.codegen.log" >&2 || true
    return 1
  fi
  LAST_CODEGEN_MS=$LAST_WALL_MS
  LAST_CODEGEN_CPU_MS=$LAST_CPU_MS
  if ! vuna_time_cmd "$dir.toolchain.log" \
      vuna_toolchain "$target" "$dir" "${csrcs[@]}"; then
    printf 'toolchain failed (%s): %s\n' "$target" "$dir.toolchain.log" >&2
    tail -n 20 "$dir.toolchain.log" >&2 || true
    return 1
  fi
  LAST_TOOLCHAIN_MS=$LAST_WALL_MS
  LAST_TOOLCHAIN_CPU_MS=$LAST_CPU_MS
  if ! vuna_time_cmd "$dir.postprocess.log" vuna_postprocess "$target" "$dir"; then
    printf 'postprocess failed (%s): %s\n' "$target" "$dir.postprocess.log" >&2
    tail -n 20 "$dir.postprocess.log" >&2 || true
    return 1
  fi
  LAST_POST_MS=$LAST_WALL_MS
  LAST_POST_CPU_MS=$LAST_CPU_MS
}

vuna_target_name() {
  case $1 in
    vuna_ocaml) printf 'ocaml' ;;
    *) printf '%s' "$1" ;;
  esac
}

# 热工具链一次调用：ocaml 的 build.sh 走内容哈希、命中即跳过；native 走完整重链；
# wasm 重新汇编 + 优化。设置 LAST_WARM_MS / LAST_WARM_CPU_MS（不能放命令替换里调用）。
vuna_toolchain_warm() { # target dir [extra.c ...]
  local target=$1 dir=$2
  shift 2
  if ! vuna_time_cmd "$dir.warm.log" vuna_pipeline_warm "$target" "$dir" "$@"; then
    printf 'warm toolchain failed (%s): %s\n' "$target" "$dir.warm.log" >&2
    tail -n 20 "$dir.warm.log" >&2 || true
    return 1
  fi
  LAST_WARM_MS=$LAST_WALL_MS
  LAST_WARM_CPU_MS=$LAST_CPU_MS
}

# 热路径的完整外部流程：工具链 + 后处理（与 `build.sh` 的阶段顺序一致）。
vuna_pipeline_warm() { # target dir [extra.c ...]
  local target=$1 dir=$2
  shift 2
  vuna_toolchain "$target" "$dir" "$@" || return $?
  vuna_postprocess "$target" "$dir" || return $?
}

# 产物文本的统计：files / bytes / lines / max_path / max_bytes / max_lines / binary。
# 每行 `<key>\t<value>`，便于调用方 read。
vuna_artifact_stats() { # target dir
  local target=$1 dir=$2
  if [ "$target" = wasm ]; then
    local b l
    b=$(wc -c <"$dir/main.wat" | tr -d ' ')
    l=$(wc -l <"$dir/main.wat" | tr -d ' ')
    printf 'files\t1\n'
    printf 'bytes\t%s\n' "$b"
    printf 'lines\t%s\n' "$l"
    printf 'max_path\tmain.wat\n'
    printf 'max_bytes\t%s\n' "$b"
    printf 'max_lines\t%s\n' "$l"
    printf 'binary\t%s\n' "$(wc -c <"$dir/main.wasm" | tr -d ' ')"
    return 0
  fi
  local ext files total_bytes total_lines max_path max_bytes max_lines
  local f b l
  ext=$(vuna_target_ext "$target")
  files=0
  total_bytes=0
  total_lines=0
  max_path=''
  max_bytes=0
  max_lines=0
  while IFS= read -r f; do
    b=$(wc -c <"$f" | tr -d ' ')
    l=$(wc -l <"$f" | tr -d ' ')
    files=$((files + 1))
    total_bytes=$((total_bytes + b))
    total_lines=$((total_lines + l))
    if [ "$b" -gt "$max_bytes" ]; then
      max_bytes=$b
      max_lines=$l
      max_path=${f#"$dir"/}
    fi
  done < <(find "$dir" -name "*.$ext" -type f | LC_ALL=C sort)
  local bin=0
  [ -f "$dir/prog" ] && bin=$(wc -c <"$dir/prog" | tr -d ' ')
  printf 'files\t%s\n' "$files"
  printf 'bytes\t%s\n' "$total_bytes"
  printf 'lines\t%s\n' "$total_lines"
  printf 'max_path\t%s\n' "$max_path"
  printf 'max_bytes\t%s\n' "$max_bytes"
  printf 'max_lines\t%s\n' "$max_lines"
  printf 'binary\t%s\n' "$bin"
}

# 文件树：每行 `<相对路径>\t<bytes>\t<lines>`，按路径排序。
vuna_artifact_tree() { # target dir
  local target=$1 dir=$2
  if [ "$target" = wasm ]; then
    printf 'main.wat\t%s\t%s\n' \
      "$(wc -c <"$dir/main.wat" | tr -d ' ')" \
      "$(wc -l <"$dir/main.wat" | tr -d ' ')"
    return 0
  fi
  local ext f rel
  ext=$(vuna_target_ext "$target")
  while IFS= read -r f; do
    rel=${f#"$dir"/}
    printf '%s\t%s\t%s\n' "$rel" \
      "$(wc -c <"$f" | tr -d ' ')" \
      "$(wc -l <"$f" | tr -d ' ')"
  done < <(find "$dir" -name "*.$ext" -type f | LC_ALL=C sort)
}

vuna_binary_path() { # target dir
  case $1 in
    wasm) printf '%s/main.wasm' "$2" ;;
    *) printf '%s/prog' "$2" ;;
  esac
}

vuna_run_target() { # target program
  case $1 in
    wasm) "$NODE_BIN" "$WASM_RUNNER" "$2" ;;
    *) "$2" ;;
  esac
}

vuna_capture_target() { # target program（stdout + stderr）
  vuna_run_target "$1" "$2" 2>&1
}

vuna_median() { # 若干整数；无参数时输出空串
  if [ $# -eq 0 ]; then
    printf ''
    return 0
  fi
  printf '%s\n' "$@" | sort -n | awk '{ a[NR] = $1 } END { if (NR % 2) print a[(NR + 1) / 2]; else print int((a[NR / 2] + a[NR / 2 + 1]) / 2) }'
}