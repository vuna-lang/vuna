open Vuna_runtime
# 22 "Vuna/Ir/Analysis.vuna"
let v_neighborsOf = (fun (dtb_u_u1 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u2 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u2) dtb_u_u1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3) -> dtb_u_u3
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Ir/Analysis.vuna"
let v_adjTblOf = (fun (dtb_u_u4 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u4) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 31 "Vuna/Ir/Analysis.vuna"
let rec v_addDependents = (fun (dtb_u_u5 : string) (dtb_u_u6 : string B_dData_dList.t_List) (dtb_u_u7 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (let dtb_u_u10 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u8) dtb_u_u7) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u11) -> dtb_u_u11
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addDependents dtb_u_u5) dtb_u_u9) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u8) (B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u10))) dtb_u_u7)))
  | B_dData_dList.C_List_Nil -> dtb_u_u7
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Ir/Analysis.vuna"
let rec v_reverseAdjTbl = (fun (dtb_u_u12 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u14) -> (match dtb_u_u13 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u15; B_dData_dPair.f_Pair_second = dtb_u_u16 } -> (((v_addDependents dtb_u_u15) dtb_u_u16) (v_reverseAdjTbl dtb_u_u14))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Ir/Analysis.vuna"
let rec v_foldNeighborsPostFuel = (fun (dtb_u_u17 : int) (dtb_u_u18 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u19 : string B_dData_dList.t_List) (dtb_u_u20 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u21 : string B_dData_dList.t_List) -> (if (dtb_u_u17 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u20; B_dData_dPair.f_Pair_second = dtb_u_u21 } else (match dtb_u_u19 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u20; B_dData_dPair.f_Pair_second = dtb_u_u21 }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u22) dtb_u_u20) then (((((v_foldNeighborsPostFuel (dtb_u_u17 - 1)) dtb_u_u18) dtb_u_u23) dtb_u_u20) dtb_u_u21) else (match (((((v_dfsPostFuel (dtb_u_u17 - 1)) dtb_u_u18) dtb_u_u22) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u22) true) dtb_u_u20)) dtb_u_u21) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u24; B_dData_dPair.f_Pair_second = dtb_u_u25 } -> (((((v_foldNeighborsPostFuel (dtb_u_u17 - 1)) dtb_u_u18) dtb_u_u23) dtb_u_u24) dtb_u_u25)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 68 "Vuna/Ir/Analysis.vuna"
and v_dfsPostFuel = (fun (dtb_u_u26 : int) (dtb_u_u27 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u28 : string) (dtb_u_u29 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u30 : string B_dData_dList.t_List) -> (if (dtb_u_u26 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u29; B_dData_dPair.f_Pair_second = dtb_u_u30 } else (match (((((v_foldNeighborsPostFuel (dtb_u_u26 - 1)) dtb_u_u27) ((v_neighborsOf dtb_u_u27) dtb_u_u28)) dtb_u_u29) dtb_u_u30) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u31; B_dData_dPair.f_Pair_second = dtb_u_u32 } -> { B_dData_dPair.f_Pair_first = dtb_u_u31; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u32)) }
  | _ -> failwith "DT: impossible branch"
)))

# 48 "Vuna/Ir/Analysis.vuna"
let v_foldNeighborsPost = (fun (dtb_u_u33 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u34 : string B_dData_dList.t_List) (dtb_u_u35 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u36 : string B_dData_dList.t_List) -> (((((v_foldNeighborsPostFuel 100000) dtb_u_u33) dtb_u_u34) dtb_u_u35) dtb_u_u36))

# 65 "Vuna/Ir/Analysis.vuna"
let v_dfsPost = (fun (dtb_u_u37 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u38 : string) (dtb_u_u39 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u40 : string B_dData_dList.t_List) -> (((((v_dfsPostFuel 100000) dtb_u_u37) dtb_u_u38) dtb_u_u39) dtb_u_u40))

# 76 "Vuna/Ir/Analysis.vuna"
let rec v_postOrder = (fun (dtb_u_u41 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u42 : string B_dData_dList.t_List) (dtb_u_u43 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u44 : string B_dData_dList.t_List) -> (match dtb_u_u42 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u45, dtb_u_u46) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u45) dtb_u_u43) then ((((v_postOrder dtb_u_u41) dtb_u_u46) dtb_u_u43) dtb_u_u44) else (match ((((v_dfsPost dtb_u_u41) dtb_u_u45) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u45) true) dtb_u_u43)) dtb_u_u44) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u47; B_dData_dPair.f_Pair_second = dtb_u_u48 } -> ((((v_postOrder dtb_u_u41) dtb_u_u46) dtb_u_u47) dtb_u_u48)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u43; B_dData_dPair.f_Pair_second = dtb_u_u44 }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Ir/Analysis.vuna"
let rec v_foldNeighborsCollectFuel = (fun (dtb_u_u49 : int) (dtb_u_u50 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u51 : string B_dData_dList.t_List) (dtb_u_u52 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u53 : string B_dData_dList.t_List) -> (if (dtb_u_u49 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 } else (match dtb_u_u51 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u54) dtb_u_u52) then (((((v_foldNeighborsCollectFuel (dtb_u_u49 - 1)) dtb_u_u50) dtb_u_u55) dtb_u_u52) dtb_u_u53) else (match (((((v_dfsCollectFuel (dtb_u_u49 - 1)) dtb_u_u50) dtb_u_u54) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u54) true) dtb_u_u52)) dtb_u_u53) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u56; B_dData_dPair.f_Pair_second = dtb_u_u57 } -> (((((v_foldNeighborsCollectFuel (dtb_u_u49 - 1)) dtb_u_u50) dtb_u_u55) dtb_u_u56) dtb_u_u57)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 108 "Vuna/Ir/Analysis.vuna"
and v_dfsCollectFuel = (fun (dtb_u_u58 : int) (dtb_u_u59 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u60 : string) (dtb_u_u61 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u62 : string B_dData_dList.t_List) -> (if (dtb_u_u58 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u61; B_dData_dPair.f_Pair_second = dtb_u_u62 } else (match (((((v_foldNeighborsCollectFuel (dtb_u_u58 - 1)) dtb_u_u59) ((v_neighborsOf dtb_u_u59) dtb_u_u60)) dtb_u_u61) dtb_u_u62) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u63; B_dData_dPair.f_Pair_second = dtb_u_u64 } -> { B_dData_dPair.f_Pair_first = dtb_u_u63; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u64)) }
  | _ -> failwith "DT: impossible branch"
)))

