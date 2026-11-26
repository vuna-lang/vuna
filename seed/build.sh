#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（直接依赖表 + 内容哈希增量 + 分层并行）。用法: ./build.sh [OUT]
# 单元表在本文件末尾的 `VUNA_UNIT_TABLE` 里：`@` 分隔并行层，其余每行 `单元 直接依赖...`
# （拓扑序）。干净构建且 JOBS<=1：一次 ocamlopt 编译全部 .mli/.ml；其余按内容哈希逐单元编译。
# 增量的判据是「本单元 .ml/.mli + 直接依赖的 .cmx」：依赖实现变了就重编下游，依赖
# 只是重新生成了同样的 .cmx 则跳过。程序自己的定义位置表在独立单元（`Vuna_deflocs`），
# `Vuna_runtime` 与 base 单元跨程序保持同一份 .cmx。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
JOBS=${VUNA_BUILD_JOBS:-}
if [ -z "$JOBS" ]; then
  JOBS=$(nproc 2>/dev/null || echo 1)
  case "${NIX_BUILD_CORES:-}" in
    ''|*[!0-9]*) ;;
    0) ;;
    *) JOBS=$NIX_BUILD_CORES ;;
  esac
fi
C_MODULES=""
C_OBJS=""
# 宿主运行时（`dtHostRuntime`）是唯一引用 `Unix.` 的块；不用宿主原语的程序不链接
# `unix.cmxa`——它的模块初始化在进程启动时值几百微秒。
UNIX=""
if grep -q 'Unix\.' Vuna_runtime.ml 2>/dev/null; then UNIX="unix.cmxa"; fi
if [ -n "$C_MODULES" ]; then
  for c in $C_MODULES; do ocamlopt -I +unix -c "$c"; b=${c##*/}; C_OBJS="$C_OBJS ${b%.c}.o"; done
fi
hash_of() {
  for f in "$@"; do
    if [ -f "$f" ]; then cat "$f"; else printf '%s' '-'; fi
  done | sha256sum | awk '{print $1}'
}
stamp_want() {
  base=$1
  shift
  deps=""
  for d in "$@"; do deps="$deps $d.cmx"; done
  hash_of "$base.ml" "$base.mli" $deps
}
compile_mod() {
  base=$1
  shift
  want=$(stamp_want "$base" "$@")
  if [ -f "$base.cmx" ] && [ -f "$base.stamp" ] && [ "$(cat "$base.stamp")" = "$want" ]; then return 0; fi
  echo "compile $base"
  if [ -f "$base.mli" ]; then ocamlopt $FLAGS -I +unix -c "$base.mli"; fi
  ocamlopt $FLAGS -I +unix -c "$base.ml"
  printf '%s' "$want" > "$base.stamp"
}
pids=""
flush_layer() {
  for p in $pids; do wait "$p" || exit 1; done
  pids=""
}
# 按单元表驱动，四种用途共用同一份依赖表：
#   clean    探测是否已有 .cmx（决定走单次调用还是逐单元路径）
#   source   收集单次 ocamlopt 的全部输入（SOURCES）与链接序（CMXS）
#   parallel 逐层并行编译：层内 `&`，层末 flush_layer 逐个 wait
#   stamps   干净构建后补写每单元 .stamp（增量构建的输入）
each_unit() {
  mode=$1
  while IFS= read -r line; do
    case "$line" in
      ''|'#'*) continue ;;
      '@') flush_layer; continue ;;
    esac
    set -- $line
    base=$1
    shift
    case "$mode" in
      clean) if [ -f "$base.cmx" ]; then clean=0; fi ;;
      source)
        CMXS="$CMXS $base.cmx"
        if [ -f "$base.mli" ]; then SOURCES="$SOURCES $base.mli"; fi
        SOURCES="$SOURCES $base.ml"
        ;;
      parallel)
        CMXS="$CMXS $base.cmx"
        compile_mod "$base" "$@" &
        pids="$pids $!"
        ;;
      stamps) printf '%s' "$(stamp_want "$base" "$@")" > "$base.stamp" ;;
    esac
  done <<'VUNA_UNIT_TABLE'
