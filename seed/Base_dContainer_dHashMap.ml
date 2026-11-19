open Vuna_runtime
type ('a0, 'a1) t_Base_dContainer_dHashMap_dHashMap = ((('a0, 'a1) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList array) array)

# 26 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_d_ubucketOf = (fun (n : int) -> ((fun m -> (if (m < 0) then (m + 1024) else m)) (n - ((if 1024 = 0 then failwith "division by zero" else n / 1024) * 1024))))

# 33 "Base/Container/HashMap.vuna"
let rec v_Base_dContainer_dHashMap_d_ulookupAssoc = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) mc0) dtb__2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3)) else (((v_Base_dContainer_dHashMap_d_ulookupAssoc _uctx0) mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/Container/HashMap.vuna"
let rec v_Base_dContainer_dHashMap_d_uhasKeyIn = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__6; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 } -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) mc0) dtb__6) then true else (((v_Base_dContainer_dHashMap_d_uhasKeyIn _uctx0) mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Container/HashMap.vuna"
let rec v_Base_dContainer_dHashMap_d_udedupGo = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> (if (((v_Base_dContainer_dHashMap_d_uhasKeyIn _uctx0) dtb__10) mc1) then (((v_Base_dContainer_dHashMap_d_udedupGo _uctx0) dtb__9) mc1) else (((v_Base_dContainer_dHashMap_d_udedupGo _uctx0) dtb__9) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_d_udedupBucket = (fun _uctx0 xs -> (((v_Base_dContainer_dHashMap_d_udedupGo _uctx0) xs) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 54 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dinsert = (fun _uctx0 mc0 mc1 mc2 -> (let dtb__12 = mc2 in ((fun base -> ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (((Base_dContainer_dArray.v_Base_dContainer_dArray_dset base) oi) (((Base_dContainer_dArray.v_Base_dContainer_dArray_dset outer) ii) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, inner))))) ((Base_dContainer_dArray.v_Base_dContainer_dArray_dget outer) ii))) ((Base_dContainer_dArray.v_Base_dContainer_dArray_dget base) oi))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dContainer_dHashMap_d_ubucketOf ((Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhash _uctx0) mc0)))) (if ((Base_dContainer_dArray.v_Base_dContainer_dArray_dlength dtb__12) = 0) then ((Base_dContainer_dArray.v_Base_dContainer_dArray_dmake 32) ((Base_dContainer_dArray.v_Base_dContainer_dArray_dmake 32) Base_dData_dList.C_Base_dData_dList_dList_Nil)) else dtb__12))))

# 72 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dlookup = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__13 = mc1 in (if ((Base_dContainer_dArray.v_Base_dContainer_dArray_dlength dtb__13) = 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> (((v_Base_dContainer_dHashMap_d_ulookupAssoc _uctx1) mc0) ((Base_dContainer_dArray.v_Base_dContainer_dArray_dget ((Base_dContainer_dArray.v_Base_dContainer_dArray_dget dtb__13) oi)) ii))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dContainer_dHashMap_d_ubucketOf ((Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhash _uctx0) mc0))))))

# 85 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dmember = (fun _uctx0 _uctx1 key t -> (match ((((v_Base_dContainer_dHashMap_dlookup _uctx0) _uctx1) key) t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 92 "Base/Container/HashMap.vuna"
let rec v_Base_dContainer_dHashMap_dinsertAll = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__18 } -> (((v_Base_dContainer_dHashMap_dinsertAll _uctx0) dtb__16) ((((v_Base_dContainer_dHashMap_dinsert _uctx0) dtb__17) dtb__18) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 97 "Base/Container/HashMap.vuna"
let rec v_Base_dContainer_dHashMap_dfromList = (fun _uctx0 mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__21; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__22 } -> ((((v_Base_dContainer_dHashMap_dinsert _uctx0) dtb__21) dtb__22) ((v_Base_dContainer_dHashMap_dfromList _uctx0) dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> [||]
  | _ -> failwith "DT: impossible branch"
))

# 102 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dofNames = (fun (xs : string Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = true })) xs)) ((v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 106 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dtoList = (fun _uctx0 mc0 -> (let dtb__23 = mc0 in ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun outer -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun inner -> ((v_Base_dContainer_dHashMap_d_udedupBucket _uctx0) inner))) (Base_dContainer_dArray.v_Base_dContainer_dArray_dtoList outer)))) (Base_dContainer_dArray.v_Base_dContainer_dArray_dtoList dtb__23))))

# 116 "Base/Container/HashMap.vuna"
let v_Show_uBase_uContainer_uHashMap_uHashMap_uk_uv = (fun _uctx0 _uctx1 _uctx2 -> (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun m -> ("fromList " ^ ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow (Base_dData_dList.v_Show_uBase_uData_uList_uList_ua ((Base_dData_dPair.v_Show_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1))) ((v_Base_dContainer_dHashMap_dtoList _uctx2) m)))))))

# 113 "Base/Container/HashMap.vuna"
let v_Base_dContainer_dHashMap_dsize = (fun _uctx0 t -> (Base_dData_dList.v_Base_dData_dList_dlength ((v_Base_dContainer_dHashMap_dtoList _uctx0) t)))
