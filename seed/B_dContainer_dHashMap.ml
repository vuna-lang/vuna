open Vuna_runtime
type ('a0, 'a1) t_HashMap = { f_HashMap_hashMapBuckets : ((('a0, 'a1) B_dData_dPair.t_Pair B_dData_dList.t_List array) array); f_HashMap_hashMapCount : int }

# 28 "Base/Container/HashMap.vuna"
let v__ubucketOf = (fun (dtb_u_u1 : int) -> (let dtb_u_u2 = (dtb_u_u1 - ((if 1024 = 0 then failwith "division by zero" else dtb_u_u1 / 1024) * 1024)) in (if (dtb_u_u2 < 0) then (dtb_u_u2 + 1024) else dtb_u_u2)))

# 35 "Base/Container/HashMap.vuna"
let rec v__ubucketInsert = (fun dtb_u_u5 dtb_u_u6 dtb_u_u7 dtb_u_u8 -> (match dtb_u_u8 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (match dtb_u_u9 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u11; B_dData_dPair.f_Pair_second = dtb_u_u12 } -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u5) dtb_u_u6) dtb_u_u11) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u6; B_dData_dPair.f_Pair_second = dtb_u_u7 }, dtb_u_u10)) } else (match ((((v__ubucketInsert dtb_u_u5) dtb_u_u6) dtb_u_u7) dtb_u_u10) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u13; B_dData_dPair.f_Pair_second = dtb_u_u14 } -> { B_dData_dPair.f_Pair_first = dtb_u_u13; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u11; B_dData_dPair.f_Pair_second = dtb_u_u12 }, dtb_u_u14)) }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u6; B_dData_dPair.f_Pair_second = dtb_u_u7 }, B_dData_dList.C_List_Nil)) }
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Container/HashMap.vuna"
let rec v__ubucketRemove = (fun dtb_u_u17 dtb_u_u18 dtb_u_u19 -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (match dtb_u_u20 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u22; B_dData_dPair.f_Pair_second = dtb_u_u23 } -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u17) dtb_u_u18) dtb_u_u22) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u21 } else (match (((v__ubucketRemove dtb_u_u17) dtb_u_u18) dtb_u_u21) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u24; B_dData_dPair.f_Pair_second = dtb_u_u25 } -> { B_dData_dPair.f_Pair_first = dtb_u_u24; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u22; B_dData_dPair.f_Pair_second = dtb_u_u23 }, dtb_u_u25)) }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 55 "Base/Container/HashMap.vuna"
let rec v__ulookupAssoc = (fun dtb_u_u28 dtb_u_u29 dtb_u_u30 -> (match dtb_u_u30 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u31, dtb_u_u32) -> (match dtb_u_u31 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u33; B_dData_dPair.f_Pair_second = dtb_u_u34 } -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u28) dtb_u_u29) dtb_u_u33) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u34)) else (((v__ulookupAssoc dtb_u_u28) dtb_u_u29) dtb_u_u32))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Container/HashMap.vuna"
let v_insert = (fun dtb_u_u37 dtb_u_u38 dtb_u_u39 dtb_u_u40 dtb_u_u41 -> (match dtb_u_u41 with
  | { f_HashMap_hashMapBuckets = dtb_u_u42; f_HashMap_hashMapCount = dtb_u_u43 } -> (let dtb_u_u44 = (if ((B_dContainer_dArray.v_length dtb_u_u42) = 0) then ((B_dContainer_dArray.v_make 32) ((B_dContainer_dArray.v_make 32) B_dData_dList.C_List_Nil)) else dtb_u_u42) in (let dtb_u_u45 = (v__ubucketOf ((B_dTrait_dHashable.v_hash dtb_u_u37) dtb_u_u39)) in (let dtb_u_u46 = (if 32 = 0 then failwith "division by zero" else dtb_u_u45 / 32) in (let dtb_u_u47 = (bi_natFromInt dtb_u_u46) in (let dtb_u_u48 = (bi_natFromInt (dtb_u_u45 - (dtb_u_u46 * 32))) in (let dtb_u_u49 = ((B_dContainer_dArray.v_get dtb_u_u44) dtb_u_u47) in (let dtb_u_u50 = ((B_dContainer_dArray.v_get dtb_u_u49) dtb_u_u48) in (match ((((v__ubucketInsert dtb_u_u38) dtb_u_u39) dtb_u_u40) dtb_u_u50) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u51; B_dData_dPair.f_Pair_second = dtb_u_u52 } -> { f_HashMap_hashMapBuckets = (((B_dContainer_dArray.v_set dtb_u_u44) dtb_u_u47) (((B_dContainer_dArray.v_set dtb_u_u49) dtb_u_u48) dtb_u_u52)); f_HashMap_hashMapCount = (if dtb_u_u51 then (dtb_u_u43 + 1) else dtb_u_u43) }
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
))

# 82 "Base/Container/HashMap.vuna"
let v_remove = (fun dtb_u_u55 dtb_u_u56 dtb_u_u57 dtb_u_u58 -> (match dtb_u_u58 with
  | { f_HashMap_hashMapBuckets = dtb_u_u59; f_HashMap_hashMapCount = dtb_u_u60 } -> (if ((B_dContainer_dArray.v_length dtb_u_u59) = 0) then dtb_u_u58 else (let dtb_u_u61 = (v__ubucketOf ((B_dTrait_dHashable.v_hash dtb_u_u55) dtb_u_u57)) in (let dtb_u_u62 = (if 32 = 0 then failwith "division by zero" else dtb_u_u61 / 32) in (let dtb_u_u63 = (bi_natFromInt dtb_u_u62) in (let dtb_u_u64 = (bi_natFromInt (dtb_u_u61 - (dtb_u_u62 * 32))) in (let dtb_u_u65 = ((B_dContainer_dArray.v_get dtb_u_u59) dtb_u_u63) in (let dtb_u_u66 = ((B_dContainer_dArray.v_get dtb_u_u65) dtb_u_u64) in (let dtb_u_u67 = (((v__ubucketRemove dtb_u_u56) dtb_u_u57) dtb_u_u66) in (match dtb_u_u67 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u68; B_dData_dPair.f_Pair_second = dtb_u_u69 } -> (if dtb_u_u68 then { f_HashMap_hashMapBuckets = (((B_dContainer_dArray.v_set dtb_u_u59) dtb_u_u63) (((B_dContainer_dArray.v_set dtb_u_u65) dtb_u_u64) dtb_u_u69)); f_HashMap_hashMapCount = (dtb_u_u60 - 1) } else dtb_u_u58)
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 99 "Base/Container/HashMap.vuna"
let v_lookup = (fun dtb_u_u72 dtb_u_u73 dtb_u_u74 dtb_u_u75 -> (match dtb_u_u75 with
  | { f_HashMap_hashMapBuckets = dtb_u_u76; f_HashMap_hashMapCount = dtb_u_u77 } -> (if ((B_dContainer_dArray.v_length dtb_u_u76) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u78 = (v__ubucketOf ((B_dTrait_dHashable.v_hash dtb_u_u72) dtb_u_u74)) in (let dtb_u_u79 = (if 32 = 0 then failwith "division by zero" else dtb_u_u78 / 32) in (let dtb_u_u80 = (bi_natFromInt dtb_u_u79) in (let dtb_u_u81 = (bi_natFromInt (dtb_u_u78 - (dtb_u_u79 * 32))) in (((v__ulookupAssoc dtb_u_u73) dtb_u_u74) ((B_dContainer_dArray.v_get ((B_dContainer_dArray.v_get dtb_u_u76) dtb_u_u80)) dtb_u_u81)))))))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Base/Container/HashMap.vuna"
let v_member = (fun dtb_u_u84 dtb_u_u85 dtb_u_u86 dtb_u_u87 -> (match ((((v_lookup dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u87) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u88) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 119 "Base/Container/HashMap.vuna"
let rec v_insertAll = (fun dtb_u_u91 dtb_u_u92 dtb_u_u93 dtb_u_u94 -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (match dtb_u_u95 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u97; B_dData_dPair.f_Pair_second = dtb_u_u98 } -> ((((v_insertAll dtb_u_u91) dtb_u_u92) dtb_u_u96) (((((v_insert dtb_u_u91) dtb_u_u92) dtb_u_u97) dtb_u_u98) dtb_u_u94))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u94
  | _ -> failwith "DT: impossible branch"
))

# 124 "Base/Container/HashMap.vuna"
let rec v_fromList = (fun dtb_u_u101 dtb_u_u102 dtb_u_u103 -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u104 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u107 } -> (((((v_insert dtb_u_u101) dtb_u_u102) dtb_u_u106) dtb_u_u107) (((v_fromList dtb_u_u101) dtb_u_u102) dtb_u_u105))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_HashMap_hashMapBuckets = [||]; f_HashMap_hashMapCount = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 129 "Base/Container/HashMap.vuna"
let v_ofNames = (fun (dtb_u_u108 : string B_dData_dList.t_List) -> ((((v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u109 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u109; B_dData_dPair.f_Pair_second = true })) dtb_u_u108)) (((v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 133 "Base/Container/HashMap.vuna"
let v_toList = (fun dtb_u_u112 -> (match dtb_u_u112 with
  | { f_HashMap_hashMapBuckets = dtb_u_u113; f_HashMap_hashMapCount = dtb_u_u114 } -> ((B_dData_dList.v_concatMap (fun dtb_u_u115 -> ((B_dData_dList.v_concatMap (fun dtb_u_u116 -> dtb_u_u116)) (B_dContainer_dArray.v_toList dtb_u_u115)))) (B_dContainer_dArray.v_toList dtb_u_u113))
  | _ -> failwith "DT: impossible branch"
))

# 143 "Base/Container/HashMap.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_HashMap_x36_46_x36_HashMap_uk_uv = (fun dtb_u_u119 dtb_u_u120 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u121 -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua ((B_dData_dPair.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u119) dtb_u_u120))) (v_toList dtb_u_u121)))))))

# 140 "Base/Container/HashMap.vuna"
let v_size = (fun dtb_u_u124 -> (match dtb_u_u124 with
  | { f_HashMap_hashMapBuckets = dtb_u_u125; f_HashMap_hashMapCount = dtb_u_u126 } -> (bi_natFromInt dtb_u_u126)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Container/HashMap.vuna"
let v_hashMapBuckets = (fun dtb_u_u129 -> (match dtb_u_u129 with
  | { f_HashMap_hashMapBuckets = dtb_u_u130; f_HashMap_hashMapCount = dtb_u_u131 } -> dtb_u_u130
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Container/HashMap.vuna"
let v_hashMapCount = (fun dtb_u_u134 -> (match dtb_u_u134 with
  | { f_HashMap_hashMapBuckets = dtb_u_u135; f_HashMap_hashMapCount = dtb_u_u136 } -> dtb_u_u136
  | _ -> failwith "DT: impossible branch"
))
