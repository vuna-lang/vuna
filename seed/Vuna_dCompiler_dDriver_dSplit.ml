open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dAssembly
type t_Vuna_dCompiler_dDriver_dSplit_dSplitFile = C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile of (string) * (string)

let v_Vuna_dCompiler_dDriver_dSplit_dsplitName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__4), (v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles dtb__5)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles mc0) dtb__7)) (fun n -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((n + 1)))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__6)])) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__6))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged mc0) dtb__9)) (fun n -> ((fun path -> ((fun text -> ((fun same -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((n + 1)))) (if same then 0 else (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) text))))) (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then ((v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)) = text) else false))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__8))) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__8)]))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dstripMl = (fun name -> (((v_Base_dString_dsubstring 0) ((bi_strLength name) - 3)) name))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((v_Base_dString_dendsWith ".ml") dtb__10) then (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dSplit_dstripMl dtb__10), (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder dtb__11))) else (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder dtb__11))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (String.concat "" [dtb__12; " "; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin dtb__13)])
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (String.concat "" [" "; dtb__14; (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix dtb__15)])
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstampWrites = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (String.concat "" ["  stamp_want "; dtb__16; (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix mc1); " > \""; dtb__16; ".stamp\"\n"; ((v_Vuna_dCompiler_dDriver_dSplit_dstampWrites dtb__17) (C_Base_dList_dList_Base_dList_dCons (dtb__16, mc1)))])
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (String.concat "" ["compile_mod "; dtb__18; (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix mc1); "\n"; ((v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls dtb__19) (C_Base_dList_dList_Base_dList_dCons (dtb__18, mc1)))])
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__21 with
  | C_Base_dList_dList_Base_dList_dNil -> (dtb__20 ^ ".cmx")
  | _ -> (String.concat "" [dtb__20; ".cmx "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs dtb__21)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dbuildScript = (fun names cFiles -> (String.concat "" ["#!/bin/sh\n"; "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136M30\239\188\154\230\140\137\229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n"; "# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155\n"; "# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\175\143\228\184\170\230\168\161\229\157\151\231\154\132 .ml/.mli \228\184\142\228\190\157\232\181\150 .cmi/.cmx \229\134\133\229\174\185\229\147\136\229\184\140\229\134\153 $base.stamp\239\188\140\229\145\189\228\184\173\229\141\179\232\183\179\232\191\135\227\128\130\n"; "set -eu\n"; "cd \"$(dirname \"$0\")\"\n"; "OUT=${1:-program}\n"; "FLAGS=\"-g -w -a+39 -warn-error +39\"\n"; "MODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin names); "\"\n"; "C_MODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin cFiles); "\"\n"; "C_OBJS=\"\"\n"; "if [ -n \"$C_MODULES\" ]; then\n"; "  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\n"; "fi\n"; "hash_of() {\n"; "  for f in \"$@\"; do\n"; "    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n"; "  done | sha256sum | awk '{print $1}'\n"; "}\n"; "stamp_want() {\n"; "  base=$1\n"; "  shift\n"; "  deps=\"\"\n"; "  for d in \"$@\"; do deps=\"$deps $d.stamp\"; done\n"; "  hash_of \"$base.ml\" \"$base.mli\" $deps\n"; "}\n"; "clean=1\n"; "for m in $MODULES; do\n"; "  if [ -f \"$m.cmx\" ]; then clean=0; fi\n"; "done\n"; "if [ \"$clean\" -eq 1 ]; then\n"; "  SOURCES=\"\"\n"; "  for m in $MODULES; do\n"; "    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi\n"; "    SOURCES=\"$SOURCES $m.ml\"\n"; "  done\n"; "  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES $C_OBJS\n"; ((v_Vuna_dCompiler_dDriver_dSplit_dstampWrites names) C_Base_dList_dList_Base_dList_dNil); "  echo \"built $OUT\"\n"; "  exit 0\n"; "fi\n"; "compile_mod() {\n"; "  base=$1\n"; "  shift\n"; "  want=$(stamp_want \"$base\" \"$@\")\n"; "  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n"; "  echo \"compile $base\"\n"; "  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n"; "  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n"; "  printf '%s' \"$want\" > \"$base.stamp\"\n"; "}\n"; ((v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls names) C_Base_dList_dList_Base_dList_dNil); "ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs names); " $C_OBJS\n"; "echo \"built $OUT\"\n"]))
