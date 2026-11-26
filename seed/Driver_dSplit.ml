open Vuna_runtime
type t_SplitFile = { f_SplitFile_splitName : string; f_SplitFile_splitText : string; f_SplitFile_splitDeps : string B_dData_dList.t_List }

# 85 "Vuna/Compiler/Driver/Split.vuna"
let v_stripMl = (fun (name : string) -> (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength name) 3)) name))

# 110 "Vuna/Compiler/Driver/Split.vuna"
let v_depthOfUnit = (fun (depths : (string, int) B_dContainer_dHashMap.t_HashMap) (unit : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) unit) depths) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Driver/Split.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a > b) then a else b))

# 106 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depthOfDeps = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> ((v_maxInt (((v_depthOfUnit mc0) dtb__1) + 1)) ((v_depthOfDeps mc0) dtb__2))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitDepths = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = dtb__6 } -> ((v_splitDepths dtb__4) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__5) ((v_depthOfDeps mc1) dtb__6)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Driver/Split.vuna"
let rec v_graphMaxDepth = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (((v_graphMaxDepth dtb__8) mc1) ((v_maxInt mc2) ((v_depthOfUnit mc1) dtb__9)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Driver/Split.vuna"
let v_splitLayers = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (let depths = ((v_splitDepths mc0) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let maxD = (((v_graphMaxDepth mc0) depths) 0) in ((B_dData_dList.v_map (fun (d : int) -> ((B_dData_dList.v_filter (fun (q : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((v_depthOfUnit depths) (B_dData_dPair.v_firstOf q)) = d))) mc0))) ((B_dData_dList.v_range 0) (maxD + 1)))))
))

