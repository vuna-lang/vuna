open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dSplit_dSplitFile = C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile of (string) * (string) * (string Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dDriver_dSplit_dsplitName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles mc0) dtb__10)) (fun n -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((n + 1)))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__9)])) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__9))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged mc0) dtb__12)) (fun n -> ((fun path -> ((fun text -> ((fun same -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((n + 1)))) (if same then 0 else (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) path) text))))) (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)) = text) else false))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__11))) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__11)]))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dstripMl = (fun name -> (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength name) 3)) name))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> ((fun name -> (if ((Base_dString.v_Base_dString_dendsWith ".ml") name) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dSplit_dstripMl name), (v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps dtb__13))), (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph dtb__14))) else (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph dtb__14))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__13))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit = (fun depths unit -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup unit) depths) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dmaxInt = (fun a b -> (if (a > b) then a else b))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> ((v_Vuna_dCompiler_dDriver_dSplit_dmaxInt (((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc0) dtb__16) + 1)) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps mc0) dtb__17))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths dtb__19) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__20) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps mc1) dtb__21)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (match dtb__22 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__24, dtb__25) -> (((v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth dtb__23) mc1) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxInt mc2) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc1) dtb__24)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> ((fun depths -> ((fun maxD -> ((Base_dList.v_Base_dList_dmap (fun d -> ((Base_dList.v_Base_dList_dfilter (fun q -> (((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit depths) (Base_dPair.v_Base_dPair_dfirstOf q)) = d))) mc0))) ((Base_dList.v_Base_dList_drange 0) (maxD + 1)))) (((v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth mc0) depths) 0))) ((v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths mc0) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.v_Base_dPair_dfirstOf dtb__26), (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits dtb__27)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (String.concat "" [dtb__28; " "; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin dtb__29)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (String.concat "" [" "; dtb__30; (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix dtb__31)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstampWrites = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (String.concat "" ["  printf '%s' \"$(stamp_want "; (Base_dPair.v_Base_dPair_dfirstOf dtb__32); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__32)); ")\" > \""; (Base_dPair.v_Base_dPair_dfirstOf dtb__32); ".stamp\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dstampWrites dtb__33)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dbgCalls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (String.concat "" ["compile_mod "; (Base_dPair.v_Base_dPair_dfirstOf dtb__34); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__34)); " &\npids=\"$pids $!\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dbgCalls dtb__35)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (String.concat "" ["compile_mod "; (Base_dPair.v_Base_dPair_dfirstOf dtb__36); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__36)); "\n"])
  | _ -> (String.concat "" ["pids=\"\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dbgCalls mc0); "for p in $pids; do wait \"$p\" || exit 1; done\n"])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> ((v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls dtb__38) ^ (v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts dtb__39))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (dtb__40 ^ ".cmx")
  | _ -> (String.concat "" [dtb__40; ".cmx "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs dtb__41)])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dbuildScript = (fun graph cFiles -> (String.concat "" ["#!/bin/sh\n# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136C35\239\188\154\230\140\137\231\155\180\230\142\165\228\190\157\232\181\150\229\136\134\229\177\130\229\185\182\232\161\140 + \229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n# \229\185\178\229\135\128\230\158\132\229\187\186\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155\n# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\175\143\229\141\149\229\133\131 .ml/.mli \228\184\142\231\155\180\230\142\165\228\190\157\232\181\150 .stamp \231\154\132\229\134\133\229\174\185\229\147\136\229\184\140\229\134\153 $base.stamp\239\188\140\229\145\189\228\184\173\229\141\179\232\183\179\232\191\135\239\188\155\n# \229\144\140\229\177\130\229\141\149\229\133\131\228\186\146\228\184\141\228\190\157\232\181\150\239\188\154\229\164\154\229\141\149\229\133\131\229\177\130\231\148\168\229\144\142\229\143\176\228\187\187\229\138\161\229\185\182\232\161\140\231\188\150\232\175\145\239\188\140\229\177\130\233\151\180\231\148\168 wait \228\184\178\232\161\140\227\128\130\nset -eu\ncd \"$(dirname \"$0\")\"\nOUT=${1:-program}\nFLAGS=\"-g -w -a+39 -warn-error +39\"\nMODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits graph)); "\"\nC_MODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin cFiles); "\"\nC_OBJS=\"\"\nif [ -n \"$C_MODULES\" ]; then\n  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\nfi\nhash_of() {\n  for f in \"$@\"; do\n    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n  done | sha256sum | awk '{print $1}'\n}\nstamp_want() {\n  base=$1\n  shift\n  deps=\"\"\n  for d in \"$@\"; do deps=\"$deps $d.stamp\"; done\n  hash_of \"$base.ml\" \"$base.mli\" $deps\n}\nclean=1\nfor m in $MODULES; do\n  if [ -f \"$m.cmx\" ]; then clean=0; fi\ndone\nif [ \"$clean\" -eq 1 ]; then\n  SOURCES=\"\"\n  for m in $MODULES; do\n    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi\n    SOURCES=\"$SOURCES $m.ml\"\n  done\n  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES $C_OBJS\n"; (v_Vuna_dCompiler_dDriver_dSplit_dstampWrites graph); "  echo \"built $OUT\"\n  exit 0\nfi\ncompile_mod() {\n  base=$1\n  shift\n  want=$(stamp_want \"$base\" \"$@\")\n  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n  echo \"compile $base\"\n  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n  printf '%s' \"$want\" > \"$base.stamp\"\n}\n"; (v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts (v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers graph)); "ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits graph)); " $C_OBJS\necho \"built $OUT\"\n"]))

let v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey = (fun name -> (((dtp_strHash name) * 1000003) + (dtp_strHash ("t:" ^ name))))

let rec v_Vuna_dCompiler_dDriver_dSplit_dfindFileNamed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (if ((v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__42) = (mc1 ^ ".ml")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42)) else ((v_Vuna_dCompiler_dDriver_dSplit_dfindFileNamed dtb__43) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dunitDepthLookup = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__44) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__44) else ((v_Vuna_dCompiler_dDriver_dSplit_dunitDepthLookup dtb__45) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> ((fun dd -> ((fun mm -> (if (dd > mm) then dd else mm)) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth mc0) dtb__47))) ((v_Vuna_dCompiler_dDriver_dSplit_dunitDepthLookup mc0) dtb__46))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dstepDepthEntry = (fun memo p -> ((fun md -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (if (md < 0) then 0 else (md + 1))))) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth memo) (Base_dPair.v_Base_dPair_dsecondOf p))))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstepDepths = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dDriver_dSplit_dstepDepthEntry mc0) dtb__48), ((v_Vuna_dCompiler_dDriver_dSplit_dstepDepths mc0) dtb__49)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dallDepthIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (if (((v_Vuna_dCompiler_dDriver_dSplit_dunitDepthLookup mc1) dtb__52) = dtb__53) then ((v_Vuna_dCompiler_dDriver_dSplit_dallDepthIn dtb__51) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsameDepthValue = (fun a b -> (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dSplit_dallDepthIn a) b) else false))

