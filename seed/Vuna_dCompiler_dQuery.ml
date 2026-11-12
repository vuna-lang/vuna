open Vuna_runtime
type t_Vuna_dCompiler_dQuery_dQVal = C_Vuna_dCompiler_dQuery_dQVal_QMarker | C_Vuna_dCompiler_dQuery_dQVal_QBytes of (string) | C_Vuna_dCompiler_dQuery_dQVal_QRef of (string)
and t_Vuna_dCompiler_dQuery_dEntry = { f_Vuna_dCompiler_dQuery_dEntry_entryDeps : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dEntry_entryDeclared : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dEntry_entryDigest : string; f_Vuna_dCompiler_dQuery_dEntry_entryOrigin : string; f_Vuna_dCompiler_dQuery_dEntry_entryVal : t_Vuna_dCompiler_dQuery_dQVal; f_Vuna_dCompiler_dQuery_dEntry_entryHits : int }
and t_Vuna_dCompiler_dQuery_dDb = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap : (string, t_Vuna_dCompiler_dQuery_dEntry) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dDb_dbOrigin : string }
and t_Vuna_dCompiler_dQuery_dDepSnap = { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey : string; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest : string; f_Vuna_dCompiler_dQuery_dDepSnap_dsValue : t_Vuna_dCompiler_dQuery_dQVal }

let v_Vuna_dCompiler_dQuery_ddbEmpty = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dQuery_dDb_dbOrigin = "pkg" }

let v_Vuna_dCompiler_dQuery_ddbWithOrigin = (fun db origin -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines; f_Vuna_dCompiler_dQuery_dDb_dbOrigin = origin })

let v_Vuna_dCompiler_dQuery_ddbOriginOf = (fun db -> (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin)

let v_Vuna_dCompiler_dQuery_ddbTrace = (fun db -> (Base_dList.v_Base_dList_dreverse (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines))

let rec v_Vuna_dCompiler_dQuery_djoinComma = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__0
  | _ -> (String.concat "" [dtb__0; ","; (v_Vuna_dCompiler_dQuery_djoinComma dtb__1)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddbTraceText = (fun db -> (v_Vuna_dCompiler_dQuery_djoinComma (v_Vuna_dCompiler_dQuery_ddbTrace db)))

let v_Vuna_dCompiler_dQuery_ddbEntryCount = (fun db -> ((Base_dHashMap.v_Base_dHashMap_dsize Base_dString.v_Eq_uString) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap))

let v_Vuna_dCompiler_dQuery_ddbLookup = (fun db key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__2).f_Vuna_dCompiler_dQuery_dEntry_entryVal))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddbNote = (fun db line -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (line, (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)); f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin })

let v_Vuna_dCompiler_dQuery_ddigestOfPayload = (fun payload -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress payload))

let v_Vuna_dCompiler_dQuery_dlenPrefixed = (fun s -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

let v_Vuna_dCompiler_dQuery_dshowQVal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dQuery_dQVal_QRef (dtb__3) -> ("ref:" ^ (v_Vuna_dCompiler_dQuery_dlenPrefixed dtb__3))
  | C_Vuna_dCompiler_dQuery_dQVal_QBytes (dtb__4) -> ("bytes:" ^ (v_Vuna_dCompiler_dQuery_dlenPrefixed dtb__4))
  | C_Vuna_dCompiler_dQuery_dQVal_QMarker -> "marker:"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddigestOfVal = (fun v -> (v_Vuna_dCompiler_dQuery_ddigestOfPayload (v_Vuna_dCompiler_dQuery_dshowQVal v)))

let v_Vuna_dCompiler_dQuery_ddsKeyOf = (fun s -> (s).f_Vuna_dCompiler_dQuery_dDepSnap_dsKey)

let v_Vuna_dCompiler_dQuery_ddsDigestOf = (fun s -> (s).f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest)

let v_Vuna_dCompiler_dQuery_ddsValueOf = (fun s -> (s).f_Vuna_dCompiler_dQuery_dDepSnap_dsValue)

let v_Vuna_dCompiler_dQuery_dsnapDep = (fun db key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey = key; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest = (dtb__5).f_Vuna_dCompiler_dQuery_dEntry_entryDigest; f_Vuna_dCompiler_dQuery_dDepSnap_dsValue = (dtb__5).f_Vuna_dCompiler_dQuery_dEntry_entryVal }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey = key; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest = (v_Vuna_dCompiler_dQuery_ddigestOfVal (C_Vuna_dCompiler_dQuery_dQVal_QBytes (key))); f_Vuna_dCompiler_dQuery_dDepSnap_dsValue = (C_Vuna_dCompiler_dQuery_dQVal_QBytes (key)) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dsnapDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dQuery_dsnapDep mc0) dtb__6), ((v_Vuna_dCompiler_dQuery_dsnapDeps mc0) dtb__7)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dsortByDepKey = (fun ps -> ((Base_dSort.v_Base_dSort_dsortBy (fun p q -> (((Base_dOrd.v_Base_dOrd_dle Base_dString.v_Ord_uString) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dfirstOf q)))) ps))

let v_Vuna_dCompiler_dQuery_ddepPairsSorted = (fun snaps -> (v_Vuna_dCompiler_dQuery_dsortByDepKey ((Base_dList.v_Base_dList_dmap (fun s -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dQuery_ddsKeyOf s); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dQuery_ddsDigestOf s) })) snaps)))