# 88 "Vuna/Ir/Analysis.vuna"
let v_foldNeighborsCollect = (fun (dtb_u_u65 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u66 : string B_dData_dList.t_List) (dtb_u_u67 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u68 : string B_dData_dList.t_List) -> (((((v_foldNeighborsCollectFuel 100000) dtb_u_u65) dtb_u_u66) dtb_u_u67) dtb_u_u68))

# 105 "Vuna/Ir/Analysis.vuna"
let v_dfsCollect = (fun (dtb_u_u69 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u70 : string) (dtb_u_u71 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u72 : string B_dData_dList.t_List) -> (((((v_dfsCollectFuel 100000) dtb_u_u69) dtb_u_u70) dtb_u_u71) dtb_u_u72))

# 116 "Vuna/Ir/Analysis.vuna"
let rec v_collectComps = (fun (dtb_u_u73 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u74 : string B_dData_dList.t_List) (dtb_u_u75 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u76 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u77) dtb_u_u75) then ((((v_collectComps dtb_u_u73) dtb_u_u78) dtb_u_u75) dtb_u_u76) else (match ((((v_dfsCollect dtb_u_u73) dtb_u_u77) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u77) true) dtb_u_u75)) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u79; B_dData_dPair.f_Pair_second = dtb_u_u80 } -> ((((v_collectComps dtb_u_u73) dtb_u_u78) dtb_u_u79) (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u76)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u76
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Analysis.vuna"
let v_componentTblOf = (fun (dtb_u_u81 : string B_dData_dList.t_List B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap (fun (dtb_u_u82 : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u83 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u83; B_dData_dPair.f_Pair_second = dtb_u_u82 })) dtb_u_u82))) dtb_u_u81)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 130 "Vuna/Ir/Analysis.vuna"
let rec v_addAllNames = (fun (dtb_u_u84 : string B_dData_dList.t_List) (dtb_u_u85 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u84 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> ((v_addAllNames dtb_u_u87) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u86) true) dtb_u_u85))
  | B_dData_dList.C_List_Nil -> dtb_u_u85
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Ir/Analysis.vuna"
let[@tail_mod_cons] rec v_filterNames = (fun (dtb_u_u88 : (string) -> bool) (dtb_u_u89 : string B_dData_dList.t_List) -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (if (dtb_u_u88 dtb_u_u90) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u90, ((v_filterNames dtb_u_u88) dtb_u_u91))) else ((v_filterNames dtb_u_u88) dtb_u_u91))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Ir/Analysis.vuna"
let v_groupOf = (fun (dtb_u_u92 : string B_dData_dList.t_List) (dtb_u_u93 : string B_dData_dList.t_List) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u94, dtb_u_u95) -> (match dtb_u_u95 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u94, B_dData_dList.C_List_Nil))
  | _ -> (let dtb_u_u96 = (B_dContainer_dHashMap.v_ofNames dtb_u_u93) in ((v_filterNames (fun (dtb_u_u97 : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u97) dtb_u_u96))) dtb_u_u92))
)
  | _ -> (let dtb_u_u98 = (B_dContainer_dHashMap.v_ofNames dtb_u_u93) in ((v_filterNames (fun (dtb_u_u99 : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u99) dtb_u_u98))) dtb_u_u92))
))

# 139 "Vuna/Ir/Analysis.vuna"
let[@tail_mod_cons] rec v_groupsFromCompsGo = (fun (dtb_u_u100 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u101 : string B_dData_dList.t_List) (dtb_u_u102 : string B_dData_dList.t_List) (dtb_u_u103 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u102 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u104) dtb_u_u103) then ((((v_groupsFromCompsGo dtb_u_u100) dtb_u_u101) dtb_u_u105) dtb_u_u103) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u104) dtb_u_u100) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u106) -> (B_dData_dList.C_List__x58__x58_ (((v_groupOf dtb_u_u101) dtb_u_u106), ((((v_groupsFromCompsGo dtb_u_u100) dtb_u_u101) dtb_u_u105) ((v_addAllNames dtb_u_u106) dtb_u_u103))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_groupsFromCompsGo dtb_u_u100) dtb_u_u101) dtb_u_u105) dtb_u_u103)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Ir/Analysis.vuna"
let v_groupsFromComps = (fun (dtb_u_u107 : string B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u108 : string B_dData_dList.t_List) -> ((((v_groupsFromCompsGo (v_componentTblOf dtb_u_u107)) dtb_u_u108) dtb_u_u108) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 162 "Vuna/Ir/Analysis.vuna"
let v_notIn = (fun (dtb_u_u109 : string) (dtb_u_u110 : string B_dData_dList.t_List) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u109) dtb_u_u110)))

