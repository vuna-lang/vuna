open Vuna_runtime
type ('a0, 'a1) t_Pair = { f_Pair_first : 'a0; f_Pair_second : 'a1 }

# 28 "Base/Data/Pair.vuna"
let v_Show_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (B_dTrait_dShow.C_Show_Show ((fun p -> (match p with
  | { f_Pair_first = dtb__0; f_Pair_second = dtb__1 } -> (String.concat "" ["("; ((B_dTrait_dShow.v_show _uctx0) dtb__0); ", "; ((B_dTrait_dShow.v_show _uctx1) dtb__1); ")"])
  | _ -> failwith "DT: impossible branch"
)))))

# 34 "Base/Data/Pair.vuna"
let rec v_Eq_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (B_dTrait_dEq.C_Eq_Eq ((fun mc0 mc1 -> (match mc0 with
  | { f_Pair_first = dtb__2; f_Pair_second = dtb__3 } -> (match mc1 with
  | { f_Pair_first = dtb__4; f_Pair_second = dtb__5 } -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__2) dtb__4) then (((B_dTrait_dEq.v__x61__x61_ _uctx1) dtb__3) dtb__5) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((B_dTrait_dEq.v__x61__x61_ ((v_Eq_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then false else true)))))

# 38 "Base/Data/Pair.vuna"
let rec v_Ord_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (B_dTrait_dOrd.C_Ord_Ord ((fun mc0 mc1 -> (match mc0 with
  | { f_Pair_first = dtb__6; f_Pair_second = dtb__7 } -> (match mc1 with
  | { f_Pair_first = dtb__8; f_Pair_second = dtb__9 } -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__6) dtb__8) then true else (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__8) dtb__6) then false else (((B_dTrait_dOrd.v__x60_ _uctx1) dtb__7) dtb__9)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun p q -> (if (((B_dTrait_dOrd.v__x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) p) q) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))), (fun p q -> (((B_dTrait_dOrd.v__x60_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)), (fun p q -> (((B_dTrait_dOrd.v__x60__x61_ ((v_Ord_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1)) q) p)))))

# 44 "Base/Data/Pair.vuna"
let v_Hashable_uBase_uData_uPair_uPair_ua_ub = (fun _uctx0 _uctx1 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun p -> (match p with
  | { f_Pair_first = dtb__10; f_Pair_second = dtb__11 } -> ((B_dTrait_dHashable.v_hashCombine ((B_dTrait_dHashable.v_hash _uctx0) dtb__10)) ((B_dTrait_dHashable.v_hash _uctx1) dtb__11))
  | _ -> failwith "DT: impossible branch"
)))))

# 19 "Base/Data/Pair.vuna"
let v_firstOf = (fun mc0 -> (match mc0 with
  | { f_Pair_first = dtb__12; f_Pair_second = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Data/Pair.vuna"
let v_secondOf = (fun mc0 -> (match mc0 with
  | { f_Pair_first = dtb__14; f_Pair_second = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))
