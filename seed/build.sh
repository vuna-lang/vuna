#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（按直接依赖分层并行 + 内容哈希增量）。用法: ./build.sh [OUT]
# 干净构建且 JOBS<=1：一次 ocamlopt 编译全部 .mli/.ml 并链接；
# 增量构建：每单元 .ml/.mli 与直接依赖 .stamp 的内容哈希写 $base.stamp，命中即跳过；
# 同层单元互不依赖：多单元层用后台任务并行编译，层间用 wait 串行。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
MODULES="Vuna_runtime Base_dApplicative Base_dFunctor Base_dFromString Base_dTraversable Base_dHashable Base_dMonad Base_dEff_dTypes Base_dObs Base_dBits Base_dNum Base_dShow Base_dMonoid Base_dFromInt Vuna_dCompiler_dBase_dVersion Base_dEq Prelude Base_dEff Base_dInterp Base_dBool Base_dFoldable Base_dEffClock Base_dOrd Base_dEffExit Base_dEffConsole Vuna_dCompiler_dBase_dObs Base_dObs_dSpan Base_dUnit Base_dPair Base_dMaybe Base_dInt Base_dEffStdin Base_dNat Base_dList Base_dEffEnv Vuna_dCompiler_dWasm_dInstr Base_dSort Base_dResult Base_dArray Base_dEffArgs Base_dString Base_dFloat Vuna_dCompiler_dNative_dModel Base_dVec Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_dCompiler_dBase_dHash Vuna_dCompiler_dFrontend_dCanonical_dPkg Base_dEffFs Vuna_dCompiler_dWasm_dModel Base_dEffProcess Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dBase_dSource Base_dHashMap Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dNative_dRender Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_dCompiler_dLoader_dAddr Vuna_dCompiler_dBase_dDiag_dCodec Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dFrontend_dCanonical_dLex Vuna_dCompiler_dNative_dModule Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dElab_dData Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dCompilerCli Main "
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
  for d in "$@"; do deps="$deps $d.stamp"; done
  hash_of "$base.ml" "$base.mli" $deps
}
clean=1
for m in $MODULES; do
  if [ -f "$m.cmx" ]; then clean=0; fi