Vuna_runtime
@
B_dTrait_dMonoid Vuna_runtime
B_dTrait_dFunctor Vuna_runtime
B_dTrait_dNum Vuna_runtime
B_dTrait_dTraversable Vuna_runtime
B_dTrait_dShow Vuna_runtime
B_dTrait_dApplicative Vuna_runtime
Vuna_deflocs Vuna_runtime
Base_dVersion Vuna_runtime
B_dTrait_dEq Vuna_runtime
B_dData_dBits Vuna_runtime
B_dTrait_dHashable Vuna_runtime
B_dTrait_dMonad Vuna_runtime
B_dTrait_dNeg Vuna_runtime
@
B_dTrait_dInterp B_dTrait_dShow Vuna_runtime
B_dData_dBool B_dTrait_dShow Vuna_runtime B_dTrait_dHashable
B_dTrait_dFoldable B_dTrait_dMonoid Vuna_runtime
@
B_dTrait_dOrd B_dTrait_dShow Vuna_runtime B_dData_dBool B_dTrait_dEq B_dTrait_dHashable
@
B_dData_dInt B_dTrait_dNum B_dTrait_dShow Vuna_runtime B_dTrait_dOrd B_dTrait_dEq B_dTrait_dHashable B_dTrait_dNeg
B_dData_dUnit B_dTrait_dMonoid B_dTrait_dShow Vuna_runtime B_dTrait_dOrd B_dTrait_dEq B_dTrait_dHashable
B_dData_dPair B_dTrait_dShow Vuna_runtime B_dData_dBool B_dTrait_dOrd B_dTrait_dEq B_dTrait_dHashable
B_dData_dMaybe B_dTrait_dMonoid B_dTrait_dFunctor B_dTrait_dTraversable B_dTrait_dShow Vuna_runtime B_dData_dBool B_dTrait_dOrd B_dTrait_dFoldable B_dTrait_dApplicative B_dTrait_dEq B_dTrait_dHashable B_dTrait_dMonad
@
B_dData_dList B_dTrait_dMonoid B_dTrait_dFunctor B_dTrait_dTraversable B_dTrait_dShow Vuna_runtime B_dData_dBool B_dTrait_dOrd B_dTrait_dFoldable B_dTrait_dApplicative B_dData_dPair B_dTrait_dEq B_dTrait_dHashable B_dTrait_dMonad B_dData_dMaybe
B_dTrait_dConvert Vuna_runtime B_dData_dMaybe
@
Base_dBytes Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
B_dContainer_dArray B_dTrait_dShow Vuna_runtime B_dData_dList B_dTrait_dEq
B_dData_dFloat B_dTrait_dNum B_dTrait_dShow Vuna_runtime B_dData_dBool B_dTrait_dOrd B_dData_dList B_dData_dPair B_dTrait_dEq B_dData_dMaybe B_dTrait_dNeg
B_dData_dString B_dTrait_dMonoid B_dTrait_dInterp Vuna_runtime B_dTrait_dOrd B_dData_dList B_dTrait_dEq B_dTrait_dHashable B_dData_dMaybe
B_dContainer_dQueue B_dTrait_dShow Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
B_dData_dNat B_dTrait_dMonoid B_dTrait_dNum B_dTrait_dShow Vuna_runtime B_dTrait_dOrd B_dTrait_dEq B_dTrait_dConvert B_dTrait_dHashable B_dData_dMaybe
B_dData_dResult B_dTrait_dFunctor B_dTrait_dTraversable B_dTrait_dShow Vuna_runtime B_dTrait_dFoldable B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dTrait_dEq B_dTrait_dHashable B_dTrait_dMonad
Vuna_dTarget_dOcaml_dModel Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
B_dData_dVec Vuna_runtime B_dData_dList B_dData_dMaybe
Base_dHash Vuna_runtime B_dData_dList B_dData_dPair B_dData_dBits
Base_dDiagnostics_dIc Vuna_runtime B_dData_dList
B_dData_dSort Vuna_runtime B_dTrait_dOrd B_dData_dList B_dData_dPair
@
Frontend_dCanonical_dPkg Base_dBytes Vuna_runtime B_dData_dList Base_dHash B_dData_dPair B_dData_dMaybe
B_dContainer_dHashMap B_dContainer_dArray B_dTrait_dShow Vuna_runtime B_dData_dString B_dData_dList B_dData_dPair B_dTrait_dEq B_dTrait_dHashable B_dData_dMaybe
Vuna_dTarget_dOcaml_dRender Vuna_runtime B_dData_dList Vuna_dTarget_dOcaml_dModel B_dData_dPair B_dData_dMaybe
Base_dSource Vuna_runtime B_dData_dBool B_dData_dString B_dData_dList B_dData_dPair
@
Frontend_dAst Vuna_runtime B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Vuna_dIr_dModel Vuna_runtime B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Base_dDiag B_dData_dInt B_dTrait_dFunctor Vuna_runtime B_dData_dString B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dTrait_dEq Base_dSource B_dTrait_dMonad B_dData_dMaybe
Base_dIntrinsics Vuna_runtime B_dContainer_dHashMap B_dData_dBool B_dData_dString B_dData_dList B_dData_dPair B_dData_dMaybe
Frontend_dReserved Vuna_runtime B_dData_dString B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
B_dEffect_dCore B_dData_dInt B_dTrait_dFunctor Vuna_runtime B_dContainer_dHashMap B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dTrait_dMonad B_dData_dMaybe
@
Vuna_dIr_dRepresent Vuna_dIr_dModel Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
Loader_dAddr Base_dBytes Frontend_dAst Vuna_runtime B_dData_dList Base_dHash
Base_dDiagnostics_dSink Vuna_runtime Base_dDiag B_dContainer_dHashMap B_dData_dString B_dData_dList Base_dSource B_dData_dMaybe
Base_dDiag_dCodec Base_dBytes Vuna_runtime Base_dDiag B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Vuna_dIr_dRuntime Vuna_dIr_dModel Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
Vuna_dIr_dTail Vuna_dIr_dModel Vuna_runtime B_dContainer_dHashMap B_dData_dString B_dData_dResult B_dData_dList B_dData_dPair B_dData_dMaybe
B_dEffect_dCursor B_dTrait_dFunctor Vuna_runtime B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Frontend_dCanonical_dAst Base_dBytes Frontend_dAst Vuna_runtime B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
B_dContainer_dMutRef Vuna_runtime B_dData_dUnit B_dTrait_dApplicative B_dEffect_dCore B_dTrait_dMonad
Vuna_dIr_dDispatch Vuna_dIr_dModel Vuna_runtime Base_dIntrinsics B_dData_dList B_dData_dPair B_dData_dMaybe
Frontend_dAstQuery Frontend_dAst Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
Base_dObs Vuna_runtime B_dTrait_dApplicative B_dEffect_dCore B_dTrait_dMonad
Core_dTerm B_dData_dInt Vuna_runtime B_dContainer_dHashMap Base_dIntrinsics B_dData_dString B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Frontend_dName Vuna_runtime Base_dIntrinsics B_dData_dString Frontend_dReserved B_dData_dList B_dData_dPair B_dData_dMaybe
Base_dCommon B_dTrait_dFunctor Vuna_runtime Base_dDiag B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dEffect_dCore B_dTrait_dMonad
Vuna_dIr_dCodec Base_dBytes Vuna_dIr_dModel Vuna_runtime B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Vuna_dTarget_dOcaml_dDecl Vuna_dIr_dModel Vuna_runtime B_dContainer_dHashMap B_dData_dString B_dData_dList Vuna_dTarget_dOcaml_dModel Vuna_dTarget_dOcaml_dRender B_dData_dPair Base_dSource B_dData_dMaybe
B_dEffect_dHost Vuna_runtime B_dEffect_dCore
Base_dDiagnostics_dCommon Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource B_dData_dMaybe
@
Core_dCanonical Base_dBytes Vuna_runtime Core_dTerm B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Base_dDiagnostics_dTc Vuna_runtime Base_dDiag B_dData_dString B_dData_dList B_dData_dVec B_dData_dPair Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
B_dEffect_dClock Vuna_runtime B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
Base_dDiagnostics_dPkg Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
B_dEffect_dConsole B_dTrait_dFunctor Vuna_runtime B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
Core_dEval B_dData_dInt Vuna_runtime B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Base_dObs Core_dTerm B_dData_dFloat B_dData_dList B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe
Base_dDiagnostics_dLoader Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dDiagnostics_dCommon
Base_dDiagnostics_dWarning Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
Lowering_dErased Vuna_runtime Base_dDiag B_dData_dBool Core_dTerm Base_dCommon B_dData_dList B_dData_dPair B_dData_dMaybe
B_dEffect_dProcess Vuna_runtime B_dData_dResult B_dData_dList B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
Base_dDiagnostics_dCg Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
B_dEffect_dEnv Vuna_runtime B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Vuna_dTarget_dOcaml_dRuntime Vuna_dIr_dRuntime Vuna_runtime B_dData_dList B_dData_dPair B_dData_dMaybe
B_dEffect_dTty Vuna_runtime B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
Base_dDiagnostics_dFrontend Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
B_dEffect_dExit Vuna_runtime B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
B_dEffect_dFs B_dTrait_dFunctor Vuna_runtime B_dEffect_dCursor B_dData_dBool B_dTrait_dOrd B_dData_dString B_dData_dResult B_dData_dList B_dTrait_dApplicative B_dEffect_dHost B_dData_dPair B_dEffect_dCore B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
Base_dDiagnostics_dRn Vuna_runtime Base_dDiag B_dData_dList B_dData_dVec Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
B_dEffect_dArgs Vuna_runtime B_dData_dList B_dTrait_dApplicative B_dEffect_dHost B_dEffect_dCore B_dTrait_dMonad
Elab_dTermination_dMeasure Frontend_dAst Vuna_runtime B_dContainer_dHashMap Frontend_dAstQuery B_dData_dString Frontend_dName B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
@
Elab_dCoverage B_dData_dInt Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag B_dData_dBool B_dData_dString Frontend_dReserved B_dData_dList B_dData_dVec B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe
Base_dStore B_dTrait_dFunctor Vuna_runtime B_dData_dBool Base_dObs B_dEffect_dProcess B_dData_dString B_dEffect_dEnv B_dData_dList Base_dHash B_dTrait_dApplicative B_dData_dPair B_dEffect_dFs B_dTrait_dEq B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Elab_dPrelude Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Base_dIntrinsics Core_dTerm B_dData_dList B_dData_dVec B_dData_dPair Base_dSource B_dData_dMaybe
Driver_dSplit B_dData_dInt Base_dBytes B_dTrait_dNum Vuna_runtime Base_dDiag B_dContainer_dHashMap B_dTrait_dOrd B_dData_dString B_dData_dNat B_dData_dList Base_dHash B_dTrait_dApplicative B_dData_dPair B_dEffect_dFs B_dEffect_dCore B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
Loader_dFingerprint B_dTrait_dFunctor Loader_dAddr Vuna_runtime B_dTrait_dOrd B_dData_dString B_dEffect_dEnv B_dData_dList Base_dHash B_dTrait_dApplicative Base_dVersion B_dData_dPair B_dEffect_dFs Base_dSource B_dEffect_dCore B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
Frontend_dLexer Vuna_runtime Base_dDiag B_dData_dBool B_dData_dList Base_dDiagnostics_dFrontend B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dRecords Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Base_dIntrinsics Frontend_dAstQuery Frontend_dReserved Base_dCommon B_dData_dList B_dData_dVec B_dData_dPair Base_dSource Base_dDiagnostics_dCommon B_dData_dMaybe
Elab_dTypes B_dData_dInt Frontend_dAst Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap Core_dTerm B_dData_dString B_dContainer_dQueue B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Vuna_dIr_dAnalysis B_dData_dInt Vuna_dIr_dModel Vuna_runtime Base_dDiag B_dContainer_dHashMap B_dData_dBool Base_dDiagnostics_dCg B_dData_dString Base_dCommon B_dData_dList B_dData_dVec B_dData_dPair Base_dSource B_dData_dMaybe
Base_dDiagnostics Base_dDiagnostics_dTc Vuna_runtime Base_dDiagnostics_dPkg Base_dDiagnostics_dLoader Base_dDiagnostics_dWarning Base_dDiagnostics_dCg B_dData_dString B_dData_dList Base_dDiagnostics_dFrontend Base_dDiagnostics_dIc B_dData_dPair Base_dDiagnostics_dRn B_dData_dMaybe
Frontend_dPackages_dState Vuna_runtime B_dEffect_dEnv B_dTrait_dApplicative B_dEffect_dFs Base_dSource B_dEffect_dCore B_dTrait_dMonad
Elab_dSig Frontend_dAst Vuna_runtime Core_dEval B_dContainer_dHashMap Base_dIntrinsics Frontend_dAstQuery Core_dTerm B_dData_dString B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Loader_dSelectors Frontend_dAst Vuna_runtime Base_dDiag B_dData_dBool B_dData_dString Base_dCommon B_dData_dList Base_dDiagnostics_dRn B_dTrait_dEq B_dData_dMaybe
Loader_dExpand Frontend_dAst Vuna_runtime Base_dDiag Base_dIntrinsics Frontend_dReserved Base_dCommon B_dData_dList B_dData_dPair Base_dDiagnostics_dRn B_dData_dMaybe
Core_dConv Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Base_dObs Core_dTerm Base_dCommon B_dData_dList B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe
Elab_dTermination_dScc Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag B_dContainer_dHashMap B_dData_dBool Frontend_dAstQuery Base_dObs B_dData_dString B_dData_dList B_dData_dVec B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe Elab_dTermination_dMeasure
Base_dIgnore Vuna_runtime B_dData_dBool B_dData_dString B_dData_dList B_dTrait_dApplicative B_dEffect_dFs B_dTrait_dEq Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
@
Base_dWalk Vuna_runtime B_dData_dList B_dTrait_dApplicative Base_dIgnore B_dEffect_dFs B_dEffect_dCore B_dTrait_dMonad
Frontend_dToml Vuna_runtime Frontend_dLexer Base_dDiag Base_dDiagnostics_dPkg B_dData_dString B_dData_dList B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dBits B_dData_dMaybe
Frontend_dCst B_dData_dInt Frontend_dAst Vuna_runtime Frontend_dLexer Base_dDiag B_dContainer_dHashMap Base_dObs B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Vuna_dIr_dValidate Vuna_dIr_dRuntime Vuna_dIr_dModel Vuna_runtime Base_dDiag B_dContainer_dHashMap Vuna_dIr_dAnalysis B_dData_dString Base_dCommon B_dData_dList B_dData_dPair B_dData_dMaybe
Elab_dMatch Elab_dCoverage Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Frontend_dAstQuery Frontend_dReserved Base_dCommon B_dData_dList B_dData_dVec B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dTermination Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag B_dContainer_dHashMap Frontend_dAstQuery B_dData_dString Base_dCommon B_dData_dList B_dData_dVec Elab_dTermination_dScc B_dData_dPair Base_dSource B_dData_dMaybe Elab_dTermination_dMeasure
Base_dDiag_dFormat B_dTrait_dInterp Vuna_runtime Base_dDiag B_dData_dBool Base_dDiagnostics B_dData_dString B_dData_dList B_dTrait_dApplicative Base_dVersion B_dEffect_dFs Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Elab_dDerive Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Elab_dRecords Base_dIntrinsics Base_dCommon B_dData_dList Loader_dSelectors B_dData_dPair Base_dSource
Vuna_dTarget_dOcaml_dTerm Vuna_dIr_dRuntime Vuna_dIr_dModel Vuna_runtime Vuna_dIr_dTail Base_dDiag Vuna_dIr_dAnalysis B_dTrait_dOrd B_dData_dString Base_dCommon B_dData_dList Vuna_dTarget_dOcaml_dModel Vuna_dTarget_dOcaml_dRuntime Vuna_dTarget_dOcaml_dDecl Vuna_dTarget_dOcaml_dRender B_dData_dPair Base_dSource B_dData_dSort B_dData_dMaybe
Elab_dMetaSpans Vuna_runtime Elab_dTypes Core_dTerm B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dRepresentation Frontend_dAst Vuna_runtime B_dData_dBool Base_dIntrinsics Elab_dTypes Core_dTerm B_dData_dList B_dData_dPair B_dData_dMaybe
@
Loader_dFixity Frontend_dAst Vuna_runtime Frontend_dCst Frontend_dLexer Base_dDiag B_dContainer_dHashMap B_dData_dString Base_dCommon B_dData_dList B_dData_dVec B_dData_dPair Base_dDiagnostics_dRn Base_dSource B_dData_dMaybe
Frontend_dAstView Frontend_dAst Vuna_runtime Frontend_dCst B_dData_dList B_dData_dMaybe
Vuna_dTarget_dOcaml_dAssembly Vuna_dIr_dModel Vuna_runtime Base_dDiag Vuna_dTarget_dOcaml_dTerm Base_dCommon B_dData_dList Vuna_dTarget_dOcaml_dDecl Vuna_dTarget_dOcaml_dRender B_dData_dPair B_dData_dMaybe
Elab_dMeta Frontend_dAst Elab_dPrelude Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Base_dObs Elab_dTypes Core_dTerm B_dData_dString Frontend_dReserved Elab_dSig Base_dCommon B_dData_dList Core_dConv B_dData_dPair B_dTrait_dEq Base_dSource Elab_dRepresentation B_dData_dMaybe
Frontend_dManifest Frontend_dToml Vuna_runtime Base_dDiag Base_dDiagnostics_dPkg B_dData_dBool B_dData_dString B_dContainer_dQueue Base_dCommon B_dData_dList B_dTrait_dApplicative B_dData_dPair B_dTrait_dEq Base_dSource B_dTrait_dMonad B_dData_dMaybe
Frontend_dParser_dSupport Frontend_dAst Vuna_runtime Frontend_dCst Frontend_dLexer Base_dDiag Base_dCommon B_dData_dList Base_dDiagnostics_dFrontend B_dData_dPair Base_dSource B_dData_dMaybe
@
Frontend_dParser Frontend_dAst Vuna_runtime Frontend_dCst Frontend_dLexer Base_dDiag B_dContainer_dHashMap B_dData_dBool Frontend_dAstView B_dData_dString Frontend_dReserved Base_dCommon B_dData_dList B_dData_dVec Base_dDiagnostics_dFrontend Frontend_dParser_dSupport B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dInstName Base_dBytes Frontend_dAst Vuna_runtime Frontend_dCanonical_dAst B_dData_dString Elab_dMeta B_dData_dList Base_dHash
Elab_dUsage Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dData_dBool Base_dDiagnostics_dWarning Elab_dTypes Core_dTerm B_dData_dString Base_dCommon Elab_dMeta B_dData_dList B_dData_dVec B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dTermination_dElabInput Frontend_dAst Vuna_runtime B_dData_dBool Elab_dTypes Core_dTerm B_dData_dString Elab_dMeta B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Frontend_dPackages_dSource Frontend_dCanonical_dPkg Vuna_runtime Base_dDiag B_dData_dString B_dData_dList Frontend_dManifest Base_dHash B_dTrait_dApplicative Base_dIgnore B_dData_dPair B_dEffect_dFs B_dEffect_dCore B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
Elab_dTerm_dSupport Frontend_dAst Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dData_dBool Elab_dTypes Core_dTerm Frontend_dReserved Elab_dMeta B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dDict Elab_dPrelude Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Elab_dTypes Core_dTerm B_dData_dString Base_dCommon Elab_dMeta B_dData_dList Elab_dMetaSpans Core_dConv B_dData_dPair Base_dSource Elab_dRepresentation B_dData_dMaybe
@
Lowering_dChecks Elab_dUsage Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Elab_dTypes Core_dTerm Base_dDiagnostics_dCg B_dData_dString Base_dCommon B_dData_dList B_dData_dVec B_dData_dPair B_dData_dMaybe
Elab_dInstCoherence Base_dBytes Core_dCanonical Vuna_runtime Base_dDiag Core_dEval Elab_dTypes Core_dTerm Elab_dDict Frontend_dReserved Elab_dMeta B_dData_dList Core_dConv Base_dHash B_dData_dPair B_dData_dMaybe
Elab_dCase Frontend_dAst Elab_dUsage Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Core_dEval B_dData_dBool Base_dIntrinsics Base_dDiagnostics_dWarning Elab_dTypes Core_dTerm B_dData_dString Base_dCommon Elab_dMeta B_dData_dList B_dData_dVec Core_dConv B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe
Driver_dOwner Frontend_dAst Elab_dInstName Vuna_runtime Base_dDiag B_dContainer_dHashMap Base_dIntrinsics Elab_dDerive Elab_dTypes B_dData_dString Frontend_dReserved Base_dCommon B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Frontend_dPackages_dPkg Frontend_dCanonical_dPkg Base_dStore Vuna_runtime B_dData_dUnit Base_dDiag Base_dDiagnostics_dPkg Frontend_dPackages_dSource B_dContainer_dHashMap B_dContainer_dMutRef B_dData_dString B_dEffect_dEnv B_dData_dList Frontend_dManifest B_dData_dVec B_dTrait_dApplicative B_dData_dPair B_dEffect_dFs B_dTrait_dEq Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
@
Loader_dModules Frontend_dAst Vuna_runtime Frontend_dCst Frontend_dLexer Base_dDiag B_dContainer_dHashMap Base_dDiagnostics_dLoader B_dData_dBool B_dData_dString Base_dCommon B_dData_dList Frontend_dPackages_dPkg B_dTrait_dApplicative B_dData_dPair B_dEffect_dFs Base_dDiagnostics_dRn B_dTrait_dEq Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Elab_dTerm_dImpl Elab_dCoverage B_dData_dInt Frontend_dAst Elab_dPrelude Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Elab_dRecords Elab_dMatch Elab_dTerm_dSupport Core_dEval B_dData_dBool Base_dIntrinsics Frontend_dAstQuery Base_dObs Elab_dTypes Core_dTerm B_dTrait_dOrd B_dData_dString Elab_dDict Elab_dCase Frontend_dReserved B_dData_dNat Base_dCommon Elab_dMeta B_dData_dList Elab_dMetaSpans Core_dConv B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dMaybe
Lowering_dEnv Lowering_dChecks Vuna_dIr_dModel Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Lowering_dErased Elab_dTypes Core_dTerm B_dData_dString Base_dCommon Elab_dMeta B_dData_dList B_dData_dPair Base_dSource Elab_dRepresentation B_dData_dMaybe
Lowering_dEntry Lowering_dChecks Vuna_dIr_dRuntime Vuna_dIr_dModel Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap Base_dIntrinsics Elab_dTypes Core_dTerm B_dData_dString B_dData_dList B_dData_dPair B_dData_dMaybe
@
Elab_dCanonical Base_dBytes Frontend_dAst Core_dCanonical Loader_dModules Vuna_runtime Elab_dRecords Frontend_dCanonical_dAst Elab_dTypes Core_dTerm B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
Lowering_dTy Vuna_dIr_dModel Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Lowering_dEnv Elab_dTypes Core_dTerm B_dData_dString Base_dCommon B_dData_dList B_dData_dPair Elab_dRepresentation B_dData_dMaybe
Loader_dResolve Frontend_dAst Loader_dModules Base_dDiagnostics_dTc Vuna_runtime Frontend_dLexer Base_dDiag B_dContainer_dHashMap Base_dIntrinsics B_dData_dString Frontend_dName Frontend_dReserved Base_dCommon B_dData_dList Loader_dSelectors Base_dDiagnostics_dFrontend B_dData_dPair Base_dDiagnostics_dRn Base_dSource B_dData_dMaybe
Loader_dLayers Frontend_dAst Loader_dModules Vuna_runtime B_dData_dUnit Base_dDiag Base_dDiagnostics_dLoader B_dData_dString B_dContainer_dQueue Base_dCommon B_dData_dList Frontend_dPackages_dPkg Frontend_dManifest B_dData_dPair Base_dSource B_dData_dMaybe
Elab_dTerm Frontend_dAst Vuna_runtime Elab_dTerm_dImpl Frontend_dAstQuery Elab_dTypes Core_dTerm B_dData_dList B_dData_dPair Base_dSource B_dData_dMaybe
@
Driver_dCache B_dData_dInt Base_dBytes Elab_dCanonical Core_dCanonical Vuna_runtime Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Elab_dTypes Core_dTerm Base_dCommon Elab_dMeta B_dData_dList B_dData_dPair B_dData_dMaybe
Elab_dData Frontend_dAst Elab_dPrelude Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Elab_dRecords B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Elab_dTypes Core_dTerm Base_dCommon Elab_dMeta B_dData_dList Elab_dTerm B_dData_dPair Base_dSource Elab_dRepresentation B_dData_dMaybe
Lowering_dProgram Lowering_dChecks Vuna_dIr_dRepresent Lowering_dTy Vuna_dIr_dRuntime Vuna_dIr_dModel Vuna_runtime Vuna_dIr_dValidate Base_dDiag Core_dEval B_dContainer_dHashMap B_dData_dBool Base_dIntrinsics Vuna_dIr_dDispatch Lowering_dEnv Base_dObs Elab_dTypes Core_dTerm Vuna_dIr_dAnalysis Base_dDiagnostics_dCg B_dData_dString Lowering_dEntry Base_dCommon B_dData_dList Vuna_dTarget_dOcaml_dRuntime Vuna_dTarget_dOcaml_dDecl B_dData_dPair Base_dSource Elab_dRepresentation B_dData_dMaybe
Elab_dTrait Elab_dCoverage B_dData_dInt B_dTrait_dInterp Frontend_dAst Elab_dInstCoherence Elab_dInstName Base_dDiagnostics_dTc Vuna_runtime Base_dDiag Elab_dMatch Core_dEval B_dContainer_dHashMap Elab_dTerm_dImpl Base_dObs Elab_dTypes Core_dTerm B_dData_dString Elab_dDict Frontend_dReserved Elab_dSig Base_dCommon Elab_dMeta B_dData_dList Core_dConv Elab_dTerm B_dData_dPair Base_dSource B_dData_dMaybe
Loader_dFlatten Frontend_dParser Frontend_dAst Loader_dModules Vuna_runtime Frontend_dCst B_dData_dUnit Frontend_dLexer Base_dDiag Loader_dFixity Loader_dResolve B_dContainer_dHashMap Base_dDiagnostics_dLoader Loader_dLayers B_dData_dBool Base_dIntrinsics Base_dDiagnostics_dWarning Base_dObs B_dData_dString Frontend_dReserved B_dData_dNat Base_dCommon B_dData_dList Loader_dSelectors Loader_dExpand Frontend_dPackages_dPkg B_dData_dVec B_dTrait_dApplicative Frontend_dParser_dSupport B_dData_dPair B_dEffect_dFs Base_dDiagnostics_dRn Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
@
Driver_dSplitGen Frontend_dAst Driver_dSplit Vuna_dIr_dModel Vuna_runtime Base_dDiag B_dContainer_dHashMap B_dData_dBool Lowering_dProgram Vuna_dTarget_dOcaml_dTerm Lowering_dEnv Elab_dTypes Base_dDiagnostics_dCg B_dData_dString Vuna_dTarget_dOcaml_dAssembly Lowering_dEntry Base_dCommon B_dData_dList Driver_dOwner Vuna_dTarget_dOcaml_dDecl B_dTrait_dApplicative B_dData_dPair Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
Driver_dIface B_dData_dInt Base_dBytes Driver_dCache Frontend_dAst Elab_dCanonical Core_dCanonical Elab_dPrelude Loader_dModules Vuna_runtime Base_dDiag Elab_dRecords B_dContainer_dHashMap Frontend_dCanonical_dAst B_dData_dBool Base_dIntrinsics Elab_dDerive Elab_dTypes Core_dTerm B_dTrait_dOrd B_dData_dString B_dData_dList Driver_dOwner Base_dHash B_dTrait_dApplicative B_dData_dPair Base_dSource Loader_dFlatten B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
Elab_dDriver B_dData_dInt B_dTrait_dInterp Frontend_dAst Elab_dPrelude Elab_dUsage Base_dDiagnostics_dTc Vuna_runtime Elab_dTermination_dElabInput Base_dDiag Elab_dRecords Core_dEval B_dContainer_dHashMap Elab_dTermination Elab_dData Base_dIntrinsics Elab_dTerm_dImpl Elab_dDerive Elab_dTrait Base_dObs Elab_dTypes Core_dTerm B_dTrait_dOrd B_dData_dString Elab_dDict Base_dCommon Elab_dMeta B_dData_dList Elab_dMetaSpans B_dData_dVec Core_dConv Elab_dTerm B_dData_dPair B_dTrait_dEq Base_dSource B_dData_dSort B_dData_dMaybe
@
Driver_dDt Frontend_dParser Driver_dCache Frontend_dAst Elab_dPrelude Vuna_dIr_dModel Loader_dModules Vuna_runtime Frontend_dCst Base_dDiag Elab_dRecords Driver_dSplitGen Core_dEval B_dContainer_dHashMap B_dData_dBool Lowering_dProgram Base_dIntrinsics Base_dDiagnostics_dWarning Elab_dDerive Lowering_dEnv Base_dObs Elab_dTypes Core_dTerm Base_dDiagnostics_dCg B_dTrait_dOrd B_dData_dString Vuna_dTarget_dOcaml_dAssembly Lowering_dEntry Base_dCommon Elab_dMeta B_dData_dList Frontend_dPackages_dPkg B_dData_dVec Base_dHash B_dTrait_dApplicative Driver_dIface B_dData_dPair B_dEffect_dFs Elab_dDriver B_dTrait_dEq Base_dSource B_dEffect_dCore Loader_dFlatten B_dData_dSort B_dTrait_dMonad B_dData_dMaybe Elab_dTermination_dMeasure
@
Driver_dCompile Base_dBytes B_dTrait_dFunctor Loader_dAddr Base_dWalk B_dTrait_dInterp Driver_dCache Frontend_dAst Base_dStore Driver_dSplit Loader_dModules Vuna_runtime Loader_dFingerprint B_dEffect_dClock Base_dDiag Base_dDiagnostics_dPkg Frontend_dPackages_dSource B_dContainer_dHashMap B_dData_dBool Base_dObs B_dEffect_dProcess B_dTrait_dOrd B_dData_dString B_dEffect_dEnv Frontend_dPackages_dState B_dData_dList Frontend_dPackages_dPkg Frontend_dManifest Base_dHash B_dTrait_dApplicative Driver_dIface Driver_dDt B_dData_dPair B_dEffect_dFs B_dTrait_dEq Base_dSource B_dEffect_dCore Loader_dFlatten B_dData_dSort B_dTrait_dMonad B_dData_dMaybe
@
Driver_dTarget Base_dDiag_dCodec Vuna_dIr_dModel Vuna_runtime Base_dDiag Driver_dCompile B_dData_dBool Lowering_dProgram B_dEffect_dProcess Elab_dTypes B_dData_dString B_dEffect_dEnv B_dData_dList Vuna_dIr_dCodec Frontend_dPackages_dPkg B_dTrait_dApplicative Driver_dDt B_dData_dPair B_dEffect_dFs B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
@
Driver_dTargetBuild Vuna_runtime Driver_dTarget Base_dDiag Driver_dCompile B_dEffect_dProcess B_dData_dString B_dData_dList Frontend_dPackages_dPkg B_dTrait_dApplicative B_dData_dPair B_dEffect_dFs B_dEffect_dCore B_dTrait_dMonad
@
Driver_dCompilerCli Base_dDiagnostics_dSink Vuna_runtime Loader_dFingerprint Driver_dTarget Base_dDiag Driver_dCompile B_dEffect_dConsole Base_dDiag_dFormat B_dData_dBool Driver_dTargetBuild B_dEffect_dProcess B_dData_dString B_dEffect_dEnv B_dData_dList Frontend_dPackages_dPkg Frontend_dManifest B_dTrait_dApplicative B_dEffect_dTty Driver_dDt Base_dVersion B_dData_dPair B_dEffect_dFs B_dTrait_dEq Base_dSource B_dEffect_dCore B_dTrait_dMonad B_dData_dMaybe
@
Main Vuna_runtime B_dEffect_dClock B_dEffect_dConsole Driver_dCompilerCli Base_dObs B_dEffect_dProcess B_dEffect_dEnv B_dData_dList B_dTrait_dApplicative B_dEffect_dTty Vuna_deflocs B_dEffect_dExit B_dEffect_dFs B_dEffect_dCore B_dTrait_dMonad B_dEffect_dArgs
VUNA_UNIT_TABLE
  flush_layer
}
clean=1
each_unit clean
if [ "$clean" -eq 1 ] && [ "$JOBS" -le 1 ]; then
  SOURCES=""
  CMXS=""
  each_unit source
  ocamlopt $FLAGS -I +unix -o "$OUT" $UNIX $SOURCES $C_OBJS
  each_unit stamps
  echo "built $OUT"
  exit 0
fi
CMXS=""
each_unit parallel
ocamlopt $FLAGS -I +unix -o "$OUT" $UNIX $CMXS $C_OBJS
echo "built $OUT"