let rec v_Vuna_dCompiler_dQuery_dsameDeps = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__8) = (Base_dPair.v_Base_dPair_dfirstOf dtb__10)) then ((Base_dPair.v_Base_dPair_dsecondOf dtb__8) = (Base_dPair.v_Base_dPair_dsecondOf dtb__10)) else false) then ((v_Vuna_dCompiler_dQuery_dsameDeps dtb__9) dtb__11) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dsortKeys = (fun keys -> ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_dle Base_dString.v_Ord_uString) a) b))) keys))

let rec v_Vuna_dCompiler_dQuery_drecordedKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (Base_dList.C_Base_dList_dList_Cons (dtb__16, (v_Vuna_dCompiler_dQuery_drecordedKeys dtb__15)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dqueryHit = (fun db key deps -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (if (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) (v_Vuna_dCompiler_dQuery_dsortKeys deps)) (dtb__18).f_Vuna_dCompiler_dQuery_dEntry_entryDeclared) then ((v_Vuna_dCompiler_dQuery_dsameDeps (dtb__18).f_Vuna_dCompiler_dQuery_dEntry_entryDeps) (v_Vuna_dCompiler_dQuery_ddepPairsSorted ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dQuery_dsnapDep db)) (v_Vuna_dCompiler_dQuery_drecordedKeys (dtb__18).f_Vuna_dCompiler_dQuery_dEntry_entryDeps)))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__18).f_Vuna_dCompiler_dQuery_dEntry_entryVal)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dqueryDepValues = (fun db deps -> ((Base_dList.v_Base_dList_dmap (fun s -> (v_Vuna_dCompiler_dQuery_ddsValueOf s))) ((v_Vuna_dCompiler_dQuery_dsnapDeps db) deps)))

let v_Vuna_dCompiler_dQuery_dmarkHit = (fun db key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("hit " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)); f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = (dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryDeps; f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = (dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryDeclared; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = (dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryDigest; f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = (dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryOrigin; f_Vuna_dCompiler_dQuery_dEntry_entryVal = (dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryVal; f_Vuna_dCompiler_dQuery_dEntry_entryHits = ((dtb__19).f_Vuna_dCompiler_dQuery_dEntry_entryHits + 1) }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("hit " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)); f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dcommitMiss = (fun db key declared observed digest val_ -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = observed; f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = declared; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = digest; f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin; f_Vuna_dCompiler_dQuery_dEntry_entryVal = val_; f_Vuna_dCompiler_dQuery_dEntry_entryHits = 0 }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("miss " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)); f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin })

let rec v_Vuna_dCompiler_dQuery_dfindSnap = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if ((v_Vuna_dCompiler_dQuery_ddsKeyOf dtb__20) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20)) else ((v_Vuna_dCompiler_dQuery_dfindSnap dtb__21) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dsnapDepWith = (fun db declared key -> (match ((v_Vuna_dCompiler_dQuery_dfindSnap declared) key) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> dtb__22
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dQuery_dsnapDep db) key)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddepPairsFromKeys = (fun db declared keys -> (v_Vuna_dCompiler_dQuery_ddepPairsSorted ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dQuery_dsnapDepWith db) declared)) keys)))

let v_Vuna_dCompiler_dQuery_dqueryResolve = (fun db key deps result -> ((fun val_ -> ((fun declared -> ((fun observed -> ((fun digest -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dQuery_dcommitMiss db) key) declared) observed) digest) val_); Base_dPair.f_Base_dPair_dPair_second = val_ }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (if ((dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryDigest = digest) then { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = observed; f_Vuna_dCompiler_dQuery_dEntry_entryDeclared = declared; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = (dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryDigest; f_Vuna_dCompiler_dQuery_dEntry_entryOrigin = (dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryOrigin; f_Vuna_dCompiler_dQuery_dEntry_entryVal = (dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryVal; f_Vuna_dCompiler_dQuery_dEntry_entryHits = ((dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryHits + 1) }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("cutoff " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)); f_Vuna_dCompiler_dQuery_dDb_dbOrigin = (db).f_Vuna_dCompiler_dQuery_dDb_dbOrigin }; Base_dPair.f_Base_dPair_dPair_second = (dtb__23).f_Vuna_dCompiler_dQuery_dEntry_entryVal } else { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dQuery_dcommitMiss db) key) declared) observed) digest) val_); Base_dPair.f_Base_dPair_dPair_second = val_ })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dQuery_ddigestOfVal val_))) (((v_Vuna_dCompiler_dQuery_ddepPairsFromKeys db) ((v_Vuna_dCompiler_dQuery_dsnapDeps db) deps)) (Base_dPair.v_Base_dPair_dsecondOf result)))) (v_Vuna_dCompiler_dQuery_dsortKeys deps))) (Base_dPair.v_Base_dPair_dfirstOf result)))

let v_Vuna_dCompiler_dQuery_dqueryWith = (fun db key deps compute -> (match (((v_Vuna_dCompiler_dQuery_dqueryHit db) key) deps) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dQuery_dmarkHit db) key); Base_dPair.f_Base_dPair_dPair_second = dtb__24 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dQuery_dqueryResolve db) key) deps) (compute ((v_Vuna_dCompiler_dQuery_dqueryDepValues db) deps)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dquery = (fun db key deps compute -> ((((v_Vuna_dCompiler_dQuery_dqueryWith db) key) deps) (fun vals -> { Base_dPair.f_Base_dPair_dPair_first = (compute vals); Base_dPair.f_Base_dPair_dPair_second = deps })))
