open Vuna_runtime
type t_SplitFile = { f_SplitFile_splitName : string; f_SplitFile_splitText : string; f_SplitFile_splitDeps : string B_dData_dList.t_List }

# 85 "Vuna/Compiler/Driver/Split.vuna"
let v_stripMl = (fun (name : string) -> (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength name) 3)) name))

# 107 "Vuna/Compiler/Driver/Split.vuna"
let rec v_pruneNames = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then mc4 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) mc3) then (((((v_pruneNames (mc0 - 1)) dtb__1) mc2) mc3) mc4) else (let deps = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((((v_pruneNames (mc0 - 1)) ((B_dData_dList.v_append dtb__1) deps)) mc2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__0, mc4))))))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Driver/Split.vuna"
let v_depthOfUnit = (fun (depths : (string, int) B_dContainer_dHashMap.t_HashMap) (unit : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) unit) depths) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/Split.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a > b) then a else b))

# 140 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depthOfDeps = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> ((v_maxInt (((v_depthOfUnit mc0) dtb__4) + 1)) ((v_depthOfDeps mc0) dtb__5))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitDepths = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> ((v_splitDepths dtb__7) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__8) ((v_depthOfDeps mc1) dtb__9)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Driver/Split.vuna"
let rec v_graphMaxDepth = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (((v_graphMaxDepth dtb__11) mc1) ((v_maxInt mc2) ((v_depthOfUnit mc1) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Driver/Split.vuna"
let v_splitLayers = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (let depths = ((v_splitDepths mc0) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let maxD = (((v_graphMaxDepth mc0) depths) 0) in ((B_dData_dList.v_map (fun (d : int) -> ((B_dData_dList.v_filter (fun (q : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((v_depthOfUnit depths) (B_dData_dPair.v_firstOf q)) = d))) mc0))) ((B_dData_dList.v_range 0) (maxD + 1)))))
))

# 287 "Vuna/Compiler/Driver/Split.vuna"
let rec v_spaceJoin = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (String.concat "" [dtb__14; " "; (v_spaceJoin dtb__15)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depsSuffix = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (String.concat "" [" "; dtb__16; (v_depsSuffix dtb__17)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRows = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (String.concat "" [dtb__20; (v_depsSuffix dtb__21); "\n"; (v_tableRows dtb__19)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRest = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (String.concat "" ["@\n"; (v_tableRows dtb__22); (v_tableRest dtb__23)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTableText = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> ((v_tableRows dtb__24) ^ (v_tableRest dtb__25))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Driver/Split.vuna"
let v_buildScript = (fun (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (cFiles : string B_dData_dList.t_List) -> (String.concat "" ["#!/bin/sh\n# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136\231\155\180\230\142\165\228\190\157\232\181\150\232\161\168 + \229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143 + \229\136\134\229\177\130\229\185\182\232\161\140\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n# \229\141\149\229\133\131\232\161\168\229\156\168\230\156\172\230\150\135\228\187\182\230\156\171\229\176\190\231\154\132 `VUNA_UNIT_TABLE` \233\135\140\239\188\154`@` \229\136\134\233\154\148\229\185\182\232\161\140\229\177\130\239\188\140\229\133\182\228\189\153\230\175\143\232\161\140 `\229\141\149\229\133\131 \231\155\180\230\142\165\228\190\157\232\181\150...`\n# \239\188\136\230\139\147\230\137\145\229\186\143\239\188\137\227\128\130\229\185\178\229\135\128\230\158\132\229\187\186\228\184\148 JOBS<=1\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml\239\188\155\229\133\182\228\189\153\230\140\137\229\134\133\229\174\185\229\147\136\229\184\140\233\128\144\229\141\149\229\133\131\231\188\150\232\175\145\227\128\130\n# \229\162\158\233\135\143\231\154\132\229\136\164\230\141\174\230\152\175\227\128\140\230\156\172\229\141\149\229\133\131 .ml/.mli + \231\155\180\230\142\165\228\190\157\232\181\150\231\154\132 .cmx\227\128\141\239\188\154\228\190\157\232\181\150\229\174\158\231\142\176\229\143\152\228\186\134\229\176\177\233\135\141\231\188\150\228\184\139\230\184\184\239\188\140\228\190\157\232\181\150\n# \229\143\170\230\152\175\233\135\141\230\150\176\231\148\159\230\136\144\228\186\134\229\144\140\230\160\183\231\154\132 .cmx \229\136\153\232\183\179\232\191\135\227\128\130\231\168\139\229\186\143\232\135\170\229\183\177\231\154\132\229\174\154\228\185\137\228\189\141\231\189\174\232\161\168\229\156\168\231\139\172\231\171\139\229\141\149\229\133\131\239\188\136`Vuna_deflocs`\239\188\137\239\188\140\n# `Vuna_runtime` \228\184\142 base \229\141\149\229\133\131\232\183\168\231\168\139\229\186\143\228\191\157\230\140\129\229\144\140\228\184\128\228\187\189 .cmx\227\128\130\nset -eu\ncd \"$(dirname \"$0\")\"\nOUT=${1:-program}\nFLAGS=\"-g -w -a+39 -warn-error +39\"\nJOBS=${VUNA_BUILD_JOBS:-}\nif [ -z \"$JOBS\" ]; then\n  JOBS=$(nproc 2>/dev/null || echo 1)\n  case \"${NIX_BUILD_CORES:-}\" in\n    ''|*[!0-9]*) ;;\n    0) ;;\n    *) JOBS=$NIX_BUILD_CORES ;;\n  esac\nfi\nC_MODULES=\""; (v_spaceJoin cFiles); "\"\nC_OBJS=\"\"\n# \229\174\191\228\184\187\232\191\144\232\161\140\230\151\182\239\188\136`dtHostRuntime`\239\188\137\230\152\175\229\148\175\228\184\128\229\188\149\231\148\168 `Unix.` \231\154\132\229\157\151\239\188\155\228\184\141\231\148\168\229\174\191\228\184\187\229\142\159\232\175\173\231\154\132\231\168\139\229\186\143\228\184\141\233\147\190\230\142\165\n# `unix.cmxa`\226\128\148\226\128\148\229\174\131\231\154\132\230\168\161\229\157\151\229\136\157\229\167\139\229\140\150\229\156\168\232\191\155\231\168\139\229\144\175\229\138\168\230\151\182\229\128\188\229\135\160\231\153\190\229\190\174\231\167\146\227\128\130\nUNIX=\"\"\nif grep -q 'Unix\\.' Vuna_runtime.ml 2>/dev/null; then UNIX=\"unix.cmxa\"; fi\nif [ -n \"$C_MODULES\" ]; then\n  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\nfi\nhash_of() {\n  for f in \"$@\"; do\n    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n  done | sha256sum | awk '{print $1}'\n}\nstamp_want() {\n  base=$1\n  shift\n  deps=\"\"\n  for d in \"$@\"; do deps=\"$deps $d.cmx\"; done\n  hash_of \"$base.ml\" \"$base.mli\" $deps\n}\ncompile_mod() {\n  base=$1\n  shift\n  want=$(stamp_want \"$base\" \"$@\")\n  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n  echo \"compile $base\"\n  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n  printf '%s' \"$want\" > \"$base.stamp\"\n}\npids=\"\"\nflush_layer() {\n  for p in $pids; do wait \"$p\" || exit 1; done\n  pids=\"\"\n}\n# \230\140\137\229\141\149\229\133\131\232\161\168\233\169\177\229\138\168\239\188\140\229\155\155\231\167\141\231\148\168\233\128\148\229\133\177\231\148\168\229\144\140\228\184\128\228\187\189\228\190\157\232\181\150\232\161\168\239\188\154\n#   clean    \230\142\162\230\181\139\230\152\175\229\144\166\229\183\178\230\156\137 .cmx\239\188\136\229\134\179\229\174\154\232\181\176\229\141\149\230\172\161\232\176\131\231\148\168\232\191\152\230\152\175\233\128\144\229\141\149\229\133\131\232\183\175\229\190\132\239\188\137\n#   source   \230\148\182\233\155\134\229\141\149\230\172\161 ocamlopt \231\154\132\229\133\168\233\131\168\232\190\147\229\133\165\239\188\136SOURCES\239\188\137\228\184\142\233\147\190\230\142\165\229\186\143\239\188\136CMXS\239\188\137\n#   parallel \233\128\144\229\177\130\229\185\182\232\161\140\231\188\150\232\175\145\239\188\154\229\177\130\229\134\133 `&`\239\188\140\229\177\130\230\156\171 flush_layer \233\128\144\228\184\170 wait\n#   stamps   \229\185\178\229\135\128\230\158\132\229\187\186\229\144\142\232\161\165\229\134\153\230\175\143\229\141\149\229\133\131 .stamp\239\188\136\229\162\158\233\135\143\230\158\132\229\187\186\231\154\132\232\190\147\229\133\165\239\188\137\neach_unit() {\n  mode=$1\n  while IFS= read -r line; do\n    case \"$line\" in\n      ''|'#'*) continue ;;\n      '@') flush_layer; continue ;;\n    esac\n    set -- $line\n    base=$1\n    shift\n    case \"$mode\" in\n      clean) if [ -f \"$base.cmx\" ]; then clean=0; fi ;;\n      source)\n        CMXS=\"$CMXS $base.cmx\"\n        if [ -f \"$base.mli\" ]; then SOURCES=\"$SOURCES $base.mli\"; fi\n        SOURCES=\"$SOURCES $base.ml\"\n        ;;\n      parallel)\n        CMXS=\"$CMXS $base.cmx\"\n        compile_mod \"$base\" \"$@\" &\n        pids=\"$pids $!\"\n        ;;\n      stamps) printf '%s' \"$(stamp_want \"$base\" \"$@\")\" > \"$base.stamp\" ;;\n    esac\n  done <<'VUNA_UNIT_TABLE'\n"; (v_unitTableText (v_splitLayers graph)); "VUNA_UNIT_TABLE\n  flush_layer\n}\nclean=1\neach_unit clean\nif [ \"$clean\" -eq 1 ] && [ \"$JOBS\" -le 1 ]; then\n  SOURCES=\"\"\n  CMXS=\"\"\n  each_unit source\n  ocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $SOURCES $C_OBJS\n  each_unit stamps\n  echo \"built $OUT\"\n  exit 0\nfi\nCMXS=\"\"\neach_unit parallel\nocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $CMXS $C_OBJS\necho \"built $OUT\"\n"]))

# 324 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTieKey = (fun (name : string) -> (Base_dHash.v_contentKey ("t:" ^ name)))

# 333 "Vuna/Compiler/Driver/Split.vuna"
let rec v_markNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> ((v_markNames dtb__27) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__26) true) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Driver/Split.vuna"
let rec v_nameSetOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> ((v_nameSetOf dtb__29) ((v_markNames dtb__31) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__30) true) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Driver/Split.vuna"
let v_tieTableOf = (fun (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (v_unitTieKey n) })) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dHashMap.v_toList ((v_nameSetOf graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))))))

# 342 "Vuna/Compiler/Driver/Split.vuna"
let v_tieOf = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) ties) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> dtb__32
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Driver/Split.vuna"
let rec v_maxDepth = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (let dd = ((v_depthOfUnit mc0) dtb__33) in (let mm = ((v_maxDepth mc0) dtb__34) in (if (dd > mm) then dd else mm)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Driver/Split.vuna"
let rec v_stepDepths = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (let md = ((v_maxDepth mc0) (B_dData_dPair.v_secondOf dtb__35)) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__35); B_dData_dPair.f_Pair_second = (if (md < 0) then 0 else (md + 1)) }, ((v_stepDepths mc0) dtb__36))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Driver/Split.vuna"
let rec v_sameDepthTable = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (if (((v_depthOfUnit mc0) (B_dData_dPair.v_firstOf dtb__37)) = (B_dData_dPair.v_secondOf dtb__37)) then ((v_sameDepthTable mc0) dtb__38) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Driver/Split.vuna"
let rec v_convergedWithin = (fun (fuel : int) (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (memo : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (fuel <= 0) then false else (let next = ((v_stepDepths memo) graph) in (if ((v_sameDepthTable memo) next) then true else (((v_convergedWithin (fuel - 1)) graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) next))))))

# 371 "Vuna/Compiler/Driver/Split.vuna"
let rec v_fixDepths = (fun (fuel : int) (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (memo : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (fuel <= 0) then memo else (let next = ((v_stepDepths memo) graph) in (if ((v_sameDepthTable memo) next) then memo else (((v_fixDepths (fuel - 1)) graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) next))))))

# 381 "Vuna/Compiler/Driver/Split.vuna"
let v_depthEntryLess = (fun (a : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) (b : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf a)) <> (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf b))) then ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf a)) < (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf b))) else ((B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf a)) <= (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf b)))))

