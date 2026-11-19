open Vuna_runtime
type ('a0, 'a1) t_HashMap = ((('a0, 'a1) B_dData_dPair.t_Pair B_dData_dList.t_List array) array)

# 26 "Base/Container/HashMap.vuna"
let v__ubucketOf = (fun (n : int) -> ((fun m -> (if (m < 0) then (m + 1024) else m)) (n - ((if 1024 = 0 then failwith "division by zero" else n / 1024) * 1024))))

# 33 "Base/Container/HashMap.vuna"
let rec v__ulookupAssoc = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__2) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else (((v__ulookupAssoc _uctx0) mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/Container/HashMap.vuna"
let rec v__uhasKeyIn = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) mc0) dtb__6) then true else (((v__uhasKeyIn _uctx0) mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Container/HashMap.vuna"
let rec v__udedupGo = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (if (((v__uhasKeyIn _uctx0) dtb__10) mc1) then (((v__udedupGo _uctx0) dtb__9) mc1) else (((v__udedupGo _uctx0) dtb__9) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Base/Container/HashMap.vuna"
let v__udedupBucket = (fun _uctx0 xs -> (((v__udedupGo _uctx0) xs) B_dData_dList.C_List_Nil))

# 54 "Base/Container/HashMap.vuna"
let v_insert = (fun _uctx0 mc0 mc1 mc2 -> (let dtb__12 = mc2 in ((fun base -> ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (((B_dContainer_dArray.v_set base) oi) (((B_dContainer_dArray.v_set outer) ii) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, inner))))) ((B_dContainer_dArray.v_get outer) ii))) ((B_dContainer_dArray.v_get base) oi))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v__ubucketOf ((B_dTrait_dHashable.v_hash _uctx0) mc0)))) (if ((B_dContainer_dArray.v_length dtb__12) = 0) then ((B_dContainer_dArray.v_make 32) ((B_dContainer_dArray.v_make 32) B_dData_dList.C_List_Nil)) else dtb__12))))

# 72 "Base/Container/HashMap.vuna"
let v_lookup = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__13 = mc1 in (if ((B_dContainer_dArray.v_length dtb__13) = 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> (((v__ulookupAssoc _uctx1) mc0) ((B_dContainer_dArray.v_get ((B_dContainer_dArray.v_get dtb__13) oi)) ii))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v__ubucketOf ((B_dTrait_dHashable.v_hash _uctx0) mc0))))))

# 85 "Base/Container/HashMap.vuna"
let v_member = (fun _uctx0 _uctx1 key t -> (match ((((v_lookup _uctx0) _uctx1) key) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 92 "Base/Container/HashMap.vuna"
let rec v_insertAll = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> (((v_insertAll _uctx0) dtb__16) ((((v_insert _uctx0) dtb__17) dtb__18) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 97 "Base/Container/HashMap.vuna"
let rec v_fromList = (fun _uctx0 mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> ((((v_insert _uctx0) dtb__21) dtb__22) ((v_fromList _uctx0) dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> [||]
  | _ -> failwith "DT: impossible branch"
))

# 102 "Base/Container/HashMap.vuna"
let v_ofNames = (fun (xs : string B_dData_dList.t_List) -> (((v_insertAll B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = true })) xs)) ((v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 106 "Base/Container/HashMap.vuna"
let v_toList = (fun _uctx0 mc0 -> (let dtb__23 = mc0 in ((B_dData_dList.v_concatMap (fun outer -> ((B_dData_dList.v_concatMap (fun inner -> ((v__udedupBucket _uctx0) inner))) (B_dContainer_dArray.v_toList outer)))) (B_dContainer_dArray.v_toList dtb__23))))

# 116 "Base/Container/HashMap.vuna"
let v_Show_uBase_uContainer_uHashMap_uHashMap_uk_uv = (fun _uctx0 _uctx1 _uctx2 -> (B_dTrait_dShow.C_Show_Show ((fun m -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua ((B_dData_dPair.v_Show_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1))) ((v_toList _uctx2) m)))))))

# 113 "Base/Container/HashMap.vuna"
let v_size = (fun _uctx0 t -> (B_dData_dList.v_length ((v_toList _uctx0) t)))
