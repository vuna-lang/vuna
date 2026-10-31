#!/bin/sh
# 由 vuna 生成：分离编译增量构建脚本（M12）。用法: ./build.sh [OUT]
set -eu
cd "$(dirname "$0")"
OUT=${1:-program}
FLAGS="-g -w -a+39 -warn-error +39"
compile_mod() {
  base=$1
  shift
  stale=0
  [ -f "$base.cmx" ] || stale=1
  if [ "$stale" -eq 0 ] && [ "$base.ml" -nt "$base.cmx" ]; then stale=1; fi
  if [ -f "$base.mli" ]; then
    [ -f "$base.cmi" ] || stale=1
    if [ "$stale" -eq 0 ] && [ "$base.mli" -nt "$base.cmi" ]; then stale=1; fi
  fi
  for dep in "$@"; do
    if [ "$stale" -eq 0 ] && [ -f "$dep.cmi" ] && [ "$dep.cmi" -nt "$base.cmx" ]; then stale=1; fi
    if [ "$stale" -eq 1 ]; then break; fi
  done
  if [ "$stale" -eq 1 ]; then
    echo "compile $base"
    if [ -f "$base.mli" ]; then ocamlopt $FLAGS -c "$base.mli"; fi
    ocamlopt $FLAGS -c "$base.ml"
  fi
}
compile_mod Vuna_runtime
compile_mod Vuna_dPair Vuna_runtime
compile_mod Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dTypedCodegen Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dCompile Vuna_dTypedCodegen Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dSplitCli Vuna_dCompile Vuna_dTypedCodegen Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Vuna_dCompilerCli Vuna_dSplitCli Vuna_dCompile Vuna_dTypedCodegen Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
compile_mod Main Vuna_dCompilerCli Vuna_dSplitCli Vuna_dCompile Vuna_dTypedCodegen Vuna_dSplit Vuna_dTypecheck Vuna_dCodegen Vuna_dLoader Vuna_dBuiltins Vuna_dParser Vuna_dLexer Vuna_dAst Vuna_dPkg Vuna_dManifest Vuna_dToml Vuna_dBase Vuna_dString Vuna_dResult Vuna_dList Vuna_dMaybe Vuna_dMonad Vuna_dBool Vuna_dPair Vuna_runtime
ocamlopt $FLAGS -o "$OUT" Vuna_runtime.cmx Vuna_dPair.cmx Vuna_dBool.cmx Vuna_dMonad.cmx Vuna_dMaybe.cmx Vuna_dList.cmx Vuna_dResult.cmx Vuna_dString.cmx Vuna_dBase.cmx Vuna_dToml.cmx Vuna_dManifest.cmx Vuna_dPkg.cmx Vuna_dAst.cmx Vuna_dLexer.cmx Vuna_dParser.cmx Vuna_dBuiltins.cmx Vuna_dLoader.cmx Vuna_dCodegen.cmx Vuna_dTypecheck.cmx Vuna_dSplit.cmx Vuna_dTypedCodegen.cmx Vuna_dCompile.cmx Vuna_dSplitCli.cmx Vuna_dCompilerCli.cmx Main.cmx
echo "built $OUT"