done
if [ "$clean" -eq 1 ] && [ "$JOBS" -le 1 ]; then
  SOURCES=""
  for m in $MODULES; do
    if [ -f "$m.mli" ]; then SOURCES="$SOURCES $m.mli"; fi
    SOURCES="$SOURCES $m.ml"
  done
  ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa $SOURCES $C_OBJS
  printf '%s' "$(stamp_want Vuna_runtime)" > "Vuna_runtime.stamp"
  printf '%s' "$(stamp_want Base_dApplicative Vuna_runtime)" > "Base_dApplicative.stamp"
  printf '%s' "$(stamp_want Base_dFunctor Vuna_runtime)" > "Base_dFunctor.stamp"
  printf '%s' "$(stamp_want Base_dFromString Vuna_runtime)" > "Base_dFromString.stamp"
  printf '%s' "$(stamp_want Base_dTraversable Vuna_runtime)" > "Base_dTraversable.stamp"
  printf '%s' "$(stamp_want Base_dHashable Vuna_runtime)" > "Base_dHashable.stamp"
  printf '%s' "$(stamp_want Base_dMonad Vuna_runtime)" > "Base_dMonad.stamp"
  printf '%s' "$(stamp_want Base_dEff_dTypes Vuna_runtime)" > "Base_dEff_dTypes.stamp"
  printf '%s' "$(stamp_want Base_dObs Vuna_runtime)" > "Base_dObs.stamp"
  printf '%s' "$(stamp_want Base_dBits Vuna_runtime)" > "Base_dBits.stamp"
  printf '%s' "$(stamp_want Base_dNum Vuna_runtime)" > "Base_dNum.stamp"
  printf '%s' "$(stamp_want Base_dShow Vuna_runtime)" > "Base_dShow.stamp"
  printf '%s' "$(stamp_want Base_dMonoid Vuna_runtime)" > "Base_dMonoid.stamp"
  printf '%s' "$(stamp_want Base_dFromInt Vuna_runtime)" > "Base_dFromInt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dVersion Vuna_runtime)" > "Vuna_dCompiler_dBase_dVersion.stamp"
  printf '%s' "$(stamp_want Base_dEq Vuna_runtime)" > "Base_dEq.stamp"
  printf '%s' "$(stamp_want Prelude Vuna_runtime)" > "Prelude.stamp"
  printf '%s' "$(stamp_want Base_dEff Base_dApplicative Vuna_runtime Base_dFunctor Base_dMonad)" > "Base_dEff.stamp"
  printf '%s' "$(stamp_want Base_dInterp Vuna_runtime Base_dShow)" > "Base_dInterp.stamp"
  printf '%s' "$(stamp_want Base_dBool Vuna_runtime Base_dHashable Base_dShow)" > "Base_dBool.stamp"
  printf '%s' "$(stamp_want Base_dFoldable Vuna_runtime Base_dMonoid)" > "Base_dFoldable.stamp"
  printf '%s' "$(stamp_want Base_dEffClock Base_dEff Base_dApplicative Vuna_runtime Base_dMonad)" > "Base_dEffClock.stamp"
  printf '%s' "$(stamp_want Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq)" > "Base_dOrd.stamp"
  printf '%s' "$(stamp_want Base_dEffExit Base_dEff Base_dApplicative Vuna_runtime Base_dMonad)" > "Base_dEffExit.stamp"
  printf '%s' "$(stamp_want Base_dEffConsole Base_dEff Base_dApplicative Vuna_runtime Base_dFunctor Base_dMonad)" > "Base_dEffConsole.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dObs Base_dEff Vuna_runtime Base_dObs)" > "Vuna_dCompiler_dBase_dObs.stamp"
  printf '%s' "$(stamp_want Base_dObs_dSpan Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dObs)" > "Base_dObs_dSpan.stamp"
  printf '%s' "$(stamp_want Base_dUnit Base_dOrd Vuna_runtime Base_dHashable Base_dShow Base_dMonoid Base_dEq)" > "Base_dUnit.stamp"
  printf '%s' "$(stamp_want Base_dPair Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq)" > "Base_dPair.stamp"
  printf '%s' "$(stamp_want Base_dMaybe Base_dOrd Base_dApplicative Vuna_runtime Base_dFunctor Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMonoid Base_dFoldable Base_dEq)" > "Base_dMaybe.stamp"
  printf '%s' "$(stamp_want Base_dInt Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dEq)" > "Base_dInt.stamp"
  printf '%s' "$(stamp_want Base_dEffStdin Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dMaybe)" > "Base_dEffStdin.stamp"
  printf '%s' "$(stamp_want Base_dNat Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dMaybe Base_dMonoid Base_dEq)" > "Base_dNat.stamp"
  printf '%s' "$(stamp_want Base_dList Base_dOrd Base_dApplicative Vuna_runtime Base_dPair Base_dFunctor Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMaybe Base_dMonoid Base_dFoldable Base_dEq)" > "Base_dList.stamp"
  printf '%s' "$(stamp_want Base_dEffEnv Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dMaybe)" > "Base_dEffEnv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dList)" > "Vuna_dCompiler_dWasm_dInstr.stamp"
  printf '%s' "$(stamp_want Base_dSort Base_dOrd Vuna_runtime Base_dList)" > "Base_dSort.stamp"
  printf '%s' "$(stamp_want Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dFunctor Base_dTraversable Base_dHashable Base_dMonad Base_dShow Base_dFoldable Base_dEq)" > "Base_dResult.stamp"
  printf '%s' "$(stamp_want Base_dArray Vuna_runtime Base_dList Base_dShow Base_dEq)" > "Base_dArray.stamp"
  printf '%s' "$(stamp_want Base_dEffArgs Base_dEff Base_dApplicative Vuna_runtime Base_dList Base_dMonad)" > "Base_dEffArgs.stamp"
  printf '%s' "$(stamp_want Base_dString Base_dOrd Base_dInterp Vuna_runtime Base_dList Base_dHashable Base_dMonoid Base_dEq)" > "Base_dString.stamp"
  printf '%s' "$(stamp_want Base_dFloat Base_dOrd Vuna_runtime Base_dList Base_dPair Base_dNum Base_dShow Base_dMaybe Base_dEq)" > "Base_dFloat.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dModel Vuna_runtime Base_dList)" > "Vuna_dCompiler_dNative_dModel.stamp"
  printf '%s' "$(stamp_want Base_dVec Vuna_runtime Base_dList)" > "Base_dVec.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dBytes Vuna_runtime Base_dList Base_dPair Base_dMaybe)" > "Vuna_dCompiler_dBase_dBytes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_runtime Base_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dIc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dHash Vuna_runtime Base_dList Base_dPair Base_dBits Base_dNum Base_dInt)" > "Vuna_dCompiler_dBase_dHash.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dFrontend_dCanonical_dPkg.stamp"
  printf '%s' "$(stamp_want Base_dEffFs Base_dEff Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dFunctor Base_dMonad Base_dMaybe)" > "Base_dEffFs.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dModel Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dList Base_dPair Base_dMaybe)" > "Vuna_dCompiler_dWasm_dModel.stamp"
  printf '%s' "$(stamp_want Base_dEffProcess Base_dEff Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dMonad)" > "Base_dEffProcess.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dAbi Vuna_runtime Base_dList Vuna_dCompiler_dNative_dModel)" > "Vuna_dCompiler_dNative_dAbi.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dSource Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool)" > "Vuna_dCompiler_dBase_dSource.stamp"
  printf '%s' "$(stamp_want Base_dHashMap Base_dArray Vuna_runtime Base_dString Base_dList Base_dPair Base_dHashable Base_dShow Base_dMaybe Base_dEq)" > "Base_dHashMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dStore Base_dEffClock Base_dEff Base_dEffFs Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dEffProcess Base_dBool Base_dMonad Base_dMaybe Base_dEffEnv Base_dObs_dSpan Base_dEq Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dBase_dStore.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dWasm_dInstr Base_dInterp Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dInt Base_dEq)" > "Vuna_dCompiler_dWasm_dRender.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dIntrinsics Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMaybe Base_dHashMap)" > "Vuna_dCompiler_dBase_dIntrinsics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dInt Base_dEq)" > "Vuna_dCompiler_dBase_dDiag.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Base_dMaybe)" > "Vuna_dCompiler_dFrontend_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dRender Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel)" > "Vuna_dCompiler_dNative_dRender.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dModel Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Base_dMaybe)" > "Vuna_dCompiler_dIr_dModel.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dRuntime Vuna_runtime Base_dList Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dMaybe)" > "Vuna_dCompiler_dNative_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dList Base_dPair)" > "Vuna_dCompiler_dWasm_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe)" > "Vuna_dCompiler_dFrontend_dCanonical_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIr_dModel)" > "Vuna_dCompiler_dIr_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIr_dModel)" > "Vuna_dCompiler_dWasm_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dDecl Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIr_dModel Base_dHashMap)" > "Vuna_dCompiler_dCodegen_dDecl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap Base_dInt)" > "Vuna_dCompiler_dCore_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap)" > "Vuna_dCompiler_dBase_dDiagnostics_dSink.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dAddr Base_dEff Vuna_dCompiler_dBase_dStore Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dMonad Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dLoader_dAddr.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag_dCodec Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiag_dCodec.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap)" > "Vuna_dCompiler_dElab_dTermination_dMeasure.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplit Base_dEff Base_dEffFs Base_dSort Base_dOrd Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMonad Vuna_dCompiler_dBase_dBytes Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dDriver_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dCommon Base_dEff Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dFunctor Vuna_dCompiler_dBase_dDiag Base_dMonad)" > "Vuna_dCompiler_dBase_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dRn.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dTc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dCanonical Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe)" > "Vuna_dCompiler_dCore_dCanonical.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec)" > "Vuna_dCompiler_dBase_dDiagnostics_dLoader.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dList Base_dPair Base_dMaybe)" > "Vuna_dCompiler_dCodegen_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dCg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure)" > "Vuna_dCompiler_dElab_dTermination_dScc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dFrontend.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFingerprint Base_dEff Base_dEffFs Base_dSort Base_dOrd Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dLoader_dAddr Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dLoader_dFingerprint.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dMaybe)" > "Vuna_dCompiler_dBase_dDiagnostics_dWarning.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dList Base_dFloat Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap Base_dInt Base_dEq)" > "Vuna_dCompiler_dCore_dEval.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dElab_dMatch.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dIc Base_dMaybe Vuna_dCompiler_dBase_dDiagnostics_dWarning)" > "Vuna_dCompiler_dBase_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dElab_dRecords.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dLoader_dFixity.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe)" > "Vuna_dCompiler_dElab_dPrelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dSig.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dInt Base_dEq)" > "Vuna_dCompiler_dFrontend_dLexer.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBits Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEq)" > "Vuna_dCompiler_dFrontend_dToml.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dLoader_dExpand.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination_dScc Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dElab_dTermination.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dInt Base_dEq)" > "Vuna_dCompiler_dElab_dCoverage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCore_dConv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTypes Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dTerm Base_dSort Vuna_dCompiler_dIr_dRuntime Base_dOrd Vuna_dCompiler_dCodegen_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dCodegen_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Base_dNum Base_dMaybe Vuna_dCompiler_dIr_dModel Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dIr_dAnalysis.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dPerfCache Base_dEff Base_dEffFs Vuna_dCompiler_dBase_dStore Base_dApplicative Vuna_runtime Base_dList Base_dEffProcess Base_dMonad Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dDriver_dSplit)" > "Vuna_dCompiler_dDriver_dPerfCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dToml Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEq Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dFrontend_dManifest.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dElab_dDerive.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dElab_dRepresentation.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag_dFormat Base_dEff Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics Base_dInterp Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dBase_dVersion)" > "Vuna_dCompiler_dBase_dDiag_dFormat.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCanonical_dLex Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe)" > "Vuna_dCompiler_dFrontend_dCanonical_dLex.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dModule Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dBool Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dEq)" > "Vuna_dCompiler_dNative_dModule.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Base_dMaybe Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dCodegen_dAssembly.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dObs_dSpan)" > "Vuna_dCompiler_dFrontend_dCst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dWasm_dInstr Base_dResult Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dWasm_dTypes Base_dBool Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dEq Vuna_dCompiler_dWasm_dRuntime)" > "Vuna_dCompiler_dWasm_dModule.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dElab_dMetaSpans.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dIr_dValidate.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe)" > "Vuna_dCompiler_dFrontend_dParser_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dMeta.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dPackages_dSource Base_dEff Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Base_dSort Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dFrontend_dPackages_dSource.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dFrontend_dParser.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dUsage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dEff Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMonad Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEffEnv Base_dEq)" > "Vuna_dCompiler_dFrontend_dPackages_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dDict.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe)" > "Vuna_dCompiler_dElab_dInstName.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dCase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dInstCoherence.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dModules Base_dEff Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dEq Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dLoader_dModules.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dChecks.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dDriver_dOwner.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dEnv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe)" > "Vuna_dCompiler_dLoader_dLayers.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dLoader_dResolve.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dEntry.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dElab_dCanonical.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dMatch Base_dNat Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dImpl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFlatten Base_dEff Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dFrontend_dCanonical_dLex Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dLayers Base_dString Base_dList Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dLoader_dAddr Base_dHashMap Base_dObs_dSpan Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dLoader_dFlatten.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dDriver_dCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl)" > "Vuna_dCompiler_dElab_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dTy.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dProgram.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dElab_dData.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dSort Base_dOrd Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dHashMap Base_dInt Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dDriver_dIface.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Base_dInt Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTrait.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplitGen Base_dEff Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dCommon)" > "Vuna_dCompiler_dDriver_dSplitGen.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dElab_dDerive Base_dSort Base_dOrd Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dInt Base_dEq Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dDriver.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDt Base_dEff Vuna_dCompiler_dLowering_dEnv Base_dEffFs Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dSort Vuna_dCompiler_dDriver_dSplitGen Base_dOrd Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCore_dTerm Base_dVec Base_dObs Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dIr_dModel Base_dEffEnv Base_dHashMap Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dDriver_dDt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompile Base_dEffClock Base_dEff Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Base_dSort Base_dOrd Base_dInterp Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dEffProcess Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Base_dObs Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dLoader_dAddr Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dDiag_dCodec Base_dEq Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dDriver_dCompile.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dWasm Base_dEff Base_dEffFs Vuna_dCompiler_dLowering_dProgram Base_dApplicative Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dPair Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dDiag Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dDriver_dCompile)" > "Vuna_dCompiler_dDriver_dWasm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dNative Base_dEff Base_dEffFs Vuna_dCompiler_dLowering_dProgram Base_dApplicative Vuna_runtime Vuna_dCompiler_dNative_dModule Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dNative_dModel Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dNative_dRender Vuna_dCompiler_dDriver_dCompile)" > "Vuna_dCompiler_dDriver_dNative.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dPair Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dDriver_dCompile)" > "Vuna_dCompiler_dDriver_dToolPayload.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompilerCli Base_dEffClock Base_dEff Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dEffConsole Base_dPair Base_dEffProcess Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dDiagnostics_dSink Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dDriver_dCompile Base_dEq)" > "Vuna_dCompiler_dDriver_dCompilerCli.stamp"
  printf '%s' "$(stamp_want Main Base_dEffClock Base_dEff Base_dEffFs Vuna_dCompiler_dDriver_dCompilerCli Base_dEffExit Base_dEffArgs Vuna_runtime Base_dEffConsole Base_dEffProcess Base_dMonad Base_dEffEnv)" > "Main.stamp"
  echo "built $OUT"
  exit 0
