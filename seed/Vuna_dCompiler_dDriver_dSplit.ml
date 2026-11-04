open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
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
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
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

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles mc0) dtb__7)) (fun n -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add n) 1)))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) ((bi_concat mc0) ((bi_concat "/") (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__6)))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__6))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged mc0) dtb__9)) (fun n -> ((fun path -> ((fun text -> ((fun same -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add n) 1)))) (if same then 0 else (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) text))))) (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then ((bi_eq_str (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))) text) else false))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__8))) ((bi_concat mc0) ((bi_concat "/") (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__8))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dSplit_dstripMl = (fun name -> (((v_Base_dString_dsubstring 0) ((bi_sub (bi_strLength name)) 3)) name))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((v_Base_dString_dendsWith ".ml") dtb__10) then (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dSplit_dstripMl dtb__10), (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder dtb__11))) else (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder dtb__11))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> ((bi_concat dtb__12) ((bi_concat " ") (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin dtb__13)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> ((bi_concat " ") ((bi_concat dtb__14) (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix dtb__15)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstampWrites = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> ((bi_concat "  stamp_want ") ((bi_concat dtb__16) ((bi_concat (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix mc1)) ((bi_concat " > \"") ((bi_concat dtb__16) ((bi_concat ".stamp\"\n") ((v_Vuna_dCompiler_dDriver_dSplit_dstampWrites dtb__17) (C_Base_dList_dList_Base_dList_dCons (dtb__16, mc1)))))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> ((bi_concat "compile_mod ") ((bi_concat dtb__18) ((bi_concat (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix mc1)) ((bi_concat "\n") ((v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls dtb__19) (C_Base_dList_dList_Base_dList_dCons (dtb__18, mc1)))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__21 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat dtb__20) ".cmx")
  | _ -> ((bi_concat dtb__20) ((bi_concat ".cmx ") (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs dtb__21)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dbuildScript = (fun names -> ((bi_concat "#!/bin/sh\n") ((bi_concat "# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136M30\239\188\154\230\140\137\229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n") ((bi_concat "# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155\n") ((bi_concat "# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\175\143\228\184\170\230\168\161\229\157\151\231\154\132 .ml/.mli \228\184\142\228\190\157\232\181\150 .cmi/.cmx \229\134\133\229\174\185\229\147\136\229\184\140\229\134\153 $base.stamp\239\188\140\229\145\189\228\184\173\229\141\179\232\183\179\232\191\135\227\128\130\n") ((bi_concat "set -eu\n") ((bi_concat "cd \"$(dirname \"$0\")\"\n") ((bi_concat "OUT=${1:-program}\n") ((bi_concat "FLAGS=\"-g -w -a+39 -warn-error +39\"\n") ((bi_concat "MODULES=\"") ((bi_concat (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin names)) ((bi_concat "\"\n") ((bi_concat "hash_of() {\n") ((bi_concat "  for f in \"$@\"; do\n") ((bi_concat "    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n") ((bi_concat "  done | sha256sum | awk '{print $1}'\n") ((bi_concat "}\n") ((bi_concat "stamp_want() {\n") ((bi_concat "  base=$1\n") ((bi_concat "  shift\n") ((bi_concat "  deps=\"\"\n") ((bi_concat "  for d in \"$@\"; do deps=\"$deps $d.stamp\"; done\n") ((bi_concat "  hash_of \"$base.ml\" \"$base.mli\" $deps\n") ((bi_concat "}\n") ((bi_concat "clean=1\n") ((bi_concat "for m in $MODULES; do\n") ((bi_concat "  if [ -f \"$m.cmx\" ]; then clean=0; fi\n") ((bi_concat "done\n") ((bi_concat "if [ \"$clean\" -eq 1 ]; then\n") ((bi_concat "  SOURCES=\"\"\n") ((bi_concat "  for m in $MODULES; do\n") ((bi_concat "    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi\n") ((bi_concat "    SOURCES=\"$SOURCES $m.ml\"\n") ((bi_concat "  done\n") ((bi_concat "  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES\n") ((bi_concat ((v_Vuna_dCompiler_dDriver_dSplit_dstampWrites names) C_Base_dList_dList_Base_dList_dNil)) ((bi_concat "  echo \"built $OUT\"\n") ((bi_concat "  exit 0\n") ((bi_concat "fi\n") ((bi_concat "compile_mod() {\n") ((bi_concat "  base=$1\n") ((bi_concat "  shift\n") ((bi_concat "  want=$(stamp_want \"$base\" \"$@\")\n") ((bi_concat "  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n") ((bi_concat "  echo \"compile $base\"\n") ((bi_concat "  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n") ((bi_concat "  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n") ((bi_concat "  printf '%s' \"$want\" > \"$base.stamp\"\n") ((bi_concat "}\n") ((bi_concat ((v_Vuna_dCompiler_dDriver_dSplit_dcompileCalls names) C_Base_dList_dList_Base_dList_dNil)) ((bi_concat "ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa ") ((bi_concat (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs names)) ((bi_concat "\n") "echo \"built $OUT\"\n")))))))))))))))))))))))))))))))))))))))))))))))))))))
