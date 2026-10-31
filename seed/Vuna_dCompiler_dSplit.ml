open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
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
open Vuna_dCompiler_dTypecheck
type   t_Vuna_dCompiler_dSplit_dSplitFile =
    C_Vuna_dCompiler_dSplit_dSplitFile of (string) * (string)
let show_Vuna_dCompiler_dSplit_dSplitFile v =
  match v with
  | C_Vuna_dCompiler_dSplit_dSplitFile (f0, f1) -> show_ctor "SplitFile" [(show_vstring) f0; (show_vstring) f1]
let v_Vuna_dCompiler_dSplit_dsplitName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dSplit_dSplitFile (name, text)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 17 1 ("no matching clause for Vuna.Compiler.Split.splitName")

let v_Vuna_dCompiler_dSplit_dsplitText = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dSplit_dSplitFile (name, text)) -> text
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 19 1 ("no matching clause for Vuna.Compiler.Split.splitText")

let rec v_Vuna_dCompiler_dSplit_dsplitInitFiles = fun a0 -> match a0 with
  | ([]) -> []
  | ((f) :: (rest)) -> (v_Vuna_dCompiler_dSplit_dsplitName f) :: (v_Vuna_dCompiler_dSplit_dsplitInitFiles rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 22 1 ("no matching clause for Vuna.Compiler.Split.splitInitFiles")

let rec v_Vuna_dCompiler_dSplit_dwriteSplitFiles = fun a0 a1 -> match (a0, a1) with
  | (dir, []) -> C_Base_dResult_dOk (0)
  | (dir, (f) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplit_dwriteSplitFiles dir rest) (fun n -> (let _ = bi_write_file ((let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dsplitName f) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dCompiler_dSplit_dsplitText f) in C_Base_dResult_dOk (bi_add n 1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 26 1 ("no matching clause for Vuna.Compiler.Split.writeSplitFiles")

let rec v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged = fun a0 a1 -> match (a0, a1) with
  | (dir, []) -> C_Base_dResult_dOk (0)
  | (dir, (f) :: (rest)) -> (let path = (let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dsplitName f) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in (let text = v_Vuna_dCompiler_dSplit_dsplitText f in (let unchanged = (if (bi_file_exists path) then (v_vuna_ueq_ustr (bi_read_file path) text) else false) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged dir rest) (fun n -> (let _ = if unchanged then 0 else bi_write_file path text in C_Base_dResult_dOk (if unchanged then n else bi_add n 1))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 34 1 ("no matching clause for Vuna.Compiler.Split.writeSplitFilesChanged")

let v_Vuna_dCompiler_dSplit_dstripMl = fun name -> v_Base_dString_dsubstring 0 (bi_sub (bi_str_length name) 3) name

let rec v_Vuna_dCompiler_dSplit_dsplitCompileOrder = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_Base_dString_dendsWith ".ml" name then (v_Vuna_dCompiler_dSplit_dstripMl name) :: (v_Vuna_dCompiler_dSplit_dsplitCompileOrder rest) else v_Vuna_dCompiler_dSplit_dsplitCompileOrder rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 49 1 ("no matching clause for Vuna.Compiler.Split.splitCompileOrder")

let rec v_Vuna_dCompiler_dSplit_dspaceJoin = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: (rest)) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dspaceJoin rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 111 1 ("no matching clause for Vuna.Compiler.Split.spaceJoin")

let rec v_Vuna_dCompiler_dSplit_ddepsSuffix = fun a0 -> match a0 with
  | ([]) -> ""
  | ((dep) :: (rest)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (dep) in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_ddepsSuffix rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 114 1 ("no matching clause for Vuna.Compiler.Split.depsSuffix")

let rec v_Vuna_dCompiler_dSplit_dcompileCalls = fun a0 a1 -> match (a0, a1) with
  | ([], prev) -> ""
  | ((name) :: (rest), prev) -> (let vuna_cat0' = ("compile_mod ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_ddepsSuffix prev) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (v_Vuna_dCompiler_dSplit_dcompileCalls rest ((name) :: (prev))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 117 1 ("no matching clause for Vuna.Compiler.Split.compileCalls")

let rec v_Vuna_dCompiler_dSplit_djoinCmxs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: ([])) -> ((name) ^ (".cmx"))
  | ((name) :: (rest)) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (".cmx ") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_djoinCmxs rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 121 1 ("no matching clause for Vuna.Compiler.Split.joinCmxs")

let v_Vuna_dCompiler_dSplit_dbuildScript = fun names -> (let vuna_cat0' = ("#!/bin/sh
# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]
# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155
# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\140\137 .ml/.mli/.cmi \230\151\182\233\151\180\230\136\179\233\128\144\230\168\161\229\157\151\233\135\141\231\188\150\239\188\136\231\188\150\232\175\145\229\141\149\229\133\131\233\161\186\229\186\143\229\141\179\228\190\157\232\181\150\233\161\186\229\186\143\239\188\137\227\128\130
set -eu
cd \"$(dirname \"$0\")\"
OUT=${1:-program}
FLAGS=\"-g -w -a+39 -warn-error +39\"
MODULES=\"") in (let vuna_cat1' = (v_Vuna_dCompiler_dSplit_dspaceJoin names) in (let vuna_cat2' = ("\"
clean=1
for m in $MODULES; do
  if [ -f \"$m.cmx\" ]; then clean=0; fi
done
if [ \"$clean\" -eq 1 ]; then
  SOURCES=\"\"
  for m in $MODULES; do
    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi
    SOURCES=\"$SOURCES $m.ml\"
  done
  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES
  echo \"built $OUT\"
  exit 0
fi
compile_mod() {
  base=$1
  shift
  stale=0
  [ -f \"$base.cmx\" ] || stale=1
  if [ \"$stale\" -eq 0 ] && [ \"$base.ml\" -nt \"$base.cmx\" ]; then stale=1; fi
  if [ -f \"$base.mli\" ]; then
    [ -f \"$base.cmi\" ] || stale=1
    if [ \"$stale\" -eq 0 ] && [ \"$base.mli\" -nt \"$base.cmi\" ]; then stale=1; fi
  fi
  for dep in \"$@\"; do
    if [ \"$stale\" -eq 0 ] && [ -f \"$dep.cmi\" ] && [ \"$dep.cmi\" -nt \"$base.cmx\" ]; then stale=1; fi
    if [ \"$stale\" -eq 1 ]; then break; fi
  done
  if [ \"$stale\" -eq 1 ]; then
    echo \"compile $base\"
    if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi
    ocamlopt $FLAGS -I +unix -c \"$base.ml\"
  fi
}
") in (let vuna_cat3' = (v_Vuna_dCompiler_dSplit_dcompileCalls names []) in (let vuna_cat4' = ("ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa ") in (let vuna_cat5' = (v_Vuna_dCompiler_dSplit_djoinCmxs names) in (let vuna_cat6' = ("\necho \"built $OUT\"\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))

let rec v_Vuna_dCompiler_dSplit_dpSpaceJoin = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: (rest)) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dpSpaceJoin rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 129 1 ("no matching clause for Vuna.Compiler.Split.pSpaceJoin")

let rec v_Vuna_dCompiler_dSplit_dpDepsSuffix = fun a0 -> match a0 with
  | ([]) -> ""
  | ((dep) :: (rest)) -> (let vuna_cat0' = (" lib/") in (let vuna_cat1' = (dep) in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dpDepsSuffix rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 132 1 ("no matching clause for Vuna.Compiler.Split.pDepsSuffix")

let rec v_Vuna_dCompiler_dSplit_dpCompileCalls = fun a0 a1 -> match (a0, a1) with
  | ([], prev) -> ""
  | ((name) :: (rest), prev) -> (let vuna_cat0' = ("compile_mod ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dpDepsSuffix prev) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (v_Vuna_dCompiler_dSplit_dpCompileCalls rest ((name) :: (prev))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 135 1 ("no matching clause for Vuna.Compiler.Split.pCompileCalls")

let rec v_Vuna_dCompiler_dSplit_dpJoinCmxs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: ([])) -> (let vuna_cat0' = ("lib/") in (let vuna_cat1' = (name) in (let vuna_cat2' = (".cmx") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | ((name) :: (rest)) -> (let vuna_cat0' = ("lib/") in (let vuna_cat1' = (name) in (let vuna_cat2' = (".cmx ") in (let vuna_cat3' = (v_Vuna_dCompiler_dSplit_dpJoinCmxs rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Split.vuna" 139 1 ("no matching clause for Vuna.Compiler.Split.pJoinCmxs")

let v_Vuna_dCompiler_dSplit_dbuildScriptPackage = fun names hasMain -> (let vuna_cat0' = ("#!/bin/sh
# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\140\133\231\186\167 compile \231\154\132\230\158\132\229\187\186\232\132\154\230\156\172\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]
# \229\184\131\229\177\128\239\188\154lib/ \228\184\186\230\168\161\229\157\151\239\188\140app/Main.ml \228\184\186\229\133\165\229\143\163\239\188\155\229\162\158\233\135\143\229\136\164\229\174\154\230\140\137 lib/ \229\134\133\230\151\182\233\151\180\230\136\179\227\128\130
set -eu
cd \"$(dirname \"$0\")\"
OUT=${1:-bin/program}
FLAGS=\"-g -w -a+39 -warn-error +39\"
OCAMLOPT=${OCAMLOPT:-ocamlopt}
command -v \"$OCAMLOPT\" >/dev/null 2>&1 || { echo \"error: ocamlopt not found (set OCAMLOPT)\" >&2; exit 127; }
MODULES=\"") in (let vuna_cat1' = (v_Vuna_dCompiler_dSplit_dpSpaceJoin names) in (let vuna_cat2' = ("\"\nmkdir -p \"$(dirname \"$OUT\")\"\nif [") in (let vuna_cat3' = (if hasMain then " \"${1:-}\" = \"--clean\" ]; then rm -f lib/*.cmx lib/*.cmi lib/*.o app/*.cmx app/*.cmi app/*.o; fi
" else " \"${1:-}\" = \"--clean\" ]; then rm -f lib/*.cmx lib/*.cmi lib/*.o; fi\n") in (let vuna_cat4' = ("clean=1
for m in $MODULES; do
  if [ -f \"lib/$m.cmx\" ]; then clean=0; fi
done
if [ \"$clean\" -eq 1 ] && [") in (let vuna_cat5' = (if hasMain then " -f \"app/Main.ml\"" else " 1 -eq 1") in (let vuna_cat6' = (" ]; then
  SOURCES=\"\"
  for m in $MODULES; do
    if [ -f \"lib/$m.mli\" ]; then SOURCES=\"$SOURCES lib/$m.mli\"; fi
    SOURCES=\"$SOURCES lib/$m.ml\"
  done
  if [") in (let vuna_cat7' = (if hasMain then " -f \"app/Main.ml\"" else " 1 -eq 0") in (let vuna_cat8' = (" ]; then
    $OCAMLOPT $FLAGS -I lib -I +unix -o \"$OUT\" unix.cmxa $SOURCES app/Main.ml
    echo \"built $OUT\"
    exit 0
  fi
  for m in $MODULES; do
    if [ -f \"lib/$m.mli\" ]; then $OCAMLOPT $FLAGS -I lib -I +unix -c \"lib/$m.mli\"; fi
    $OCAMLOPT $FLAGS -I lib -I +unix -c \"lib/$m.ml\"
  done
  echo \"compiled lib modules\"
  exit 0
fi
compile_mod() {
  base=$1
  shift
  path=\"lib/$base\"
  stale=0
  [ -f \"$path.cmx\" ] || stale=1
  if [ \"$stale\" -eq 0 ] && [ \"$path.ml\" -nt \"$path.cmx\" ]; then stale=1; fi
  if [ -f \"$path.mli\" ]; then
    [ -f \"$path.cmi\" ] || stale=1
    if [ \"$stale\" -eq 0 ] && [ \"$path.mli\" -nt \"$path.cmi\" ]; then stale=1; fi
  fi
  for dep in \"$@\"; do
    if [ \"$stale\" -eq 0 ] && [ -f \"$dep.cmi\" ] && [ \"$dep.cmi\" -nt \"$path.cmx\" ]; then stale=1; fi
    if [ \"$stale\" -eq 1 ]; then break; fi
  done
  if [ \"$stale\" -eq 1 ]; then
    echo \"compile $base\"
    if [ -f \"$path.mli\" ]; then $OCAMLOPT $FLAGS -I lib -I +unix -c \"$path.mli\"; fi
    $OCAMLOPT $FLAGS -I lib -I +unix -c \"$path.ml\"
  fi
}
") in (let vuna_cat9' = (v_Vuna_dCompiler_dSplit_dpCompileCalls names []) in (let vuna_cat10' = (if hasMain then (let vuna_cat0' = ("if [ -f \"app/Main.cmx\" ] && [ \"app/Main.ml\" -nt \"app/Main.cmx\" ]; then rm -f app/Main.cmx; fi
if [ ! -f \"app/Main.cmx\" ]; then
  echo \"compile app/Main\"
  $OCAMLOPT $FLAGS -I lib -I +unix -c app/Main.ml
fi
$OCAMLOPT $FLAGS -I lib -I +unix -o \"$OUT\" unix.cmxa ") in (let vuna_cat1' = (v_Vuna_dCompiler_dSplit_dpJoinCmxs names) in (let vuna_cat2' = (" app/Main.cmx\necho \"built $OUT\"\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else "echo \"compiled lib modules\"\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'])))))))))))

let v_vuna_ushow_uVuna_uCompiler_uSplit_uSplitFile = fun x -> (match x with
  | C_Vuna_dCompiler_dSplit_dSplitFile (v0, v1) -> (let vuna_cat0' = ("(SplitFile ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 20 45 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uSplit_uSplitFile = fun x y -> (match x with
  | C_Vuna_dCompiler_dSplit_dSplitFile (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dSplit_dSplitFile (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 25 42 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 24 45 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uSplit_uSplitFile = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uSplit_uSplitFile x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