# 188 "Vuna/Ir/Analysis.vuna"
let rec v_indexGroups = (fun (dtb_u_u111 : int) (dtb_u_u112 : string B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u113 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> (((v_indexGroups (dtb_u_u111 + 1)) dtb_u_u115) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u111; B_dData_dPair.f_Pair_second = dtb_u_u114 }, dtb_u_u113)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u113)
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Ir/Analysis.vuna"
let v_groupIndexTbl = (fun (dtb_u_u116 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap (fun (dtb_u_u117 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_map (fun (dtb_u_u118 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u117) })) (B_dData_dPair.v_secondOf dtb_u_u117)))) dtb_u_u116)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 204 "Vuna/Ir/Analysis.vuna"
let rec v_groupDepIdxGo = (fun (dtb_u_u119 : int) (dtb_u_u120 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u121 : string B_dData_dList.t_List) (dtb_u_u122 : (int, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u123 : int B_dData_dList.t_List) -> (match dtb_u_u121 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u124, dtb_u_u125) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u124) dtb_u_u120) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u126) -> (if (if (dtb_u_u126 = dtb_u_u119) then true else ((((B_dContainer_dHashMap.v_member B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u126) dtb_u_u122)) then (((((v_groupDepIdxGo dtb_u_u119) dtb_u_u120) dtb_u_u125) dtb_u_u122) dtb_u_u123) else (((((v_groupDepIdxGo dtb_u_u119) dtb_u_u120) dtb_u_u125) (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u126) true) dtb_u_u122)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u126, dtb_u_u123))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_groupDepIdxGo dtb_u_u119) dtb_u_u120) dtb_u_u125) dtb_u_u122) dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Ir/Analysis.vuna"
let v_groupDepIdx = (fun (dtb_u_u127 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u128 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u129 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u129 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u130; B_dData_dPair.f_Pair_second = dtb_u_u131 } -> (((((v_groupDepIdxGo dtb_u_u130) dtb_u_u128) ((B_dData_dList.v_concatMap (v_neighborsOf dtb_u_u127)) dtb_u_u131)) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Ir/Analysis.vuna"
let v_lookupInt = (fun (dtb_u_u132 : (int, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u133 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u133) dtb_u_u132) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u134) -> dtb_u_u134
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Ir/Analysis.vuna"
let v_lookupNames = (fun (dtb_u_u135 : (int, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u136 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u136) dtb_u_u135) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u137) -> dtb_u_u137
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Ir/Analysis.vuna"
let v_lookupDeps = (fun (dtb_u_u138 : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u139 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u139) dtb_u_u138) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u140) -> dtb_u_u140
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Ir/Analysis.vuna"
let v_addReverseEdges = (fun (dtb_u_u141 : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u142 : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u142 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 } -> (((B_dData_dList.v_foldl (fun (dtb_u_u145 : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u146 : int) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u146) ((B_dData_dList.v_append ((v_lookupDeps dtb_u_u145) dtb_u_u146)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u143, B_dData_dList.C_List_Nil)))) dtb_u_u145))) dtb_u_u141) dtb_u_u144)
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Ir/Analysis.vuna"
let v_reverseDepTbl = (fun (dtb_u_u147 : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addReverseEdges) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) dtb_u_u147))

# 242 "Vuna/Ir/Analysis.vuna"
let[@tail_mod_cons] rec v_insertReady = (fun (dtb_u_u148 : int) (dtb_u_u149 : int B_dData_dList.t_List) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u150, dtb_u_u151) -> (if (dtb_u_u148 <= dtb_u_u150) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u148, (B_dData_dList.C_List__x58__x58_ (dtb_u_u150, dtb_u_u151)))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u150, ((v_insertReady dtb_u_u148) dtb_u_u151))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u148, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Ir/Analysis.vuna"
let rec v_orderGroupsGo = (fun (dtb_u_u152 : int) (dtb_u_u153 : (int, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u154 : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u155 : (int, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u156 : int B_dData_dList.t_List) (dtb_u_u157 : int) (dtb_u_u158 : string B_dData_dList.t_List B_dData_dList.t_List) -> (if (dtb_u_u152 <= 0) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_DependencyCycle) else (if (dtb_u_u157 = 0) then (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u158))) else (match dtb_u_u156 with
  | B_dData_dList.C_List_Nil -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_DependencyCycle)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (let dtb_u_u161 = ((v_lookupDeps dtb_u_u154) dtb_u_u159) in (let dtb_u_u162 = (((B_dData_dList.v_foldl (fun (dtb_u_u166 : (int, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u167 : int) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u167) (((v_lookupInt dtb_u_u155) dtb_u_u167) - 1)) dtb_u_u166))) dtb_u_u155) dtb_u_u161) in (let dtb_u_u163 = (((B_dData_dList.v_foldl (fun (dtb_u_u164 : int B_dData_dList.t_List) (dtb_u_u165 : int) -> (if (((v_lookupInt dtb_u_u162) dtb_u_u165) = 0) then ((v_insertReady dtb_u_u165) dtb_u_u164) else dtb_u_u164))) dtb_u_u160) dtb_u_u161) in (((((((v_orderGroupsGo (dtb_u_u152 - 1)) dtb_u_u153) dtb_u_u154) dtb_u_u162) dtb_u_u163) (dtb_u_u157 - 1)) (B_dData_dList.C_List__x58__x58_ (((v_lookupNames dtb_u_u153) dtb_u_u159), dtb_u_u158))))))
  | _ -> failwith "DT: impossible branch"
))))

# 295 "Vuna/Ir/Analysis.vuna"
let rec v_allCovered = (fun (dtb_u_u168 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u169 : string B_dData_dList.t_List) -> (match dtb_u_u169 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u170, dtb_u_u171) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u170) dtb_u_u168) then ((v_allCovered dtb_u_u168) dtb_u_u171) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Ir/Analysis.vuna"
let v_checkGroupsCover = (fun (dtb_u_u172 : string B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u173 : string B_dData_dList.t_List) -> (let dtb_u_u174 = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_concatMap (fun (dtb_u_u175 : string B_dData_dList.t_List) -> dtb_u_u175)) dtb_u_u172)) in (if ((v_allCovered dtb_u_u174) dtb_u_u173) then (Base_dDiag.C_Check_OkC (dtb_u_u172)) else (Base_dDiag.v_icInternal "SCC grouping dropped definitions (DFS budget exhausted?)"))))