# 250 "Vuna/Compiler/Driver/Split.vuna"
let rec v_spaceJoin = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (String.concat "" [dtb__11; " "; (v_spaceJoin dtb__12)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Driver/Split.vuna"
let rec v_depsSuffix = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (String.concat "" [" "; dtb__13; (v_depsSuffix dtb__14)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRows = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> (String.concat "" [dtb__17; (v_depsSuffix dtb__18); "\n"; (v_tableRows dtb__16)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Driver/Split.vuna"
let rec v_tableRest = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (String.concat "" ["@\n"; (v_tableRows dtb__19); (v_tableRest dtb__20)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTableText = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> ((v_tableRows dtb__21) ^ (v_tableRest dtb__22))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Driver/Split.vuna"
let v_buildScript = (fun (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (cFiles : string B_dData_dList.t_List) -> (String.concat "" ["#!/bin/sh\n# \231\148\177 vuna \231\148\159\230\136\144\239\188\154\229\136\134\231\166\187\231\188\150\232\175\145\230\158\132\229\187\186\232\132\154\230\156\172\239\188\136\231\155\180\230\142\165\228\190\157\232\181\150\232\161\168 + \229\134\133\229\174\185\229\147\136\229\184\140\229\162\158\233\135\143 + \229\136\134\229\177\130\229\185\182\232\161\140\239\188\137\227\128\130\231\148\168\230\179\149: ./build.sh [OUT]\n# \229\141\149\229\133\131\232\161\168\229\156\168\230\156\172\230\150\135\228\187\182\230\156\171\229\176\190\231\154\132 `VUNA_UNIT_TABLE` \233\135\140\239\188\154`@` \229\136\134\233\154\148\229\185\182\232\161\140\229\177\130\239\188\140\229\133\182\228\189\153\230\175\143\232\161\140 `\229\141\149\229\133\131 \231\155\180\230\142\165\228\190\157\232\181\150...`\n# \239\188\136\230\139\147\230\137\145\229\186\143\239\188\137\227\128\130\229\185\178\229\135\128\230\158\132\229\187\186\228\184\148 JOBS<=1\239\188\154\228\184\128\230\172\161 ocamlopt \231\188\150\232\175\145\229\133\168\233\131\168 .mli/.ml\239\188\155\229\133\182\228\189\153\230\140\137\229\134\133\229\174\185\229\147\136\229\184\140\233\128\144\229\141\149\229\133\131\231\188\150\232\175\145\227\128\130\nset -eu\ncd \"$(dirname \"$0\")\"\nOUT=${1:-program}\nFLAGS=\"-g -w -a+39 -warn-error +39\"\nJOBS=${VUNA_BUILD_JOBS:-}\nif [ -z \"$JOBS\" ]; then\n  JOBS=$(nproc 2>/dev/null || echo 1)\n  case \"${NIX_BUILD_CORES:-}\" in\n    ''|*[!0-9]*) ;;\n    0) ;;\n    *) JOBS=$NIX_BUILD_CORES ;;\n  esac\nfi\nC_MODULES=\""; (v_spaceJoin cFiles); "\"\nC_OBJS=\"\"\n# \229\174\191\228\184\187\232\191\144\232\161\140\230\151\182\239\188\136`dtHostRuntime`\239\188\137\230\152\175\229\148\175\228\184\128\229\188\149\231\148\168 `Unix.` \231\154\132\229\157\151\239\188\155\228\184\141\231\148\168\229\174\191\228\184\187\229\142\159\232\175\173\231\154\132\231\168\139\229\186\143\228\184\141\233\147\190\230\142\165\n# `unix.cmxa`\226\128\148\226\128\148\229\174\131\231\154\132\230\168\161\229\157\151\229\136\157\229\167\139\229\140\150\229\156\168\232\191\155\231\168\139\229\144\175\229\138\168\230\151\182\229\128\188\229\135\160\231\153\190\229\190\174\231\167\146\227\128\130\nUNIX=\"\"\nif grep -q 'Unix\\.' Vuna_runtime.ml 2>/dev/null; then UNIX=\"unix.cmxa\"; fi\nif [ -n \"$C_MODULES\" ]; then\n  for c in $C_MODULES; do ocamlopt -I +unix -c \"$c\"; b=${c##*/}; C_OBJS=\"$C_OBJS ${b%.c}.o\"; done\nfi\nhash_of() {\n  for f in \"$@\"; do\n    if [ -f \"$f\" ]; then cat \"$f\"; else printf '%s' '-'; fi\n  done | sha256sum | awk '{print $1}'\n}\nstamp_want() {\n  base=$1\n  shift\n  deps=\"\"\n  for d in \"$@\"; do deps=\"$deps $d.stamp\"; done\n  hash_of \"$base.ml\" \"$base.mli\" $deps\n}\ncompile_mod() {\n  base=$1\n  shift\n  want=$(stamp_want \"$base\" \"$@\")\n  if [ -f \"$base.cmx\" ] && [ -f \"$base.stamp\" ] && [ \"$(cat \"$base.stamp\")\" = \"$want\" ]; then return 0; fi\n  echo \"compile $base\"\n  if [ -f \"$base.mli\" ]; then ocamlopt $FLAGS -I +unix -c \"$base.mli\"; fi\n  ocamlopt $FLAGS -I +unix -c \"$base.ml\"\n  printf '%s' \"$want\" > \"$base.stamp\"\n}\npids=\"\"\nflush_layer() {\n  for p in $pids; do wait \"$p\" || exit 1; done\n  pids=\"\"\n}\n# \230\140\137\229\141\149\229\133\131\232\161\168\233\169\177\229\138\168\239\188\140\229\155\155\231\167\141\231\148\168\233\128\148\229\133\177\231\148\168\229\144\140\228\184\128\228\187\189\228\190\157\232\181\150\232\161\168\239\188\154\n#   clean    \230\142\162\230\181\139\230\152\175\229\144\166\229\183\178\230\156\137 .cmx\239\188\136\229\134\179\229\174\154\232\181\176\229\141\149\230\172\161\232\176\131\231\148\168\232\191\152\230\152\175\233\128\144\229\141\149\229\133\131\232\183\175\229\190\132\239\188\137\n#   source   \230\148\182\233\155\134\229\141\149\230\172\161 ocamlopt \231\154\132\229\133\168\233\131\168\232\190\147\229\133\165\239\188\136SOURCES\239\188\137\228\184\142\233\147\190\230\142\165\229\186\143\239\188\136CMXS\239\188\137\n#   parallel \233\128\144\229\177\130\229\185\182\232\161\140\231\188\150\232\175\145\239\188\154\229\177\130\229\134\133 `&`\239\188\140\229\177\130\230\156\171 flush_layer \233\128\144\228\184\170 wait\n#   stamps   \229\185\178\229\135\128\230\158\132\229\187\186\229\144\142\232\161\165\229\134\153\230\175\143\229\141\149\229\133\131 .stamp\239\188\136\229\162\158\233\135\143\230\158\132\229\187\186\231\154\132\232\190\147\229\133\165\239\188\137\neach_unit() {\n  mode=$1\n  while IFS= read -r line; do\n    case \"$line\" in\n      ''|'#'*) continue ;;\n      '@') flush_layer; continue ;;\n    esac\n    set -- $line\n    base=$1\n    shift\n    case \"$mode\" in\n      clean) if [ -f \"$base.cmx\" ]; then clean=0; fi ;;\n      source)\n        CMXS=\"$CMXS $base.cmx\"\n        if [ -f \"$base.mli\" ]; then SOURCES=\"$SOURCES $base.mli\"; fi\n        SOURCES=\"$SOURCES $base.ml\"\n        ;;\n      parallel)\n        CMXS=\"$CMXS $base.cmx\"\n        compile_mod \"$base\" \"$@\" &\n        pids=\"$pids $!\"\n        ;;\n      stamps) printf '%s' \"$(stamp_want \"$base\" \"$@\")\" > \"$base.stamp\" ;;\n    esac\n  done <<'VUNA_UNIT_TABLE'\n"; (v_unitTableText (v_splitLayers graph)); "VUNA_UNIT_TABLE\n  flush_layer\n}\nclean=1\neach_unit clean\nif [ \"$clean\" -eq 1 ] && [ \"$JOBS\" -le 1 ]; then\n  SOURCES=\"\"\n  CMXS=\"\"\n  each_unit source\n  ocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $SOURCES $C_OBJS\n  each_unit stamps\n  echo \"built $OUT\"\n  exit 0\nfi\nCMXS=\"\"\neach_unit parallel\nocamlopt $FLAGS -I +unix -o \"$OUT\" $UNIX $CMXS $C_OBJS\necho \"built $OUT\"\n"]))

# 287 "Vuna/Compiler/Driver/Split.vuna"
let v_unitTieKey = (fun (name : string) -> (Base_dHash.v_contentKey ("t:" ^ name)))

# 296 "Vuna/Compiler/Driver/Split.vuna"
let rec v_markNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> ((v_markNames dtb__24) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__23) true) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Driver/Split.vuna"
let rec v_nameSetOf = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | { B_dData_dPair.f_Pair_first = dtb__27; B_dData_dPair.f_Pair_second = dtb__28 } -> ((v_nameSetOf dtb__26) ((v_markNames dtb__28) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__27) true) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Driver/Split.vuna"
let v_tieTableOf = (fun (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (v_unitTieKey n) })) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dHashMap.v_toList ((v_nameSetOf graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))))))

# 305 "Vuna/Compiler/Driver/Split.vuna"
let v_tieOf = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) ties) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> dtb__29
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Driver/Split.vuna"
let rec v_maxDepth = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (let dd = ((v_depthOfUnit mc0) dtb__30) in (let mm = ((v_maxDepth mc0) dtb__31) in (if (dd > mm) then dd else mm)))
  | B_dData_dList.C_List_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Driver/Split.vuna"
let rec v_stepDepths = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (let md = ((v_maxDepth mc0) (B_dData_dPair.v_secondOf dtb__32)) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__32); B_dData_dPair.f_Pair_second = (if (md < 0) then 0 else (md + 1)) }, ((v_stepDepths mc0) dtb__33))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Driver/Split.vuna"
let rec v_sameDepthTable = (fun (mc0 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (if (((v_depthOfUnit mc0) (B_dData_dPair.v_firstOf dtb__34)) = (B_dData_dPair.v_secondOf dtb__34)) then ((v_sameDepthTable mc0) dtb__35) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Driver/Split.vuna"
let rec v_convergedWithin = (fun (fuel : int) (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (memo : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (fuel <= 0) then false else (let next = ((v_stepDepths memo) graph) in (if ((v_sameDepthTable memo) next) then true else (((v_convergedWithin (fuel - 1)) graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) next))))))

# 334 "Vuna/Compiler/Driver/Split.vuna"
let rec v_fixDepths = (fun (fuel : int) (graph : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (memo : (string, int) B_dContainer_dHashMap.t_HashMap) -> (if (fuel <= 0) then memo else (let next = ((v_stepDepths memo) graph) in (if ((v_sameDepthTable memo) next) then memo else (((v_fixDepths (fuel - 1)) graph) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) next))))))

# 344 "Vuna/Compiler/Driver/Split.vuna"
let v_depthEntryLess = (fun (a : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) (b : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf a)) <> (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf b))) then ((B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf a)) < (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf b))) else ((B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf a)) <= (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf b)))))

