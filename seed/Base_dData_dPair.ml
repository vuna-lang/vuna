open Vuna_runtime
type ('a0, 'a1) t_Base_dData_dPair_dPair = { f_Base_dData_dPair_dPair_first : 'a0; f_Base_dData_dPair_dPair_second : 'a1 }

# 28 "Base/Data/Pair.vuna"
let v_Show_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun p -> (match p with
  | { f_Base_dData_dPair_dPair_first = dtb__0; f_Base_dData_dPair_dPair_second = dtb__1 } -> (String.concat "" ["("; ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow _uctx0) dtb__0); ", "; ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow _uctx1) dtb__1); ")"])
  | _ -> failwith "DT: impossible branch"
)))))

# 34 "Base/Data/Pair.vuna"
let rec v_Eq_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | { f_Base_dData_dPair_dPair_first = dtb__2; f_Base_dData_dPair_dPair_second = dtb__3 } -> (match mc1 with
  | { f_Base_dData_dPair_dPair_first = dtb__4; f_Base_dData_dPair_dPair_second = dtb__5 } -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__2) dtb__4) then (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx1) dtb__3) dtb__5) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ ((v_Eq_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then false else true)))))

# 38 "Base/Data/Pair.vuna"
let rec v_Ord_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun mc0 mc1 -> (match mc0 with
  | { f_Base_dData_dPair_dPair_first = dtb__6; f_Base_dData_dPair_dPair_second = dtb__7 } -> (match mc1 with
  | { f_Base_dData_dPair_dPair_first = dtb__8; f_Base_dData_dPair_dPair_second = dtb__9 } -> (if (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ _uctx0) dtb__6) dtb__8) then true else (if (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ _uctx0) dtb__8) dtb__6) then false else (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ _uctx1) dtb__7) dtb__9)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then true else (Base_dData_dBool.v_Base_dData_dBool_dnot (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))), (fun p q -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)), (fun p q -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60__x61_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))))

# 44 "Base/Data/Pair.vuna"
let v_Hashable_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun p -> (match p with
  | { f_Base_dData_dPair_dPair_first = dtb__10; f_Base_dData_dPair_dPair_second = dtb__11 } -> ((Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhashCombine ((Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhash _uctx0) dtb__10)) ((Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhash _uctx1) dtb__11))
  | _ -> failwith "DT: impossible branch"
)))))

# 19 "Base/Data/Pair.vuna"
let v_Base_dData_dPair_dfirstOf = (fun mc0 -> (match mc0 with
  | { f_Base_dData_dPair_dPair_first = dtb__12; f_Base_dData_dPair_dPair_second = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Data/Pair.vuna"
let v_Base_dData_dPair_dsecondOf = (fun mc0 -> (match mc0 with
  | { f_Base_dData_dPair_dPair_first = dtb__14; f_Base_dData_dPair_dPair_second = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))