# 300 "Vuna/Ir/Analysis.vuna"
let v_groupNeedsRec = (fun (dtb_u_u176 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u177 : string B_dData_dList.t_List) -> (match dtb_u_u177 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> (match dtb_u_u179 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_memName dtb_u_u178) ((v_neighborsOf dtb_u_u176) dtb_u_u178))
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Ir/Analysis.vuna"
let rec v_firstBadRecursiveValue = (fun (dtb_u_u180 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u180 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (if ((Vuna_dIr_dModel.v_irDefArity dtb_u_u181) = 0) then (if (Vuna_dIr_dModel.v_irDefRecValueOk dtb_u_u181) then (v_firstBadRecursiveValue dtb_u_u182) else (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.v_irDefName dtb_u_u181)))) else (v_firstBadRecursiveValue dtb_u_u182))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Ir/Analysis.vuna"
let rec v_findDefByName = (fun (dtb_u_u183 : string) (dtb_u_u184 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u184 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u185, dtb_u_u186) -> (if ((Vuna_dIr_dModel.v_irDefName dtb_u_u185) = dtb_u_u183) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u185)) else ((v_findDefByName dtb_u_u183) dtb_u_u186))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Ir/Analysis.vuna"
let[@tail_mod_cons] rec v_groupDefsOf = (fun (dtb_u_u187 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (dtb_u_u188 : string B_dData_dList.t_List) -> (match dtb_u_u188 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u189, dtb_u_u190) -> (match ((v_findDefByName dtb_u_u189) dtb_u_u187) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_groupDefsOf dtb_u_u187) dtb_u_u190)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u191) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u191, ((v_groupDefsOf dtb_u_u187) dtb_u_u190)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Ir/Analysis.vuna"
let rec v_assembleGroups = (fun (dtb_u_u192 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u193 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (dtb_u_u194 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u194 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u196) -> (let dtb_u_u197 = ((v_groupDefsOf dtb_u_u193) dtb_u_u195) in (let dtb_u_u198 = ((v_groupNeedsRec dtb_u_u192) dtb_u_u195) in (let dtb_u_u199 = (if dtb_u_u198 then (match (v_firstBadRecursiveValue dtb_u_u197) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u202) -> (match ((v_findDefByName dtb_u_u202) dtb_u_u197) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u203) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (Vuna_dIr_dModel.v_irDefSpan dtb_u_u203)) dtb_u_u202) (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb_u_u202))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u202, B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb_u_u202))) dtb_u_u202)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = true; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u197 }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = false; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u197 }))) in ((Base_dCommon.v_bind dtb_u_u199) (fun (dtb_u_u200 : Vuna_dIr_dModel.t_IrGroup) -> ((Base_dCommon.v_bind (((v_assembleGroups dtb_u_u192) dtb_u_u193) dtb_u_u196)) (fun (dtb_u_u201 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u200, dtb_u_u201)))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Ir/Analysis.vuna"
let rec v_countList = (fun dtb_u_u205 -> (match dtb_u_u205 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u206, dtb_u_u207) -> (1 + (v_countList dtb_u_u207))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Ir/Analysis.vuna"
let v_orderGroups = (fun (dtb_u_u208 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u209 : string B_dData_dList.t_List B_dData_dList.t_List) -> (let dtb_u_u210 = (((v_indexGroups 0) dtb_u_u209) B_dData_dList.C_List_Nil) in (let dtb_u_u211 = (v_groupIndexTbl dtb_u_u210) in (let dtb_u_u212 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dList.v_map (fun (dtb_u_u221 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u221); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u221) })) dtb_u_u210)) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) in (let dtb_u_u213 = ((B_dData_dList.v_map (fun (dtb_u_u220 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u220); B_dData_dPair.f_Pair_second = (((v_groupDepIdx dtb_u_u208) dtb_u_u211) dtb_u_u220) })) dtb_u_u210) in (let dtb_u_u214 = (v_reverseDepTbl dtb_u_u213) in (let dtb_u_u215 = (((B_dData_dList.v_foldl (fun (dtb_u_u218 : (int, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u219 : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dPair.v_firstOf dtb_u_u219)) (v_countList (B_dData_dPair.v_secondOf dtb_u_u219))) dtb_u_u218))) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) dtb_u_u213) in (let dtb_u_u216 = ((B_dData_dList.v_filter (fun (dtb_u_u217 : int) -> (((v_lookupInt dtb_u_u215) dtb_u_u217) = 0))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u210)) in (((((((v_orderGroupsGo ((v_countList dtb_u_u209) + 1)) dtb_u_u212) dtb_u_u214) dtb_u_u215) dtb_u_u216) (v_countList dtb_u_u209)) B_dData_dList.C_List_Nil)))))))))

