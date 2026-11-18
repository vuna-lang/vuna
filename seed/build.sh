#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（按直接依赖分层并行 + 内容哈希增量）。用法: ./build.sh [OUT]
# 干净构建且 JOBS<=1：一次 ocamlopt 编译全部 .mli/.ml 并链接；
# 增量构建：每单元 .ml/.mli 与直接依赖 .stamp 的内容哈希写 $base.stamp，命中即跳过；
# 同层单元互不依赖：多单元层用后台任务并行编译，层间用 wait 串行。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
MODULES="Vuna_runtime Base_dTrait_dNum Base_dContainer Base_dTrait_dMonoid Base_dTrait_dFromInt Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dEffect_dTypes Base_dData Base_dInternal_dOperator Base_dData_dBits Base_dTrait_dApplicative Base_dTrait_dEq Base_dTrait_dNeg Vuna_dCompiler_dBase_dVersion Base_dTrait_dFromString Base_dTrait_dShow Vuna_dCompiler_dBase_dCapabilities Prelude Base_dEffect_dPure Base_dEffect Base_dData_dObs Base_dTrait_dFunctor Base_dTrait_dFoldable Base_dEffect_dPure_dReader Base_dData_dBool Base_dTrait_dInterp Base_dEffect_dPure_dError Base_dEffect_dCore Base_dEffect_dClock Base_dEffect_dReader Base_dEffect_dConsole Base_dEffect_dRef Base_dEffect_dExit Vuna_dCompiler_dBase_dObs Base_dEffect_dPure_dIORef Base_dEffect_dState Base_dTrait_dOrd Base_dData_dObs_dSpan Base_dData_dUnit Base_dData_dMaybe Base_dData_dPair Base_dData_dInt Base_dEffect_dStdin Base_dData_dNat Base_dEffect_dEnv Base_dEffect_dPure_dState Base_dData_dList Vuna_dCompiler_dWasm_dInstr Base_dData_dString Base_dData_dVec Base_dContainer_dArray Base_dEffect_dArgs Vuna_dCompiler_dNative_dModel Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dBase_dDiagnostics_dIc Base_dData_dResult Base_dData_dFloat Base_dContainer_dMap Vuna_dCompiler_dBase_dHash Base_dData_dSort Vuna_dCompiler_dFrontend_dCanonical_dPkg Base_dEffect_dError Vuna_dCompiler_dWasm_dModel Base_dEffect_dExn Base_dEffect_dProcess Base_dEffect_dNet Vuna_dCompiler_dNative_dAbi Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dNative_dRender Base_dEffect_dFs Vuna_dCompiler_dNative_dGc Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dWasm_dStep Vuna_dCompiler_dIr_dModel Base_dContainer_dHashSet Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dIr_dCps Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dIr_dAnf Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_dCompiler_dLoader_dAddr Vuna_dCompiler_dNative_dRuntime Vuna_dCompiler_dBase_dDiag_dCodec Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dBase_dCommon Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dNative_dAudit Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dLoader_dFingerprint Vuna_dCompiler_dBase_dDiagnostics_dWarning Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dElab_dCoverage Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dNative_dModule Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dIr_dValidate Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dElab_dData Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dCompilerCli Main "
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
  printf '%s' "$(stamp_want Base_dTrait_dNum Vuna_runtime)" > "Base_dTrait_dNum.stamp"
  printf '%s' "$(stamp_want Base_dContainer Vuna_runtime)" > "Base_dContainer.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dMonoid Vuna_runtime)" > "Base_dTrait_dMonoid.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dFromInt Vuna_runtime)" > "Base_dTrait_dFromInt.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dTraversable Vuna_runtime)" > "Base_dTrait_dTraversable.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dMonad Vuna_runtime)" > "Base_dTrait_dMonad.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dHashable Vuna_runtime)" > "Base_dTrait_dHashable.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dTypes Vuna_runtime)" > "Base_dEffect_dTypes.stamp"
  printf '%s' "$(stamp_want Base_dData Vuna_runtime)" > "Base_dData.stamp"
  printf '%s' "$(stamp_want Base_dInternal_dOperator Vuna_runtime)" > "Base_dInternal_dOperator.stamp"
  printf '%s' "$(stamp_want Base_dData_dBits Vuna_runtime)" > "Base_dData_dBits.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dApplicative Vuna_runtime)" > "Base_dTrait_dApplicative.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dEq Vuna_runtime)" > "Base_dTrait_dEq.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dNeg Vuna_runtime)" > "Base_dTrait_dNeg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dVersion Vuna_runtime)" > "Vuna_dCompiler_dBase_dVersion.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dFromString Vuna_runtime)" > "Base_dTrait_dFromString.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dShow Vuna_runtime)" > "Base_dTrait_dShow.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dCapabilities Vuna_runtime)" > "Vuna_dCompiler_dBase_dCapabilities.stamp"
  printf '%s' "$(stamp_want Prelude Vuna_runtime)" > "Prelude.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dPure Vuna_runtime)" > "Base_dEffect_dPure.stamp"
  printf '%s' "$(stamp_want Base_dEffect Vuna_runtime)" > "Base_dEffect.stamp"
  printf '%s' "$(stamp_want Base_dData_dObs Vuna_runtime)" > "Base_dData_dObs.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dFunctor Vuna_runtime)" > "Base_dTrait_dFunctor.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime)" > "Base_dTrait_dFoldable.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dPure_dReader Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor)" > "Base_dEffect_dPure_dReader.stamp"
  printf '%s' "$(stamp_want Base_dData_dBool Vuna_runtime Base_dTrait_dHashable Base_dTrait_dShow)" > "Base_dData_dBool.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dInterp Vuna_runtime Base_dTrait_dShow)" > "Base_dTrait_dInterp.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dPure_dError Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor)" > "Base_dEffect_dPure_dError.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dCore Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor)" > "Base_dEffect_dCore.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dClock Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dEffect_dCore)" > "Base_dEffect_dClock.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dReader Vuna_runtime Base_dTrait_dMonad Base_dEffect_dCore)" > "Base_dEffect_dReader.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dConsole Vuna_runtime Base_dTrait_dMonad Base_dTrait_dFunctor Base_dEffect_dCore)" > "Base_dEffect_dConsole.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dRef Vuna_runtime Base_dEffect_dCore)" > "Base_dEffect_dRef.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dExit Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dEffect_dCore)" > "Base_dEffect_dExit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dObs Vuna_runtime Base_dData_dObs Base_dEffect_dCore)" > "Vuna_dCompiler_dBase_dObs.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dPure_dIORef Vuna_runtime Base_dTrait_dMonad Base_dEffect_dCore)" > "Base_dEffect_dPure_dIORef.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dState Vuna_runtime Base_dEffect_dCore)" > "Base_dEffect_dState.stamp"
  printf '%s' "$(stamp_want Base_dTrait_dOrd Vuna_runtime Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dEq Base_dTrait_dShow)" > "Base_dTrait_dOrd.stamp"
  printf '%s' "$(stamp_want Base_dData_dObs_dSpan Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dObs Base_dEffect_dCore)" > "Base_dData_dObs_dSpan.stamp"
  printf '%s' "$(stamp_want Base_dData_dUnit Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd)" > "Base_dData_dUnit.stamp"
  printf '%s' "$(stamp_want Base_dData_dMaybe Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dApplicative Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd Base_dTrait_dFunctor)" > "Base_dData_dMaybe.stamp"
  printf '%s' "$(stamp_want Base_dData_dPair Vuna_runtime Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd)" > "Base_dData_dPair.stamp"
  printf '%s' "$(stamp_want Base_dData_dInt Base_dTrait_dNum Vuna_runtime Base_dTrait_dHashable Base_dTrait_dEq Base_dTrait_dNeg Base_dTrait_dShow Base_dTrait_dOrd)" > "Base_dData_dInt.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dStdin Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dCore)" > "Base_dEffect_dStdin.stamp"
  printf '%s' "$(stamp_want Base_dData_dNat Base_dTrait_dNum Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd)" > "Base_dData_dNat.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dEnv Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dCore)" > "Base_dEffect_dEnv.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dPure_dState Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dPair Base_dTrait_dFunctor)" > "Base_dEffect_dPure_dState.stamp"
  printf '%s' "$(stamp_want Base_dData_dList Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd Base_dData_dPair Base_dTrait_dFunctor)" > "Base_dData_dList.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dData_dList)" > "Vuna_dCompiler_dWasm_dInstr.stamp"
  printf '%s' "$(stamp_want Base_dData_dString Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dTrait_dInterp Base_dTrait_dEq Base_dTrait_dOrd Base_dData_dList)" > "Base_dData_dString.stamp"
  printf '%s' "$(stamp_want Base_dData_dVec Vuna_runtime Base_dData_dList)" > "Base_dData_dVec.stamp"
  printf '%s' "$(stamp_want Base_dContainer_dArray Vuna_runtime Base_dTrait_dEq Base_dTrait_dShow Base_dData_dList)" > "Base_dContainer_dArray.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dArgs Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dList Base_dEffect_dCore)" > "Base_dEffect_dArgs.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dModel Vuna_runtime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dNative_dModel.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dBytes Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dBytes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_runtime Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dIc.stamp"
  printf '%s' "$(stamp_want Base_dData_dResult Base_dTrait_dFoldable Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dTrait_dApplicative Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor)" > "Base_dData_dResult.stamp"
  printf '%s' "$(stamp_want Base_dData_dFloat Base_dTrait_dNum Vuna_runtime Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dNeg Base_dTrait_dShow Base_dTrait_dOrd Base_dData_dPair Base_dData_dList)" > "Base_dData_dFloat.stamp"
  printf '%s' "$(stamp_want Base_dContainer_dMap Vuna_runtime Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList)" > "Base_dContainer_dMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dHash Base_dTrait_dNum Vuna_runtime Base_dData_dBits Base_dData_dPair Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dBase_dHash.stamp"
  printf '%s' "$(stamp_want Base_dData_dSort Vuna_runtime Base_dTrait_dOrd Base_dData_dList)" > "Base_dData_dSort.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_runtime Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dFrontend_dCanonical_dPkg.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dError Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dEffect_dCore)" > "Base_dEffect_dError.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dModel Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dWasm_dModel.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dExn Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dEffect_dCore)" > "Base_dEffect_dExn.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dProcess Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dData_dList Base_dEffect_dCore)" > "Base_dEffect_dProcess.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dNet Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dData_dResult Base_dEffect_dCore)" > "Base_dEffect_dNet.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dAbi Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dList)" > "Vuna_dCompiler_dNative_dAbi.stamp"
  printf '%s' "$(stamp_want Base_dContainer_dHashMap Base_dData_dString Base_dContainer_dArray Vuna_runtime Base_dTrait_dHashable Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList)" > "Base_dContainer_dHashMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dSource Base_dData_dString Vuna_runtime Base_dData_dBool Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dSource.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dRender Base_dData_dString Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dNative_dRender.stamp"
  printf '%s' "$(stamp_want Base_dEffect_dFs Base_dData_dString Vuna_runtime Base_dTrait_dMonad Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dData_dResult Base_dTrait_dOrd Base_dData_dList Base_dTrait_dFunctor Base_dEffect_dCore Base_dData_dSort)" > "Base_dEffect_dFs.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dGc Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dList)" > "Vuna_dCompiler_dNative_dGc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dStore Base_dData_dString Base_dEffect_dClock Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Base_dData_dObs_dSpan Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore)" > "Vuna_dCompiler_dBase_dStore.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dWasm_dInstr Base_dData_dString Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dTrait_dInterp Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dWasm_dRender.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dIntrinsics Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dIntrinsics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor Base_dData_dInt)" > "Vuna_dCompiler_dBase_dDiag.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dAst Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dStep Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dWasm_dStep.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dModel Vuna_runtime Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dIr_dModel.stamp"
  printf '%s' "$(stamp_want Base_dContainer_dHashSet Vuna_runtime Base_dContainer_dHashMap Base_dTrait_dShow Base_dData_dPair Base_dData_dList)" > "Base_dContainer_dHashSet.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dWasm_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_runtime Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dCanonical_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dIr_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dCommon Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dWasm_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dCps Vuna_runtime Base_dData_dBool Base_dData_dMaybe Base_dTrait_dEq Base_dData_dResult Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dIr_dCps.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dDecl Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dCodegen_dDecl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dTerm Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dCore_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dAnf Base_dData_dString Vuna_runtime Base_dData_dMaybe Base_dData_dResult Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dIr_dAnf.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dSink Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dSink.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dAddr Vuna_runtime Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash)" > "Vuna_dCompiler_dLoader_dAddr.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dRuntime Vuna_dCompiler_dNative_dGc Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dNative_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag_dCodec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiag_dCodec.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dElab_dTermination_dMeasure.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplit Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dBytes Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Base_dTrait_dOrd Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort Base_dData_dInt)" > "Vuna_dCompiler_dDriver_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dCommon Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dTrait_dApplicative Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor Base_dEffect_dCore)" > "Vuna_dCompiler_dBase_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dRn.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dTc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dCanonical Vuna_runtime Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dCore_dCanonical.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dAudit Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dBool Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dNative_dAudit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dLoader Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dLoader.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dCodegen_dRuntime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dPkg Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dCg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dElab_dTermination_dScc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dFrontend Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dFrontend.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFingerprint Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Vuna_dCompiler_dLoader_dAddr Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Base_dTrait_dOrd Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore Base_dData_dSort)" > "Vuna_dCompiler_dLoader_dFingerprint.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics_dWarning.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dEval Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dTrait_dEq Base_dData_dFloat Base_dData_dPair Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dCore_dEval.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dElab_dMatch.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dBase_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dElab_dRecords.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dLoader_dFixity.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dElab_dPrelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dSig Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dSig.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dLexer.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dToml Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dBits Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dToml.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dLoader_dExpand.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination_dScc Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dElab_dTermination.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCoverage Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dElab_dCoverage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCore_dConv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTypes Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt)" > "Vuna_dCompiler_dElab_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dTerm Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dCodegen_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dTrait_dOrd Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dSort)" > "Vuna_dCompiler_dCodegen_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dAnalysis Base_dTrait_dNum Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dInt)" > "Vuna_dCompiler_dIr_dAnalysis.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dBase_dStore Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Vuna_dCompiler_dDriver_dSplit Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dPerfCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dManifest.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dElab_dDerive.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dElab_dRepresentation.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dBase_dDiag_dFormat Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dTrait_dInterp Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dBase_dDiag_dFormat.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dNative_dModule Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dNative_dAudit Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dBool Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dNative_dModule.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dCodegen_dAssembly.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dObs_dSpan Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dCst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dWasm_dInstr Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dWasm_dModel Vuna_runtime Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dIr_dCps Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dIr_dAnf Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dWasm_dStep Base_dData_dMaybe Base_dTrait_dEq Base_dData_dResult Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dWasm_dRuntime Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dWasm_dModule.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dElab_dMetaSpans.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIr_dValidate Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dIr_dValidate.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dParser_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMeta Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dMeta.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort)" > "Vuna_dCompiler_dFrontend_dPackages_dSource.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser Base_dData_dVec Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dFrontend_dParser.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dUsage Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dUsage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Base_dData_dVec Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Base_dData_dPair Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dFrontend_dPackages_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDict Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dMetaSpans Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dDict.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstName Base_dData_dString Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dElab_dInstName.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dCase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dDict Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dInstCoherence.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dFs Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dLoader_dModules.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dElab_dUsage Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dChecks.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dInstName Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dDriver_dOwner.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dEnv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dList)" > "Vuna_dCompiler_dLoader_dLayers.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dLoader_dResolve.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dEntry Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dEntry.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair)" > "Vuna_dCompiler_dElab_dCanonical.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dMatch Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Base_dData_dNat Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dImpl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Base_dData_dVec Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dLayers Base_dTrait_dMonad Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dEffect_dFs Base_dData_dObs_dSpan Base_dData_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dLoader_dFlatten.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt)" > "Vuna_dCompiler_dDriver_dCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl)" > "Vuna_dCompiler_dElab_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dTy.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dIr_dValidate Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dLowering_dProgram.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dData Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList)" > "Vuna_dCompiler_dElab_dData.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dOrd Vuna_dCompiler_dDriver_dOwner Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dData_dSort Base_dData_dInt)" > "Vuna_dCompiler_dDriver_dIface.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dMatch Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dTrait_dInterp Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt)" > "Vuna_dCompiler_dElab_dTrait.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dCodegen_dDecl Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Base_dTrait_dApplicative Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDriver_dSplit Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dSplitGen.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dData Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dTrait_dInterp Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dTrait_dOrd Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dSort Vuna_dCompiler_dCore_dEval Base_dData_dInt)" > "Vuna_dCompiler_dElab_dDriver.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dLowering_dProgram Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dAssembly Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dIr_dModel Base_dEffect_dEnv Base_dEffect_dFs Base_dTrait_dOrd Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dObs Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dDriver_dDt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Base_dEffect_dClock Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dInterp Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dLoader_dAddr Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dDiag_dCodec Vuna_dCompiler_dDriver_dSplit Base_dData_dPair Base_dData_dList Base_dData_dObs Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dCompile.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dEffect_dFs Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dBase_dCapabilities Base_dData_dPair Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dWasm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dNative Base_dData_dString Vuna_dCompiler_dLowering_dProgram Vuna_runtime Vuna_dCompiler_dNative_dModule Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dNative_dModel Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dNative_dRender Base_dEffect_dFs Vuna_dCompiler_dDriver_dCompile Base_dData_dPair Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dNative.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dIface Vuna_runtime Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Vuna_dCompiler_dDriver_dCompile Base_dData_dPair)" > "Vuna_dCompiler_dDriver_dToolPayload.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompilerCli Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Base_dEffect_dClock Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dEffect_dConsole Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dDriver_dCompile Base_dData_dPair Base_dData_dList Base_dEffect_dCore)" > "Vuna_dCompiler_dDriver_dCompilerCli.stamp"
  printf '%s' "$(stamp_want Main Vuna_dCompiler_dDriver_dCompilerCli Base_dEffect_dClock Base_dEffect_dConsole Vuna_runtime Base_dEffect_dExit Base_dTrait_dMonad Base_dEffect_dProcess Base_dEffect_dArgs Base_dEffect_dEnv Base_dEffect_dFs Base_dEffect_dCore)" > "Main.stamp"
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
compile_mod Base_dTrait_dNum Vuna_runtime &
pids="$pids $!"
compile_mod Base_dContainer Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dMonoid Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dFromInt Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dTraversable Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dMonad Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dHashable Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEffect_dTypes Vuna_runtime &
pids="$pids $!"
compile_mod Base_dData Vuna_runtime &
pids="$pids $!"
compile_mod Base_dInternal_dOperator Vuna_runtime &
pids="$pids $!"
compile_mod Base_dData_dBits Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dApplicative Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dEq Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dNeg Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dVersion Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dFromString Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dShow Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dCapabilities Vuna_runtime &
pids="$pids $!"
compile_mod Prelude Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEffect_dPure Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEffect Vuna_runtime &
pids="$pids $!"
compile_mod Base_dData_dObs Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTrait_dFunctor Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEffect_dPure_dReader Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor &
pids="$pids $!"
compile_mod Base_dData_dBool Vuna_runtime Base_dTrait_dHashable Base_dTrait_dShow &
pids="$pids $!"
compile_mod Base_dTrait_dInterp Vuna_runtime Base_dTrait_dShow &
pids="$pids $!"
compile_mod Base_dEffect_dPure_dError Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor &
pids="$pids $!"
compile_mod Base_dEffect_dCore Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dTrait_dFunctor &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEffect_dClock Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dReader Vuna_runtime Base_dTrait_dMonad Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dConsole Vuna_runtime Base_dTrait_dMonad Base_dTrait_dFunctor Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dRef Vuna_runtime Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dExit Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dObs Vuna_runtime Base_dData_dObs Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dPure_dIORef Vuna_runtime Base_dTrait_dMonad Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dState Vuna_runtime Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dTrait_dOrd Vuna_runtime Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dEq Base_dTrait_dShow &
pids="$pids $!"
compile_mod Base_dData_dObs_dSpan Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dObs Base_dEffect_dCore &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dData_dUnit Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd &
pids="$pids $!"
compile_mod Base_dData_dMaybe Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dApplicative Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd Base_dTrait_dFunctor &
pids="$pids $!"
compile_mod Base_dData_dPair Vuna_runtime Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd &
pids="$pids $!"
compile_mod Base_dData_dInt Base_dTrait_dNum Vuna_runtime Base_dTrait_dHashable Base_dTrait_dEq Base_dTrait_dNeg Base_dTrait_dShow Base_dTrait_dOrd &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEffect_dStdin Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dData_dNat Base_dTrait_dNum Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd &
pids="$pids $!"
compile_mod Base_dEffect_dEnv Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dPure_dState Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dPair Base_dTrait_dFunctor &
pids="$pids $!"
compile_mod Base_dData_dList Base_dTrait_dFoldable Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dTrait_dOrd Base_dData_dPair Base_dTrait_dFunctor &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dData_dList &
pids="$pids $!"
compile_mod Base_dData_dString Base_dTrait_dMonoid Vuna_runtime Base_dTrait_dHashable Base_dTrait_dInterp Base_dTrait_dEq Base_dTrait_dOrd Base_dData_dList &
pids="$pids $!"
compile_mod Base_dData_dVec Vuna_runtime Base_dData_dList &
pids="$pids $!"
compile_mod Base_dContainer_dArray Vuna_runtime Base_dTrait_dEq Base_dTrait_dShow Base_dData_dList &
pids="$pids $!"
compile_mod Base_dEffect_dArgs Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dModel Vuna_runtime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dBytes Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_runtime Base_dData_dList &
pids="$pids $!"
compile_mod Base_dData_dResult Base_dTrait_dFoldable Vuna_runtime Base_dTrait_dTraversable Base_dTrait_dMonad Base_dTrait_dHashable Base_dTrait_dApplicative Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor &
pids="$pids $!"
compile_mod Base_dData_dFloat Base_dTrait_dNum Vuna_runtime Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dNeg Base_dTrait_dShow Base_dTrait_dOrd Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Base_dContainer_dMap Vuna_runtime Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dHash Base_dTrait_dNum Vuna_runtime Base_dData_dBits Base_dData_dPair Base_dData_dList Base_dData_dInt &
pids="$pids $!"
compile_mod Base_dData_dSort Vuna_runtime Base_dTrait_dOrd Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_runtime Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Base_dEffect_dError Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dModel Vuna_dCompiler_dWasm_dInstr Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Base_dEffect_dExn Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dProcess Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dResult Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Base_dEffect_dNet Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dData_dResult Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dAbi Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dList &
pids="$pids $!"
compile_mod Base_dContainer_dHashMap Base_dData_dString Base_dContainer_dArray Vuna_runtime Base_dTrait_dHashable Base_dData_dMaybe Base_dTrait_dEq Base_dTrait_dShow Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dSource Base_dData_dString Vuna_runtime Base_dData_dBool Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dRender Base_dData_dString Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Base_dEffect_dFs Base_dData_dString Vuna_runtime Base_dTrait_dMonad Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dData_dResult Base_dTrait_dOrd Base_dData_dList Base_dTrait_dFunctor Base_dEffect_dCore Base_dData_dSort &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dNative_dGc Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dStore Base_dData_dString Base_dEffect_dClock Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Base_dData_dBool Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Base_dData_dObs_dSpan Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dWasm_dInstr Base_dData_dString Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dTrait_dInterp Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dIntrinsics Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dAst Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dStep Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dModel Vuna_runtime Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Base_dContainer_dHashSet Vuna_runtime Base_dContainer_dHashMap Base_dTrait_dShow Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dRuntime Vuna_dCompiler_dWasm_dInstr Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_runtime Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dCommon Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dCps Vuna_runtime Base_dData_dBool Base_dData_dMaybe Base_dTrait_dEq Base_dData_dResult Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dDecl Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dTerm Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dAnf Base_dData_dString Vuna_runtime Base_dData_dMaybe Base_dData_dResult Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dSink Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dAddr Vuna_runtime Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dRuntime Vuna_dCompiler_dNative_dGc Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag_dCodec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dString Vuna_runtime Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dSplit Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dBytes Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Base_dTrait_dOrd Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dCommon Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dTrait_dApplicative Base_dData_dPair Base_dData_dList Base_dTrait_dFunctor Base_dEffect_dCore &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dCanonical Vuna_runtime Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dAudit Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dNative_dModel Base_dData_dBool Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dLoader Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dIr_dRuntime Vuna_runtime Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dPkg Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dCg Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dFrontend Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFingerprint Base_dData_dString Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Vuna_dCompiler_dLoader_dAddr Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Base_dTrait_dOrd Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore Base_dData_dSort &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dEval Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dTrait_dEq Base_dData_dFloat Base_dData_dPair Base_dData_dList Base_dData_dInt &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiagnostics Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dDiagnostics_dIc Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCommon Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dSig Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dToml Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dBits Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiagnostics_dRn Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination_dScc Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCoverage Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Base_dData_dList Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTypes Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dTerm Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dCodegen_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dTrait_dOrd Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dSort &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dAnalysis Base_dTrait_dNum Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dBase_dStore Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Vuna_dCompiler_dDriver_dSplit Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dBase_dDiag_dFormat Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dSource Base_dTrait_dInterp Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dNative_dModule Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dNative_dAudit Vuna_runtime Vuna_dCompiler_dNative_dAbi Vuna_dCompiler_dNative_dModel Base_dData_dBool Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dNative_dRuntime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dData_dMaybe Base_dData_dObs_dSpan Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dWasm_dInstr Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dWasm_dModel Vuna_runtime Vuna_dCompiler_dWasm_dTypes Vuna_dCompiler_dIr_dCps Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dIr_dAnf Vuna_dCompiler_dIr_dAnalysis Vuna_dCompiler_dWasm_dStep Base_dData_dMaybe Base_dTrait_dEq Base_dData_dResult Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dWasm_dRuntime Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIr_dValidate Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMeta Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_runtime Base_dTrait_dMonad Base_dTrait_dApplicative Base_dData_dMaybe Base_dEffect_dFs Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser Base_dData_dVec Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dUsage Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dCanonical_dPkg Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Base_dData_dVec Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Base_dData_dPair Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDict Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dMetaSpans Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstName Base_dData_dString Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dBase_dDiagnostics_dTc Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dTrait_dEq Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dDict Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dFs Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dChecks Vuna_dCompiler_dElab_dUsage Base_dData_dString Base_dData_dVec Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dInstName Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dLayers Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dBase_dDiagnostics_dFrontend Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dEntry Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCanonical Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dData_dPair &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dMatch Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Base_dData_dNat Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dBase_dDiagnostics_dRn Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dLoader Base_dData_dVec Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Vuna_dCompiler_dLoader_dLayers Base_dTrait_dMonad Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dEffect_dFs Base_dData_dObs_dSpan Base_dData_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dMeta Vuna_runtime Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dData_dMaybe Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dIr_dRuntime Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dCodegen_dRuntime Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dLowering_dChecks Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIr_dAnalysis Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dLowering_dTy Vuna_dCompiler_dIr_dValidate Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dData Base_dData_dString Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dCore_dCanonical Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dCanonical Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dOrd Vuna_dCompiler_dDriver_dOwner Base_dData_dPair Base_dData_dList Vuna_dCompiler_dBase_dHash Base_dData_dSort Base_dData_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dMatch Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dCoverage Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dTrait_dInterp Base_dData_dMaybe Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Vuna_dCompiler_dCore_dEval Base_dData_dInt &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dLowering_dEnv Base_dData_dString Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dLowering_dEntry Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dCodegen_dDecl Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Base_dTrait_dApplicative Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDriver_dSplit Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dBase_dDiagnostics_dTc Vuna_dCompiler_dElab_dData Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dElab_dTermination Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Base_dTrait_dInterp Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dTrait_dOrd Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dSort Vuna_dCompiler_dCore_dEval Base_dData_dInt &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dLowering_dEnv Vuna_dCompiler_dFrontend_dCanonical_dAst Vuna_dCompiler_dElab_dDerive Base_dData_dString Vuna_dCompiler_dDriver_dSplitGen Vuna_dCompiler_dLowering_dProgram Base_dData_dVec Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dBase_dDiagnostics_dCg Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dBase_dIntrinsics Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dCodegen_dAssembly Base_dContainer_dHashMap Vuna_dCompiler_dCore_dTerm Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dIr_dModel Base_dEffect_dEnv Base_dEffect_dFs Base_dTrait_dOrd Vuna_dCompiler_dElab_dTermination_dMeasure Base_dData_dPair Vuna_dCompiler_dBase_dCommon Base_dData_dList Base_dData_dObs Vuna_dCompiler_dBase_dHash Base_dEffect_dCore Base_dData_dSort Vuna_dCompiler_dCore_dEval
compile_mod Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Base_dEffect_dClock Vuna_dCompiler_dFrontend_dPackages_dSource Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dBase_dDiagnostics_dPkg Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dFrontend_dPackages_dPkg Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dBase_dDiag Base_dContainer_dHashMap Base_dData_dBool Vuna_dCompiler_dBase_dObs Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dBytes Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dInterp Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Vuna_dCompiler_dLoader_dAddr Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dBase_dDiag_dCodec Vuna_dCompiler_dDriver_dSplit Base_dData_dPair Base_dData_dList Base_dData_dObs Vuna_dCompiler_dBase_dHash Base_dTrait_dFunctor Base_dEffect_dCore
pids=""
compile_mod Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dLowering_dProgram Vuna_dCompiler_dWasm_dModel Vuna_runtime Base_dTrait_dMonad Vuna_dCompiler_dWasm_dRender Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dBase_dDiagnostics_dWarning Base_dData_dMaybe Vuna_dCompiler_dIr_dModel Base_dEffect_dFs Vuna_dCompiler_dWasm_dModule Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dBase_dCapabilities Base_dData_dPair Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dNative Base_dData_dString Vuna_dCompiler_dLowering_dProgram Vuna_runtime Vuna_dCompiler_dNative_dModule Base_dTrait_dMonad Vuna_dCompiler_dBase_dDiag Vuna_dCompiler_dNative_dModel Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dElab_dTypes Base_dTrait_dApplicative Vuna_dCompiler_dNative_dRender Base_dEffect_dFs Vuna_dCompiler_dDriver_dCompile Base_dData_dPair Base_dData_dList Base_dEffect_dCore &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dToolPayload Vuna_dCompiler_dDriver_dIface Vuna_runtime Vuna_dCompiler_dBase_dBytes Base_dData_dMaybe Vuna_dCompiler_dDriver_dCompile Base_dData_dPair &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dDriver_dCompilerCli Vuna_dCompiler_dFrontend_dManifest Base_dData_dString Vuna_dCompiler_dDriver_dWasm Vuna_dCompiler_dDriver_dNative Base_dEffect_dClock Vuna_dCompiler_dBase_dDiag_dFormat Vuna_dCompiler_dBase_dStore Vuna_dCompiler_dFrontend_dPackages_dPkg Base_dEffect_dConsole Vuna_runtime Base_dTrait_dMonad Base_dEffect_dProcess Vuna_dCompiler_dBase_dDiag Base_dData_dBool Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dBase_dSource Vuna_dCompiler_dBase_dDiagnostics_dSink Vuna_dCompiler_dLoader_dFingerprint Base_dTrait_dApplicative Base_dData_dMaybe Base_dTrait_dEq Base_dEffect_dEnv Base_dEffect_dFs Vuna_dCompiler_dBase_dVersion Vuna_dCompiler_dDriver_dCompile Base_dData_dPair Base_dData_dList Base_dEffect_dCore
compile_mod Main Vuna_dCompiler_dDriver_dCompilerCli Base_dEffect_dClock Base_dEffect_dConsole Vuna_runtime Base_dEffect_dExit Base_dTrait_dMonad Base_dEffect_dProcess Base_dEffect_dArgs Base_dEffect_dEnv Base_dEffect_dFs Base_dEffect_dCore
ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa Vuna_runtime.cmx Base_dTrait_dNum.cmx Base_dContainer.cmx Base_dTrait_dMonoid.cmx Base_dTrait_dFromInt.cmx Base_dTrait_dTraversable.cmx Base_dTrait_dMonad.cmx Base_dTrait_dHashable.cmx Base_dEffect_dTypes.cmx Base_dData.cmx Base_dInternal_dOperator.cmx Base_dData_dBits.cmx Base_dTrait_dApplicative.cmx Base_dTrait_dEq.cmx Base_dTrait_dNeg.cmx Vuna_dCompiler_dBase_dVersion.cmx Base_dTrait_dFromString.cmx Base_dTrait_dShow.cmx Vuna_dCompiler_dBase_dCapabilities.cmx Prelude.cmx Base_dEffect_dPure.cmx Base_dEffect.cmx Base_dData_dObs.cmx Base_dTrait_dFunctor.cmx Base_dTrait_dFoldable.cmx Base_dEffect_dPure_dReader.cmx Base_dData_dBool.cmx Base_dTrait_dInterp.cmx Base_dEffect_dPure_dError.cmx Base_dEffect_dCore.cmx Base_dEffect_dClock.cmx Base_dEffect_dReader.cmx Base_dEffect_dConsole.cmx Base_dEffect_dRef.cmx Base_dEffect_dExit.cmx Vuna_dCompiler_dBase_dObs.cmx Base_dEffect_dPure_dIORef.cmx Base_dEffect_dState.cmx Base_dTrait_dOrd.cmx Base_dData_dObs_dSpan.cmx Base_dData_dUnit.cmx Base_dData_dMaybe.cmx Base_dData_dPair.cmx Base_dData_dInt.cmx Base_dEffect_dStdin.cmx Base_dData_dNat.cmx Base_dEffect_dEnv.cmx Base_dEffect_dPure_dState.cmx Base_dData_dList.cmx Vuna_dCompiler_dWasm_dInstr.cmx Base_dData_dString.cmx Base_dData_dVec.cmx Base_dContainer_dArray.cmx Base_dEffect_dArgs.cmx Vuna_dCompiler_dNative_dModel.cmx Vuna_dCompiler_dBase_dBytes.cmx Vuna_dCompiler_dBase_dDiagnostics_dIc.cmx Base_dData_dResult.cmx Base_dData_dFloat.cmx Base_dContainer_dMap.cmx Vuna_dCompiler_dBase_dHash.cmx Base_dData_dSort.cmx Vuna_dCompiler_dFrontend_dCanonical_dPkg.cmx Base_dEffect_dError.cmx Vuna_dCompiler_dWasm_dModel.cmx Base_dEffect_dExn.cmx Base_dEffect_dProcess.cmx Base_dEffect_dNet.cmx Vuna_dCompiler_dNative_dAbi.cmx Base_dContainer_dHashMap.cmx Vuna_dCompiler_dBase_dSource.cmx Vuna_dCompiler_dNative_dRender.cmx Base_dEffect_dFs.cmx Vuna_dCompiler_dNative_dGc.cmx Vuna_dCompiler_dBase_dStore.cmx Vuna_dCompiler_dWasm_dRender.cmx Vuna_dCompiler_dBase_dIntrinsics.cmx Vuna_dCompiler_dBase_dDiag.cmx Vuna_dCompiler_dFrontend_dAst.cmx Vuna_dCompiler_dWasm_dStep.cmx Vuna_dCompiler_dIr_dModel.cmx Base_dContainer_dHashSet.cmx Vuna_dCompiler_dWasm_dRuntime.cmx Vuna_dCompiler_dFrontend_dCanonical_dAst.cmx Vuna_dCompiler_dIr_dRuntime.cmx Vuna_dCompiler_dBase_dDiagnostics_dCommon.cmx Vuna_dCompiler_dWasm_dTypes.cmx Vuna_dCompiler_dIr_dCps.cmx Vuna_dCompiler_dCodegen_dDecl.cmx Vuna_dCompiler_dCore_dTerm.cmx Vuna_dCompiler_dIr_dAnf.cmx Vuna_dCompiler_dBase_dDiagnostics_dSink.cmx Vuna_dCompiler_dLoader_dAddr.cmx Vuna_dCompiler_dNative_dRuntime.cmx Vuna_dCompiler_dBase_dDiag_dCodec.cmx Vuna_dCompiler_dElab_dTermination_dMeasure.cmx Vuna_dCompiler_dDriver_dSplit.cmx Vuna_dCompiler_dBase_dCommon.cmx Vuna_dCompiler_dBase_dDiagnostics_dRn.cmx Vuna_dCompiler_dBase_dDiagnostics_dTc.cmx Vuna_dCompiler_dCore_dCanonical.cmx Vuna_dCompiler_dNative_dAudit.cmx Vuna_dCompiler_dBase_dDiagnostics_dLoader.cmx Vuna_dCompiler_dCodegen_dRuntime.cmx Vuna_dCompiler_dBase_dDiagnostics_dPkg.cmx Vuna_dCompiler_dBase_dDiagnostics_dCg.cmx Vuna_dCompiler_dElab_dTermination_dScc.cmx Vuna_dCompiler_dBase_dDiagnostics_dFrontend.cmx Vuna_dCompiler_dLoader_dFingerprint.cmx Vuna_dCompiler_dBase_dDiagnostics_dWarning.cmx Vuna_dCompiler_dCore_dEval.cmx Vuna_dCompiler_dElab_dMatch.cmx Vuna_dCompiler_dBase_dDiagnostics.cmx Vuna_dCompiler_dElab_dRecords.cmx Vuna_dCompiler_dLoader_dFixity.cmx Vuna_dCompiler_dElab_dPrelude.cmx Vuna_dCompiler_dElab_dSig.cmx Vuna_dCompiler_dFrontend_dLexer.cmx Vuna_dCompiler_dFrontend_dToml.cmx Vuna_dCompiler_dLoader_dExpand.cmx Vuna_dCompiler_dElab_dTermination.cmx Vuna_dCompiler_dElab_dCoverage.cmx Vuna_dCompiler_dCore_dConv.cmx Vuna_dCompiler_dElab_dTypes.cmx Vuna_dCompiler_dCodegen_dTerm.cmx Vuna_dCompiler_dIr_dAnalysis.cmx Vuna_dCompiler_dDriver_dPerfCache.cmx Vuna_dCompiler_dFrontend_dManifest.cmx Vuna_dCompiler_dElab_dDerive.cmx Vuna_dCompiler_dElab_dRepresentation.cmx Vuna_dCompiler_dBase_dDiag_dFormat.cmx Vuna_dCompiler_dNative_dModule.cmx Vuna_dCompiler_dCodegen_dAssembly.cmx Vuna_dCompiler_dFrontend_dCst.cmx Vuna_dCompiler_dWasm_dModule.cmx Vuna_dCompiler_dElab_dMetaSpans.cmx Vuna_dCompiler_dIr_dValidate.cmx Vuna_dCompiler_dFrontend_dParser_dSupport.cmx Vuna_dCompiler_dElab_dMeta.cmx Vuna_dCompiler_dFrontend_dPackages_dSource.cmx Vuna_dCompiler_dFrontend_dParser.cmx Vuna_dCompiler_dElab_dUsage.cmx Vuna_dCompiler_dFrontend_dPackages_dPkg.cmx Vuna_dCompiler_dElab_dTerm_dSupport.cmx Vuna_dCompiler_dElab_dDict.cmx Vuna_dCompiler_dElab_dInstName.cmx Vuna_dCompiler_dElab_dCase.cmx Vuna_dCompiler_dElab_dInstCoherence.cmx Vuna_dCompiler_dLoader_dModules.cmx Vuna_dCompiler_dLowering_dChecks.cmx Vuna_dCompiler_dDriver_dOwner.cmx Vuna_dCompiler_dLowering_dEnv.cmx Vuna_dCompiler_dLoader_dLayers.cmx Vuna_dCompiler_dLoader_dResolve.cmx Vuna_dCompiler_dLowering_dEntry.cmx Vuna_dCompiler_dElab_dCanonical.cmx Vuna_dCompiler_dElab_dTerm_dImpl.cmx Vuna_dCompiler_dLoader_dFlatten.cmx Vuna_dCompiler_dDriver_dCache.cmx Vuna_dCompiler_dElab_dTerm.cmx Vuna_dCompiler_dLowering_dTy.cmx Vuna_dCompiler_dLowering_dProgram.cmx Vuna_dCompiler_dElab_dData.cmx Vuna_dCompiler_dDriver_dIface.cmx Vuna_dCompiler_dElab_dTrait.cmx Vuna_dCompiler_dDriver_dSplitGen.cmx Vuna_dCompiler_dElab_dDriver.cmx Vuna_dCompiler_dDriver_dDt.cmx Vuna_dCompiler_dDriver_dCompile.cmx Vuna_dCompiler_dDriver_dWasm.cmx Vuna_dCompiler_dDriver_dNative.cmx Vuna_dCompiler_dDriver_dToolPayload.cmx Vuna_dCompiler_dDriver_dCompilerCli.cmx Main.cmx $C_OBJS
echo "built $OUT"