# 351 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepthEntries = (fun (xs : ((int, int) B_dData_dPair.t_Pair, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_depthEntryLess) xs))

# 355 "Vuna/Compiler/Driver/Split.vuna"
let[@tail_mod_cons] rec v_filesOfDepthEntries = (fun (mc0 : (string, t_SplitFile) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (dtb__36 ^ ".ml")) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> (B_dData_dList.C_List__x58__x58_ (dtb__38, ((v_filesOfDepthEntries mc0) dtb__37)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_filesOfDepthEntries mc0) dtb__37)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepEntries = (fun (xs : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dInt.v_Ord_u5afb3bbeddafcb50_uInt) (B_dData_dPair.v_secondOf a)) (B_dData_dPair.v_secondOf b)))) xs))

# 374 "Vuna/Compiler/Driver/Split.vuna"
let v_sortDepsByTie = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (deps : string B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_sortDepEntries ((B_dData_dList.v_map (fun (d : string) -> { B_dData_dPair.f_Pair_first = d; B_dData_dPair.f_Pair_second = ((v_tieOf ties) d) })) deps))))

# 390 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFile = (fun (f : t_SplitFile) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (f).f_SplitFile_splitName) ((Base_dBytes.v_encStr (f).f_SplitFile_splitText) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (f).f_SplitFile_splitDeps) acc))))

