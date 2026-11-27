open Vuna_runtime
type t_SplitFile = { f_SplitFile_splitName : string; f_SplitFile_splitText : string; f_SplitFile_splitDeps : string B_dData_dList.t_List }

# 85 "Vuna/Compiler/Driver/Split.vuna"
let v_stripMl = (fun (dtb_u_u1 : string) -> (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength dtb_u_u1) 3)) dtb_u_u1))

# 107 "Vuna/Compiler/Driver/Split.vuna"
let rec v_pruneNames = (fun (dtb_u_u2 : int) (dtb_u_u3 : string B_dData_dList.t_List) (dtb_u_u4 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u5 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u6 : string B_dData_dList.t_List) -> (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (if (dtb_u_u2 <= 0) then dtb_u_u6 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u7) dtb_u_u5) then (((((v_pruneNames (dtb_u_u2 - 1)) dtb_u_u8) dtb_u_u4) dtb_u_u5) dtb_u_u6) else (let dtb_u_u9 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u7) dtb_u_u4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u10) -> dtb_u_u10
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((((v_pruneNames (dtb_u_u2 - 1)) ((B_dData_dList.v_append dtb_u_u8) dtb_u_u9)) dtb_u_u4) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u7) true) dtb_u_u5)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u6))))))
  | B_dData_dList.C_List_Nil -> dtb_u_u6
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Driver/Split.vuna"
let v_depthOfUnit = (fun (dtb_u_u11 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u12 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u12) dtb_u_u11) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u13) -> dtb_u_u13
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/Split.vuna"
let v_maxInt = (fun (dtb_u_u14 : int) (dtb_u_u15 : int) -> (if (dtb_u_u14 > dtb_u_u15) then dtb_u_u14 else dtb_u_u15))

