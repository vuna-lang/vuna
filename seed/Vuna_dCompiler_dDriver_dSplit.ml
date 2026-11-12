open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dSplit_dSplitFile = { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName : string; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText : string; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps : string Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dDriver_dSplit_dsplitName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = dtb__0; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = dtb__1; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitText = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = dtb__3; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = dtb__4; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = dtb__6; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = dtb__7; f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles mc0) dtb__10)) (fun restR -> (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__11) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__11)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__12) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__9)])) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__9))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__12 + 1))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged mc0) dtb__14)) (fun restR -> (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__15) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__15)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__16) -> ((fun path -> ((fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun old -> (if (old = text) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__16 + 1)))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) path) text)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__16 + 1))))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) path) text)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__16 + 1)))))))))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitText dtb__13))) (String.concat "" [mc0; "/"; (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__13)]))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dstripMl = (fun name -> (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength name) 3)) name))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> ((fun name -> (if ((Base_dString.v_Base_dString_dendsWith ".ml") name) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dSplit_dstripMl name); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps dtb__17) }, (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph dtb__18))) else (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph dtb__18))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitName dtb__17))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit = (fun depths unit -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) unit) depths) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> dtb__19
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dmaxInt = (fun a b -> (if (a > b) then a else b))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dDriver_dSplit_dmaxInt (((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc0) dtb__20) + 1)) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps mc0) dtb__21))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> ((v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths dtb__23) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__24) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps mc1) dtb__25)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = dtb__29 } -> (((v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth dtb__27) mc1) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxInt mc2) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc1) dtb__28)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> ((fun depths -> ((fun maxD -> ((Base_dList.v_Base_dList_dmap (fun d -> ((Base_dList.v_Base_dList_dfilter (fun q -> (((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit depths) (Base_dPair.v_Base_dPair_dfirstOf q)) = d))) mc0))) ((Base_dList.v_Base_dList_drange 0) (maxD + 1)))) (((v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth mc0) depths) 0))) ((v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths mc0) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf dtb__30), (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits dtb__31)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (String.concat "" [dtb__32; " "; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin dtb__33)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (String.concat "" [" "; dtb__34; (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix dtb__35)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstampWrites = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (String.concat "" ["  printf '%s' \"$(stamp_want "; (Base_dPair.v_Base_dPair_dfirstOf dtb__36); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__36)); ")\" > \""; (Base_dPair.v_Base_dPair_dfirstOf dtb__36); ".stamp\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dstampWrites dtb__37)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dbgCalls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (String.concat "" ["compile_mod "; (Base_dPair.v_Base_dPair_dfirstOf dtb__38); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__38)); " &\npids=\"$pids $!\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dbgCalls dtb__39)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["compile_mod "; (Base_dPair.v_Base_dPair_dfirstOf dtb__40); (v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix (Base_dPair.v_Base_dPair_dsecondOf dtb__40)); "\n"])
  | _ -> (String.concat "" ["pids=\"\"\n"; (v_Vuna_dCompiler_dDriver_dSplit_dbgCalls mc0); "for p in $pids; do wait \"$p\" || exit 1; done\n"])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> ((v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls dtb__42) ^ (v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts dtb__43))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__44 ^ ".cmx")
  | _ -> (String.concat "" [dtb__44; ".cmx "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs dtb__45)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dbuildScript = (fun graph cFiles -> (String.concat "" ["#!/bin/sh\n# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136C35\239\188\154\230\140\137\231\155\180\230\142\165\228\190\157\232\181\150\229\136\134\229\177\130\229\185\182\232\161\140 + \229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n# \229\185\178\229\135\128\230\158\132\229\187\186\228\184\148 JOBS<=1\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml \229\185\182\233\147\190\230\142\165\239\188\155\n# \229\162\158\233\135\143\230\158\132\229\187\186\239\188\154\230\175\143\229\141\149\229\133\131 .ml/.mli \228\184\142\231\155\180\230\142\165\228\190\157\232\181\150 .stamp \231\154\132\229\134\133\229\174\185\229\147\136\229\184\140\229\134\153 $base.stamp\239\188\140\229\145\189\228\184\173\229\141\179\232\183\179\232\191\135\239\188\155\n# \229\144\140\229\177\130\229\141\149\229\133\131\228\186\146\228\184\141\228\190\157\232\181\150\239\188\154\229\164\154\229\141\149\229\133\131\229\177\130\231\148\168\229\144\142\229\143\176\228\187\187\229\138\161\229\185\182\232\161\140\231\188\150\232\175\145\239\188\140\229\177\130\233\151\180\231\148\168 wait \228\184\178\232\161\140\227\128\130\nset -eu\ncd \"$(dirname \"$0\")\"\nOUT=${1:-program}\nFLAGS=\"-g -w -a+39 -warn-error +39\"\nMODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits graph)); "\"\nJOBS=${VUNA_BUILD_JOBS:-}\nif [ -z \"$JOBS\" ]; then\n  JOBS=$(nproc 2>/dev/null || echo 1)\n  case \"${NIX_BUILD_CORES:-}\" in\n    ''|*[!0-9]*) ;;\n    0) ;;\n    *) JOBS=$NIX_BUILD_CORES ;;\n  esac\nfi\nC_MODULES=\""; (v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin cFiles); "\"\nC_OBJS=\"\"\nif [ -n \"$C_MODULES\" ]; then\n  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\nfi\nhash_of() {\n  for f in \"$@\"; do\n    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n  done | sha256sum | awk '{print $1}'\n}\nstamp_want() {\n  base=$1\n  shift\n  deps=\"\"\n  for d in \"$@\"; do deps=\"$deps $d.stamp\"; done\n  hash_of \"$base.ml\" \"$base.mli\" $deps\n}\nclean=1\nfor m in $MODULES; do\n  if [ -f \"$m.cmx\" ]; then clean=0; fi\ndone\nif [ \"$clean\" -eq 1 ] && [ \"$JOBS\" -le 1 ]; then\n  SOURCES=\"\"\n  for m in $MODULES; do\n    if [ -f \"$m.mli\" ]; then SOURCES=\"$SOURCES $m.mli\"; fi\n    SOURCES=\"$SOURCES $m.ml\"\n  done\n  ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa $SOURCES $C_OBJS\n"; (v_Vuna_dCompiler_dDriver_dSplit_dstampWrites graph); "  echo \"built $OUT\"\n  exit 0\nfi\ncompile_mod() {\n  base=$1\n  shift\n  want=$(stamp_want \"$base\" \"$@\")\n  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n  echo \"compile $base\"\n  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n  printf '%s' \"$want\" > \"$base.stamp\"\n}\n"; (v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts (v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers graph)); "ocamlopt $FLAGS -I +unix -o \"$OUT\" unix.cmxa "; (v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs (v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits graph)); " $C_OBJS\necho \"built $OUT\"\n"]))

let v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey = (fun name -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey ("t:" ^ name)))

let rec v_Vuna_dCompiler_dDriver_dSplit_dmarkNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> ((v_Vuna_dCompiler_dDriver_dSplit_dmarkNames dtb__47) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__46) true) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dnameSetOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__48 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> ((v_Vuna_dCompiler_dDriver_dSplit_dnameSetOf dtb__49) ((v_Vuna_dCompiler_dDriver_dSplit_dmarkNames dtb__51) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__50) true) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dtieTableOf = (fun graph -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey n) })) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) ((v_Vuna_dCompiler_dDriver_dSplit_dnameSetOf graph) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dDriver_dSplit_dtieOf = (fun ties name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) ties) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> dtb__52
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> ((fun dd -> ((fun mm -> (if (dd > mm) then dd else mm)) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth mc0) dtb__54))) ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dstepDepths = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> ((fun md -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__55); Base_dPair.f_Base_dPair_dPair_second = (if (md < 0) then 0 else (md + 1)) }, ((v_Vuna_dCompiler_dDriver_dSplit_dstepDepths mc0) dtb__56)))) ((v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth mc0) (Base_dPair.v_Base_dPair_dsecondOf dtb__55)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsameDepthTable = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__57)) = (Base_dPair.v_Base_dPair_dsecondOf dtb__57)) then ((v_Vuna_dCompiler_dDriver_dSplit_dsameDepthTable mc0) dtb__58) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dfixDepths = (fun fuel graph memo -> (if (fuel <= 0) then memo else ((fun next -> (if ((v_Vuna_dCompiler_dDriver_dSplit_dsameDepthTable memo) next) then memo else (((v_Vuna_dCompiler_dDriver_dSplit_dfixDepths (fuel - 1)) graph) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) next)))) ((v_Vuna_dCompiler_dDriver_dSplit_dstepDepths memo) graph))))