# 388 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepthEntries = (fun (xs : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_depthEntryLess) xs))

# 392 "Vuna/Compiler/Driver/Split.vuna"
let[@tail_mod_cons] rec v_filesOfDepthEntries = (fun (mc0 : (string, t_SplitFile) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__39 ^ ".ml")) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (B_dData_dList.C_List__x58__x58_ (dtb__41, ((v_filesOfDepthEntries mc0) dtb__40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_filesOfDepthEntries mc0) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepEntries = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (B_dData_dPair.v_secondOf a)) (B_dData_dPair.v_secondOf b)))) xs))

# 411 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepsByTie = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_sortDepEntries ((B_dData_dList.v_map (fun (d : string) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = ((v_tieOf ties) d) })) deps))))

# 427 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFile = (fun (f : t_SplitFile) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).f_SplitFile_splitName) ((Base_dBytes.v_encStr (f).f_SplitFile_splitText) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (f).f_SplitFile_splitDeps) acc))))

# 431 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFiles = (fun (fs : t_SplitFile B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encSplitFile) fs) acc))

# 25 "Vuna/Compiler/Driver/Split.vuna"
let v_splitName = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__42; f_SplitFile_splitText = dtb__43; f_SplitFile_splitDeps = dtb__44 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/Split.vuna"
let v_splitUnitOfFile = (fun (f : t_SplitFile) -> (v_stripMl (v_splitName f)))

