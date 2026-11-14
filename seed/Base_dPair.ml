open Vuna_runtime
type ('a0, 'a1) t_Base_dPair_dPair = { f_Base_dPair_dPair_first : 'a0; f_Base_dPair_dPair_second : 'a1 }

# 30 "Base/Pair.vuna"
let v_Show_uBase_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun p -> (match p with
  | { f_Base_dPair_dPair_first = dtb__0; f_Base_dPair_dPair_second = dtb__1 } -> (String.concat "" ["("; ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__0); ", "; ((Base_dShow.v_Base_dShow_dshow _uctx1) dtb__1); ")"])
  | _ -> failwith "DT: impossible branch"
)))))

# 35 "Base/Pair.vuna"
let rec v_Eq_uBase_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | { f_Base_dPair_dPair_first = dtb__2; f_Base_dPair_dPair_second = dtb__3 } -> (match mc1 with
  | { f_Base_dPair_dPair_first = dtb__4; f_Base_dPair_dPair_second = dtb__5 } -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__2) dtb__4) then (((Base_dEq.v_Base_dEq_deq _uctx1) dtb__3) dtb__5) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((Base_dEq.v_Base_dEq_deq ((v_Eq_uBase_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then false else true)))))

# 39 "Base/Pair.vuna"
let rec v_Ord_uBase_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun mc0 mc1 -> (match mc0 with
  | { f_Base_dPair_dPair_first = dtb__6; f_Base_dPair_dPair_second = dtb__7 } -> (match mc1 with
  | { f_Base_dPair_dPair_first = dtb__8; f_Base_dPair_dPair_second = dtb__9 } -> (if (((Base_dOrd.v_Base_dOrd_dlt _uctx0) dtb__6) dtb__8) then true else (if (((Base_dOrd.v_Base_dOrd_dlt _uctx0) dtb__8) dtb__6) then false else (((Base_dOrd.v_Base_dOrd_dlt _uctx1) dtb__7) dtb__9)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((Base_dOrd.v_Base_dOrd_dlt ((v_Ord_uBase_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then true else (Base_dBool.v_Base_dBool_dnot (((Base_dOrd.v_Base_dOrd_dlt ((v_Ord_uBase_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))), (fun p q -> (((Base_dOrd.v_Base_dOrd_dlt ((v_Ord_uBase_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)), (fun p q -> (((Base_dOrd.v_Base_dOrd_dle ((v_Ord_uBase_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))))

# 45 "Base/Pair.vuna"
let v_Hashable_uBase_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun p -> (match p with
  | { f_Base_dPair_dPair_first = dtb__10; f_Base_dPair_dPair_second = dtb__11 } -> ((Base_dHashable.v_Base_dHashable_dhashCombine ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__10)) ((Base_dHashable.v_Base_dHashable_dhash _uctx1) dtb__11))
  | _ -> failwith "DT: impossible branch"
)))))

# 20 "Base/Pair.vuna"
let v_Base_dPair_dfirstOf = (fun mc0 -> (match mc0 with
  | { f_Base_dPair_dPair_first = dtb__12; f_Base_dPair_dPair_second = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Pair.vuna"
let v_Base_dPair_dsecondOf = (fun mc0 -> (match mc0 with
  | { f_Base_dPair_dPair_first = dtb__14; f_Base_dPair_dPair_second = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))