# 140 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depthOfDeps = (fun (dtb_u_u16 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u17 : string B_dData_dList.t_List) -> (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> ((v_maxInt (((v_depthOfUnit dtb_u_u16) dtb_u_u18) + 1)) ((v_depthOfDeps dtb_u_u16) dtb_u_u19))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitDepths = (fun (dtb_u_u20 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u21 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (match dtb_u_u22 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u24; B_dData_dPair.f_Pair_second = dtb_u_u25 } -> ((v_splitDepths dtb_u_u23) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u24) ((v_depthOfDeps dtb_u_u21) dtb_u_u25)) dtb_u_u21))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u21
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Driver/Split.vuna"
let rec v_graphMaxDepth = (fun (dtb_u_u26 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u27 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u28 : int) -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (match dtb_u_u29 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u31; B_dData_dPair.f_Pair_second = dtb_u_u32 } -> (((v_graphMaxDepth dtb_u_u30) dtb_u_u27) ((v_maxInt dtb_u_u28) ((v_depthOfUnit dtb_u_u27) dtb_u_u31)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u28
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Driver/Split.vuna"
let v_splitLayers = (fun (dtb_u_u33 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u33 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (let dtb_u_u34 = ((v_splitDepths dtb_u_u33) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let dtb_u_u35 = (((v_graphMaxDepth dtb_u_u33) dtb_u_u34) 0) in ((B_dData_dList.v_map (fun (dtb_u_u36 : int) -> ((B_dData_dList.v_filter (fun (dtb_u_u37 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((v_depthOfUnit dtb_u_u34) (B_dData_dPair.v_firstOf dtb_u_u37)) = dtb_u_u36))) dtb_u_u33))) ((B_dData_dList.v_range 0) (dtb_u_u35 + 1)))))
))

# 287 "Vuna/Compiler/Driver/Split.vuna"
let rec v_spaceJoin = (fun (dtb_u_u38 : string B_dData_dList.t_List) -> (match dtb_u_u38 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u39, dtb_u_u40) -> (String.concat "" [dtb_u_u39; " "; (v_spaceJoin dtb_u_u40)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depsSuffix = (fun (dtb_u_u41 : string B_dData_dList.t_List) -> (match dtb_u_u41 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (String.concat "" [" "; dtb_u_u42; (v_depsSuffix dtb_u_u43)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRows = (fun (dtb_u_u44 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u44 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (match dtb_u_u45 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u47; B_dData_dPair.f_Pair_second = dtb_u_u48 } -> (String.concat "" [dtb_u_u47; (v_depsSuffix dtb_u_u48); "\n"; (v_tableRows dtb_u_u46)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRest = (fun (dtb_u_u49 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u49 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> (String.concat "" ["@\n"; (v_tableRows dtb_u_u50); (v_tableRest dtb_u_u51)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTableText = (fun (dtb_u_u52 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u53, dtb_u_u54) -> ((v_tableRows dtb_u_u53) ^ (v_tableRest dtb_u_u54))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Driver/Split.vuna"
let v_buildScript = (fun (dtb_u_u55 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u56 : string B_dData_dList.t_List) -> (String.concat "" ["#!/bin/sh\n# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136\231\155\180\230\142\165\228\190\157\232\181\150\232\161\168 + \229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143 + \229\136\134\229\177\130\229\185\182\232\161\140\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n# \229\141\149\229\133\131\232\161\168\229\156\168\230\156\172\230\150\135\228\187\182\230\156\171\229\176\190\231\154\132 `VUNA_UNIT_TABLE` \233\135\140\239\188\154`@` \229\136\134\233\154\148\229\185\182\232\161\140\229\177\130\239\188\140\229\133\182\228\189\153\230\175\143\232\161\140 `\229\141\149\229\133\131 \231\155\180\230\142\165\228\190\157\232\181\150...`\n# \239\188\136\230\139\147\230\137\145\229\186\143\239\188\137\227\128\130\229\185\178\229\135\128\230\158\132\229\187\186\228\184\148 JOBS<=1\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml\239\188\155\229\133\182\228\189\153\230\140\137\229\134\133\229\174\185\229\147\136\229\184\140\233\128\144\229\141\149\229\133\131\231\188\150\232\175\145\227\128\130\n# \229\162\158\233\135\143\231\154\132\229\136\164\230\141\174\230\152\175\227\128\140\230\156\172\229\141\149\229\133\131 .ml/.mli + \231\155\180\230\142\165\228\190\157\232\181\150\231\154\132 .cmx\227\128\141\239\188\154\228\190\157\232\181\150\229\174\158\231\142\176\229\143\152\228\186\134\229\176\177\233\135\141\231\188\150\228\184\139\230\184\184\239\188\140\228\190\157\232\181\150\n# \229\143\170\230\152\175\233\135\141\230\150\176\231\148\159\230\136\144\228\186\134\229\144\140\230\160\183\231\154\132 .cmx \229\136\153\232\183\179\232\191\135\227\128\130\231\168\139\229\186\143\232\135\170\229\183\177\231\154\132\229\174\154\228\185\137\228\189\141\231\189\174\232\161\168\229\156\168\231\139\172\231\171\139\229\141\149\229\133\131\239\188\136`Vuna_deflocs`\239\188\137\239\188\140\n# `Vuna_runtime` \228\184\142 base \229\141\149\229\133\131\232\183\168\231\168\139\229\186\143\228\191\157\230\140\129\229\144\140\228\184\128\228\187\189 .cmx\227\128\130\nset -eu\ncd \"$(dirname \"$0\")\"\nOUT=${1:-program}\nFLAGS=\"-g -w -a+39 -warn-error +39\"\nJOBS=${VUNA_BUILD_JOBS:-}\nif [ -z \"$JOBS\" ]; then\n  JOBS=$(nproc 2>/dev/null || echo 1)\n  case \"${NIX_BUILD_CORES:-}\" in\n    ''|*[!0-9]*) ;;\n    0) ;;\n    *) JOBS=$NIX_BUILD_CORES ;;\n  esac\nfi\nC_MODULES=\""; (v_spaceJoin dtb_u_u56); "\"\nC_OBJS=\"\"\n# \229\174\191\228\184\187\232\191\144\232\161\140\230\151\182\239\188\136`dtHostRuntime`\239\188\137\230\152\175\229\148\175\228\184\128\229\188\149\231\148\168 `Unix.` \231\154\132\229\157\151\239\188\155\228\184\141\231\148\168\229\174\191\228\184\187\229\142\159\232\175\173\231\154\132\231\168\139\229\186\143\228\184\141\233\147\190\230\142\165\n# `unix.cmxa`\226\128\148\226\128\148\229\174\131\231\154\132\230\168\161\229\157\151\229\136\157\229\167\139\229\140\150\229\156\168\232\191\155\231\168\139\229\144\175\229\138\168\230\151\182\229\128\188\229\135\160\231\153\190\229\190\174\231\167\146\227\128\130\nUNIX=\"\"\nif grep -q 'Unix\\.' Vuna_runtime.ml 2>/dev/null; then UNIX=\"unix.cmxa\"; fi\nif [ -n \"$C_MODULES\" ]; then\n  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\nfi\nhash_of() {\n  for f in \"$@\"; do\n    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n  done | sha256sum | awk '{print $1}'\n}\nstamp_want() {\n  base=$1\n  shift\n  deps=\"\"\n  for d in \"$@\"; do deps=\"$deps $d.cmx\"; done\n  hash_of \"$base.ml\" \"$base.mli\" $deps\n}\ncompile_mod() {\n  base=$1\n  shift\n  want=$(stamp_want \"$base\" \"$@\")\n  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n  echo \"compile $base\"\n  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n  printf '%s' \"$want\" > \"$base.stamp\"\n}\npids=\"\"\nflush_layer() {\n  for p in $pids; do wait \"$p\" || exit 1; done\n  pids=\"\"\n}\n# \230\140\137\229\141\149\229\133\131\232\161\168\233\169\177\229\138\168\239\188\140\229\155\155\231\167\141\231\148\168\233\128\148\229\133\177\231\148\168\229\144\140\228\184\128\228\187\189\228\190\157\232\181\150\232\161\168\239\188\154\n#   clean    \230\142\162\230\181\139\230\152\175\229\144\166\229\183\178\230\156\137 .cmx\239\188\136\229\134\179\229\174\154\232\181\176\229\141\149\230\172\161\232\176\131\231\148\168\232\191\152\230\152\175\233\128\144\229\141\149\229\133\131\232\183\175\229\190\132\239\188\137\n#   source   \230\148\182\233\155\134\229\141\149\230\172\161 ocamlopt \231\154\132\229\133\168\233\131\168\232\190\147\229\133\165\239\188\136SOURCES\239\188\137\228\184\142\233\147\190\230\142\165\229\186\143\239\188\136CMXS\239\188\137\n#   parallel \233\128\144\229\177\130\229\185\182\232\161\140\231\188\150\232\175\145\239\188\154\229\177\130\229\134\133 `&`\239\188\140\229\177\130\230\156\171 flush_layer \233\128\144\228\184\170 wait\n#   stamps   \229\185\178\229\135\128\230\158\132\229\187\186\229\144\142\232\161\165\229\134\153\230\175\143\229\141\149\229\133\131 .stamp\239\188\136\229\162\158\233\135\143\230\158\132\229\187\186\231\154\132\232\190\147\229\133\165\239\188\137\neach_unit() {\n  mode=$1\n  while IFS= read -r line; do\n    case \"$line\" in\n      ''|'#'*) continue ;;\n      '@') flush_layer; continue ;;\n    esac\n    set -- $line\n    base=$1\n    shift\n    case \"$mode\" in\n      clean) if [ -f \"$base.cmx\" ]; then clean=0; fi ;;\n      source)\n        CMXS=\"$CMXS $base.cmx\"\n        if [ -f \"$base.mli\" ]; then SOURCES=\"$SOURCES $base.mli\"; fi\n        SOURCES=\"$SOURCES $base.ml\"\n        ;;\n      parallel)\n        CMXS=\"$CMXS $base.cmx\"\n        compile_mod \"$base\" \"$@\" &\n        pids=\"$pids $!\"\n        ;;\n      stamps) printf '%s' \"$(stamp_want \"$base\" \"$@\")\" > \"$base.stamp\" ;;\n    esac\n  done <<'VUNA_UNIT_TABLE'\n"; (v_unitTableText (v_splitLayers dtb_u_u55)); "VUNA_UNIT_TABLE\n  flush_layer\n}\nclean=1\neach_unit clean\nif [ \"$clean\" -eq 1 ] && [ \"$JOBS\" -le 1 ]; then\n  SOURCES=\"\"\n  CMXS=\"\"\n  each_unit source\n  ocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $SOURCES $C_OBJS\n  each_unit stamps\n  echo \"built $OUT\"\n  exit 0\nfi\nCMXS=\"\"\neach_unit parallel\nocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $CMXS $C_OBJS\necho \"built $OUT\"\n"]))

# 324 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTieKey = (fun (dtb_u_u57 : string) -> (Base_dHash.v_contentKey ("t:" ^ dtb_u_u57)))

# 333 "Vuna/Compiler/Driver/Split.vuna"
let rec v_markNames = (fun (dtb_u_u58 : string B_dData_dList.t_List) (dtb_u_u59 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u58 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> ((v_markNames dtb_u_u61) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u60) true) dtb_u_u59))
  | B_dData_dList.C_List_Nil -> dtb_u_u59
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Driver/Split.vuna"
let rec v_nameSetOf = (fun (dtb_u_u62 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u63 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u64 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u66; B_dData_dPair.f_Pair_second = dtb_u_u67 } -> ((v_nameSetOf dtb_u_u65) ((v_markNames dtb_u_u67) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u66) true) dtb_u_u63)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u63
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Driver/Split.vuna"
let v_tieTableOf = (fun (dtb_u_u68 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u69 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = (v_unitTieKey dtb_u_u69) })) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dHashMap.v_toList ((v_nameSetOf dtb_u_u68) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))))))

# 342 "Vuna/Compiler/Driver/Split.vuna"
let v_tieOf = (fun (dtb_u_u70 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u71 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u71) dtb_u_u70) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> dtb_u_u72
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Driver/Split.vuna"
let rec v_maxDepth = (fun (dtb_u_u73 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u74 : string B_dData_dList.t_List) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (let dtb_u_u77 = ((v_depthOfUnit dtb_u_u73) dtb_u_u75) in (let dtb_u_u78 = ((v_maxDepth dtb_u_u73) dtb_u_u76) in (if (dtb_u_u77 > dtb_u_u78) then dtb_u_u77 else dtb_u_u78)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Driver/Split.vuna"
let rec v_stepDepths = (fun (dtb_u_u79 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u80 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u80 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u81, dtb_u_u82) -> (let dtb_u_u83 = ((v_maxDepth dtb_u_u79) (B_dData_dPair.v_secondOf dtb_u_u81)) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u81); B_dData_dPair.f_Pair_second = (if (dtb_u_u83 < 0) then 0 else (dtb_u_u83 + 1)) }, ((v_stepDepths dtb_u_u79) dtb_u_u82))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Driver/Split.vuna"
let rec v_sameDepthTable = (fun (dtb_u_u84 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u85 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (if (((v_depthOfUnit dtb_u_u84) (B_dData_dPair.v_firstOf dtb_u_u86)) = (B_dData_dPair.v_secondOf dtb_u_u86)) then ((v_sameDepthTable dtb_u_u84) dtb_u_u87) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Driver/Split.vuna"
let rec v_convergedWithin = (fun (dtb_u_u88 : int) (dtb_u_u89 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u90 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u88 <= 0) then false else (let dtb_u_u91 = ((v_stepDepths dtb_u_u90) dtb_u_u89) in (if ((v_sameDepthTable dtb_u_u90) dtb_u_u91) then true else (((v_convergedWithin (dtb_u_u88 - 1)) dtb_u_u89) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u91))))))

# 371 "Vuna/Compiler/Driver/Split.vuna"
let rec v_fixDepths = (fun (dtb_u_u92 : int) (dtb_u_u93 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u94 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u92 <= 0) then dtb_u_u94 else (let dtb_u_u95 = ((v_stepDepths dtb_u_u94) dtb_u_u93) in (if ((v_sameDepthTable dtb_u_u94) dtb_u_u95) then dtb_u_u94 else (((v_fixDepths (dtb_u_u92 - 1)) dtb_u_u93) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u95))))))

# 381 "Vuna/Compiler/Driver/Split.vuna"
let v_depthEntryLess = (fun (dtb_u_u96 : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) (dtb_u_u97 : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u96)) <> (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u97))) then ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u96)) < (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u97))) else ((B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u96)) <= (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u97)))))

# 388 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepthEntries = (fun (dtb_u_u98 : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_depthEntryLess) dtb_u_u98))

# 392 "Vuna/Compiler/Driver/Split.vuna"
let[@tail_mod_cons] rec v_filesOfDepthEntries = (fun (dtb_u_u99 : (string, t_SplitFile) B_dContainer_dHashMap.t_HashMap) (dtb_u_u100 : string B_dData_dList.t_List) -> (match dtb_u_u100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u101, dtb_u_u102) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb_u_u101 ^ ".ml")) dtb_u_u99) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u103) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u103, ((v_filesOfDepthEntries dtb_u_u99) dtb_u_u102)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_filesOfDepthEntries dtb_u_u99) dtb_u_u102)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepEntries = (fun (dtb_u_u104 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (dtb_u_u105 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u106 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (B_dData_dPair.v_secondOf dtb_u_u105)) (B_dData_dPair.v_secondOf dtb_u_u106)))) dtb_u_u104))