# 26 "Vuna/Compiler/Driver/Split.vuna"
let v_splitText = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__45; f_SplitFile_splitText = dtb__46; f_SplitFile_splitDeps = dtb__47 } -> dtb__46
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFiles = (fun (nFs : string) (mc0 : string) (mc1 : t_SplitFile B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__50 = Obj.obj (e) in (let dtb__51 = Obj.obj ((k (dtb__50 u))) in (dtb__51 u)))))) (((v_writeSplitFiles nFs) mc0) dtb__49)) (fun restR -> (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__52) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__52)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__53) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__54 = Obj.obj (e) in (let dtb__55 = Obj.obj ((k (dtb__54 u))) in (dtb__55 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [mc0; "/"; (v_splitName dtb__48)])) (v_splitText dtb__48))) (fun _u -> (let x = (Base_dDiag.C_Check_OkC ((dtb__53 + 1))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFilesIfChanged = (fun (nFs : string) (mc0 : string) (mc1 : t_SplitFile B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__58 = Obj.obj (e) in (let dtb__59 = Obj.obj ((k (dtb__58 u))) in (dtb__59 u)))))) (((v_writeSplitFilesIfChanged nFs) mc0) dtb__57)) (fun restR -> (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__60) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__60)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__61) -> (let path = (String.concat "" [mc0; "/"; (v_splitName dtb__56)]) in (let text = (v_splitText dtb__56) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__62 = Obj.obj (e) in (let dtb__63 = Obj.obj ((k (dtb__62 u))) in (dtb__63 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__64 = Obj.obj (e) in (let dtb__65 = Obj.obj ((k (dtb__64 u))) in (dtb__65 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = text) then (let x = (Base_dDiag.C_Check_OkC ((dtb__61 + 1))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__66 = Obj.obj (e) in (let dtb__67 = Obj.obj ((k (dtb__66 u))) in (dtb__67 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) path) text)) (fun _u -> (let x = (Base_dDiag.C_Check_OkC ((dtb__61 + 1))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__68 = Obj.obj (e) in (let dtb__69 = Obj.obj ((k (dtb__68 u))) in (dtb__69 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) path) text)) (fun _u -> (let x = (Base_dDiag.C_Check_OkC ((dtb__61 + 1))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Driver/Split.vuna"
let v_splitDeps = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__70; f_SplitFile_splitText = dtb__71; f_SplitFile_splitDeps = dtb__72 } -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitGraph = (fun (mc0 : t_SplitFile B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (let name = (v_splitName dtb__73) in (if ((B_dData_dString.v_endsWith ".ml") name) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripMl name); B_dData_dPair.f_Pair_second = (v_splitDeps dtb__73) }, (v_splitGraph dtb__74))) else (v_splitGraph dtb__74)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Driver/Split.vuna"
let v_pruneSplitFiles = (fun (roots : string B_dData_dList.t_List) (files : t_SplitFile B_dData_dList.t_List) -> (let graph = (v_splitGraph files) in (let edgeCount = (((B_dData_dList.v_foldl (fun (acc : int) (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((B_dTrait_dNum.v__x43_ B_dData_dNat.v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat) acc) (B_dData_dList.v_length (B_dData_dPair.v_secondOf p))))) 0) graph) in (let budget = (bi_natAdd (bi_natAdd 8 (bi_natMul 4 (B_dData_dList.v_length roots))) edgeCount) in (let graphT = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let kept = (((((v_pruneNames budget) roots) graphT) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in ((B_dData_dList.v_filter (fun (f : t_SplitFile) -> ((B_dData_dList.v_memName (v_splitUnitOfFile f)) kept))) files)))))))

# 297 "Vuna/Compiler/Driver/Split.vuna"
let v_splitGraphAcyclic = (fun (files : t_SplitFile B_dData_dList.t_List) -> (let graph = (v_splitGraph files) in (let baseMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = 0 })) graph)) in (((v_convergedWithin ((B_dData_dList.v_length graph) + 2)) graph) baseMemo))))

# 417 "Vuna/Compiler/Driver/Split.vuna"
let v_normalizeFileDeps = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (f : t_SplitFile) -> { f_SplitFile_splitName = (v_splitName f); f_SplitFile_splitText = (v_splitText f); f_SplitFile_splitDeps = ((v_sortDepsByTie ties) (v_splitDeps f)) })

# 399 "Vuna/Compiler/Driver/Split.vuna"
let v_canonicalTopo = (fun (files : t_SplitFile B_dData_dList.t_List) -> (let graph = (v_splitGraph files) in (let ties = (v_tieTableOf graph) in (let fileTable = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (f : t_SplitFile) -> { B_dData_dPair.f_Pair_first = (v_splitName f); B_dData_dPair.f_Pair_second = f })) files)) in (let baseMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = 0 })) graph)) in (let depths = (((v_fixDepths ((B_dData_dList.v_length graph) + 2)) graph) baseMemo) in (let keyed = ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = ((v_depthOfUnit depths) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = ((v_tieOf ties) (B_dData_dPair.v_firstOf p)) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })) graph) in (let ordered = ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortDepthEntries keyed)) in ((B_dData_dList.v_map (v_normalizeFileDeps ties)) ((v_filesOfDepthEntries fileTable) ordered))))))))))
