open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
open Vuna_dTypecheck
type   t_Vuna_dSplit_dSplitFile =
    C_Vuna_dSplit_dSplitFile of (string) * (string)
let show_Vuna_dSplit_dSplitFile v =
  match v with
  | C_Vuna_dSplit_dSplitFile (f0, f1) -> show_ctor "SplitFile" [(show_vstring) f0; (show_vstring) f1]
let v_Vuna_dSplit_dsplitName = fun a0 -> match a0 with
  | (C_Vuna_dSplit_dSplitFile (name, text)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 18 1 ("no matching clause for Vuna.Split.splitName")

let v_Vuna_dSplit_dsplitText = fun a0 -> match a0 with
  | (C_Vuna_dSplit_dSplitFile (name, text)) -> text
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 20 1 ("no matching clause for Vuna.Split.splitText")

let rec v_Vuna_dSplit_dsplitInitFiles = fun a0 -> match a0 with
  | ([]) -> []
  | ((f) :: (rest)) -> (v_Vuna_dSplit_dsplitName f) :: (v_Vuna_dSplit_dsplitInitFiles rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 23 1 ("no matching clause for Vuna.Split.splitInitFiles")

let rec v_Vuna_dSplit_dwriteSplitFiles = fun a0 a1 -> match (a0, a1) with
  | (dir, []) -> C_Vuna_dResult_dOk (0)
  | (dir, (f) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dSplit_dwriteSplitFiles dir rest) (fun n -> (let _ = bi_write_file ((let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dSplit_dsplitName f) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dSplit_dsplitText f) in C_Vuna_dResult_dOk (bi_add n 1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 28 1 ("no matching clause for Vuna.Split.writeSplitFiles")

let v_Vuna_dSplit_dstripMl = fun name -> v_Vuna_dString_dsubstring 0 (bi_sub (bi_str_length name) 3) name

let rec v_Vuna_dSplit_dsplitCompileOrder = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_Vuna_dString_dendsWith ".ml" name then (v_Vuna_dSplit_dstripMl name) :: (v_Vuna_dSplit_dsplitCompileOrder rest) else v_Vuna_dSplit_dsplitCompileOrder rest
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 37 1 ("no matching clause for Vuna.Split.splitCompileOrder")

let rec v_Vuna_dSplit_dspaceJoin = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: (rest)) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dSplit_dspaceJoin rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 97 1 ("no matching clause for Vuna.Split.spaceJoin")

let rec v_Vuna_dSplit_ddepsSuffix = fun a0 -> match a0 with
  | ([]) -> ""
  | ((dep) :: (rest)) -> (let vuna_cat0' = (" ") in (let vuna_cat1' = (dep) in (let vuna_cat2' = (v_Vuna_dSplit_ddepsSuffix rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 101 1 ("no matching clause for Vuna.Split.depsSuffix")

let rec v_Vuna_dSplit_dcompileCalls = fun a0 a1 -> match (a0, a1) with
  | ([], prev) -> ""
  | ((name) :: (rest), prev) -> (let vuna_cat0' = ("compile_mod ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dSplit_ddepsSuffix prev) in (let vuna_cat3' = ("\n") in (let vuna_cat4' = (v_Vuna_dSplit_dcompileCalls rest ((name) :: (prev))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 105 1 ("no matching clause for Vuna.Split.compileCalls")

let rec v_Vuna_dSplit_djoinCmxs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((name) :: ([])) -> ((name) ^ (".cmx"))
  | ((name) :: (rest)) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (".cmx ") in (let vuna_cat2' = (v_Vuna_dSplit_djoinCmxs rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Split.vuna" 110 1 ("no matching clause for Vuna.Split.joinCmxs")

let v_Vuna_dSplit_dbuildScript = fun names -> (let vuna_cat0' = ("#!/bin/sh
# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]
# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155
# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\140\137 .ml/.mli/.cmi \230\151\182\233\151\180\230\136\179\233\128\144\230\168\161\229\157\151\233\135\141\231\188\150\239\188\136\231\188\150\232\175\145\229\141\149\229\133\131\233\161\186\229\186\143\229\141\179\228\190\157\232\181\150\233\161\186\229\186\143\239\188\137\227\128\130
set -eu
cd \"$(dirname \"$0\")\"
OUT=${1:-program}
FLAGS=\"-g -w -a+39 -warn-error +39\"
MODULES=\"") in (let vuna_cat1' = (v_Vuna_dSplit_dspaceJoin names) in (let vuna_cat2' = ("\"
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
  ocamlopt $FLAGS -o \"$OUT\" $SOURCES
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
    if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -c \"$base.mli\"; fi
    ocamlopt $FLAGS -c \"$base.ml\"
  fi
}
") in (let vuna_cat3' = (v_Vuna_dSplit_dcompileCalls names []) in (let vuna_cat4' = ("ocamlopt $FLAGS -o \"$OUT\" ") in (let vuna_cat5' = (v_Vuna_dSplit_djoinCmxs names) in (let vuna_cat6' = ("\necho \"built $OUT\"\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))

let v_vuna_ushow_uVuna_uSplit_uSplitFile = fun x -> (match x with
  | C_Vuna_dSplit_dSplitFile (v0, v1) -> (let vuna_cat0' = ("(SplitFile ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 2 36 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uSplit_uSplitFile = fun x y -> (match x with
  | C_Vuna_dSplit_dSplitFile (v0, v1) -> (match y with
  | C_Vuna_dSplit_dSplitFile (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 7 33 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 6 36 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uSplit_uSplitFile = fun x y -> if v_vuna_ueq_uVuna_uSplit_uSplitFile x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