# 268 "Vuna/Ir/Analysis.vuna"
let v_groupNames = (fun (dtb_u_u222 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u223 : string B_dData_dList.t_List) -> (let dtb_u_u224 = (B_dContainer_dHashMap.v_ofNames dtb_u_u223) in (let dtb_u_u225 = ((B_dData_dList.v_map (fun (dtb_u_u233 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u233); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (dtb_u_u234 : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u234) dtb_u_u224))) (B_dData_dPair.v_secondOf dtb_u_u233)) })) dtb_u_u222) in (let dtb_u_u226 = (v_adjTblOf dtb_u_u225) in (let dtb_u_u227 = (v_reverseAdjTbl dtb_u_u225) in (match ((((v_postOrder dtb_u_u226) dtb_u_u223) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u228; B_dData_dPair.f_Pair_second = dtb_u_u229 } -> (let dtb_u_u230 = ((((v_collectComps dtb_u_u227) dtb_u_u229) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (let dtb_u_u231 = ((v_groupsFromComps dtb_u_u230) dtb_u_u223) in ((Base_dCommon.v_bind ((v_orderGroups dtb_u_u226) dtb_u_u231)) (fun (dtb_u_u232 : string B_dData_dList.t_List B_dData_dList.t_List) -> ((v_checkGroupsCover dtb_u_u232) dtb_u_u223)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 362 "Vuna/Ir/Analysis.vuna"
let v_depEdgeCount = (fun (dtb_u_u235 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (dtb_u_u236 : int) (dtb_u_u237 : Vuna_dIr_dModel.t_IrDef) -> (dtb_u_u236 + (v_countList (Vuna_dIr_dModel.v_irDefDeps dtb_u_u237))))) 0) dtb_u_u235))

# 369 "Vuna/Ir/Analysis.vuna"
let rec v_reachableNames = (fun (dtb_u_u238 : int) (dtb_u_u239 : string B_dData_dList.t_List) (dtb_u_u240 : (string, Vuna_dIr_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u241 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u238 <= 0) then dtb_u_u241 else (match dtb_u_u239 with
  | B_dData_dList.C_List_Nil -> dtb_u_u241
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u242, dtb_u_u243) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u242) dtb_u_u241) then ((((v_reachableNames (dtb_u_u238 - 1)) dtb_u_u243) dtb_u_u240) dtb_u_u241) else (let dtb_u_u244 = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u242) true) dtb_u_u241) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u242) dtb_u_u240) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_reachableNames (dtb_u_u238 - 1)) dtb_u_u243) dtb_u_u240) dtb_u_u244)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u245) -> ((((v_reachableNames (dtb_u_u238 - 1)) ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irDefDeps dtb_u_u245)) dtb_u_u243)) dtb_u_u240) dtb_u_u244)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 354 "Vuna/Ir/Analysis.vuna"
let v_reachableDefs = (fun (dtb_u_u246 : string B_dData_dList.t_List) (dtb_u_u247 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (let dtb_u_u248 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u252 : Vuna_dIr_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName dtb_u_u252); B_dData_dPair.f_Pair_second = dtb_u_u252 })) dtb_u_u247)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let dtb_u_u249 = ((8 + (v_countList dtb_u_u246)) + (v_depEdgeCount dtb_u_u247)) in (let dtb_u_u250 = ((((v_reachableNames dtb_u_u249) dtb_u_u246) dtb_u_u248) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in ((B_dData_dList.v_filter (fun (dtb_u_u251 : Vuna_dIr_dModel.t_IrDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Vuna_dIr_dModel.v_irDefName dtb_u_u251)) dtb_u_u250))) dtb_u_u247)))))

