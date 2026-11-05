#!/bin/sh
# 由 vuna 生成：分离编译构建脚本（C35：按直接依赖分层并行 + 内容哈希增量）。用法: ./build.sh [OUT]
# 干净构建：一次 ocamlopt 编译全部 .mli/.ml 并链接；
# 增量构建：每单元 .ml/.mli 与直接依赖 .stamp 的内容哈希写 $base.stamp，命中即跳过；
# 同层单元互不依赖：多单元层用后台任务并行编译，层间用 wait 串行。
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
MODULES="Vuna_runtime Base_dPair Base_dBool Base_dMonad Base_dMaybe Base_dEq Base_dOrd Base_dInt Base_dShow Base_dNat Base_dList Base_dResult Base_dString Prelude Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dToml Vuna_dCompiler_dFrontend_dManifest Base_dIO Vuna_dCompiler_dPackages_dPkg Base_dArray Base_dHashMap Vuna_dCompiler_dDebug Base_dVec Vuna_dCompiler_dDiagnostics_dCommon Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dDiagnostics Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dLoader_dResolve Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dLoader Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dCore Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm_dSupport Vuna_dCompiler_dElab_dTerm_dImpl Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dElab_dTermination_dScc Vuna_dCompiler_dElab_dTermination Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dElab Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dCodegen_dSplit Vuna_dCompiler_dCodegen Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dVersion Vuna_dCompiler_dDriver_dCompile Vuna_dCompiler_dDriver_dCompilerCli Main "
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
  printf '%s' "$(stamp_want Base_dPair Vuna_runtime)" > "Base_dPair.stamp"
  printf '%s' "$(stamp_want Base_dBool Vuna_runtime)" > "Base_dBool.stamp"
  printf '%s' "$(stamp_want Base_dMonad Vuna_runtime)" > "Base_dMonad.stamp"
  printf '%s' "$(stamp_want Base_dMaybe Vuna_runtime Base_dMonad)" > "Base_dMaybe.stamp"
  printf '%s' "$(stamp_want Base_dEq Vuna_runtime)" > "Base_dEq.stamp"
  printf '%s' "$(stamp_want Base_dOrd Vuna_runtime)" > "Base_dOrd.stamp"
  printf '%s' "$(stamp_want Base_dInt Vuna_runtime Base_dEq Base_dOrd)" > "Base_dInt.stamp"
  printf '%s' "$(stamp_want Base_dShow Vuna_runtime)" > "Base_dShow.stamp"
  printf '%s' "$(stamp_want Base_dNat Vuna_runtime Base_dMaybe Base_dEq Base_dOrd Base_dShow)" > "Base_dNat.stamp"
  printf '%s' "$(stamp_want Base_dList Vuna_runtime Base_dPair Base_dMonad Base_dMaybe Base_dEq)" > "Base_dList.stamp"
  printf '%s' "$(stamp_want Base_dResult Vuna_runtime Base_dPair Base_dList)" > "Base_dResult.stamp"
  printf '%s' "$(stamp_want Base_dString Vuna_runtime Base_dEq Base_dOrd Base_dList)" > "Base_dString.stamp"
  printf '%s' "$(stamp_want Prelude Vuna_runtime)" > "Prelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCommon Vuna_runtime Base_dPair Base_dList Base_dString)" > "Vuna_dCompiler_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dToml Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dFrontend_dToml.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dManifest Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dToml)" > "Vuna_dCompiler_dFrontend_dManifest.stamp"
  printf '%s' "$(stamp_want Base_dIO Vuna_runtime Base_dMonad Base_dList)" > "Base_dIO.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dPackages_dPkg Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dManifest Base_dIO)" > "Vuna_dCompiler_dPackages_dPkg.stamp"
  printf '%s' "$(stamp_want Base_dArray Vuna_runtime Base_dList)" > "Base_dArray.stamp"
  printf '%s' "$(stamp_want Base_dHashMap Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dArray)" > "Base_dHashMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDebug Vuna_runtime Base_dList Base_dIO Base_dHashMap)" > "Vuna_dCompiler_dDebug.stamp"
  printf '%s' "$(stamp_want Base_dVec Vuna_runtime Base_dList)" > "Base_dVec.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec)" > "Vuna_dCompiler_dDiagnostics_dCommon.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dCg Vuna_runtime Base_dList Base_dResult Base_dVec Vuna_dCompiler_dDiagnostics_dCommon)" > "Vuna_dCompiler_dDiagnostics_dCg.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics_dTc Vuna_runtime Base_dList Base_dResult Base_dVec Vuna_dCompiler_dDiagnostics_dCommon)" > "Vuna_dCompiler_dDiagnostics_dTc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDiagnostics Vuna_runtime)" > "Vuna_dCompiler_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dPair Base_dMaybe Base_dList Vuna_dCompiler_dCommon)" > "Vuna_dCompiler_dFrontend_dAst.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dList Base_dResult Base_dVec)" > "Vuna_dCompiler_dFrontend_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dPair Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dDiagnostics)" > "Vuna_dCompiler_dFrontend_dLexer.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer)" > "Vuna_dCompiler_dFrontend_dParser_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dFrontend_dParser Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dParser_dSupport)" > "Vuna_dCompiler_dFrontend_dParser.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dDiagnostics Vuna_runtime Base_dList Base_dResult Base_dVec)" > "Vuna_dCompiler_dLoader_dDiagnostics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFixity Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst)" > "Vuna_dCompiler_dLoader_dFixity.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dModules Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dIO Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dDiagnostics)" > "Vuna_dCompiler_dLoader_dModules.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dIntrinsics Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dHashMap)" > "Vuna_dCompiler_dIntrinsics.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dResolve Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dIntrinsics)" > "Vuna_dCompiler_dLoader_dResolve.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader_dFlatten Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dIO Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dLoader_dResolve)" > "Vuna_dCompiler_dLoader_dFlatten.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dLoader Vuna_runtime)" > "Vuna_dCompiler_dLoader.stamp"
  printf '%s' "$(stamp_want Base_dIntMap Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dArray)" > "Base_dIntMap.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dHashMap Base_dIntMap)" > "Vuna_dCompiler_dCore_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dHashMap Vuna_dCompiler_dIntrinsics Base_dIntMap Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dCore_dEval.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore_dConv Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dCore_dConv.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCore Vuna_runtime)" > "Vuna_dCompiler_dCore.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTypes Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dTypes.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm)" > "Vuna_dCompiler_dElab_dPrelude.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dPair Base_dList Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval)" > "Vuna_dCompiler_dElab_dSig.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig)" > "Vuna_dCompiler_dElab_dMeta.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dCase Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta)" > "Vuna_dCompiler_dElab_dCase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDict Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta)" > "Vuna_dCompiler_dElab_dDict.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dMatch Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst)" > "Vuna_dCompiler_dElab_dMatch.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dSupport Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta)" > "Vuna_dCompiler_dElab_dTerm_dSupport.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm_dImpl Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm_dSupport)" > "Vuna_dCompiler_dElab_dTerm_dImpl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTerm Vuna_runtime Vuna_dCompiler_dElab_dTerm_dImpl)" > "Vuna_dCompiler_dElab_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dData Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dTerm)" > "Vuna_dCompiler_dElab_dData.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dInstName Vuna_runtime Base_dMaybe Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dMeta)" > "Vuna_dCompiler_dElab_dInstName.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTrait Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dInstName)" > "Vuna_dCompiler_dElab_dTrait.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dPair Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst)" > "Vuna_dCompiler_dElab_dDerive.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst)" > "Vuna_dCompiler_dElab_dRecords.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dPair Base_dMaybe Base_dList Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst)" > "Vuna_dCompiler_dElab_dTermination_dMeasure.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTermination_dMeasure)" > "Vuna_dCompiler_dElab_dTermination_dScc.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dTermination Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dHashMap Vuna_dCompiler_dDebug Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dElab_dTermination_dScc)" > "Vuna_dCompiler_dElab_dTermination.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab_dDriver Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dTermination)" > "Vuna_dCompiler_dElab_dDriver.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dElab Vuna_runtime)" > "Vuna_dCompiler_dElab.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dDecl Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dHashMap Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dCodegen_dDecl.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dErase Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dHashMap Base_dVec Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl)" > "Vuna_dCompiler_dCodegen_dErase.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dTerm Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Base_dHashMap Base_dVec Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase)" > "Vuna_dCompiler_dCodegen_dTerm.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dTerm)" > "Vuna_dCompiler_dCodegen_dAssembly.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dSplit Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Base_dHashMap)" > "Vuna_dCompiler_dDriver_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen_dSplit Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dDriver_dSplit)" > "Vuna_dCompiler_dCodegen_dSplit.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dCodegen Vuna_runtime)" > "Vuna_dCompiler_dCodegen.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dDt Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dCodegen_dSplit)" > "Vuna_dCompiler_dDriver_dDt.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCache Vuna_runtime Base_dPair Base_dList Base_dHashMap Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes)" > "Vuna_dCompiler_dDriver_dCache.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dVersion Vuna_runtime)" > "Vuna_dCompiler_dVersion.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompile Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dVersion)" > "Vuna_dCompiler_dDriver_dCompile.stamp"
  printf '%s' "$(stamp_want Vuna_dCompiler_dDriver_dCompilerCli Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dVersion Vuna_dCompiler_dDriver_dCompile)" > "Vuna_dCompiler_dDriver_dCompilerCli.stamp"
  printf '%s' "$(stamp_want Main Vuna_runtime Base_dMonad Base_dIO Vuna_dCompiler_dDriver_dCompilerCli)" > "Main.stamp"
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
compile_mod Base_dPair Vuna_runtime &
pids="$pids $!"
compile_mod Base_dBool Vuna_runtime &
pids="$pids $!"
compile_mod Base_dMonad Vuna_runtime &
pids="$pids $!"
compile_mod Base_dEq Vuna_runtime &
pids="$pids $!"
compile_mod Base_dOrd Vuna_runtime &
pids="$pids $!"
compile_mod Base_dShow Vuna_runtime &
pids="$pids $!"
compile_mod Prelude Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen Vuna_runtime &
pids="$pids $!"
compile_mod Vuna_dCompiler_dVersion Vuna_runtime &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dMaybe Vuna_runtime Base_dMonad &
pids="$pids $!"
compile_mod Base_dInt Vuna_runtime Base_dEq Base_dOrd &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dNat Vuna_runtime Base_dMaybe Base_dEq Base_dOrd Base_dShow &
pids="$pids $!"
compile_mod Base_dList Vuna_runtime Base_dPair Base_dMonad Base_dMaybe Base_dEq &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Base_dResult Vuna_runtime Base_dPair Base_dList &
pids="$pids $!"
compile_mod Base_dString Vuna_runtime Base_dEq Base_dOrd Base_dList &
pids="$pids $!"
compile_mod Base_dIO Vuna_runtime Base_dMonad Base_dList &
pids="$pids $!"
compile_mod Base_dArray Vuna_runtime Base_dList &
pids="$pids $!"
compile_mod Base_dVec Vuna_runtime Base_dList &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dCommon Vuna_runtime Base_dPair Base_dList Base_dString &
pids="$pids $!"
compile_mod Base_dHashMap Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dArray &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dDiagnostics Vuna_runtime Base_dList Base_dResult Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dDiagnostics Vuna_runtime Base_dList Base_dResult Base_dVec &
pids="$pids $!"
compile_mod Base_dIntMap Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dArray &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dToml Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDebug Vuna_runtime Base_dList Base_dIO Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCommon Vuna_runtime Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dAst Vuna_runtime Base_dPair Base_dMaybe Base_dList Vuna_dCompiler_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dLexer Vuna_runtime Base_dPair Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dDiagnostics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dIntrinsics Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dHashMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dTerm Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dHashMap Base_dIntMap &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dSplit Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Base_dHashMap &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dFrontend_dManifest Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dToml &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dCg Vuna_runtime Base_dList Base_dResult Base_dVec Vuna_dCompiler_dDiagnostics_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDiagnostics_dTc Vuna_runtime Base_dList Base_dResult Base_dVec Vuna_dCompiler_dDiagnostics_dCommon &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser_dSupport Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer &
pids="$pids $!"
compile_mod Vuna_dCompiler_dLoader_dFixity Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dEval Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dHashMap Vuna_dCompiler_dIntrinsics Base_dIntMap Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDerive Vuna_runtime Base_dPair Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dRecords Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dAst &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_runtime Base_dPair Base_dMaybe Base_dList Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dPackages_dPkg Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Vuna_dCompiler_dFrontend_dManifest Base_dIO &
pids="$pids $!"
compile_mod Vuna_dCompiler_dFrontend_dParser Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dFrontend_dParser_dSupport &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCore_dConv Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dResult Base_dString Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTypes Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dPrelude Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dSig Vuna_runtime Base_dPair Base_dList Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMatch Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination_dScc Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTermination_dMeasure &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dModules Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dIO Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dDiagnostics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dMeta Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dSig &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTermination Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dHashMap Vuna_dCompiler_dDebug Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTermination_dMeasure Vuna_dCompiler_dElab_dTermination_dScc &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dDecl Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dHashMap Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
compile_mod Vuna_dCompiler_dDriver_dCache Vuna_runtime Base_dPair Base_dList Base_dHashMap Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dResolve Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dDiagnostics Vuna_dCompiler_dFrontend_dLexer Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dIntrinsics &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dCase Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dDict Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dSupport Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dInstName Vuna_runtime Base_dMaybe Base_dList Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dMeta &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dErase Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dHashMap Base_dVec Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dLoader_dFlatten Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Vuna_dCompiler_dCommon Base_dIO Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dFrontend_dParser Vuna_dCompiler_dLoader_dDiagnostics Vuna_dCompiler_dLoader_dFixity Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dLoader_dResolve &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTerm_dImpl Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dCase Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm_dSupport &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dTerm Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Base_dString Base_dHashMap Base_dVec Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dTerm Vuna_runtime Vuna_dCompiler_dElab_dTerm_dImpl &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dAssembly Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dTerm &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
pids=""
compile_mod Vuna_dCompiler_dElab_dData Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dTerm &
pids="$pids $!"
compile_mod Vuna_dCompiler_dElab_dTrait Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dSig Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dMatch Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dInstName &
pids="$pids $!"
compile_mod Vuna_dCompiler_dCodegen_dSplit Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dInstName Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dCodegen_dDecl Vuna_dCompiler_dCodegen_dErase Vuna_dCompiler_dCodegen_dTerm Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dDriver_dSplit &
pids="$pids $!"
for p in $pids; do wait "$p" || exit 1; done
compile_mod Vuna_dCompiler_dElab_dDriver Vuna_runtime Base_dPair Base_dMaybe Base_dList Base_dResult Vuna_dCompiler_dCommon Base_dHashMap Vuna_dCompiler_dDebug Base_dVec Vuna_dCompiler_dDiagnostics_dTc Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dIntrinsics Base_dIntMap Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dCore_dConv Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDict Vuna_dCompiler_dElab_dTerm Vuna_dCompiler_dElab_dData Vuna_dCompiler_dElab_dTrait Vuna_dCompiler_dElab_dDerive Vuna_dCompiler_dElab_dRecords Vuna_dCompiler_dElab_dTermination
compile_mod Vuna_dCompiler_dDriver_dDt Vuna_runtime Base_dPair Base_dMaybe Base_dEq Base_dList Base_dResult Vuna_dCompiler_dPackages_dPkg Base_dHashMap Vuna_dCompiler_dDebug Vuna_dCompiler_dDiagnostics_dCg Vuna_dCompiler_dFrontend_dAst Vuna_dCompiler_dLoader_dModules Vuna_dCompiler_dIntrinsics Vuna_dCompiler_dLoader_dFlatten Vuna_dCompiler_dCore_dTerm Vuna_dCompiler_dCore_dEval Vuna_dCompiler_dElab_dTypes Vuna_dCompiler_dElab_dPrelude Vuna_dCompiler_dElab_dMeta Vuna_dCompiler_dElab_dDriver Vuna_dCompiler_dCodegen_dAssembly Vuna_dCompiler_dCodegen_dSplit
compile_mod Vuna_dCompiler_dDriver_dCompile Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dDebug Vuna_dCompiler_dDriver_dSplit Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dDriver_dCache Vuna_dCompiler_dVersion
compile_mod Vuna_dCompiler_dDriver_dCompilerCli Vuna_runtime Base_dPair Base_dBool Base_dMaybe Base_dList Base_dResult Base_dString Base_dIO Vuna_dCompiler_dPackages_dPkg Vuna_dCompiler_dDriver_dDt Vuna_dCompiler_dVersion Vuna_dCompiler_dDriver_dCompile
compile_mod Main Vuna_runtime Base_dMonad Base_dIO Vuna_dCompiler_dDriver_dCompilerCli
ocamlopt $FLAGS -I +unix -o "$OUT" unix.cmxa Vuna_runtime.cmx Base_dPair.cmx Base_dBool.cmx Base_dMonad.cmx Base_dMaybe.cmx Base_dEq.cmx Base_dOrd.cmx Base_dInt.cmx Base_dShow.cmx Base_dNat.cmx Base_dList.cmx Base_dResult.cmx Base_dString.cmx Prelude.cmx Vuna_dCompiler_dCommon.cmx Vuna_dCompiler_dFrontend_dToml.cmx Vuna_dCompiler_dFrontend_dManifest.cmx Base_dIO.cmx Vuna_dCompiler_dPackages_dPkg.cmx Base_dArray.cmx Base_dHashMap.cmx Vuna_dCompiler_dDebug.cmx Base_dVec.cmx Vuna_dCompiler_dDiagnostics_dCommon.cmx Vuna_dCompiler_dDiagnostics_dCg.cmx Vuna_dCompiler_dDiagnostics_dTc.cmx Vuna_dCompiler_dDiagnostics.cmx Vuna_dCompiler_dFrontend_dAst.cmx Vuna_dCompiler_dFrontend_dDiagnostics.cmx Vuna_dCompiler_dFrontend_dLexer.cmx Vuna_dCompiler_dFrontend_dParser_dSupport.cmx Vuna_dCompiler_dFrontend_dParser.cmx Vuna_dCompiler_dLoader_dDiagnostics.cmx Vuna_dCompiler_dLoader_dFixity.cmx Vuna_dCompiler_dLoader_dModules.cmx Vuna_dCompiler_dIntrinsics.cmx Vuna_dCompiler_dLoader_dResolve.cmx Vuna_dCompiler_dLoader_dFlatten.cmx Vuna_dCompiler_dLoader.cmx Base_dIntMap.cmx Vuna_dCompiler_dCore_dTerm.cmx Vuna_dCompiler_dCore_dEval.cmx Vuna_dCompiler_dCore_dConv.cmx Vuna_dCompiler_dCore.cmx Vuna_dCompiler_dElab_dTypes.cmx Vuna_dCompiler_dElab_dPrelude.cmx Vuna_dCompiler_dElab_dSig.cmx Vuna_dCompiler_dElab_dMeta.cmx Vuna_dCompiler_dElab_dCase.cmx Vuna_dCompiler_dElab_dDict.cmx Vuna_dCompiler_dElab_dMatch.cmx Vuna_dCompiler_dElab_dTerm_dSupport.cmx Vuna_dCompiler_dElab_dTerm_dImpl.cmx Vuna_dCompiler_dElab_dTerm.cmx Vuna_dCompiler_dElab_dData.cmx Vuna_dCompiler_dElab_dInstName.cmx Vuna_dCompiler_dElab_dTrait.cmx Vuna_dCompiler_dElab_dDerive.cmx Vuna_dCompiler_dElab_dRecords.cmx Vuna_dCompiler_dElab_dTermination_dMeasure.cmx Vuna_dCompiler_dElab_dTermination_dScc.cmx Vuna_dCompiler_dElab_dTermination.cmx Vuna_dCompiler_dElab_dDriver.cmx Vuna_dCompiler_dElab.cmx Vuna_dCompiler_dCodegen_dDecl.cmx Vuna_dCompiler_dCodegen_dErase.cmx Vuna_dCompiler_dCodegen_dTerm.cmx Vuna_dCompiler_dCodegen_dAssembly.cmx Vuna_dCompiler_dDriver_dSplit.cmx Vuna_dCompiler_dCodegen_dSplit.cmx Vuna_dCompiler_dCodegen.cmx Vuna_dCompiler_dDriver_dDt.cmx Vuna_dCompiler_dDriver_dCache.cmx Vuna_dCompiler_dVersion.cmx Vuna_dCompiler_dDriver_dCompile.cmx Vuna_dCompiler_dDriver_dCompilerCli.cmx Main.cmx $C_OBJS
echo "built $OUT"
