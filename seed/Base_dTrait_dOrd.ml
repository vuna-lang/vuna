open Vuna_runtime
type t_Base_dTrait_dOrd_dOrdering = C_Base_dTrait_dOrd_dOrdering_LT | C_Base_dTrait_dOrd_dOrdering_EQ | C_Base_dTrait_dOrd_dOrdering_GT
and 'a0 t_Dict_uBase_dTrait_dOrd_dOrd = C_Dict_uBase_dTrait_dOrd_dOrd_Ord of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

# 26 "Base/Trait/Ord.vuna"
let v_Ord_uBase_uData_uBool_uBool = (C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun mc0 mc1 -> (if mc0 then false else (if mc1 then true else false))), (fun mc0 mc1 -> (if mc0 then mc1 else true)), (fun mc0 mc1 -> (if mc0 then (if mc1 then false else true) else false)), (fun mc0 mc1 -> (if mc0 then true else mc1))))

# 45 "Base/Trait/Ord.vuna"
let rec v_Eq_uBase_uTrait_uOrd_uOrdering = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dTrait_dOrd_dOrdering_GT -> (match mc1 with
  | C_Base_dTrait_dOrd_dOrdering_GT -> true
  | _ -> false
)
  | C_Base_dTrait_dOrd_dOrdering_EQ -> (match mc1 with
  | C_Base_dTrait_dOrd_dOrdering_EQ -> true
  | _ -> false
)
  | C_Base_dTrait_dOrd_dOrdering_LT -> (match mc1 with
  | C_Base_dTrait_dOrd_dOrdering_LT -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ v_Eq_uBase_uTrait_uOrd_uOrdering) a) b) then false else true))))

# 67 "Base/Trait/Ord.vuna"
let v_Show_uBase_uTrait_uOrd_uOrdering = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun o -> (match o with
  | C_Base_dTrait_dOrd_dOrdering_LT -> "LT"
  | C_Base_dTrait_dOrd_dOrdering_EQ -> "EQ"
  | C_Base_dTrait_dOrd_dOrdering_GT -> "GT"
  | _ -> failwith "DT: impossible branch"
))))

# 85 "Base/Trait/Ord.vuna"
let v_Hashable_uBase_uTrait_uOrd_uOrdering = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun o -> (match o with
  | C_Base_dTrait_dOrd_dOrdering_LT -> 0
  | C_Base_dTrait_dOrd_dOrdering_EQ -> 1
  | C_Base_dTrait_dOrd_dOrdering_GT -> 2
  | _ -> failwith "DT: impossible branch"
))))

# 17 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_d_x60_ = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dTrait_dOrd_dOrd_Ord (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_d_x60__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dTrait_dOrd_dOrd_Ord (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Trait/Ord.vuna"
let rec v_Ord_uBase_uTrait_uOrd_uOrdering = (C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun a b -> (match a with
  | C_Base_dTrait_dOrd_dOrdering_LT -> (match b with
  | C_Base_dTrait_dOrd_dOrdering_LT -> false
  | C_Base_dTrait_dOrd_dOrdering_EQ -> true
  | C_Base_dTrait_dOrd_dOrdering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dTrait_dOrd_dOrdering_EQ -> (match b with
  | C_Base_dTrait_dOrd_dOrdering_LT -> false
  | C_Base_dTrait_dOrd_dOrdering_EQ -> false
  | C_Base_dTrait_dOrd_dOrdering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dTrait_dOrd_dOrdering_GT -> false
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((v_Base_dTrait_dOrd_d_x60_ v_Ord_uBase_uTrait_uOrd_uOrdering) a) b) then true else (Base_dData_dBool.v_Base_dData_dBool_dnot (((v_Base_dTrait_dOrd_d_x60_ v_Ord_uBase_uTrait_uOrd_uOrdering) b) a)))), (fun a b -> (((v_Base_dTrait_dOrd_d_x60_ v_Ord_uBase_uTrait_uOrd_uOrdering) b) a)), (fun a b -> (((v_Base_dTrait_dOrd_d_x60__x61_ v_Ord_uBase_uTrait_uOrd_uOrdering) b) a))))

# 21 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_d_x62_ = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dTrait_dOrd_dOrd_Ord (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_d_x62__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dTrait_dOrd_dOrd_Ord (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_dcompare = (fun _uctx0 x y -> (if (((v_Base_dTrait_dOrd_d_x60_ _uctx0) x) y) then C_Base_dTrait_dOrd_dOrdering_LT else (if (((v_Base_dTrait_dOrd_d_x60_ _uctx0) y) x) then C_Base_dTrait_dOrd_dOrdering_GT else C_Base_dTrait_dOrd_dOrdering_EQ)))

# 79 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_dmin = (fun _uctx0 x y -> (if (((v_Base_dTrait_dOrd_d_x60__x61_ _uctx0) x) y) then x else y))

# 83 "Base/Trait/Ord.vuna"
let v_Base_dTrait_dOrd_dmax = (fun _uctx0 x y -> (if (((v_Base_dTrait_dOrd_d_x60__x61_ _uctx0) x) y) then y else x))