fi
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
compile_mod Vuna_runtime
pids=""
compile_mod Base_dApplicative Vuna_runtime &
pids="$pids $!"
compile_mod Base_dFunctor Vuna_runtime &
pids="$pids $!"
compile_mod Base_dFromString Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTraversable Vuna_runtime &
pids="$pids $!"
compile_mod Base_dHashable Vuna_runtime &
pids="$pids $!"
compile_mod Base_dMonad Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEff_dTypes Vuna_runtime &
pids="$pids $!"
compile_mod Base_dObs Vuna_runtime &
pids="$pids $!"
compile_mod Base_dBits Vuna_runtime &
pids="$pids $!"
compile_mod Base_dNum Vuna_runtime &
pids="$pids $!"
compile_mod Base_dShow Vuna_runtime &
pids="$pids $!"
compile_mod Base_dMonoid Vuna_runtime &
pids="$pids $!"
compile_mod Base_dFromInt Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dVersion Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEq Vuna_runtime &
pids="$pids $!"
compile_mod Prelude Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEff Base_dApplicative Vuna_runtime Base_dFunctor Base_dMonad &
pids="$pids $!"
compile_mod Base_dInterp Vuna_runtime Base_dShow &
pids="$pids $!"
compile_mod Base_dBool Vuna_runtime Base_dHashable Base_dShow &
pids="$pids $!"
compile_mod Base_dFoldable Vuna_runtime Base_dMonoid &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEffClock Base_dEff Base_dApplicative Vuna_runtime Base_dMonad &
pids="$pids $!"
compile_mod Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dEffExit Base_dEff Base_dApplicative Vuna_runtime Base_dMonad &
pids="$pids $!"
compile_mod Base_dEffConsole Base_dEff Base_dApplicative Vuna_runtime Base_dFunctor Base_dMonad &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dObs Base_dEff Vuna_runtime Base_dObs &
pids="$pids $!"
compile_mod Base_dObs_dSpan Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dObs &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dUnit Base_dOrd Vuna_runtime Base_dHashable Base_dShow Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dPair Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dMaybe Base_dOrd Base_dApplicative Vuna_runtime Base_dFunctor Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMonoid Base_dFoldable Base_dEq &
pids="$pids $!"
compile_mod Base_dInt Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEffStdin Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dMaybe &
pids="$pids $!"
compile_mod Base_dNat Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dMaybe Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dList Base_dOrd Base_dApplicative Vuna_runtime Base_dPair Base_dFunctor Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMaybe Base_dMonoid Base_dFoldable Base_dEq &
pids="$pids $!"
compile_mod Base_dEffEnv Base_dEff Base_dApplicative Vuna_runtime Base_dMonad Base_dMaybe &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dSort Base_dOrd Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dFunctor Base_dTraversable Base_dHashable Base_dMonad Base_dShow Base_dFoldable Base_dEq &
pids="$pids $!"
compile_mod Base_dArray Vuna_runtime Base_dList Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dEffArgs Base_dEff Base_dApplicative Vuna_runtime Base_dList Base_dMonad &
pids="$pids $!"
compile_mod Base_dString Base_dOrd Base_dInterp Vuna_runtime Base_dList Base_dHashable Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dFloat Base_dOrd Vuna_runtime Base_dList Base_dPair Base_dNum Base_dShow Base_dMaybe Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dModel Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dVec Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dBytes Vuna_runtime Base_dList Base_dPair Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dHash Vuna_runtime Base_dList Base_dPair Base_dBits Base_dNum Base_dInt &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Base_dEffFs Base_dEff Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dFunctor Base_dMonad Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dModel Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dList Base_dPair Base_dMaybe &
pids="$pids $!"
compile_mod Base_dEffProcess Base_dEff Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dMonad &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dAbi Vuna_runtime Base_dList Vuna_dCompiler_dNative_dModel &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dSource Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool &
pids="$pids $!"
compile_mod Base_dHashMap Base_dArray Vuna_runtime Base_dString Base_dList Base_dPair Base_dHashable Base_dShow Base_dMaybe Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dBase_dStore Base_dEffClock Base_dEff Base_dEffFs Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dEffProcess Base_dBool Base_dMonad Base_dMaybe Base_dEffEnv Base_dObs_dSpan Base_dEq Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dWasm_dInstr Base_dInterp Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dInt Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dIntrinsics Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMaybe Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dInt Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dRender Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dModel Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dRuntime Vuna_runtime Base_dList Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dList Base_dPair &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIr_dModel &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIr_dModel &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dDecl Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIr_dModel Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap Base_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dAddr Base_dEff Vuna_dCompiler_dBase_dStore Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dMonad Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag_dCodec Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dSplit Base_dEff Base_dEffFs Base_dSort Base_dOrd Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMonad Vuna_dCompiler_dBase_dBytes Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dCommon Base_dEff Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dFunctor Vuna_dCompiler_dBase_dDiag Base_dMonad &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dCanonical Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dList Base_dPair Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFingerprint Base_dEff Base_dEffFs Base_dSort Base_dOrd Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dLoader_dAddr Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Vuna_dCompiler_dBase_dDiag Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dList Base_dFloat Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dHashMap Base_dInt Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dIc Base_dMaybe Vuna_dCompiler_dBase_dDiagnostics_dWarning &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dInt Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBits Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination_dScc Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dInt Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTypes Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dTerm Base_dSort Vuna_dCompiler_dIr_dRuntime Base_dOrd Vuna_dCompiler_dCodegen_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Base_dNum Base_dMaybe Vuna_dCompiler_dIr_dModel Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dPerfCache Base_dEff Base_dEffFs Vuna_dCompiler_dBase_dStore Base_dApplicative Vuna_runtime Base_dList Base_dEffProcess Base_dMonad Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dDriver_dSplit &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dToml Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEq Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag_dFormat Base_dEff Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics Base_dInterp Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dBase_dVersion &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dCanonical_dLex Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dModule Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dBool Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Base_dMaybe Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dObs_dSpan &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dWasm_dInstr Base_dResult Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dWasm_dTypes Base_dBool Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dEq Vuna_dCompiler_dWasm_dRuntime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMaybe Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dPackages_dSource Base_dEff Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Base_dSort Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dVec Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dEff Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dMonad Base_dVec Vuna_dCompiler_dBase_dSource Base_dMaybe Base_dEffEnv Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dModules Base_dEff Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dEq Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Base_dBool Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dMatch Base_dNat Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dEq Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dFlatten Base_dEff Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dEffFs Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dFrontend_dCanonical_dLex Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dLayers Base_dString Base_dList Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Base_dVec Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dLoader_dAddr Base_dHashMap Base_dObs_dSpan Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dHashMap Base_dInt Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dSort Base_dOrd Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dHashMap Base_dInt Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Base_dInt Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dDriver_dSplitGen Base_dEff Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dModel Base_dHashMap Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dElab_dDerive Base_dSort Base_dOrd Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dInt Base_dEq Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dDriver_dDt Base_dEff Vuna_dCompiler_dLowering_dEnv Base_dEffFs Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dSort Vuna_dCompiler_dDriver_dSplitGen Base_dOrd Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCore_dTerm Base_dVec Base_dObs Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dIr_dModel Base_dEffEnv Base_dHashMap Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dCore_dEval
compile_mod Vuna_dCompiler_dDriver_dCompile Base_dEffClock Base_dEff Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Base_dSort Base_dOrd Base_dInterp Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Base_dPair Base_dFunctor Base_dEffProcess Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Base_dObs Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dLoader_dAddr Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dDiag_dCodec Base_dEq Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dHash
pids=""
compile_mod Vuna_dCompiler_dDriver_dWasm Base_dEff Base_dEffFs Vuna_dCompiler_dLowering_dProgram Base_dApplicative Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dPair Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dDiag Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dDriver_dCompile &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dNative Base_dEff Base_dEffFs Vuna_dCompiler_dLowering_dProgram Base_dApplicative Vuna_runtime Vuna_dCompiler_dNative_dModule Base_dPair Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dNative_dModel Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dNative_dRender Vuna_dCompiler_dDriver_dCompile &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dPair Vuna_dCompiler_dBase_dBytes Base_dMaybe Vuna_dCompiler_dDriver_dCompile &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dDriver_dCompilerCli Base_dEffClock Base_dEff Vuna_dCompiler_dFrontend_dManifest Base_dEffFs Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dEffConsole Base_dPair Base_dEffProcess Vuna_dCompiler_dBase_dDiag Base_dBool Base_dMonad Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dDiagnostics_dSink Base_dMaybe Vuna_dCompiler_dLoader_dFingerprint Base_dEffEnv Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dDriver_dCompile Base_dEq
compile_mod Main Base_dEffClock Base_dEff Base_dEffFs Vuna_dCompiler_dDriver_dCompilerCli Base_dEffExit Base_dEffArgs Vuna_runtime Base_dEffConsole Base_dEffProcess Base_dMonad Base_dEffEnv
ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa Vuna_runtime.cmx Base_dApplicative.cmx Base_dFunctor.cmx Base_dFromString.cmx Base_dTraversable.cmx Base_dHashable.cmx Base_dMonad.cmx Base_dEff_dTypes.cmx Base_dObs.cmx Base_dBits.cmx Base_dNum.cmx Base_dShow.cmx Base_dMonoid.cmx Base_dFromInt.cmx Vuna_dCompiler_dBase_dVersion.cmx Base_dEq.cmx Prelude.cmx Base_dEff.cmx Base_dInterp.cmx Base_dBool.cmx Base_dFoldable.cmx Base_dEffClock.cmx Base_dOrd.cmx Base_dEffExit.cmx Base_dEffConsole.cmx Vuna_dCompiler_dBase_dObs.cmx Base_dObs_dSpan.cmx Base_dUnit.cmx Base_dPair.cmx Base_dMaybe.cmx Base_dInt.cmx Base_dEffStdin.cmx Base_dNat.cmx Base_dList.cmx Base_dEffEnv.cmx Vuna_dCompiler_dWasm_dInstr.cmx Base_dSort.cmx Base_dResult.cmx Base_dArray.cmx Base_dEffArgs.cmx Base_dString.cmx Base_dFloat.cmx Vuna_dCompiler_dNative_dModel.cmx Base_dVec.cmx Vuna_dCompiler_dBase_dBytes.cmx Vuna_dCompiler_dBase_dDiagnostics_dIc.cmx Vuna_dCompiler_dBase_dHash.cmx Vuna_dCompiler_dFrontend_dCanonical_dPkg.cmx Base_dEffFs.cmx Vuna_dCompiler_dWasm_dModel.cmx Base_dEffProcess.cmx Vuna_dCompiler_dNative_dAbi.cmx Vuna_dCompiler_dBase_dSource.cmx Base_dHashMap.cmx Vuna_dCompiler_dBase_dStore.cmx Vuna_dCompiler_dWasm_dRender.cmx Vuna_dCompiler_dBase_dIntrinsics.cmx Vuna_dCompiler_dBase_dDiag.cmx Vuna_dCompiler_dFrontend_dAst.cmx Vuna_dCompiler_dNative_dRender.cmx Vuna_dCompiler_dIr_dModel.cmx Vuna_dCompiler_dNative_dRuntime.cmx Vuna_dCompiler_dWasm_dRuntime.cmx Vuna_dCompiler_dFrontend_dCanonical_dAst.cmx Vuna_dCompiler_dIr_dRuntime.cmx Vuna_dCompiler_dBase_dDiagnostics_dCommon.cmx Vuna_dCompiler_dWasm_dTypes.cmx Vuna_dCompiler_dCodegen_dDecl.cmx Vuna_dCompiler_dCore_dTerm.cmx Vuna_dCompiler_dBase_dDiagnostics_dSink.cmx Vuna_dCompiler_dLoader_dAddr.cmx Vuna_dCompiler_dBase_dDiag_dCodec.cmx Vuna_dCompiler_dElab_dTermination_dMeasure.cmx Vuna_dCompiler_dDriver_dSplit.cmx Vuna_dCompiler_dBase_dCommon.cmx Vuna_dCompiler_dBase_dDiagnostics_dRn.cmx Vuna_dCompiler_dBase_dDiagnostics_dTc.cmx Vuna_dCompiler_dCore_dCanonical.cmx Vuna_dCompiler_dBase_dDiagnostics_dLoader.cmx Vuna_dCompiler_dCodegen_dRuntime.cmx Vuna_dCompiler_dBase_dDiagnostics_dPkg.cmx Vuna_dCompiler_dBase_dDiagnostics_dCg.cmx Vuna_dCompiler_dElab_dTermination_dScc.cmx Vuna_dCompiler_dBase_dDiagnostics_dFrontend.cmx Vuna_dCompiler_dLoader_dFingerprint.cmx Vuna_dCompiler_dBase_dDiagnostics_dWarning.cmx Vuna_dCompiler_dCore_dEval.cmx Vuna_dCompiler_dElab_dMatch.cmx Vuna_dCompiler_dBase_dDiagnostics.cmx Vuna_dCompiler_dElab_dRecords.cmx Vuna_dCompiler_dLoader_dFixity.cmx Vuna_dCompiler_dElab_dPrelude.cmx Vuna_dCompiler_dElab_dSig.cmx Vuna_dCompiler_dFrontend_dLexer.cmx Vuna_dCompiler_dFrontend_dToml.cmx Vuna_dCompiler_dLoader_dExpand.cmx Vuna_dCompiler_dElab_dTermination.cmx Vuna_dCompiler_dElab_dCoverage.cmx Vuna_dCompiler_dCore_dConv.cmx Vuna_dCompiler_dElab_dTypes.cmx Vuna_dCompiler_dCodegen_dTerm.cmx Vuna_dCompiler_dIr_dAnalysis.cmx Vuna_dCompiler_dDriver_dPerfCache.cmx Vuna_dCompiler_dFrontend_dManifest.cmx Vuna_dCompiler_dElab_dDerive.cmx Vuna_dCompiler_dElab_dRepresentation.cmx Vuna_dCompiler_dBase_dDiag_dFormat.cmx Vuna_dCompiler_dFrontend_dCanonical_dLex.cmx Vuna_dCompiler_dNative_dModule.cmx Vuna_dCompiler_dCodegen_dAssembly.cmx Vuna_dCompiler_dFrontend_dCst.cmx Vuna_dCompiler_dWasm_dModule.cmx Vuna_dCompiler_dElab_dMetaSpans.cmx Vuna_dCompiler_dIr_dValidate.cmx Vuna_dCompiler_dFrontend_dParser_dSupport.cmx Vuna_dCompiler_dElab_dMeta.cmx Vuna_dCompiler_dFrontend_dPackages_dSource.cmx Vuna_dCompiler_dFrontend_dParser.cmx Vuna_dCompiler_dElab_dUsage.cmx Vuna_dCompiler_dFrontend_dPackages_dPkg.cmx Vuna_dCompiler_dElab_dTerm_dSupport.cmx Vuna_dCompiler_dElab_dDict.cmx Vuna_dCompiler_dElab_dInstName.cmx Vuna_dCompiler_dElab_dCase.cmx Vuna_dCompiler_dElab_dInstCoherence.cmx Vuna_dCompiler_dLoader_dModules.cmx Vuna_dCompiler_dLowering_dChecks.cmx Vuna_dCompiler_dDriver_dOwner.cmx Vuna_dCompiler_dLowering_dEnv.cmx Vuna_dCompiler_dLoader_dLayers.cmx Vuna_dCompiler_dLoader_dResolve.cmx Vuna_dCompiler_dLowering_dEntry.cmx Vuna_dCompiler_dElab_dCanonical.cmx Vuna_dCompiler_dElab_dTerm_dImpl.cmx Vuna_dCompiler_dLoader_dFlatten.cmx Vuna_dCompiler_dDriver_dCache.cmx Vuna_dCompiler_dElab_dTerm.cmx Vuna_dCompiler_dLowering_dTy.cmx Vuna_dCompiler_dLowering_dProgram.cmx Vuna_dCompiler_dElab_dData.cmx Vuna_dCompiler_dDriver_dIface.cmx Vuna_dCompiler_dElab_dTrait.cmx Vuna_dCompiler_dDriver_dSplitGen.cmx Vuna_dCompiler_dElab_dDriver.cmx Vuna_dCompiler_dDriver_dDt.cmx Vuna_dCompiler_dDriver_dCompile.cmx Vuna_dCompiler_dDriver_dWasm.cmx Vuna_dCompiler_dDriver_dNative.cmx Vuna_dCompiler_dDriver_dToolPayload.cmx Vuna_dCompiler_dDriver_dCompilerCli.cmx Main.cmx $C_OBJS
echo "built $OUT"
