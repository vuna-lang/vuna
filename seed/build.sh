#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（C35：按直接依赖分层并行 + 内容哈希增量）。用法: ./build.sh [OUT]
# 干净构建且 JOBS<=1：一次 ocamlopt 编译全部 .mli/.ml 并链接；
# 增量构建：每单元 .ml/.mli 与直接依赖 .stamp 的内容哈希写 $base.stamp，命中即跳过；
# 同层单元互不依赖：多单元层用后台任务并行编译，层间用 wait 串行。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
MODULES="Vuna_runtime Vuna_dCompiler_dCore Base_dApplicative Base_dFromString Base_dTraversable Vuna_dCompiler_dVersion Vuna_dCompiler_dLoader Base_dHashable Base_dMonad Vuna_dCompiler_dCodegen Base_dBits Base_dNum Base_dShow Base_dMonoid Base_dFromInt Base_dEq Prelude Vuna_dCompiler_dElab Base_dEff Base_dInterp Base_dBool Base_dFoldable Base_dOrd Base_dUnit Base_dFloat Base_dPair Base_dMaybe Base_dInt Base_dNat Base_dList Base_dSort Base_dResult Vuna_dCompiler_dDiagnostics_dIc Base_dArray Base_dString Base_dVec Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dStore Vuna_dCompiler_dDriver_dDiagRender Vuna_dCompiler_dFingerprint Base_dHashMap Vuna_dCompiler_dSource Vuna_dCompiler_dDiag Vuna_dCompiler_dQuery Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dQuery_dRun Vuna_dCompiler_dDiagnostics_dCommon Vuna_dCompiler_dCanonical_dAst Vuna_dCompiler_dDiagnostics_dSink Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dDriver_dGraph Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dDiagnostics_dWarning Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCanonical_dCoreTerm Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dDiag_dFormat Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dCanonical_dLex Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dData Vuna_dCompiler_dCodegen_dSplit Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dDriver_dCompilerCli Main "
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
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore Vuna_runtime)" > "Vuna_dCompiler_dCore.stamp"
  printf '%s' "$(stamp_want Base_dApplicative Vuna_runtime)" > "Base_dApplicative.stamp"
  printf '%s' "$(stamp_want Base_dFromString Vuna_runtime)" > "Base_dFromString.stamp"
  printf '%s' "$(stamp_want Base_dTraversable Vuna_runtime)" > "Base_dTraversable.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dVersion Vuna_runtime)" > "Vuna_dCompiler_dVersion.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader Vuna_runtime)" > "Vuna_dCompiler_dLoader.stamp"
  printf '%s' "$(stamp_want Base_dHashable Vuna_runtime)" > "Base_dHashable.stamp"
  printf '%s' "$(stamp_want Base_dMonad Vuna_runtime)" > "Base_dMonad.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen Vuna_runtime)" > "Vuna_dCompiler_dCodegen.stamp"
  printf '%s' "$(stamp_want Base_dBits Vuna_runtime)" > "Base_dBits.stamp"
  printf '%s' "$(stamp_want Base_dNum Vuna_runtime)" > "Base_dNum.stamp"
  printf '%s' "$(stamp_want Base_dShow Vuna_runtime)" > "Base_dShow.stamp"
  printf '%s' "$(stamp_want Base_dMonoid Vuna_runtime)" > "Base_dMonoid.stamp"
  printf '%s' "$(stamp_want Base_dFromInt Vuna_runtime)" > "Base_dFromInt.stamp"
  printf '%s' "$(stamp_want Base_dEq Vuna_runtime)" > "Base_dEq.stamp"
  printf '%s' "$(stamp_want Prelude Vuna_runtime)" > "Prelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab Vuna_runtime)" > "Vuna_dCompiler_dElab.stamp"
  printf '%s' "$(stamp_want Base_dEff Base_dApplicative Vuna_runtime Base_dMonad)" > "Base_dEff.stamp"
  printf '%s' "$(stamp_want Base_dInterp Vuna_runtime Base_dShow)" > "Base_dInterp.stamp"
  printf '%s' "$(stamp_want Base_dBool Vuna_runtime Base_dHashable Base_dShow)" > "Base_dBool.stamp"
  printf '%s' "$(stamp_want Base_dFoldable Vuna_runtime Base_dMonoid)" > "Base_dFoldable.stamp"
  printf '%s' "$(stamp_want Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq)" > "Base_dOrd.stamp"
  printf '%s' "$(stamp_want Base_dUnit Base_dOrd Vuna_runtime Base_dHashable Base_dShow Base_dMonoid Base_dEq)" > "Base_dUnit.stamp"
  printf '%s' "$(stamp_want Base_dFloat Base_dOrd Vuna_runtime Base_dNum Base_dShow Base_dEq)" > "Base_dFloat.stamp"
  printf '%s' "$(stamp_want Base_dPair Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq)" > "Base_dPair.stamp"
  printf '%s' "$(stamp_want Base_dMaybe Base_dOrd Base_dApplicative Vuna_runtime Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMonoid Base_dFoldable Base_dEq)" > "Base_dMaybe.stamp"
  printf '%s' "$(stamp_want Base_dInt Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dEq)" > "Base_dInt.stamp"
  printf '%s' "$(stamp_want Base_dNat Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dMaybe Base_dMonoid Base_dEq)" > "Base_dNat.stamp"
  printf '%s' "$(stamp_want Base_dList Base_dOrd Base_dApplicative Vuna_runtime Base_dPair Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMaybe Base_dMonoid Base_dFoldable Base_dEq)" > "Base_dList.stamp"
  printf '%s' "$(stamp_want Base_dSort Base_dOrd Vuna_runtime Base_dList)" > "Base_dSort.stamp"
  printf '%s' "$(stamp_want Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dTraversable Base_dHashable Base_dMonad Base_dShow Base_dFoldable Base_dEq)" > "Base_dResult.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dIc Vuna_runtime Base_dList)" > "Vuna_dCompiler_dDiagnostics_dIc.stamp"
  printf '%s' "$(stamp_want Base_dArray Vuna_runtime Base_dList Base_dShow Base_dEq)" > "Base_dArray.stamp"
  printf '%s' "$(stamp_want Base_dString Base_dOrd Base_dInterp Vuna_runtime Base_dList Base_dHashable Base_dMonoid Base_dEq)" > "Base_dString.stamp"
  printf '%s' "$(stamp_want Base_dVec Vuna_runtime Base_dList)" > "Base_dVec.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dHash Vuna_runtime Base_dList Base_dPair Base_dBits Base_dNum Base_dInt)" > "Vuna_dCompiler_dHash.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCanonical_dBytes Vuna_runtime Base_dList Base_dPair Base_dMaybe)" > "Vuna_dCompiler_dCanonical_dBytes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dStore Base_dEff Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMonad Base_dMaybe Base_dEq Vuna_dCompiler_dHash)" > "Vuna_dCompiler_dStore.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDiagRender Base_dEff Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe)" > "Vuna_dCompiler_dDriver_dDiagRender.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFingerprint Base_dEff Base_dApplicative Vuna_runtime Vuna_dCompiler_dVersion Base_dMonad Vuna_dCompiler_dHash)" > "Vuna_dCompiler_dFingerprint.stamp"
  printf '%s' "$(stamp_want Base_dHashMap Base_dArray Vuna_runtime Base_dString Base_dList Base_dPair Base_dHashable Base_dShow Base_dMaybe Base_dEq)" > "Base_dHashMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dSource Vuna_runtime Base_dString Base_dList Base_dPair)" > "Vuna_dCompiler_dSource.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Base_dInt Base_dEq Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dDiag.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dQuery Base_dSort Base_dOrd Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dHashMap Base_dEq Vuna_dCompiler_dHash)" > "Vuna_dCompiler_dQuery.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIntrinsics Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dHashMap)" > "Vuna_dCompiler_dIntrinsics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dQuery_dRun Base_dEff Vuna_dCompiler_dStore Vuna_dCompiler_dQuery Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMonad Vuna_dCompiler_dFingerprint Base_dMaybe Base_dHashMap Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes)" > "Vuna_dCompiler_dQuery_dRun.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCommon Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dDiagnostics_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCanonical_dAst Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCanonical_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dSink Vuna_dCompiler_dDiag Vuna_runtime Base_dList)" > "Vuna_dCompiler_dDiagnostics_dSink.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCore_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCommon Base_dEff Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dMonad)" > "Vuna_dCompiler_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dElab_dTermination_dMeasure.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplit Base_dEff Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Base_dHashMap Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes)" > "Vuna_dCompiler_dDriver_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec)" > "Vuna_dCompiler_dFrontend_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dGraph Vuna_dCompiler_dQuery_dRun Vuna_dCompiler_dQuery Vuna_runtime Base_dList Base_dPair)" > "Vuna_dCompiler_dDriver_dGraph.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec Base_dMaybe Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dDiagnostics_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec)" > "Vuna_dCompiler_dDiagnostics_dCg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dElab_dTermination_dScc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dWarning Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dMaybe)" > "Vuna_dCompiler_dDiagnostics_dWarning.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dPerfCache Base_dEff Vuna_dCompiler_dStore Base_dApplicative Vuna_runtime Base_dList Base_dMonad Vuna_dCompiler_dFingerprint Base_dMaybe Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCanonical_dBytes)" > "Vuna_dCompiler_dDriver_dPerfCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec)" > "Vuna_dCompiler_dLoader_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dString Base_dList Base_dPair Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dDiagnostics_dTc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec Base_dMaybe)" > "Vuna_dCompiler_dDiagnostics_dRn.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Base_dEq Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCore_dEval.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCanonical_dCoreTerm Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCanonical_dCoreTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dElab_dMatch.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dElab_dRecords.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dLoader_dFixity.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dElab_dPrelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dSig.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dList Base_dPair Base_dBool Base_dMaybe Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dLexer.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMaybe Base_dEq Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dToml.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dLoader_dExpand.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dElab_dTermination_dScc Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTermination_dMeasure)" > "Vuna_dCompiler_dElab_dTermination.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCore_dConv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dDiagnostics_dIc Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics_dRn)" > "Vuna_dCompiler_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dToml Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMaybe Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dManifest.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dElab_dDerive.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics)" > "Vuna_dCompiler_dElab_dRepresentation.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiag_dFormat Base_dEff Vuna_dCompiler_dDiag Base_dInterp Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dVersion Base_dBool Base_dMonad Base_dMaybe Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dDiag_dFormat.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dCst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCanonical_dLex Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCanonical_dLex.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dElab_dMetaSpans.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dParser_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dMeta.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dPackages_dPkg Base_dEff Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMonad Base_dVec Base_dMaybe Base_dEq Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dPackages_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dBool Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dFrontend_dParser.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dUsage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dModules Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dMonad Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dLoader_dDiagnostics Base_dHashMap Vuna_dCompiler_dDiagnostics_dRn Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dLoader_dModules.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCodegen_dDecl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dDict.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe)" > "Vuna_dCompiler_dElab_dInstName.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCodegen_dErase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dCase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dInstCoherence.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dLoader_dResolve.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_runtime Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCanonical_dCoreTerm)" > "Vuna_dCompiler_dCanonical_dElab.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dDriver_dOwner.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFlatten Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dStore Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dLoader_dExpand Base_dMonad Base_dVec Vuna_dCompiler_dFingerprint Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dCanonical_dLex Base_dHashMap Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dLoader_dFlatten.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Base_dInt Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCanonical_dCoreTerm)" > "Vuna_dCompiler_dDriver_dCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCodegen_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMatch Base_dNat Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTerm_dImpl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dIface Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dStore Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dDriver_dCache Base_dBool Base_dMonad Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCanonical_dCoreTerm)" > "Vuna_dCompiler_dDriver_dIface.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dCodegen_dAssembly.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl)" > "Vuna_dCompiler_dElab_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dData Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dElab_dData.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dSplit Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dCommon Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dSource)" > "Vuna_dCompiler_dCodegen_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Base_dInt Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTrait.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dInt Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dDriver.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDt Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDriver_dPerfCache Base_dHashMap Vuna_dCompiler_dCodegen_dSplit Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dDriver_dDt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompile Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dStore Vuna_dCompiler_dQuery_dRun Vuna_dCompiler_dQuery Base_dInterp Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDriver_dGraph Vuna_dCompiler_dVersion Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDriver_dCache Base_dBool Base_dMonad Vuna_dCompiler_dFingerprint Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dHash Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCanonical_dBytes)" > "Vuna_dCompiler_dDriver_dCompile.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompilerCli Base_dEff Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Vuna_dCompiler_dDiag_dFormat Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dDiagnostics_dSink Base_dPair Vuna_dCompiler_dVersion Base_dBool Base_dMonad Vuna_dCompiler_dDriver_dDiagRender Vuna_dCompiler_dDriver_dDt Base_dMaybe Vuna_dCompiler_dDriver_dCompile Base_dEq)" > "Vuna_dCompiler_dDriver_dCompilerCli.stamp"
  printf '%s' "$(stamp_want Main Base_dEff Vuna_dCompiler_dDriver_dCompilerCli Vuna_runtime Base_dList Base_dMonad)" > "Main.stamp"
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
compile_mod Vuna_dCompiler_dCore Vuna_runtime &
pids="$pids $!"
compile_mod Base_dApplicative Vuna_runtime &
pids="$pids $!"
compile_mod Base_dFromString Vuna_runtime &
pids="$pids $!"
compile_mod Base_dTraversable Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dVersion Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader Vuna_runtime &
pids="$pids $!"
compile_mod Base_dHashable Vuna_runtime &
pids="$pids $!"
compile_mod Base_dMonad Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen Vuna_runtime &
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
compile_mod Base_dEq Vuna_runtime &
pids="$pids $!"
compile_mod Prelude Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dEff Base_dApplicative Vuna_runtime Base_dMonad &
pids="$pids $!"
compile_mod Base_dInterp Vuna_runtime Base_dShow &
pids="$pids $!"
compile_mod Base_dBool Vuna_runtime Base_dHashable Base_dShow &
pids="$pids $!"
compile_mod Base_dFoldable Vuna_runtime Base_dMonoid &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq
pids=""
compile_mod Base_dUnit Base_dOrd Vuna_runtime Base_dHashable Base_dShow Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dFloat Base_dOrd Vuna_runtime Base_dNum Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dPair Base_dOrd Vuna_runtime Base_dHashable Base_dBool Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dMaybe Base_dOrd Base_dApplicative Vuna_runtime Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMonoid Base_dFoldable Base_dEq &
pids="$pids $!"
compile_mod Base_dInt Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dNat Base_dOrd Vuna_runtime Base_dHashable Base_dNum Base_dShow Base_dMaybe Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dList Base_dOrd Base_dApplicative Vuna_runtime Base_dPair Base_dTraversable Base_dHashable Base_dBool Base_dMonad Base_dShow Base_dMaybe Base_dMonoid Base_dFoldable Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dSort Base_dOrd Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dResult Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dTraversable Base_dHashable Base_dMonad Base_dShow Base_dFoldable Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dIc Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dArray Vuna_runtime Base_dList Base_dShow Base_dEq &
pids="$pids $!"
compile_mod Base_dString Base_dOrd Base_dInterp Vuna_runtime Base_dList Base_dHashable Base_dMonoid Base_dEq &
pids="$pids $!"
compile_mod Base_dVec Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dHash Vuna_runtime Base_dList Base_dPair Base_dBits Base_dNum Base_dInt &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCanonical_dBytes Vuna_runtime Base_dList Base_dPair Base_dMaybe &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dStore Base_dEff Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMonad Base_dMaybe Base_dEq Vuna_dCompiler_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dDiagRender Base_dEff Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFingerprint Base_dEff Base_dApplicative Vuna_runtime Vuna_dCompiler_dVersion Base_dMonad Vuna_dCompiler_dHash &
pids="$pids $!"
compile_mod Base_dHashMap Base_dArray Vuna_runtime Base_dString Base_dList Base_dPair Base_dHashable Base_dShow Base_dMaybe Base_dEq &
pids="$pids $!"
compile_mod Vuna_dCompiler_dSource Vuna_runtime Base_dString Base_dList Base_dPair &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Base_dInt Base_dEq Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dQuery Base_dSort Base_dOrd Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dHashMap Base_dEq Vuna_dCompiler_dHash &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIntrinsics Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Base_dHashMap &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dQuery_dRun Base_dEff Vuna_dCompiler_dStore Vuna_dCompiler_dQuery Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Base_dMonad Vuna_dCompiler_dFingerprint Base_dMaybe Base_dHashMap Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCommon Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCanonical_dAst Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dSink Vuna_dCompiler_dDiag Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCommon Base_dEff Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dList Base_dPair Base_dMonad &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dSplit Base_dEff Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dMonad Base_dMaybe Base_dHashMap Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dGraph Vuna_dCompiler_dQuery_dRun Vuna_dCompiler_dQuery Vuna_runtime Base_dList Base_dPair &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec Base_dMaybe Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dWarning Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dPerfCache Base_dEff Vuna_dCompiler_dStore Base_dApplicative Vuna_runtime Base_dList Base_dMonad Vuna_dCompiler_dFingerprint Base_dMaybe Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCanonical_dBytes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dString Base_dList Base_dPair Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dVec Base_dMaybe &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Base_dEq Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCanonical_dCoreTerm Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dDiag Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dList Base_dPair Base_dBool Base_dMaybe Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMaybe Base_dEq Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dExpand Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dElab_dTermination_dScc Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTermination_dMeasure &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dDiag Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dHashMap Base_dInt Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dDiagnostics_dIc Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics_dRn &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dToml Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMaybe Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiag_dFormat Base_dEff Vuna_dCompiler_dDiag Base_dInterp Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dVersion Base_dBool Base_dMonad Base_dMaybe Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dCst Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCanonical_dLex Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMetaSpans Vuna_runtime Base_dList Base_dPair Base_dMaybe Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dSource &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dPackages_dPkg Base_dEff Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dPkg Base_dMonad Base_dVec Base_dMaybe Base_dEq Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dBool Base_dVec Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dSource &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dModules Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dList Base_dPair Base_dMonad Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dLoader_dDiagnostics Base_dHashMap Vuna_dCompiler_dDiagnostics_dRn Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dDiag Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_runtime Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCanonical_dCoreTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dSource &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dFlatten Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dStore Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dLoader_dExpand Base_dMonad Base_dVec Vuna_dCompiler_dFingerprint Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dCanonical_dLex Base_dHashMap Vuna_dCompiler_dDiagnostics_dRn Vuna_dCompiler_dCommon Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dCore_dTerm Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Base_dInt Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCanonical_dCoreTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dRepresentation Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMatch Base_dNat Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dDriver_dIface Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dStore Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dDriver_dCache Base_dBool Base_dMonad Vuna_dCompiler_dCanonical_dElab Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Base_dInt Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dHash Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCanonical_dCoreTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Vuna_runtime Base_dList Base_dPair Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dDecl Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm Vuna_runtime Base_dMaybe Vuna_dCompiler_dElab_dTerm_dImpl &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dData Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dRepresentation Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dSplit Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dCodegen_dErase Base_dApplicative Vuna_runtime Base_dString Base_dList Base_dPair Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dCommon Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dSource &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dMeta Base_dInterp Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dDict Base_dInt Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dConv Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dMetaSpans Vuna_dCompiler_dElab_dDict Base_dInt Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval
compile_mod Vuna_dCompiler_dDriver_dDt Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dCanonical_dAst Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dFrontend_dParser Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dLoader_dModules Base_dPair Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dMonad Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCore_dTerm Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dDiagnostics_dWarning Base_dMaybe Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dDriver_dPerfCache Base_dHashMap Vuna_dCompiler_dCodegen_dSplit Base_dEq Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dCanonical_dBytes Vuna_dCompiler_dSource Vuna_dCompiler_dCore_dEval
compile_mod Vuna_dCompiler_dDriver_dCompile Base_dEff Vuna_dCompiler_dDiag Vuna_dCompiler_dStore Vuna_dCompiler_dQuery_dRun Vuna_dCompiler_dQuery Base_dInterp Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_dCompiler_dDriver_dIface Vuna_runtime Base_dString Base_dList Base_dPair Vuna_dCompiler_dDriver_dGraph Vuna_dCompiler_dVersion Vuna_dCompiler_dDiagnostics_dPkg Vuna_dCompiler_dDriver_dCache Base_dBool Base_dMonad Vuna_dCompiler_dFingerprint Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dFrontend_dAst Base_dMaybe Base_dEq Vuna_dCompiler_dHash Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCanonical_dBytes
compile_mod Vuna_dCompiler_dDriver_dCompilerCli Base_dEff Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dDiag Vuna_dCompiler_dDiag_dFormat Vuna_dCompiler_dPackages_dPkg Base_dApplicative Vuna_runtime Base_dString Base_dList Vuna_dCompiler_dDiagnostics_dSink Base_dPair Vuna_dCompiler_dVersion Base_dBool Base_dMonad Vuna_dCompiler_dDriver_dDiagRender Vuna_dCompiler_dDriver_dDt Base_dMaybe Vuna_dCompiler_dDriver_dCompile Base_dEq
compile_mod Main Base_dEff Vuna_dCompiler_dDriver_dCompilerCli Vuna_runtime Base_dList Base_dMonad
ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa Vuna_runtime.cmx Vuna_dCompiler_dCore.cmx Base_dApplicative.cmx Base_dFromString.cmx Base_dTraversable.cmx Vuna_dCompiler_dVersion.cmx Vuna_dCompiler_dLoader.cmx Base_dHashable.cmx Base_dMonad.cmx Vuna_dCompiler_dCodegen.cmx Base_dBits.cmx Base_dNum.cmx Base_dShow.cmx Base_dMonoid.cmx Base_dFromInt.cmx Base_dEq.cmx Prelude.cmx Vuna_dCompiler_dElab.cmx Base_dEff.cmx Base_dInterp.cmx Base_dBool.cmx Base_dFoldable.cmx Base_dOrd.cmx Base_dUnit.cmx Base_dFloat.cmx Base_dPair.cmx Base_dMaybe.cmx Base_dInt.cmx Base_dNat.cmx Base_dList.cmx Base_dSort.cmx Base_dResult.cmx Vuna_dCompiler_dDiagnostics_dIc.cmx Base_dArray.cmx Base_dString.cmx Base_dVec.cmx Vuna_dCompiler_dHash.cmx Vuna_dCompiler_dCanonical_dBytes.cmx Vuna_dCompiler_dStore.cmx Vuna_dCompiler_dDriver_dDiagRender.cmx Vuna_dCompiler_dFingerprint.cmx Base_dHashMap.cmx Vuna_dCompiler_dSource.cmx Vuna_dCompiler_dDiag.cmx Vuna_dCompiler_dQuery.cmx Vuna_dCompiler_dFrontend_dAst.cmx Vuna_dCompiler_dIntrinsics.cmx Vuna_dCompiler_dQuery_dRun.cmx Vuna_dCompiler_dDiagnostics_dCommon.cmx Vuna_dCompiler_dCanonical_dAst.cmx Vuna_dCompiler_dDiagnostics_dSink.cmx Vuna_dCompiler_dCore_dTerm.cmx Vuna_dCompiler_dCommon.cmx Vuna_dCompiler_dElab_dTermination_dMeasure.cmx Vuna_dCompiler_dDriver_dSplit.cmx Vuna_dCompiler_dFrontend_dDiagnostics.cmx Vuna_dCompiler_dDriver_dGraph.cmx Vuna_dCompiler_dDiagnostics_dPkg.cmx Vuna_dCompiler_dDiagnostics_dCg.cmx Vuna_dCompiler_dElab_dTermination_dScc.cmx Vuna_dCompiler_dDiagnostics_dWarning.cmx Vuna_dCompiler_dDriver_dPerfCache.cmx Vuna_dCompiler_dLoader_dDiagnostics.cmx Vuna_dCompiler_dDiagnostics_dTc.cmx Vuna_dCompiler_dDiagnostics_dRn.cmx Vuna_dCompiler_dCore_dEval.cmx Vuna_dCompiler_dCanonical_dCoreTerm.cmx Vuna_dCompiler_dElab_dMatch.cmx Vuna_dCompiler_dElab_dRecords.cmx Vuna_dCompiler_dLoader_dFixity.cmx Vuna_dCompiler_dElab_dPrelude.cmx Vuna_dCompiler_dElab_dSig.cmx Vuna_dCompiler_dFrontend_dLexer.cmx Vuna_dCompiler_dFrontend_dToml.cmx Vuna_dCompiler_dLoader_dExpand.cmx Vuna_dCompiler_dElab_dTermination.cmx Vuna_dCompiler_dCore_dConv.cmx Vuna_dCompiler_dElab_dTypes.cmx Vuna_dCompiler_dDiagnostics.cmx Vuna_dCompiler_dFrontend_dManifest.cmx Vuna_dCompiler_dElab_dDerive.cmx Vuna_dCompiler_dElab_dRepresentation.cmx Vuna_dCompiler_dDiag_dFormat.cmx Vuna_dCompiler_dFrontend_dCst.cmx Vuna_dCompiler_dCanonical_dLex.cmx Vuna_dCompiler_dElab_dMetaSpans.cmx Vuna_dCompiler_dFrontend_dParser_dSupport.cmx Vuna_dCompiler_dElab_dMeta.cmx Vuna_dCompiler_dPackages_dPkg.cmx Vuna_dCompiler_dFrontend_dParser.cmx Vuna_dCompiler_dElab_dUsage.cmx Vuna_dCompiler_dLoader_dModules.cmx Vuna_dCompiler_dElab_dTerm_dSupport.cmx Vuna_dCompiler_dCodegen_dDecl.cmx Vuna_dCompiler_dElab_dDict.cmx Vuna_dCompiler_dElab_dInstName.cmx Vuna_dCompiler_dCodegen_dErase.cmx Vuna_dCompiler_dElab_dCase.cmx Vuna_dCompiler_dElab_dInstCoherence.cmx Vuna_dCompiler_dLoader_dResolve.cmx Vuna_dCompiler_dCanonical_dElab.cmx Vuna_dCompiler_dDriver_dOwner.cmx Vuna_dCompiler_dLoader_dFlatten.cmx Vuna_dCompiler_dDriver_dCache.cmx Vuna_dCompiler_dCodegen_dTerm.cmx Vuna_dCompiler_dElab_dTerm_dImpl.cmx Vuna_dCompiler_dDriver_dIface.cmx Vuna_dCompiler_dCodegen_dAssembly.cmx Vuna_dCompiler_dElab_dTerm.cmx Vuna_dCompiler_dElab_dData.cmx Vuna_dCompiler_dCodegen_dSplit.cmx Vuna_dCompiler_dElab_dTrait.cmx Vuna_dCompiler_dElab_dDriver.cmx Vuna_dCompiler_dDriver_dDt.cmx Vuna_dCompiler_dDriver_dCompile.cmx Vuna_dCompiler_dDriver_dCompilerCli.cmx Main.cmx $C_OBJS
echo "built $OUT"