# 411 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepsByTie = (fun (dtb_u_u107 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u108 : string B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_sortDepEntries ((B_dData_dList.v_map (fun (dtb_u_u109 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u109; B_dData_dPair.f_Pair_second = ((v_tieOf dtb_u_u107) dtb_u_u109) })) dtb_u_u108))))

# 427 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFile = (fun (dtb_u_u110 : t_SplitFile) (dtb_u_u111 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u110).f_SplitFile_splitName) ((Base_dBytes.v_encStr (dtb_u_u110).f_SplitFile_splitText) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (dtb_u_u110).f_SplitFile_splitDeps) dtb_u_u111))))

# 431 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFiles = (fun (dtb_u_u112 : t_SplitFile B_dData_dList.t_List) (dtb_u_u113 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encSplitFile) dtb_u_u112) dtb_u_u113))

# 25 "Vuna/Compiler/Driver/Split.vuna"
let v_splitName = (fun (dtb_u_u114 : t_SplitFile) -> (match dtb_u_u114 with
  | { f_SplitFile_splitName = dtb_u_u115; f_SplitFile_splitText = dtb_u_u116; f_SplitFile_splitDeps = dtb_u_u117 } -> dtb_u_u115
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/Split.vuna"
let v_splitUnitOfFile = (fun (dtb_u_u118 : t_SplitFile) -> (v_stripMl (v_splitName dtb_u_u118)))

# 26 "Vuna/Compiler/Driver/Split.vuna"
let v_splitText = (fun (dtb_u_u119 : t_SplitFile) -> (match dtb_u_u119 with
  | { f_SplitFile_splitName = dtb_u_u120; f_SplitFile_splitText = dtb_u_u121; f_SplitFile_splitDeps = dtb_u_u122 } -> dtb_u_u121
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFiles = (fun (dtb_u_u123 : string) (dtb_u_u126 : string) (dtb_u_u127 : t_SplitFile B_dData_dList.t_List) -> (match dtb_u_u127 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (Obj.repr ((fun (dtb_u_u134 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u135 = Obj.obj ((((v_writeSplitFiles dtb_u_u123) dtb_u_u126) dtb_u_u129)) in (let dtb_u_u137 = (dtb_u_u135 dtb_u_u134) in (match dtb_u_u137 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u138) -> (let dtb_u_u140 = (Base_dDiag.C_Check_ErrC (dtb_u_u138)) in dtb_u_u140)
  | Base_dDiag.C_Check_OkC (dtb_u_u142) -> (let dtb_u_u148 = Obj.obj ((((B_dEffect_dFs.v_fsWriteFile dtb_u_u123) (String.concat "" [dtb_u_u126; "/"; (v_splitName dtb_u_u128)])) (v_splitText dtb_u_u128))) in (let dtb_u_u150 = (dtb_u_u148 dtb_u_u134) in (let dtb_u_u152 = (Base_dDiag.C_Check_OkC ((dtb_u_u142 + 1))) in dtb_u_u152)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u155 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u156 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u155))))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFilesIfChanged = (fun (dtb_u_u157 : string) (dtb_u_u160 : string) (dtb_u_u161 : t_SplitFile B_dData_dList.t_List) -> (match dtb_u_u161 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u162, dtb_u_u163) -> (Obj.repr ((fun (dtb_u_u168 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u169 = Obj.obj ((((v_writeSplitFilesIfChanged dtb_u_u157) dtb_u_u160) dtb_u_u163)) in (let dtb_u_u171 = (dtb_u_u169 dtb_u_u168) in (match dtb_u_u171 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u172) -> (let dtb_u_u174 = (Base_dDiag.C_Check_ErrC (dtb_u_u172)) in dtb_u_u174)
  | Base_dDiag.C_Check_OkC (dtb_u_u176) -> (let dtb_u_u177 = (String.concat "" [dtb_u_u160; "/"; (v_splitName dtb_u_u162)]) in (let dtb_u_u178 = (v_splitText dtb_u_u162) in (let dtb_u_u184 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u157) dtb_u_u177)) in (let dtb_u_u186 = (dtb_u_u184 dtb_u_u168) in (if dtb_u_u186 then (let dtb_u_u192 = Obj.obj (((B_dEffect_dFs.v_fsReadFile dtb_u_u157) dtb_u_u177)) in (let dtb_u_u194 = (dtb_u_u192 dtb_u_u168) in (if (dtb_u_u194 = dtb_u_u178) then (let dtb_u_u196 = (Base_dDiag.C_Check_OkC ((dtb_u_u176 + 1))) in dtb_u_u196) else (let dtb_u_u203 = Obj.obj ((((B_dEffect_dFs.v_fsWriteFile dtb_u_u157) dtb_u_u177) dtb_u_u178)) in (let dtb_u_u205 = (dtb_u_u203 dtb_u_u168) in (let dtb_u_u207 = (Base_dDiag.C_Check_OkC ((dtb_u_u176 + 1))) in dtb_u_u207)))))) else (let dtb_u_u214 = Obj.obj ((((B_dEffect_dFs.v_fsWriteFile dtb_u_u157) dtb_u_u177) dtb_u_u178)) in (let dtb_u_u216 = (dtb_u_u214 dtb_u_u168) in (let dtb_u_u218 = (Base_dDiag.C_Check_OkC ((dtb_u_u176 + 1))) in dtb_u_u218))))))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u221 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u222 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u221))))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Driver/Split.vuna"
let v_splitDeps = (fun (dtb_u_u223 : t_SplitFile) -> (match dtb_u_u223 with
  | { f_SplitFile_splitName = dtb_u_u224; f_SplitFile_splitText = dtb_u_u225; f_SplitFile_splitDeps = dtb_u_u226 } -> dtb_u_u226
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitGraph = (fun (dtb_u_u227 : t_SplitFile B_dData_dList.t_List) -> (match dtb_u_u227 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229) -> (let dtb_u_u230 = (v_splitName dtb_u_u228) in (if ((B_dData_dString.v_endsWith ".ml") dtb_u_u230) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripMl dtb_u_u230); B_dData_dPair.f_Pair_second = (v_splitDeps dtb_u_u228) }, (v_splitGraph dtb_u_u229))) else (v_splitGraph dtb_u_u229)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Driver/Split.vuna"
let v_pruneSplitFiles = (fun (dtb_u_u231 : string B_dData_dList.t_List) (dtb_u_u232 : t_SplitFile B_dData_dList.t_List) -> (let dtb_u_u233 = (v_splitGraph dtb_u_u232) in (let dtb_u_u234 = (((B_dData_dList.v_foldl (fun (dtb_u_u239 : int) (dtb_u_u240 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((B_dTrait_dNum.v__x43_ B_dData_dNat.v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat) dtb_u_u239) (B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb_u_u240))))) 0) dtb_u_u233) in (let dtb_u_u235 = (bi_natAdd (bi_natAdd 8 (bi_natMul 4 (B_dData_dList.v_length dtb_u_u231))) dtb_u_u234) in (let dtb_u_u236 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u233) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let dtb_u_u237 = (((((v_pruneNames dtb_u_u235) dtb_u_u231) dtb_u_u236) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in ((B_dData_dList.v_filter (fun (dtb_u_u238 : t_SplitFile) -> ((B_dData_dList.v_memName (v_splitUnitOfFile dtb_u_u238)) dtb_u_u237))) dtb_u_u232)))))))

# 297 "Vuna/Compiler/Driver/Split.vuna"
let v_splitGraphAcyclic = (fun (dtb_u_u241 : t_SplitFile B_dData_dList.t_List) -> (let dtb_u_u242 = (v_splitGraph dtb_u_u241) in (let dtb_u_u243 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u244 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u244); B_dData_dPair.f_Pair_second = 0 })) dtb_u_u242)) in (((v_convergedWithin ((B_dData_dList.v_length dtb_u_u242) + 2)) dtb_u_u242) dtb_u_u243))))

# 417 "Vuna/Compiler/Driver/Split.vuna"
let v_normalizeFileDeps = (fun (dtb_u_u245 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u246 : t_SplitFile) -> { f_SplitFile_splitName = (v_splitName dtb_u_u246); f_SplitFile_splitText = (v_splitText dtb_u_u246); f_SplitFile_splitDeps = ((v_sortDepsByTie dtb_u_u245) (v_splitDeps dtb_u_u246)) })

# 399 "Vuna/Compiler/Driver/Split.vuna"
let v_canonicalTopo = (fun (dtb_u_u247 : t_SplitFile B_dData_dList.t_List) -> (let dtb_u_u248 = (v_splitGraph dtb_u_u247) in (let dtb_u_u249 = (v_tieTableOf dtb_u_u248) in (let dtb_u_u250 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u257 : t_SplitFile) -> { B_dData_dPair.f_Pair_first = (v_splitName dtb_u_u257); B_dData_dPair.f_Pair_second = dtb_u_u257 })) dtb_u_u247)) in (let dtb_u_u251 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u256 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u256); B_dData_dPair.f_Pair_second = 0 })) dtb_u_u248)) in (let dtb_u_u252 = (((v_fixDepths ((B_dData_dList.v_length dtb_u_u248) + 2)) dtb_u_u248) dtb_u_u251) in (let dtb_u_u253 = ((B_dData_dList.v_map (fun (dtb_u_u255 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = ((v_depthOfUnit dtb_u_u252) (B_dData_dPair.v_firstOf dtb_u_u255)); B_dData_dPair.f_Pair_second = ((v_tieOf dtb_u_u249) (B_dData_dPair.v_firstOf dtb_u_u255)) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u255) })) dtb_u_u248) in (let dtb_u_u254 = ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortDepthEntries dtb_u_u253)) in ((B_dData_dList.v_map (v_normalizeFileDeps dtb_u_u249)) ((v_filesOfDepthEntries dtb_u_u250) dtb_u_u254))))))))))
