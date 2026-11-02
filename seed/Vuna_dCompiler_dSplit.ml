open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
type t_Vuna_dCompiler_dSplit_dSplitFile = C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile of (string) * (string)

let v_Vuna_dCompiler_dSplit_dsplitName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dSplit_dsplitText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dSplit_dSplitFile_Vuna_dCompiler_dSplit_dSplitFile (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dsplitInitFiles = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dSplit_dsplitName dtb__4), (v_Vuna_dCompiler_dSplit_dsplitInitFiles dtb__5)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dwriteSplitFiles = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dSplit_dwriteSplitFiles mc0) dtb__7)) (fun n -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add n) 1)))) ((dtp_writeFile ((bi_concat mc0) ((bi_concat "/") (v_Vuna_dCompiler_dSplit_dsplitName dtb__6)))) (v_Vuna_dCompiler_dSplit_dsplitText dtb__6)))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> ((fun path -> ((fun text -> ((fun unchanged -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged mc0) dtb__9)) (fun n -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((if unchanged then n else ((bi_add n) 1))))) (if unchanged then 0 else ((dtp_writeFile path) text)))))) (if (dtp_fileExists path) then ((bi_eq_str (dtp_readFile path)) text) else false))) (v_Vuna_dCompiler_dSplit_dsplitText dtb__8))) ((bi_concat mc0) ((bi_concat "/") (v_Vuna_dCompiler_dSplit_dsplitName dtb__8))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dSplit_dstripMl = (fun name -> (((v_Base_dString_dsubstring 0) ((bi_sub (bi_strLength name)) 3)) name))

let rec v_Vuna_dCompiler_dSplit_dsplitCompileOrder = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if ((v_Base_dString_dendsWith ".ml") dtb__10) then (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dSplit_dstripMl dtb__10), (v_Vuna_dCompiler_dSplit_dsplitCompileOrder dtb__11))) else (v_Vuna_dCompiler_dSplit_dsplitCompileOrder dtb__11))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dspaceJoin = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((bi_concat dtb__12) ((bi_concat " ") (v_Vuna_dCompiler_dSplit_dspaceJoin dtb__13)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_ddepsSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((bi_concat " ") ((bi_concat dtb__14) (v_Vuna_dCompiler_dSplit_ddepsSuffix dtb__15)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dcompileCalls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((bi_concat "compile_mod ") ((bi_concat dtb__16) ((bi_concat (v_Vuna_dCompiler_dSplit_ddepsSuffix mc1)) ((bi_concat "\n") ((v_Vuna_dCompiler_dSplit_dcompileCalls dtb__17) (C_Base_dList_dList_Cons (dtb__16, mc1)))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dSplit_djoinCmxs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__19 with
  | C_Base_dList_dList_Nil -> ((bi_concat dtb__18) ".cmx")
  | _ -> ((bi_concat dtb__18) ((bi_concat ".cmx ") (v_Vuna_dCompiler_dSplit_djoinCmxs dtb__19)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dSplit_dbuildScript = (fun names -> ((bi_concat "#!/bin/sh\n") ((bi_concat "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n") ((bi_concat "# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155\n") ((bi_concat "# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\140\137 .ml/.mli/.cmi \230\151\182\233\151\180\230\136\179\233\128\144\230\168\161\229\157\151\233\135\141\231\188\150\239\188\136\231\188\150\232\175\145\229\141\149\229\133\131\233\161\186\229\186\143\229\141\179\228\190\157\232\181\150\233\161\186\229\186\143\239\188\137\227\128\130\n") ((bi_concat "set -eu\n") ((bi_concat "cd \"$(dirname \"$0\")\"\n") ((bi_concat "OUT=${1:-program}\n") ((bi_concat "FLAGS=\"-g -w -a+39 -warn-error +39\"\n") ((bi_concat "MODULES=\"") ((bi_concat (v_Vuna_dCompiler_dSplit_dspaceJoin names)) ((bi_concat "\"\n") ((bi_concat "clean=1\n") ((bi_concat "for m in $MODULES; do\n") ((bi_concat "  if [ -f \"$m.cmx\" ]; then clean=0; fi\n") ((bi_concat "done\n") ((bi_concat "if [ \"$clean\" -eq 1 ]; then\n") ((bi_concat "  SOURCES=\"\"\n") ((bi_concat "  for m in $MODULES; do\n") ((bi_concat "    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi\n") ((bi_concat "    SOURCES=\"$SOURCES $m.ml\"\n") ((bi_concat "  done\n") ((bi_concat "  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES\n") ((bi_concat "  echo \"built $OUT\"\n") ((bi_concat "  exit 0\n") ((bi_concat "fi\n") ((bi_concat "compile_mod() {\n") ((bi_concat "  base=$1\n") ((bi_concat "  shift\n") ((bi_concat "  stale=0\n") ((bi_concat "  [ -f \"$base.cmx\" ] || stale=1\n") ((bi_concat "  if [ \"$stale\" -eq 0 ] && [ \"$base.ml\" -nt \"$base.cmx\" ]; then stale=1; fi\n") ((bi_concat "  if [ -f \"$base.mli\" ]; then\n") ((bi_concat "    [ -f \"$base.cmi\" ] || stale=1\n") ((bi_concat "    if [ \"$stale\" -eq 0 ] && [ \"$base.mli\" -nt \"$base.cmi\" ]; then stale=1; fi\n") ((bi_concat "  fi\n") ((bi_concat "  for dep in \"$@\"; do\n") ((bi_concat "    if [ \"$stale\" -eq 0 ] && [ -f \"$dep.cmi\" ] && [ \"$dep.cmi\" -nt \"$base.cmx\" ]; then stale=1; fi\n") ((bi_concat "    if [ \"$stale\" -eq 1 ]; then break; fi\n") ((bi_concat "  done\n") ((bi_concat "  if [ \"$stale\" -eq 1 ]; then\n") ((bi_concat "    echo \"compile $base\"\n") ((bi_concat "    if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n") ((bi_concat "    ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n") ((bi_concat "  fi\n") ((bi_concat "}\n") ((bi_concat ((v_Vuna_dCompiler_dSplit_dcompileCalls names) C_Base_dList_dList_Nil)) ((bi_concat "ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa ") ((bi_concat (v_Vuna_dCompiler_dSplit_djoinCmxs names)) ((bi_concat "\n") "echo \"built $OUT\"\n"))))))))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dSplit_dpSpaceJoin = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> ((bi_concat dtb__20) ((bi_concat " ") (v_Vuna_dCompiler_dSplit_dpSpaceJoin dtb__21)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dpDepsSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> ((bi_concat " lib/") ((bi_concat dtb__22) (v_Vuna_dCompiler_dSplit_dpDepsSuffix dtb__23)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dSplit_dpCompileCalls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__24, dtb__25) -> ((bi_concat "compile_mod ") ((bi_concat dtb__24) ((bi_concat (v_Vuna_dCompiler_dSplit_dpDepsSuffix mc1)) ((bi_concat "\n") ((v_Vuna_dCompiler_dSplit_dpCompileCalls dtb__25) (C_Base_dList_dList_Cons (dtb__24, mc1)))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dSplit_dpJoinCmxs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__27 with
  | C_Base_dList_dList_Nil -> ((bi_concat "lib/") ((bi_concat dtb__26) ".cmx"))
  | _ -> ((bi_concat "lib/") ((bi_concat dtb__26) ((bi_concat ".cmx ") (v_Vuna_dCompiler_dSplit_dpJoinCmxs dtb__27))))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dSplit_dbuildScriptPackage = (fun names -> (fun hasMain -> ((bi_concat "#!/bin/sh\n") ((bi_concat "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\140\133\231\186\167 compile \231\154\132\230\158\132\229\187\186\232\132\154\230\156\172\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n") ((bi_concat "# \229\184\131\229\177\128\239\188\154lib/ \228\184\186\230\168\161\229\157\151\239\188\140app/Main.ml \228\184\186\229\133\165\229\143\163\239\188\155\229\162\158\233\135\143\229\136\164\229\174\154\230\140\137 lib/ \229\134\133\230\151\182\233\151\180\230\136\179\227\128\130\n") ((bi_concat "set -eu\n") ((bi_concat "cd \"$(dirname \"$0\")\"\n") ((bi_concat "OUT=${1:-bin/program}\n") ((bi_concat "FLAGS=\"-g -w -a+39 -warn-error +39\"\n") ((bi_concat "OCAMLOPT=${OCAMLOPT:-ocamlopt}\n") ((bi_concat "command -v \"$OCAMLOPT\" >/dev/null 2>&1 || { echo \"error: ocamlopt not found (set OCAMLOPT)\" >&2; exit 127; }\n") ((bi_concat "MODULES=\"") ((bi_concat (v_Vuna_dCompiler_dSplit_dpSpaceJoin names)) ((bi_concat "\"\n") ((bi_concat "mkdir -p \"$(dirname \"$OUT\")\"\n") ((bi_concat "if [") ((bi_concat (if hasMain then " \"${1:-}\" = \"--clean\" ]; then rm -f lib/*.cmx lib/*.cmi lib/*.o app/*.cmx app/*.cmi app/*.o; fi\n" else " \"${1:-}\" = \"--clean\" ]; then rm -f lib/*.cmx lib/*.cmi lib/*.o; fi\n")) ((bi_concat "clean=1\n") ((bi_concat "for m in $MODULES; do\n") ((bi_concat "  if [ -f \"lib/$m.cmx\" ]; then clean=0; fi\n") ((bi_concat "done\n") ((bi_concat "if [ \"$clean\" -eq 1 ] && [") ((bi_concat (if hasMain then " -f \"app/Main.ml\"" else " 1 -eq 1")) ((bi_concat " ]; then\n") ((bi_concat "  SOURCES=\"\"\n") ((bi_concat "  for m in $MODULES; do\n") ((bi_concat "    if [ -f \"lib/$m.mli\" ]; then SOURCES=\"$SOURCES lib/$m.mli\"; fi\n") ((bi_concat "    SOURCES=\"$SOURCES lib/$m.ml\"\n") ((bi_concat "  done\n") ((bi_concat "  if [") ((bi_concat (if hasMain then " -f \"app/Main.ml\"" else " 1 -eq 0")) ((bi_concat " ]; then\n") ((bi_concat "    $OCAMLOPT $FLAGS -I lib -I +unix -o \"$OUT\" unix.cmxa $SOURCES app/Main.ml\n") ((bi_concat "    echo \"built $OUT\"\n") ((bi_concat "    exit 0\n") ((bi_concat "  fi\n") ((bi_concat "  for m in $MODULES; do\n") ((bi_concat "    if [ -f \"lib/$m.mli\" ]; then $OCAMLOPT $FLAGS -I lib -I +unix -c \"lib/$m.mli\"; fi\n") ((bi_concat "    $OCAMLOPT $FLAGS -I lib -I +unix -c \"lib/$m.ml\"\n") ((bi_concat "  done\n") ((bi_concat "  echo \"compiled lib modules\"\n") ((bi_concat "  exit 0\n") ((bi_concat "fi\n") ((bi_concat "compile_mod() {\n") ((bi_concat "  base=$1\n") ((bi_concat "  shift\n") ((bi_concat "  path=\"lib/$base\"\n") ((bi_concat "  stale=0\n") ((bi_concat "  [ -f \"$path.cmx\" ] || stale=1\n") ((bi_concat "  if [ \"$stale\" -eq 0 ] && [ \"$path.ml\" -nt \"$path.cmx\" ]; then stale=1; fi\n") ((bi_concat "  if [ -f \"$path.mli\" ]; then\n") ((bi_concat "    [ -f \"$path.cmi\" ] || stale=1\n") ((bi_concat "    if [ \"$stale\" -eq 0 ] && [ \"$path.mli\" -nt \"$path.cmi\" ]; then stale=1; fi\n") ((bi_concat "  fi\n") ((bi_concat "  for dep in \"$@\"; do\n") ((bi_concat "    if [ \"$stale\" -eq 0 ] && [ -f \"$dep.cmi\" ] && [ \"$dep.cmi\" -nt \"$path.cmx\" ]; then stale=1; fi\n") ((bi_concat "    if [ \"$stale\" -eq 1 ]; then break; fi\n") ((bi_concat "  done\n") ((bi_concat "  if [ \"$stale\" -eq 1 ]; then\n") ((bi_concat "    echo \"compile $base\"\n") ((bi_concat "    if [ -f \"$path.mli\" ]; then $OCAMLOPT $FLAGS -I lib -I +unix -c \"$path.mli\"; fi\n") ((bi_concat "    $OCAMLOPT $FLAGS -I lib -I +unix -c \"$path.ml\"\n") ((bi_concat "  fi\n") ((bi_concat "}\n") ((bi_concat ((v_Vuna_dCompiler_dSplit_dpCompileCalls names) C_Base_dList_dList_Nil)) (if hasMain then ((bi_concat "if [ -f \"app/Main.cmx\" ] && [ \"app/Main.ml\" -nt \"app/Main.cmx\" ]; then rm -f app/Main.cmx; fi\n") ((bi_concat "if [ ! -f \"app/Main.cmx\" ]; then\n") ((bi_concat "  echo \"compile app/Main\"\n") ((bi_concat "  $OCAMLOPT $FLAGS -I lib -I +unix -c app/Main.ml\n") ((bi_concat "fi\n") ((bi_concat "$OCAMLOPT $FLAGS -I lib -I +unix -o \"$OUT\" unix.cmxa ") ((bi_concat (v_Vuna_dCompiler_dSplit_dpJoinCmxs names)) ((bi_concat " app/Main.cmx\n") "echo \"built $OUT\"\n")))))))) else "echo \"compiled lib modules\"\n"))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