let v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess = (fun a b -> (if ((Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf a)) <> (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf b))) then ((Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf a)) < (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf b))) else ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf a)) <= (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf b)))))

let rec v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if ((v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess mc0) dtb__59) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__59, ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry mc0) dtb__60))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry dtb__61) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries dtb__62))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (dtb__63 ^ ".ml")) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (Base_dList.C_Base_dList_dList_Cons (dtb__65, ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries mc0) dtb__64)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries mc0) dtb__64)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dinsertDep = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if ((Base_dPair.v_Base_dPair_dsecondOf mc0) <= (Base_dPair.v_Base_dPair_dsecondOf dtb__66)) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__66, ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDep mc0) dtb__67))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dSplit_dsortDepEntries = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> ((v_Vuna_dCompiler_dDriver_dSplit_dinsertDep dtb__68) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepEntries dtb__69))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie = (fun ties deps -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepEntries ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = d; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dSplit_dtieOf ties) d) })) deps))))

let v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps = (fun ties f -> { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = (v_Vuna_dCompiler_dDriver_dSplit_dsplitName f); f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = (v_Vuna_dCompiler_dDriver_dSplit_dsplitText f); f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = ((v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie ties) (v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps f)) })

let v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo = (fun files -> ((fun graph -> ((fun ties -> ((fun fileTable -> ((fun baseMemo -> ((fun depths -> ((fun keyed -> ((fun ordered -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps ties)) ((v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries fileTable) ordered))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries keyed)))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit depths) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dSplit_dtieOf ties) (Base_dPair.v_Base_dPair_dfirstOf p)) }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p) })) graph))) (((v_Vuna_dCompiler_dDriver_dSplit_dfixDepths ((Base_dList.v_Base_dList_dlength graph) + 2)) graph) baseMemo))) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = 0 })) graph)))) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun f -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dSplit_dsplitName f); Base_dPair.f_Base_dPair_dPair_second = f })) files)))) (v_Vuna_dCompiler_dDriver_dSplit_dtieTableOf graph))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files)))

let v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile = (fun f acc -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (f).f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr (f).f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) (f).f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps) acc))))

let v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFile = (fun fuel c -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun p1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p1))) (fun p2 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dMaybe.v_Monad_uBase_uMaybe_uMaybe) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (fuel - 1)) (Base_dPair.v_Base_dPair_dsecondOf p2))) (fun p3 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dMaybe.v_Applicative_uBase_uMaybe_uMaybe) { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = (Base_dPair.v_Base_dPair_dfirstOf p1); f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = (Base_dPair.v_Base_dPair_dfirstOf p2); f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = (Base_dPair.v_Base_dPair_dfirstOf p3) }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p3) }))))))))

let v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles = (fun fs acc -> (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile) fs) acc))

let v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (match dtb__70 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__72) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFile) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

let v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (match dtb__73 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__74; Base_dPair.f_Base_dPair_dPair_second = dtb__75 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__75) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFile (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))
