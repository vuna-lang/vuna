#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（C35：按直接依赖分层并行 + 内容哈希增量）。用法: ./build.sh [OUT]
# 干净构建：一次 ocamlopt 编译全部 .mli/.ml 并链接；
# 增量构建：每单元 .ml/.mli 与直接依赖 .stamp 的内容哈希写 $base.stamp，命中即跳过；
# 同层单元互不依赖：多单元层用后台任务并行编译，层间用 wait 串行。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
MODULES="Vuna_runtime Vuna_dCompiler_dCodegen Base_dPair Base_dMonad Base_dEq Vuna_dCompiler_dCore Vuna_dCompiler_dVersion Base_dOrd Prelude Base_dBool Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dLoader Vuna_dCompiler_dElab Base_dShow Base_dInt Base_dInterp Base_dMaybe Base_dNat Base_dList Base_dResult Base_dArray Base_dIO Base_dString Base_dVec Base_dIntMap Vuna_dCompiler_dDriver_dPerfCache Vuna_dCompiler_dCommon Vuna_dCompiler_dDriver_dDiagRender Vuna_dCompiler_dFrontend_dDiagnostics Base_dHashMap Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dDiagnostics_dCommon Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dFrontend_dManifest Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dUsage Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dDriver_dIface Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dElab_dData Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dCodegen_dSplit Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dDriver_dCompilerCli Main "
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
if [ "$clean" -eq 1 ]; then
  SOURCES=""
  for m in $MODULES; do
    if [ -f "$m.mli" ]; then SOURCES="$SOURCES $m.mli"; fi
    SOURCES="$SOURCES $m.ml"
  done
  ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa $SOURCES $C_OBJS
  printf '%s' "$(stamp_want Vuna_runtime)" > "Vuna_runtime.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen Vuna_runtime)" > "Vuna_dCompiler_dCodegen.stamp"
  printf '%s' "$(stamp_want Base_dPair Vuna_runtime)" > "Base_dPair.stamp"
  printf '%s' "$(stamp_want Base_dMonad Vuna_runtime)" > "Base_dMonad.stamp"
  printf '%s' "$(stamp_want Base_dEq Vuna_runtime)" > "Base_dEq.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore Vuna_runtime)" > "Vuna_dCompiler_dCore.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dVersion Vuna_runtime)" > "Vuna_dCompiler_dVersion.stamp"
  printf '%s' "$(stamp_want Base_dOrd Vuna_runtime)" > "Base_dOrd.stamp"
  printf '%s' "$(stamp_want Prelude Vuna_runtime)" > "Prelude.stamp"
  printf '%s' "$(stamp_want Base_dBool Vuna_runtime)" > "Base_dBool.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics Vuna_runtime)" > "Vuna_dCompiler_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader Vuna_runtime)" > "Vuna_dCompiler_dLoader.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab Vuna_runtime)" > "Vuna_dCompiler_dElab.stamp"
  printf '%s' "$(stamp_want Base_dShow Vuna_runtime)" > "Base_dShow.stamp"
  printf '%s' "$(stamp_want Base_dInt Base_dEq Vuna_runtime Base_dOrd)" > "Base_dInt.stamp"
  printf '%s' "$(stamp_want Base_dInterp Vuna_runtime Base_dShow)" > "Base_dInterp.stamp"
  printf '%s' "$(stamp_want Base_dMaybe Base_dMonad Vuna_runtime)" > "Base_dMaybe.stamp"
  printf '%s' "$(stamp_want Base_dNat Base_dEq Base_dMaybe Vuna_runtime Base_dOrd Base_dShow)" > "Base_dNat.stamp"
  printf '%s' "$(stamp_want Base_dList Base_dPair Base_dMonad Base_dEq Base_dMaybe Vuna_runtime)" > "Base_dList.stamp"
  printf '%s' "$(stamp_want Base_dResult Base_dPair Base_dList Vuna_runtime)" > "Base_dResult.stamp"
  printf '%s' "$(stamp_want Base_dArray Base_dList Vuna_runtime)" > "Base_dArray.stamp"
  printf '%s' "$(stamp_want Base_dIO Base_dMonad Base_dList Vuna_runtime)" > "Base_dIO.stamp"
  printf '%s' "$(stamp_want Base_dString Base_dEq Base_dList Vuna_runtime Base_dOrd)" > "Base_dString.stamp"
  printf '%s' "$(stamp_want Base_dVec Base_dList Vuna_runtime)" > "Base_dVec.stamp"
  printf '%s' "$(stamp_want Base_dIntMap Base_dPair Base_dArray Base_dList Base_dMaybe Vuna_runtime)" > "Base_dIntMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dPerfCache Base_dPair Base_dIO Base_dString Base_dList Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Base_dBool)" > "Vuna_dCompiler_dDriver_dPerfCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCommon Base_dPair Base_dString Base_dList Vuna_runtime)" > "Vuna_dCompiler_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDiagRender Base_dPair Base_dIO Base_dString Base_dList Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dDriver_dDiagRender.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dDiagnostics Base_dResult Base_dList Vuna_runtime Base_dVec)" > "Vuna_dCompiler_dFrontend_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Base_dHashMap Base_dPair Base_dArray Base_dList Base_dMaybe Vuna_runtime)" > "Base_dHashMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dDiagnostics Base_dResult Base_dList Vuna_runtime Base_dVec)" > "Vuna_dCompiler_dLoader_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dToml Base_dPair Base_dResult Base_dEq Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dFrontend_dToml.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDebug Base_dIO Base_dList Vuna_runtime Base_dHashMap)" > "Vuna_dCompiler_dDebug.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplit Base_dPair Base_dResult Base_dIO Base_dString Base_dList Base_dMaybe Vuna_runtime Base_dHashMap)" > "Vuna_dCompiler_dDriver_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dAst Base_dPair Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dFrontend_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dLexer Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dDiagnostics Base_dBool)" > "Vuna_dCompiler_dFrontend_dLexer.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCommon Base_dResult Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Base_dVec)" > "Vuna_dCompiler_dDiagnostics_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIntrinsics Base_dPair Base_dList Base_dMaybe Vuna_runtime Base_dHashMap)" > "Vuna_dCompiler_dIntrinsics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dTerm Base_dPair Base_dIntMap Base_dList Base_dMaybe Vuna_runtime Base_dHashMap)" > "Vuna_dCompiler_dCore_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dEval Base_dPair Base_dIntMap Base_dEq Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCore_dEval.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser_dSupport Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dDiagnostics)" > "Vuna_dCompiler_dFrontend_dParser_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDerive Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_runtime)" > "Vuna_dCompiler_dElab_dDerive.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFixity Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dLoader_dFixity.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dTc Base_dResult Base_dList Vuna_runtime Base_dVec Vuna_dCompiler_dDiagnostics_dCommon)" > "Vuna_dCompiler_dDiagnostics_dTc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dMeasure Base_dPair Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dHashMap)" > "Vuna_dCompiler_dElab_dTermination_dMeasure.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCg Base_dResult Base_dList Vuna_runtime Base_dVec Vuna_dCompiler_dDiagnostics_dCommon)" > "Vuna_dCompiler_dDiagnostics_dCg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRecords Base_dPair Base_dResult Base_dEq Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dElab_dRecords.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dManifest Base_dPair Vuna_dCompiler_dFrontend_dToml Base_dResult Base_dEq Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dFrontend_dManifest.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTypes Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMatch Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec)" > "Vuna_dCompiler_dElab_dMatch.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dSig Base_dPair Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dSig.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dScc Base_dPair Base_dResult Base_dEq Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dTermination_dMeasure)" > "Vuna_dCompiler_dElab_dTermination_dScc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser Base_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dDiagnostics Base_dVec Base_dBool)" > "Vuna_dCompiler_dFrontend_dParser.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dPrelude Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dPrelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dConv Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDebug Base_dString Base_dList Base_dMaybe Vuna_runtime Base_dBool Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCore_dConv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dPackages_dPkg Base_dPair Base_dResult Base_dEq Base_dIO Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dManifest)" > "Vuna_dCompiler_dPackages_dPkg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDebug Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dElab_dTermination_dMeasure Base_dVec Base_dHashMap)" > "Vuna_dCompiler_dElab_dTermination.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dModules Base_dPair Base_dResult Base_dEq Base_dIO Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dLoader_dDiagnostics)" > "Vuna_dCompiler_dLoader_dModules.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dDecl Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCodegen_dDecl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMeta Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dSig Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dMeta.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dUsage.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstName Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta)" > "Vuna_dCompiler_dElab_dInstName.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCache Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dDriver_dCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCase Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec Base_dBool Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dCase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dSupport Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dTerm_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDict Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dDict.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dResolve Base_dPair Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dIntrinsics Base_dHashMap)" > "Vuna_dCompiler_dLoader_dResolve.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstCoherence Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dInstCoherence.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dImpl Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dDebug Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dTerm_dImpl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiagnostics_dCg Base_dBool Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCodegen_dErase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dOwner Base_dPair Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dDerive Base_dResult Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime)" > "Vuna_dCompiler_dDriver_dOwner.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFlatten Base_dPair Vuna_dCompiler_dLoader_dFixity Base_dResult Base_dIO Vuna_dCompiler_dDebug Base_dString Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dFrontend_dParser Base_dBool Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dLoader_dDiagnostics)" > "Vuna_dCompiler_dLoader_dFlatten.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dIface Base_dPair Base_dIntMap Base_dResult Base_dIO Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dRecords Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dDriver_dIface.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dTerm_dImpl Vuna_runtime)" > "Vuna_dCompiler_dElab_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dTerm Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Base_dVec Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCodegen_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dData Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dTerm Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Base_dBool Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dData.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dAssembly Base_dPair Base_dResult Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dDiagnostics_dCg)" > "Vuna_dCompiler_dCodegen_dAssembly.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTrait Base_dPair Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dInstName Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dDebug Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dSig Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dTrait.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Vuna_dCompiler_dElab_dDerive Base_dResult Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dData Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dTrait Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dDriver.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dSplit Base_dPair Base_dResult Vuna_dCompiler_dElab_dTypes Base_dString Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dHashMap)" > "Vuna_dCompiler_dCodegen_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDt Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dIface Base_dIO Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dPerfCache Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCodegen_dSplit Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dLoader_dFlatten Base_dHashMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dDriver_dDt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompile Base_dPair Base_dResult Vuna_dCompiler_dDriver_dIface Base_dIO Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dDt Base_dString Vuna_dCompiler_dDriver_dSplit Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dLoader_dFlatten)" > "Vuna_dCompiler_dDriver_dCompile.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompilerCli Base_dPair Base_dResult Vuna_dCompiler_dDriver_dCompile Base_dIO Vuna_dCompiler_dDriver_dDt Base_dString Base_dList Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Vuna_dCompiler_dDriver_dDiagRender Base_dBool Vuna_dCompiler_dPackages_dPkg)" > "Vuna_dCompiler_dDriver_dCompilerCli.stamp"
  printf '%s' "$(stamp_want Main Base_dMonad Vuna_dCompiler_dDriver_dCompilerCli Base_dIO Vuna_runtime)" > "Main.stamp"
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
compile_mod Vuna_dCompiler_dCodegen Vuna_runtime &
pids="$pids $!"
compile_mod Base_dPair Vuna_runtime &
pids="$pids $!"
compile_mod Base_dMonad Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEq Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dVersion Vuna_runtime &
pids="$pids $!"
compile_mod Base_dOrd Vuna_runtime &
pids="$pids $!"
compile_mod Prelude Vuna_runtime &
pids="$pids $!"
compile_mod Base_dBool Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab Vuna_runtime &
pids="$pids $!"
compile_mod Base_dShow Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dInt Base_dEq Vuna_runtime Base_dOrd &
pids="$pids $!"
compile_mod Base_dInterp Vuna_runtime Base_dShow &
pids="$pids $!"
compile_mod Base_dMaybe Base_dMonad Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dNat Base_dEq Base_dMaybe Vuna_runtime Base_dOrd Base_dShow &
pids="$pids $!"
compile_mod Base_dList Base_dPair Base_dMonad Base_dEq Base_dMaybe Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dResult Base_dPair Base_dList Vuna_runtime &
pids="$pids $!"
compile_mod Base_dArray Base_dList Vuna_runtime &
pids="$pids $!"
compile_mod Base_dIO Base_dMonad Base_dList Vuna_runtime &
pids="$pids $!"
compile_mod Base_dString Base_dEq Base_dList Vuna_runtime Base_dOrd &
pids="$pids $!"
compile_mod Base_dVec Base_dList Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dIntMap Base_dPair Base_dArray Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dPerfCache Base_dPair Base_dIO Base_dString Base_dList Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Base_dBool &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCommon Base_dPair Base_dString Base_dList Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dDiagRender Base_dPair Base_dIO Base_dString Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dDiagnostics Base_dResult Base_dList Vuna_runtime Base_dVec &
pids="$pids $!"
compile_mod Base_dHashMap Base_dPair Base_dArray Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dDiagnostics Base_dResult Base_dList Vuna_runtime Base_dVec &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dToml Base_dPair Base_dResult Base_dEq Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDebug Base_dIO Base_dList Vuna_runtime Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dSplit Base_dPair Base_dResult Base_dIO Base_dString Base_dList Base_dMaybe Vuna_runtime Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dAst Base_dPair Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dLexer Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dDiagnostics Base_dBool &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCommon Base_dResult Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIntrinsics Base_dPair Base_dList Base_dMaybe Vuna_runtime Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dTerm Base_dPair Base_dIntMap Base_dList Base_dMaybe Vuna_runtime Base_dHashMap &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dCore_dEval Base_dPair Base_dIntMap Base_dEq Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser_dSupport Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dDiagnostics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDerive Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFixity Base_dPair Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dTc Base_dResult Base_dList Vuna_runtime Base_dVec Vuna_dCompiler_dDiagnostics_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dMeasure Base_dPair Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCg Base_dResult Base_dList Vuna_runtime Base_dVec Vuna_dCompiler_dDiagnostics_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRecords Base_dPair Base_dResult Base_dEq Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dManifest Base_dPair Vuna_dCompiler_dFrontend_dToml Base_dResult Base_dEq Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dTypes Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMatch Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dSig Base_dPair Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dScc Base_dPair Base_dResult Base_dEq Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dTermination_dMeasure &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser Base_dPair Vuna_dCompiler_dFrontend_dParser_dSupport Base_dResult Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dDiagnostics Base_dVec Base_dBool &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dPrelude Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dConv Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDebug Base_dString Base_dList Base_dMaybe Vuna_runtime Base_dBool Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dPackages_dPkg Base_dPair Base_dResult Base_dEq Base_dIO Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dManifest &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dTermination Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDebug Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dElab_dTermination_dMeasure Base_dVec Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dModules Base_dPair Base_dResult Base_dEq Base_dIO Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dLoader_dDiagnostics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dDecl Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMeta Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dSig Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstName Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dCache Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCase Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec Base_dBool Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dSupport Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDict Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dResolve Base_dPair Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dIntrinsics Base_dHashMap &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dInstCoherence Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dImpl Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dDebug Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dList Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiagnostics_dCg Base_dBool Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dOwner Base_dPair Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dDerive Base_dResult Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFlatten Base_dPair Vuna_dCompiler_dLoader_dFixity Base_dResult Base_dIO Vuna_dCompiler_dDebug Base_dString Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dFrontend_dParser Base_dBool Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dLoader_dDiagnostics &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dDriver_dIface Base_dPair Base_dIntMap Base_dResult Base_dIO Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dRecords Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dTerm_dImpl Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dTerm Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Vuna_dCompiler_dElab_dTypes Base_dString Vuna_dCompiler_dCommon Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Base_dVec Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dIntrinsics Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dData Base_dPair Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dTerm Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dPrelude Base_dBool Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dAssembly Base_dPair Base_dResult Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Base_dList Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dDiagnostics_dCg &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTrait Base_dPair Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dInstName Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dInstCoherence Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dDebug Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon Vuna_dCompiler_dElab_dSig Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab_dUsage Base_dPair Vuna_dCompiler_dCore_dEval Base_dIntMap Vuna_dCompiler_dElab_dDerive Base_dResult Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDebug Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Base_dVec Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dData Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dTrait Base_dHashMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dSplit Base_dPair Base_dResult Vuna_dCompiler_dElab_dTypes Base_dString Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCommon Base_dList Vuna_dCompiler_dFrontend_dAst Base_dMaybe Vuna_runtime Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dDriver_dOwner Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dTerm Base_dBool Vuna_dCompiler_dCodegen_dAssembly Base_dHashMap &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dDriver_dDt Base_dPair Vuna_dCompiler_dCore_dEval Base_dResult Base_dEq Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dDriver_dIface Base_dIO Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dPerfCache Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCodegen_dSplit Base_dMaybe Vuna_runtime Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dDiagnostics_dCg Base_dBool Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dLoader_dFlatten Base_dHashMap Vuna_dCompiler_dCore_dTerm
compile_mod Vuna_dCompiler_dDriver_dCompile Base_dPair Base_dResult Vuna_dCompiler_dDriver_dIface Base_dIO Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dDt Base_dString Vuna_dCompiler_dDriver_dSplit Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Base_dBool Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dLoader_dFlatten
compile_mod Vuna_dCompiler_dDriver_dCompilerCli Base_dPair Base_dResult Vuna_dCompiler_dDriver_dCompile Base_dIO Vuna_dCompiler_dDriver_dDt Base_dString Base_dList Vuna_dCompiler_dVersion Base_dMaybe Vuna_runtime Vuna_dCompiler_dDriver_dDiagRender Base_dBool Vuna_dCompiler_dPackages_dPkg
compile_mod Main Base_dMonad Vuna_dCompiler_dDriver_dCompilerCli Base_dIO Vuna_runtime
ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa Vuna_runtime.cmx Vuna_dCompiler_dCodegen.cmx Base_dPair.cmx Base_dMonad.cmx Base_dEq.cmx Vuna_dCompiler_dCore.cmx Vuna_dCompiler_dVersion.cmx Base_dOrd.cmx Prelude.cmx Base_dBool.cmx Vuna_dCompiler_dDiagnostics.cmx Vuna_dCompiler_dLoader.cmx Vuna_dCompiler_dElab.cmx Base_dShow.cmx Base_dInt.cmx Base_dInterp.cmx Base_dMaybe.cmx Base_dNat.cmx Base_dList.cmx Base_dResult.cmx Base_dArray.cmx Base_dIO.cmx Base_dString.cmx Base_dVec.cmx Base_dIntMap.cmx Vuna_dCompiler_dDriver_dPerfCache.cmx Vuna_dCompiler_dCommon.cmx Vuna_dCompiler_dDriver_dDiagRender.cmx Vuna_dCompiler_dFrontend_dDiagnostics.cmx Base_dHashMap.cmx Vuna_dCompiler_dLoader_dDiagnostics.cmx Vuna_dCompiler_dFrontend_dToml.cmx Vuna_dCompiler_dDebug.cmx Vuna_dCompiler_dDriver_dSplit.cmx Vuna_dCompiler_dFrontend_dAst.cmx Vuna_dCompiler_dFrontend_dLexer.cmx Vuna_dCompiler_dDiagnostics_dCommon.cmx Vuna_dCompiler_dIntrinsics.cmx Vuna_dCompiler_dCore_dTerm.cmx Vuna_dCompiler_dCore_dEval.cmx Vuna_dCompiler_dFrontend_dParser_dSupport.cmx Vuna_dCompiler_dElab_dDerive.cmx Vuna_dCompiler_dLoader_dFixity.cmx Vuna_dCompiler_dDiagnostics_dTc.cmx Vuna_dCompiler_dElab_dTermination_dMeasure.cmx Vuna_dCompiler_dDiagnostics_dCg.cmx Vuna_dCompiler_dElab_dRecords.cmx Vuna_dCompiler_dFrontend_dManifest.cmx Vuna_dCompiler_dElab_dTypes.cmx Vuna_dCompiler_dElab_dMatch.cmx Vuna_dCompiler_dElab_dSig.cmx Vuna_dCompiler_dElab_dTermination_dScc.cmx Vuna_dCompiler_dFrontend_dParser.cmx Vuna_dCompiler_dElab_dPrelude.cmx Vuna_dCompiler_dCore_dConv.cmx Vuna_dCompiler_dPackages_dPkg.cmx Vuna_dCompiler_dElab_dTermination.cmx Vuna_dCompiler_dLoader_dModules.cmx Vuna_dCompiler_dCodegen_dDecl.cmx Vuna_dCompiler_dElab_dMeta.cmx Vuna_dCompiler_dElab_dUsage.cmx Vuna_dCompiler_dElab_dInstName.cmx Vuna_dCompiler_dDriver_dCache.cmx Vuna_dCompiler_dElab_dCase.cmx Vuna_dCompiler_dElab_dTerm_dSupport.cmx Vuna_dCompiler_dElab_dDict.cmx Vuna_dCompiler_dLoader_dResolve.cmx Vuna_dCompiler_dElab_dInstCoherence.cmx Vuna_dCompiler_dElab_dTerm_dImpl.cmx Vuna_dCompiler_dCodegen_dErase.cmx Vuna_dCompiler_dDriver_dOwner.cmx Vuna_dCompiler_dLoader_dFlatten.cmx Vuna_dCompiler_dDriver_dIface.cmx Vuna_dCompiler_dElab_dTerm.cmx Vuna_dCompiler_dCodegen_dTerm.cmx Vuna_dCompiler_dElab_dData.cmx Vuna_dCompiler_dCodegen_dAssembly.cmx Vuna_dCompiler_dElab_dTrait.cmx Vuna_dCompiler_dElab_dDriver.cmx Vuna_dCompiler_dCodegen_dSplit.cmx Vuna_dCompiler_dDriver_dDt.cmx Vuna_dCompiler_dDriver_dCompile.cmx Vuna_dCompiler_dDriver_dCompilerCli.cmx Main.cmx $C_OBJS
echo "built $OUT"
