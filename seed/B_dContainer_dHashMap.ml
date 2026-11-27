open Vuna_runtime
type ('a0, 'a1) t_HashMap = { f_HashMap_hashMapBuckets : ((('a0, 'a1) B_dData_dPair.t_Pair B_dData_dList.t_List array) array); f_HashMap_hashMapCount : int }

# 28 "Base/Container/HashMap.vuna"
let v__ubucketOf = (fun (n : int) -> (let m = (n - ((if 1024 = 0 then failwith "division by zero" else n / 1024) * 1024)) in (if (m < 0) then (m + 1024) else m)))

# 35 "Base/Container/HashMap.vuna"
let rec v__ubucketInsert = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__2) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__1)) } else (match ((((v__ubucketInsert _uctx0) mc0) mc1) dtb__1) with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 }, dtb__5)) }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, B_dData_dList.C_List_Nil)) }
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Container/HashMap.vuna"
let rec v__ubucketRemove = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__8) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__7 } else (match (((v__ubucketRemove _uctx0) mc0) dtb__7) with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 }, dtb__11)) }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 55 "Base/Container/HashMap.vuna"
let rec v__ulookupAssoc = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (match dtb__12 with
  | { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = dtb__15 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__14) then (B_dData_dMaybe.C_Maybe_Just (dtb__15)) else (((v__ulookupAssoc _uctx0) mc0) dtb__13))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Container/HashMap.vuna"
let v_insert = (fun _uctx0 _uctx1 mc0 mc1 mc2 -> (match mc2 with
  | { f_HashMap_hashMapBuckets = dtb__16; f_HashMap_hashMapCount = dtb__17 } -> (let base = (if ((B_dContainer_dArray.v_length dtb__16) = 0) then ((B_dContainer_dArray.v_make 32) ((B_dContainer_dArray.v_make 32) B_dData_dList.C_List_Nil)) else dtb__16) in (let b = (v__ubucketOf ((B_dTrait_dHashable.v_hash _uctx0) mc0)) in (let qi = (if 32 = 0 then failwith "division by zero" else b / 32) in (let oi = (bi_natFromInt qi) in (let ii = (bi_natFromInt (b - (qi * 32))) in (let outer = ((B_dContainer_dArray.v_get base) oi) in (let inner = ((B_dContainer_dArray.v_get outer) ii) in (match ((((v__ubucketInsert _uctx1) mc0) mc1) inner) with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> { f_HashMap_hashMapBuckets = (((B_dContainer_dArray.v_set base) oi) (((B_dContainer_dArray.v_set outer) ii) dtb__19)); f_HashMap_hashMapCount = (if dtb__18 then (dtb__17 + 1) else dtb__17) }
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
))

# 82 "Base/Container/HashMap.vuna"
let v_remove = (fun _uctx0 _uctx1 mc0 mc1 -> (match mc1 with
  | { f_HashMap_hashMapBuckets = dtb__20; f_HashMap_hashMapCount = dtb__21 } -> (if ((B_dContainer_dArray.v_length dtb__20) = 0) then mc1 else (let b = (v__ubucketOf ((B_dTrait_dHashable.v_hash _uctx0) mc0)) in (let qi = (if 32 = 0 then failwith "division by zero" else b / 32) in (let oi = (bi_natFromInt qi) in (let ii = (bi_natFromInt (b - (qi * 32))) in (let outer = ((B_dContainer_dArray.v_get dtb__20) oi) in (let inner = ((B_dContainer_dArray.v_get outer) ii) in (let nd_uscrut16 = (((v__ubucketRemove _uctx1) mc0) inner) in (match nd_uscrut16 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (if dtb__22 then { f_HashMap_hashMapBuckets = (((B_dContainer_dArray.v_set dtb__20) oi) (((B_dContainer_dArray.v_set outer) ii) dtb__23)); f_HashMap_hashMapCount = (dtb__21 - 1) } else mc1)
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 99 "Base/Container/HashMap.vuna"
let v_lookup = (fun _uctx0 _uctx1 mc0 mc1 -> (match mc1 with
  | { f_HashMap_hashMapBuckets = dtb__24; f_HashMap_hashMapCount = dtb__25 } -> (if ((B_dContainer_dArray.v_length dtb__24) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let b = (v__ubucketOf ((B_dTrait_dHashable.v_hash _uctx0) mc0)) in (let qi = (if 32 = 0 then failwith "division by zero" else b / 32) in (let oi = (bi_natFromInt qi) in (let ii = (bi_natFromInt (b - (qi * 32))) in (((v__ulookupAssoc _uctx1) mc0) ((B_dContainer_dArray.v_get ((B_dContainer_dArray.v_get dtb__24) oi)) ii)))))))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Base/Container/HashMap.vuna"
let v_member = (fun _uctx0 _uctx1 key t -> (match ((((v_lookup _uctx0) _uctx1) key) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 119 "Base/Container/HashMap.vuna"
let rec v_insertAll = (fun _uctx0 _uctx1 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> ((((v_insertAll _uctx0) _uctx1) dtb__28) (((((v_insert _uctx0) _uctx1) dtb__29) dtb__30) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 124 "Base/Container/HashMap.vuna"
let rec v_fromList = (fun _uctx0 _uctx1 mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__31 with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> (((((v_insert _uctx0) _uctx1) dtb__33) dtb__34) (((v_fromList _uctx0) _uctx1) dtb__32))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_HashMap_hashMapBuckets = [||]; f_HashMap_hashMapCount = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 129 "Base/Container/HashMap.vuna"
let v_ofNames = (fun (xs : string B_dData_dList.t_List) -> ((((v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = true })) xs)) (((v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 133 "Base/Container/HashMap.vuna"
let v_toList = (fun mc0 -> (match mc0 with
  | { f_HashMap_hashMapBuckets = dtb__35; f_HashMap_hashMapCount = dtb__36 } -> ((B_dData_dList.v_concatMap (fun outer -> ((B_dData_dList.v_concatMap (fun inner -> (Obj.magic inner))) (B_dContainer_dArray.v_toList (Obj.magic outer))))) (B_dContainer_dArray.v_toList dtb__35))
  | _ -> failwith "DT: impossible branch"
))

# 143 "Base/Container/HashMap.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_HashMap_x36_46_x36_HashMap_uk_uv = (fun _uctx0 _uctx1 -> (B_dTrait_dShow.C_Show_Show ((fun m -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua ((B_dData_dPair.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub _uctx0) _uctx1))) (v_toList m)))))))

# 140 "Base/Container/HashMap.vuna"
let v_size = (fun mc0 -> (match mc0 with
  | { f_HashMap_hashMapBuckets = dtb__37; f_HashMap_hashMapCount = dtb__38 } -> (bi_natFromInt dtb__38)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Container/HashMap.vuna"
let v_hashMapBuckets = (fun p -> (match p with
  | { f_HashMap_hashMapBuckets = dtb__39; f_HashMap_hashMapCount = dtb__40 } -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Container/HashMap.vuna"
let v_hashMapCount = (fun p -> (match p with
  | { f_HashMap_hashMapBuckets = dtb__41; f_HashMap_hashMapCount = dtb__42 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))
