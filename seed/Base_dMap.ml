open Vuna_runtime
type ('a0, 'a1) t_Base_dMap_dMap = ('a0, 'a1) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList

# 21 "Base/Map.vuna"
let rec v_Base_dMap_d_uinsertPair = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__2) mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__1)) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 }, ((((v_Base_dMap_d_uinsertPair _uctx0) mc0) mc1) dtb__1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Map.vuna"
let rec v_Base_dMap_d_ulookupPair = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__6) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7)) else (((v_Base_dMap_d_ulookupPair _uctx0) mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Map.vuna"
let rec v_Base_dMap_d_uremovePair = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__10) mc0) then dtb__9 else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 }, (((v_Base_dMap_d_uremovePair _uctx0) mc0) dtb__9))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/Map.vuna"
let v_Base_dMap_dempty = Base_dList.C_Base_dList_dList_Nil

# 42 "Base/Map.vuna"
let v_Base_dMap_dinsert = (fun _uctx0 mc0 mc1 mc2 -> (let dtb__12 = mc2 in ((((v_Base_dMap_d_uinsertPair _uctx0) mc0) mc1) dtb__12)))

# 46 "Base/Map.vuna"
let v_Base_dMap_dlookup = (fun _uctx0 mc0 mc1 -> (let dtb__13 = mc1 in (((v_Base_dMap_d_ulookupPair _uctx0) mc0) dtb__13)))

# 50 "Base/Map.vuna"
let v_Base_dMap_dremove = (fun _uctx0 mc0 mc1 -> (let dtb__14 = mc1 in (((v_Base_dMap_d_uremovePair _uctx0) mc0) dtb__14)))

# 54 "Base/Map.vuna"
let v_Base_dMap_dkeys = (fun mc0 -> (let dtb__15 = mc0 in ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__15)))

# 58 "Base/Map.vuna"
let v_Base_dMap_dvalues = (fun mc0 -> (let dtb__16 = mc0 in ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) dtb__16)))

# 62 "Base/Map.vuna"
let v_Base_dMap_dsize = (fun mc0 -> (let dtb__17 = mc0 in (Base_dList.v_Base_dList_dlength dtb__17)))

# 66 "Base/Map.vuna"
let v_Base_dMap_dfromList = (fun pairs -> pairs)

# 70 "Base/Map.vuna"
let v_Base_dMap_dtoList = (fun mc0 -> (let dtb__18 = mc0 in dtb__18))

# 73 "Base/Map.vuna"
let v_Show_uBase_uMap_uMap_uk_uv = (fun _uctx0 _uctx1 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun m -> ("fromList " ^ ((Base_dShow.v_Base_dShow_dshow (Base_dList.v_Show_uBase_uList_uList_ua ((Base_dPair.v_Show_uBase_uPair_uPair_ua_ub _uctx0) _uctx1))) (v_Base_dMap_dtoList m)))))))