# 391 "Vuna/Ir/Analysis.vuna"
let rec v_irStringsOf = (fun (dtb_u_u253 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u253 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u254, dtb_u_u255, dtb_u_u256) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u257) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u258) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u259) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u260) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u261) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u262) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u263, dtb_u_u264, dtb_u_u265, dtb_u_u266, dtb_u_u267) -> (v_irStringsOf dtb_u_u267)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u268) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb_u_u268)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u269, dtb_u_u270, dtb_u_u271, dtb_u_u272, dtb_u_u273) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u269)) ((B_dData_dList.v_append (v_irStringsOfAltMaybe dtb_u_u271)) ((B_dData_dList.v_append (v_irStringsOfAltMaybe dtb_u_u272)) (v_irStringsOfAltMaybe dtb_u_u273))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u274, dtb_u_u275, dtb_u_u276, dtb_u_u277) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u276)) ((B_dData_dList.v_concatMap v_irStringsOfAlt) dtb_u_u277))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u278, dtb_u_u279, dtb_u_u280) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u278)) ((B_dData_dList.v_append (v_irStringsOf dtb_u_u279)) (v_irStringsOf dtb_u_u280)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u281) -> (v_irStringsOf dtb_u_u281)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u282, dtb_u_u283, dtb_u_u284) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u283)) (v_irStringsOf dtb_u_u284))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u285, dtb_u_u286, dtb_u_u287) -> (v_irStringsOf dtb_u_u287)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u288, dtb_u_u289, dtb_u_u290) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u289)) (v_irStringsOf dtb_u_u290))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u291, dtb_u_u292, dtb_u_u293) -> (v_irStringsOf dtb_u_u293)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u294, dtb_u_u295) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb_u_u295)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u296, dtb_u_u297, dtb_u_u298, dtb_u_u299) -> ((B_dData_dList.v_append (v_irStringsOf dtb_u_u296)) ((B_dData_dList.v_concatMap v_irStringsOfField) dtb_u_u298))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u300, dtb_u_u301, dtb_u_u302, dtb_u_u303) -> (v_irStringsOf dtb_u_u300)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u304, dtb_u_u305, dtb_u_u306) -> ((B_dData_dList.v_concatMap v_irStringsOfField) dtb_u_u306)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb_u_u310)
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u311) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u311, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfField = (fun (dtb_u_u312 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irStringsOf (B_dData_dPair.v_secondOf dtb_u_u312)))
# 423 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfAlt = (fun (dtb_u_u313 : Vuna_dIr_dModel.t_IrAlt) -> (v_irStringsOf (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u313)))
# 426 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfAltMaybe = (fun (dtb_u_u314 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u314 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u315) -> (v_irStringsOfAlt dtb_u_u315)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Ir/Analysis.vuna"
let rec v_irFloatLitsOf = (fun (dtb_u_u316 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u316 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u317, dtb_u_u318, dtb_u_u319) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u320) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u321) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u322) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u323) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u324) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u325) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u326, dtb_u_u327, dtb_u_u328, dtb_u_u329, dtb_u_u330) -> (v_irFloatLitsOf dtb_u_u330)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u331) -> ((B_dData_dList.v_concatMap v_irFloatLitsOf) dtb_u_u331)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u332, dtb_u_u333, dtb_u_u334, dtb_u_u335, dtb_u_u336) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u332)) ((B_dData_dList.v_append (v_floatsOfAltMaybe dtb_u_u334)) ((B_dData_dList.v_append (v_floatsOfAltMaybe dtb_u_u335)) (v_floatsOfAltMaybe dtb_u_u336))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u337, dtb_u_u338, dtb_u_u339, dtb_u_u340) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u339)) ((B_dData_dList.v_concatMap v_floatsOfAlt) dtb_u_u340))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u341, dtb_u_u342, dtb_u_u343) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u341)) ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u342)) (v_irFloatLitsOf dtb_u_u343)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u344) -> (v_irFloatLitsOf dtb_u_u344)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u345, dtb_u_u346, dtb_u_u347) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u346)) (v_irFloatLitsOf dtb_u_u347))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u348, dtb_u_u349, dtb_u_u350) -> (v_irFloatLitsOf dtb_u_u350)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u351, dtb_u_u352, dtb_u_u353) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u352)) (v_irFloatLitsOf dtb_u_u353))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u354, dtb_u_u355, dtb_u_u356) -> (v_irFloatLitsOf dtb_u_u356)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u357, dtb_u_u358) -> ((B_dData_dList.v_concatMap v_irFloatLitsOf) dtb_u_u358)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u359, dtb_u_u360, dtb_u_u361, dtb_u_u362) -> ((B_dData_dList.v_append (v_irFloatLitsOf dtb_u_u359)) ((B_dData_dList.v_concatMap v_floatsOfField) dtb_u_u361))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u363, dtb_u_u364, dtb_u_u365, dtb_u_u366) -> (v_irFloatLitsOf dtb_u_u363)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u367, dtb_u_u368, dtb_u_u369) -> ((B_dData_dList.v_concatMap v_floatsOfField) dtb_u_u369)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u370, dtb_u_u371, dtb_u_u372, dtb_u_u373) -> ((B_dData_dList.v_concatMap v_irFloatLitsOf) dtb_u_u373)
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u374) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u374, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 461 "Vuna/Ir/Analysis.vuna"
and v_floatsOfField = (fun (dtb_u_u375 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irFloatLitsOf (B_dData_dPair.v_secondOf dtb_u_u375)))
# 464 "Vuna/Ir/Analysis.vuna"
and v_floatsOfAlt = (fun (dtb_u_u376 : Vuna_dIr_dModel.t_IrAlt) -> (v_irFloatLitsOf (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u376)))
# 467 "Vuna/Ir/Analysis.vuna"
and v_floatsOfAltMaybe = (fun (dtb_u_u377 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u377 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u378) -> (v_floatsOfAlt dtb_u_u378)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Ir/Analysis.vuna"
let rec v_flattenApp = (fun (dtb_u_u379 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u379 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u380, dtb_u_u381, dtb_u_u382) -> (let dtb_u_u383 = (v_flattenApp dtb_u_u381) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u383); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u383)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u382, B_dData_dList.C_List_Nil))) })
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u379; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 480 "Vuna/Ir/Analysis.vuna"
let rec v_irGlobalsOf = (fun (dtb_u_u384 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u384 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u385, dtb_u_u386, dtb_u_u387) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u388) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u389) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u390) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u391) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u392) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u393) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u394) -> (v_irGlobalsOf dtb_u_u394)
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u395, dtb_u_u396, dtb_u_u397, dtb_u_u398, dtb_u_u399) -> (v_irGlobalsOf dtb_u_u399)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u400) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb_u_u400)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u401, dtb_u_u402, dtb_u_u403, dtb_u_u404, dtb_u_u405) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u401)) ((B_dData_dList.v_append (v_globalsOfAltMaybe dtb_u_u403)) ((B_dData_dList.v_append (v_globalsOfAltMaybe dtb_u_u404)) (v_globalsOfAltMaybe dtb_u_u405))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u406, dtb_u_u407, dtb_u_u408, dtb_u_u409) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u408)) ((B_dData_dList.v_concatMap v_globalsOfAlt) dtb_u_u409))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u410, dtb_u_u411, dtb_u_u412) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u410)) ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u411)) (v_irGlobalsOf dtb_u_u412)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u413, dtb_u_u414, dtb_u_u415) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u414)) (v_irGlobalsOf dtb_u_u415))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u416, dtb_u_u417, dtb_u_u418) -> (v_irGlobalsOf dtb_u_u418)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u419, dtb_u_u420, dtb_u_u421) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u420)) (v_irGlobalsOf dtb_u_u421))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u422, dtb_u_u423, dtb_u_u424) -> (v_irGlobalsOf dtb_u_u424)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u425, dtb_u_u426) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb_u_u426)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u427, dtb_u_u428, dtb_u_u429, dtb_u_u430) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u427)) ((B_dData_dList.v_concatMap v_globalsOfField) dtb_u_u429))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u431, dtb_u_u432, dtb_u_u433, dtb_u_u434) -> (v_irGlobalsOf dtb_u_u431)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u435, dtb_u_u436, dtb_u_u437) -> ((B_dData_dList.v_concatMap v_globalsOfField) dtb_u_u437)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u438, dtb_u_u439, dtb_u_u440, dtb_u_u441) -> ((B_dData_dList.v_concatMap v_irGlobalsOf) dtb_u_u441)
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u442) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u442, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 508 "Vuna/Ir/Analysis.vuna"
and v_globalsOfField = (fun (dtb_u_u443 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irGlobalsOf (B_dData_dPair.v_secondOf dtb_u_u443)))
# 511 "Vuna/Ir/Analysis.vuna"
and v_globalsOfAlt = (fun (dtb_u_u444 : Vuna_dIr_dModel.t_IrAlt) -> (v_irGlobalsOf (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u444)))
# 514 "Vuna/Ir/Analysis.vuna"
and v_globalsOfAltMaybe = (fun (dtb_u_u445 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u445 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u446) -> (v_globalsOfAlt dtb_u_u446)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Ir/Analysis.vuna"
let v_bodyRefCount = (fun (dtb_u_u447 : Vuna_dIr_dModel.t_Ir B_dData_dMaybe.t_Maybe) -> (match dtb_u_u447 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u448) -> (v_countList (v_irGlobalsOf dtb_u_u448))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Ir/Analysis.vuna"
let v_refEdgeCount = (fun (dtb_u_u449 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (dtb_u_u450 : int) (dtb_u_u451 : Vuna_dIr_dModel.t_IrDef) -> ((dtb_u_u450 + (v_bodyRefCount (Vuna_dIr_dModel.v_irDefBody dtb_u_u451))) + (v_countList (Vuna_dIr_dModel.v_irDefDeps dtb_u_u451))))) 0) dtb_u_u449))

