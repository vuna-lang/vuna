open Vuna_runtime
type t_Vuna_dCompiler_dQuery_dQVal = C_Vuna_dCompiler_dQuery_dQVal_QStr of (string) | C_Vuna_dCompiler_dQuery_dQVal_QInt of (int) | C_Vuna_dCompiler_dQuery_dQVal_QList of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dQuery_dEntry = { f_Vuna_dCompiler_dQuery_dEntry_entryDeps : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dQuery_dEntry_entryDigest : string; f_Vuna_dCompiler_dQuery_dEntry_entryVal : t_Vuna_dCompiler_dQuery_dQVal }
and t_Vuna_dCompiler_dQuery_dDb = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap : (string, t_Vuna_dCompiler_dQuery_dEntry) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines : string Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dQuery_dDepSnap = { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey : string; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest : string; f_Vuna_dCompiler_dQuery_dDepSnap_dsValue : t_Vuna_dCompiler_dQuery_dQVal }

let v_Vuna_dCompiler_dQuery_ddbEmpty = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = Base_dList.C_Base_dList_dList_Nil }

let v_Vuna_dCompiler_dQuery_ddbTrace = (fun db -> (Base_dList.v_Base_dList_dreverse (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines))

let v_Vuna_dCompiler_dQuery_ddepSnapValue = (fun s -> (s).f_Vuna_dCompiler_dQuery_dDepSnap_dsValue)

let rec v_Vuna_dCompiler_dQuery_ddepPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__0).f_Vuna_dCompiler_dQuery_dDepSnap_dsKey; Base_dPair.f_Base_dPair_dPair_second = (dtb__0).f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest }, (v_Vuna_dCompiler_dQuery_ddepPairs dtb__1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dsameDeps = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__2) = (Base_dPair.v_Base_dPair_dfirstOf dtb__4)) then ((Base_dPair.v_Base_dPair_dsecondOf dtb__2) = (Base_dPair.v_Base_dPair_dsecondOf dtb__4)) else false) then ((v_Vuna_dCompiler_dQuery_dsameDeps dtb__3) dtb__5) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dlenInt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (1 + (v_Vuna_dCompiler_dQuery_dlenInt dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_dlenPrefixed = (fun s -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

let v_Vuna_dCompiler_dQuery_dshowQVal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dQuery_dQVal_QList (dtb__10) -> (String.concat "" ["list:"; (bi_strFromInt (v_Vuna_dCompiler_dQuery_dlenInt dtb__10)); ":"; (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_dlenPrefixed) dtb__10))])
  | C_Vuna_dCompiler_dQuery_dQVal_QInt (dtb__11) -> ("int:" ^ (bi_strFromInt dtb__11))
  | C_Vuna_dCompiler_dQuery_dQVal_QStr (dtb__12) -> ("str:" ^ (v_Vuna_dCompiler_dQuery_dlenPrefixed dtb__12))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddigestOfVal = (fun v -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestHex (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_ddigestOfString (v_Vuna_dCompiler_dQuery_dshowQVal v))))

let v_Vuna_dCompiler_dQuery_dsnapDep = (fun db key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey = key; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest = (dtb__13).f_Vuna_dCompiler_dQuery_dEntry_entryDigest; f_Vuna_dCompiler_dQuery_dDepSnap_dsValue = (dtb__13).f_Vuna_dCompiler_dQuery_dEntry_entryVal }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dQuery_dDepSnap_dsKey = key; f_Vuna_dCompiler_dQuery_dDepSnap_dsDigest = (v_Vuna_dCompiler_dQuery_ddigestOfVal (C_Vuna_dCompiler_dQuery_dQVal_QStr (key))); f_Vuna_dCompiler_dQuery_dDepSnap_dsValue = (C_Vuna_dCompiler_dQuery_dQVal_QStr (key)) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dQuery_dsnapDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dQuery_dsnapDep mc0) dtb__14), ((v_Vuna_dCompiler_dQuery_dsnapDeps mc0) dtb__15)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dQuery_ddbNote = (fun db line -> { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap; f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (line, (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)) })

let v_Vuna_dCompiler_dQuery_drecompute = (fun db key recorded values compute -> ((fun fresh -> { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = recorded; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = (v_Vuna_dCompiler_dQuery_ddigestOfVal fresh); f_Vuna_dCompiler_dQuery_dEntry_entryVal = fresh }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("miss " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)) }; Base_dPair.f_Base_dPair_dPair_second = fresh }) (compute values)))

let v_Vuna_dCompiler_dQuery_drecomputeAgainst = (fun db key old recorded values compute -> ((fun fresh -> ((fun freshDigest -> (if ((old).f_Vuna_dCompiler_dQuery_dEntry_entryDigest = freshDigest) then { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = recorded; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = (old).f_Vuna_dCompiler_dQuery_dEntry_entryDigest; f_Vuna_dCompiler_dQuery_dEntry_entryVal = (old).f_Vuna_dCompiler_dQuery_dEntry_entryVal }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("cutoff " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)) }; Base_dPair.f_Base_dPair_dPair_second = fresh } else { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dQuery_dDb_dbEntryMap = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) { f_Vuna_dCompiler_dQuery_dEntry_entryDeps = recorded; f_Vuna_dCompiler_dQuery_dEntry_entryDigest = freshDigest; f_Vuna_dCompiler_dQuery_dEntry_entryVal = fresh }) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap); f_Vuna_dCompiler_dQuery_dDb_dbTraceLines = (Base_dList.C_Base_dList_dList_Cons (("miss " ^ key), (db).f_Vuna_dCompiler_dQuery_dDb_dbTraceLines)) }; Base_dPair.f_Base_dPair_dPair_second = fresh })) (v_Vuna_dCompiler_dQuery_ddigestOfVal fresh))) (compute values)))

let v_Vuna_dCompiler_dQuery_dquery = (fun db key deps compute -> ((fun snaps -> ((fun values -> ((fun recorded -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) (db).f_Vuna_dCompiler_dQuery_dDb_dbEntryMap) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dQuery_drecompute db) key) recorded) values) compute)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (if ((v_Vuna_dCompiler_dQuery_dsameDeps (dtb__16).f_Vuna_dCompiler_dQuery_dEntry_entryDeps) recorded) then { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dQuery_ddbNote db) ("hit " ^ key)); Base_dPair.f_Base_dPair_dPair_second = (dtb__16).f_Vuna_dCompiler_dQuery_dEntry_entryVal } else ((((((v_Vuna_dCompiler_dQuery_drecomputeAgainst db) key) dtb__16) recorded) values) compute))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dQuery_ddepPairs snaps))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dQuery_ddepSnapValue) snaps))) ((v_Vuna_dCompiler_dQuery_dsnapDeps db) deps)))
