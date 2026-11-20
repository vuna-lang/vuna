open Vuna_runtime
type ('a0, 'a1) t_Map = ('a0, 'a1) B_dData_dPair.t_Pair B_dData_dList.t_List

# 21 "Base/Container/Map.vuna"
let rec v__uinsertPair = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__2) mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__1)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 }, ((((v__uinsertPair _uctx0) mc0) mc1) dtb__1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Container/Map.vuna"
let rec v__ulookupPair = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__6) mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__7)) else (((v__ulookupPair _uctx0) mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Container/Map.vuna"
let rec v__uremovePair = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__10) mc0) then dtb__9 else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 }, (((v__uremovePair _uctx0) mc0) dtb__9))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/Container/Map.vuna"
let v_empty = B_dData_dList.C_List_Nil

# 42 "Base/Container/Map.vuna"
let v_insert = (fun _uctx0 mc0 mc1 mc2 -> (let dtb__12 = mc2 in ((((v__uinsertPair _uctx0) mc0) mc1) dtb__12)))

# 46 "Base/Container/Map.vuna"
let v_lookup = (fun _uctx0 mc0 mc1 -> (let dtb__13 = mc1 in (((v__ulookupPair _uctx0) mc0) dtb__13)))

# 50 "Base/Container/Map.vuna"
let v_remove = (fun _uctx0 mc0 mc1 -> (let dtb__14 = mc1 in (((v__uremovePair _uctx0) mc0) dtb__14)))

# 54 "Base/Container/Map.vuna"
let v_keys = (fun mc0 -> (let dtb__15 = mc0 in ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__15)))

# 58 "Base/Container/Map.vuna"
let v_values = (fun mc0 -> (let dtb__16 = mc0 in ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__16)))

# 62 "Base/Container/Map.vuna"
let v_size = (fun mc0 -> (let dtb__17 = mc0 in (B_dData_dList.v_length dtb__17)))

# 66 "Base/Container/Map.vuna"
let v_fromList = (fun pairs -> pairs)

# 70 "Base/Container/Map.vuna"
let v_toList = (fun mc0 -> (let dtb__18 = mc0 in dtb__18))

# 73 "Base/Container/Map.vuna"
let v_Show_uBase_uContainer_uMap_uMap_uk_uv = (fun _uctx0 _uctx1 -> (B_dTrait_dShow.C_Show_Show ((fun m -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua ((B_dData_dPair.v_Show_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1))) (v_toList m)))))))