# 394 "Vuna/Compiler/Driver/Split.vuna"
let v_encSplitFiles = (fun (fs : t_SplitFile B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encSplitFile) fs) acc))

# 25 "Vuna/Compiler/Driver/Split.vuna"
let v_splitName = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__39; f_SplitFile_splitText = dtb__40; f_SplitFile_splitDeps = dtb__41 } -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Driver/Split.vuna"
let v_splitText = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__42; f_SplitFile_splitText = dtb__43; f_SplitFile_splitDeps = dtb__44 } -> dtb__43
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFiles = (fun (nFs : string) (mc0 : string) (mc1 : t_SplitFile B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_writeSplitFiles nFs) mc0) dtb__46)) (fun restR -> (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__47) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__47)))
  | Base_dDiag.C_Check_OkC (dtb__48) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [mc0; "/"; (v_splitName dtb__45)])) (v_splitText dtb__45))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((dtb__48 + 1))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/Split.vuna"
let rec v_writeSplitFilesIfChanged = (fun (nFs : string) (mc0 : string) (mc1 : t_SplitFile B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_writeSplitFilesIfChanged nFs) mc0) dtb__50)) (fun restR -> (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__51) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__51)))
  | Base_dDiag.C_Check_OkC (dtb__52) -> (let path = (String.concat "" [mc0; "/"; (v_splitName dtb__49)]) in (let text = (v_splitText dtb__49) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = text) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((dtb__52 + 1)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) path) text)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((dtb__52 + 1))))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) path) text)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((dtb__52 + 1)))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Driver/Split.vuna"
let v_splitDeps = (fun (p : t_SplitFile) -> (match p with
  | { f_SplitFile_splitName = dtb__53; f_SplitFile_splitText = dtb__54; f_SplitFile_splitDeps = dtb__55 } -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Split.vuna"
let rec v_splitGraph = (fun (mc0 : t_SplitFile B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (let name = (v_splitName dtb__56) in (if ((B_dData_dString.v_endsWith ".ml") name) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_stripMl name); B_dData_dPair.f_Pair_second = (v_splitDeps dtb__56) }, (v_splitGraph dtb__57))) else (v_splitGraph dtb__57)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Driver/Split.vuna"
let v_splitGraphAcyclic = (fun (files : t_SplitFile B_dData_dList.t_List) -> (let graph = (v_splitGraph files) in (let baseMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = 0 })) graph)) in (((v_convergedWithin ((B_dData_dList.v_length graph) + 2)) graph) baseMemo))))

# 380 "Vuna/Compiler/Driver/Split.vuna"
let v_normalizeFileDeps = (fun (ties : (string, int) B_dContainer_dHashMap.t_HashMap) (f : t_SplitFile) -> { f_SplitFile_splitName = (v_splitName f); f_SplitFile_splitText = (v_splitText f); f_SplitFile_splitDeps = ((v_sortDepsByTie ties) (v_splitDeps f)) })

# 362 "Vuna/Compiler/Driver/Split.vuna"
let v_canonicalTopo = (fun (files : t_SplitFile B_dData_dList.t_List) -> (let graph = (v_splitGraph files) in (let ties = (v_tieTableOf graph) in (let fileTable = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (f : t_SplitFile) -> { B_dData_dPair.f_Pair_first = (v_splitName f); B_dData_dPair.f_Pair_second = f })) files)) in (let baseMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = 0 })) graph)) in (let depths = (((v_fixDepths ((B_dData_dList.v_length graph) + 2)) graph) baseMemo) in (let keyed = ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = ((v_depthOfUnit depths) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = ((v_tieOf ties) (B_dData_dPair.v_firstOf p)) }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })) graph) in (let ordered = ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (v_sortDepthEntries keyed)) in ((B_dData_dList.v_map (v_normalizeFileDeps ties)) ((v_filesOfDepthEntries fileTable) ordered))))))))))