# 537 "Vuna/Ir/Analysis.vuna"
let v_refsOfDef = (fun (dtb_u_u452 : (string) -> bool) (dtb_u_u453 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u453) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_filter dtb_u_u452) (Vuna_dIr_dModel.v_irDefDeps dtb_u_u453))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u454) -> ((B_dData_dList.v_append (v_irGlobalsOf dtb_u_u454)) ((B_dData_dList.v_filter dtb_u_u452) (Vuna_dIr_dModel.v_irDefDeps dtb_u_u453)))
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Ir/Analysis.vuna"
let rec v_closeRefsByRefs = (fun (dtb_u_u455 : int) (dtb_u_u456 : (string, Vuna_dIr_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u457 : (string) -> bool) (dtb_u_u458 : string B_dData_dList.t_List) (dtb_u_u459 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (if (dtb_u_u455 <= 0) then dtb_u_u459 else (match dtb_u_u458 with
  | B_dData_dList.C_List_Nil -> dtb_u_u459
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u460, dtb_u_u461) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u460) dtb_u_u459) then (((((v_closeRefsByRefs (dtb_u_u455 - 1)) dtb_u_u456) dtb_u_u457) dtb_u_u461) dtb_u_u459) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u460) dtb_u_u456) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_closeRefsByRefs (dtb_u_u455 - 1)) dtb_u_u456) dtb_u_u457) dtb_u_u461) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u460) true) dtb_u_u459))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u462) -> (((((v_closeRefsByRefs (dtb_u_u455 - 1)) dtb_u_u456) dtb_u_u457) ((B_dData_dList.v_append ((v_refsOfDef dtb_u_u457) dtb_u_u462)) dtb_u_u461)) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u460) true) dtb_u_u459))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 521 "Vuna/Ir/Analysis.vuna"
let v_reachableDefsByRefs = (fun (dtb_u_u463 : (string) -> bool) (dtb_u_u464 : int) (dtb_u_u465 : string B_dData_dList.t_List) (dtb_u_u466 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (let dtb_u_u467 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u471 : Vuna_dIr_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName dtb_u_u471); B_dData_dPair.f_Pair_second = dtb_u_u471 })) dtb_u_u466)) in (let dtb_u_u468 = ((8 + dtb_u_u464) + (v_refEdgeCount dtb_u_u466)) in (let dtb_u_u469 = (((((v_closeRefsByRefs dtb_u_u468) dtb_u_u467) dtb_u_u463) dtb_u_u465) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in ((B_dData_dList.v_filter (fun (dtb_u_u470 : Vuna_dIr_dModel.t_IrDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Vuna_dIr_dModel.v_irDefName dtb_u_u470)) dtb_u_u469))) dtb_u_u466)))))