let rec v_Vuna_dCompiler_dDriver_dSplit_dfixDepths = (fun fuel graph memo -> (if (fuel <= 0) then memo else ((fun next -> (if ((v_Vuna_dCompiler_dDriver_dSplit_dsameDepthValue next) memo) then memo else (((v_Vuna_dCompiler_dDriver_dSplit_dfixDepths (fuel - 1)) graph) next))) ((v_Vuna_dCompiler_dDriver_dSplit_dstepDepths memo) graph))))

let v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess = (fun a b -> (if ((Base_dPair.v_Base_dPair_dsecondOf a) <> (Base_dPair.v_Base_dPair_dsecondOf b)) then ((Base_dPair.v_Base_dPair_dsecondOf a) < (Base_dPair.v_Base_dPair_dsecondOf b)) else ((v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey (Base_dPair.v_Base_dPair_dfirstOf a)) <= (v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey (Base_dPair.v_Base_dPair_dfirstOf b)))))

let rec v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if ((v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess mc0) dtb__54) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55)))) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry mc0) dtb__55))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry dtb__56) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries dtb__57))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match ((v_Vuna_dCompiler_dDriver_dSplit_dfindFileNamed mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__58)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__60, ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries mc0) dtb__59)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries mc0) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dgraphName = (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))

let rec v_Vuna_dCompiler_dDriver_dSplit_dinsertDep = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (if ((v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey mc0) <= (v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey dtb__61)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62)))) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDep mc0) dtb__62))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDep dtb__63) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie dtb__64))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps = (fun f -> (C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ((v_Vuna_dCompiler_dDriver_dSplit_dsplitName f), (v_Vuna_dCompiler_dDriver_dSplit_dsplitText f), (v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie (v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps f)))))

let v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo = (fun files -> ((fun graph -> ((fun names -> ((fun baseMemo -> ((fun depths -> ((fun ordered -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps) ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries files) ordered))) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dSplit_dunitDepthLookup depths) (Base_dPair.v_Base_dPair_dfirstOf p)))))) graph)))) (((v_Vuna_dCompiler_dDriver_dSplit_dfixDepths ((Base_dList.v_Base_dList_dlength names) + 2)) graph) baseMemo))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), 0)))) graph))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dSplit_dgraphName) graph))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files)))
