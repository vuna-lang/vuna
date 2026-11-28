#!/bin/bash
# checks.vuna-native-conformance-pr：PR 增量档的 native 自举 conformance。
#
# `package:vuna-native-conformance`（`nix run .#ci -- native`）跑 `--scope all`，整轮十几分钟，
# 只在定时 / 手动跑。PR 上要的是「改了 native 后端就立刻知道自举还成立」，所以这一档只跑
# 两个能直接抓到后端回归的 scope：
#
#   selfhost  `vuna-native check <member> --error-format json`，逐成员一个进程
#   parity    `corpus/pure_cross/*.vuna` 在 ocaml / native 两个目标上对拍（ocaml 是 oracle）
#
# `corpus`（900+ 夹具的诊断对拍）留在 `native` 组：它主要守编译器前端，与后端改动弱相关，
# 成本 1.5–2 分钟，PR 上不值得。
#
# 超时与并发按 CI runner（16 GiB）标定：单成员峰值 RSS 5–6 GiB，所以 selfhost 2 路；
# parity 每条命令只编一个小程序，4 路。可用 env 覆盖。
set -eu

OUT=${1:?usage: native-conformance.sh OUT}
: "${VUNA_ALT_NATIVE:?VUNA_ALT_NATIVE 未设置（自举出的 native 编译器）}"

SCOPES=${VUNA_CONFORMANCE_SCOPES:-selfhost,parity}
TARGETS=${VUNA_CONFORMANCE_TARGETS:-ocaml,native}
SELFHOST_JOBS=${VUNA_BACKEND_SELFHOST_JOBS:-2}
JOBS=${VUNA_BACKEND_JOBS:-4}
MAX_FAILS=${VUNA_BACKEND_MAX_FAILS:-10}

export TMPDIR="$PWD/.tmp"
mkdir -p "$TMPDIR"
export VUNA_ALT_NATIVE VUNA_BACKEND_SELFHOST_JOBS="$SELFHOST_JOBS" VUNA_BACKEND_JOBS="$JOBS"
export VUNA_BACKEND_TIMEOUT="${VUNA_BACKEND_TIMEOUT:-240}"
export VUNA_BACKEND_SELFHOST_TIMEOUT="${VUNA_BACKEND_SELFHOST_TIMEOUT:-600}"
export VUNA_BACKEND_MAX_FAILS="$MAX_FAILS"

bash nix/tools/backend-check.sh \
  --compiler native \
  --scope "$SCOPES" \
  --target "$TARGETS" \
  --jobs "$JOBS"

touch "$OUT/ok"