# 559 "Vuna/Ir/Analysis.vuna"
let v_irStringsOfDef = (fun (dtb_u_u472 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u472) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u473) -> (v_irStringsOf dtb_u_u473)
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Ir/Analysis.vuna"
let v_irFloatLitsOfDef = (fun (dtb_u_u474 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u474) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u475) -> (v_irFloatLitsOf dtb_u_u475)
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Ir/Analysis.vuna"
let rec v_checkUniqueDefNamesGo = (fun (dtb_u_u476 : string B_dData_dList.t_List) (dtb_u_u477 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u476 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u478, dtb_u_u479) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u478) dtb_u_u477) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate runtime definition name in IR: `"; dtb_u_u478; "`"])) else ((v_checkUniqueDefNamesGo dtb_u_u479) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u478) true) dtb_u_u477)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Ir/Analysis.vuna"
let v_checkUniqueDefNames = (fun (dtb_u_u480 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((v_checkUniqueDefNamesGo ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) dtb_u_u480)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 614 "Vuna/Ir/Analysis.vuna"
let rec v_firstBadRecName = (fun (dtb_u_u481 : string B_dData_dList.t_List) (dtb_u_u482 : (string) -> bool) -> (match dtb_u_u481 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u483, dtb_u_u484) -> (if (dtb_u_u482 dtb_u_u483) then ((v_firstBadRecName dtb_u_u484) dtb_u_u482) else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u483)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 598 "Vuna/Ir/Analysis.vuna"
let rec v_assembleGo = (fun (dtb_u_u485 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u486 : string B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u487 : (string) -> bool) (dtb_u_u488 : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u486 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u489, dtb_u_u490) -> (let dtb_u_u491 = ((v_groupNeedsRec dtb_u_u485) dtb_u_u489) in (let dtb_u_u492 = (if dtb_u_u491 then (match ((v_firstBadRecName dtb_u_u489) dtb_u_u487) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u495) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (dtb_u_u488 dtb_u_u495)) dtb_u_u495) (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb_u_u495))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u495, B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u489 }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u489 }))) in ((Base_dCommon.v_bind dtb_u_u492) (fun (dtb_u_u493 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_assembleGo dtb_u_u485) dtb_u_u490) dtb_u_u487) dtb_u_u488)) (fun (dtb_u_u494 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u493, dtb_u_u494))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Ir/Analysis.vuna"
let v_groupNamesGo = (fun (dtb_u_u496 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u497 : string B_dData_dList.t_List) (dtb_u_u498 : string B_dData_dList.t_List B_dData_dList.t_List Base_dDiag.t_Check) (dtb_u_u499 : (string) -> bool) (dtb_u_u500 : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u498 with
  | Base_dDiag.C_Check_OkC (dtb_u_u501) -> ((((v_assembleGo dtb_u_u496) dtb_u_u501) dtb_u_u499) dtb_u_u500)
  | Base_dDiag.C_Check_ErrC (dtb_u_u502) -> (Base_dDiag.C_Check_ErrC (dtb_u_u502))
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Ir/Analysis.vuna"
let v_assembleGroupNames = (fun (dtb_u_u503 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u504 : string B_dData_dList.t_List) (dtb_u_u505 : (string) -> bool) (dtb_u_u506 : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (((((v_groupNamesGo (v_adjTblOf dtb_u_u503)) dtb_u_u504) ((v_groupNames dtb_u_u503) dtb_u_u504)) dtb_u_u505) dtb_u_u506))

# 620 "Vuna/Ir/Analysis.vuna"
let rec v_irMentionsGlobal = (fun (dtb_u_u507 : string) (dtb_u_u508 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u508 with
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u509, dtb_u_u510, dtb_u_u511, dtb_u_u512, dtb_u_u513) -> ((v_irMentionsGlobal dtb_u_u507) dtb_u_u513)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u514) -> ((v_anyMentions dtb_u_u507) dtb_u_u514)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u515, dtb_u_u516, dtb_u_u517, dtb_u_u518, dtb_u_u519) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u515) then true else (if ((v_anyMentionsAltM dtb_u_u507) dtb_u_u517) then true else (if ((v_anyMentionsAltM dtb_u_u507) dtb_u_u518) then true else ((v_anyMentionsAltM dtb_u_u507) dtb_u_u519))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u520, dtb_u_u521, dtb_u_u522, dtb_u_u523) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u522) then true else ((v_anyMentionsAlts dtb_u_u507) dtb_u_u523))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u524, dtb_u_u525, dtb_u_u526) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u524) then true else (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u525) then true else ((v_irMentionsGlobal dtb_u_u507) dtb_u_u526)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u527, dtb_u_u528, dtb_u_u529) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u528) then true else ((v_irMentionsGlobal dtb_u_u507) dtb_u_u529))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u530, dtb_u_u531, dtb_u_u532) -> ((v_irMentionsGlobal dtb_u_u507) dtb_u_u532)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u533, dtb_u_u534, dtb_u_u535) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u534) then true else ((v_irMentionsGlobal dtb_u_u507) dtb_u_u535))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u536, dtb_u_u537, dtb_u_u538) -> ((v_irMentionsGlobal dtb_u_u507) dtb_u_u538)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u539, dtb_u_u540) -> ((v_anyMentions dtb_u_u507) dtb_u_u540)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u541, dtb_u_u542, dtb_u_u543, dtb_u_u544) -> (if ((v_irMentionsGlobal dtb_u_u507) dtb_u_u541) then true else ((v_anyMentionsFields dtb_u_u507) dtb_u_u543))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u545, dtb_u_u546, dtb_u_u547, dtb_u_u548) -> ((v_irMentionsGlobal dtb_u_u507) dtb_u_u545)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u549, dtb_u_u550, dtb_u_u551) -> ((v_anyMentionsFields dtb_u_u507) dtb_u_u551)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u552, dtb_u_u553, dtb_u_u554, dtb_u_u555) -> ((v_anyMentions dtb_u_u507) dtb_u_u555)
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u556) -> (dtb_u_u556 = dtb_u_u507)
  | _ -> false
))
# 644 "Vuna/Ir/Analysis.vuna"
and v_anyMentions = (fun (dtb_u_u557 : string) (dtb_u_u558 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match dtb_u_u558 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u559, dtb_u_u560) -> (if ((v_irMentionsGlobal dtb_u_u557) dtb_u_u559) then true else ((v_anyMentions dtb_u_u557) dtb_u_u560))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 648 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsFields = (fun (dtb_u_u561 : string) (dtb_u_u562 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u562 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u563, dtb_u_u564) -> (match dtb_u_u563 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u565; B_dData_dPair.f_Pair_second = dtb_u_u566 } -> (if ((v_irMentionsGlobal dtb_u_u561) dtb_u_u566) then true else ((v_anyMentionsFields dtb_u_u561) dtb_u_u564))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 652 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsAlts = (fun (dtb_u_u567 : string) (dtb_u_u568 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u568 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u569, dtb_u_u570) -> (if ((v_irMentionsGlobal dtb_u_u567) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u569)) then true else ((v_anyMentionsAlts dtb_u_u567) dtb_u_u570))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 657 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsAltM = (fun (dtb_u_u571 : string) (dtb_u_u572 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u572 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u573) -> ((v_irMentionsGlobal dtb_u_u571) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u573))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
