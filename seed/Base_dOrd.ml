open Vuna_runtime
type t_Base_dOrd_dOrdering = C_Base_dOrd_dOrdering_LT | C_Base_dOrd_dOrdering_EQ | C_Base_dOrd_dOrdering_GT
and 'a0 t_Dict_uBase_dOrd_dOrd = C_Dict_uBase_dOrd_dOrd_Ord of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

let v_Ord_uBase_uBool_uBool = (C_Dict_uBase_dOrd_dOrd_Ord ((fun mc0 mc1 -> (if mc0 then false else (if mc1 then true else false))), (fun mc0 mc1 -> (if mc0 then mc1 else true)), (fun mc0 mc1 -> (if mc0 then (if mc1 then false else true) else false)), (fun mc0 mc1 -> (if mc0 then true else mc1))))

let rec v_Eq_uBase_uOrd_uOrdering = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dOrd_dOrdering_GT -> (match mc1 with
  | C_Base_dOrd_dOrdering_GT -> true
  | _ -> false
)
  | C_Base_dOrd_dOrdering_EQ -> (match mc1 with
  | C_Base_dOrd_dOrdering_EQ -> true
  | _ -> false
)
  | C_Base_dOrd_dOrdering_LT -> (match mc1 with
  | C_Base_dOrd_dOrdering_LT -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((Base_dEq.v_Base_dEq_deq v_Eq_uBase_uOrd_uOrdering) a) b) then false else true))))

let v_Show_uBase_uOrd_uOrdering = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun o -> (match o with
  | C_Base_dOrd_dOrdering_LT -> "LT"
  | C_Base_dOrd_dOrdering_EQ -> "EQ"
  | C_Base_dOrd_dOrdering_GT -> "GT"
  | _ -> failwith "DT: impossible branch"
))))

let v_Hashable_uBase_uOrd_uOrdering = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun o -> (match o with
  | C_Base_dOrd_dOrdering_LT -> 0
  | C_Base_dOrd_dOrdering_EQ -> 1
  | C_Base_dOrd_dOrdering_GT -> 2
  | _ -> failwith "DT: impossible branch"
))))

let v_Base_dOrd_dlt = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_Ord (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dOrd_dle = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_Ord (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Ord_uBase_uOrd_uOrdering = (C_Dict_uBase_dOrd_dOrd_Ord ((fun a b -> (match a with
  | C_Base_dOrd_dOrdering_LT -> (match b with
  | C_Base_dOrd_dOrdering_LT -> false
  | C_Base_dOrd_dOrdering_EQ -> true
  | C_Base_dOrd_dOrdering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dOrd_dOrdering_EQ -> (match b with
  | C_Base_dOrd_dOrdering_LT -> false
  | C_Base_dOrd_dOrdering_EQ -> false
  | C_Base_dOrd_dOrdering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dOrd_dOrdering_GT -> false
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((v_Base_dOrd_dlt v_Ord_uBase_uOrd_uOrdering) a) b) then true else (Base_dBool.v_Base_dBool_dnot (((v_Base_dOrd_dlt v_Ord_uBase_uOrd_uOrdering) b) a)))), (fun a b -> (((v_Base_dOrd_dlt v_Ord_uBase_uOrd_uOrdering) b) a)), (fun a b -> (((v_Base_dOrd_dle v_Ord_uBase_uOrd_uOrdering) b) a))))

let v_Base_dOrd_dgt = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_Ord (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dOrd_dge = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dOrd_dOrd_Ord (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dOrd_dcompare = (fun _uctx0 x y -> (if (((v_Base_dOrd_dlt _uctx0) x) y) then C_Base_dOrd_dOrdering_LT else (if (((v_Base_dOrd_dlt _uctx0) y) x) then C_Base_dOrd_dOrdering_GT else C_Base_dOrd_dOrdering_EQ)))

let v_Base_dOrd_dmin = (fun _uctx0 x y -> (if (((v_Base_dOrd_dle _uctx0) x) y) then x else y))

let v_Base_dOrd_dmax = (fun _uctx0 x y -> (if (((v_Base_dOrd_dle _uctx0) x) y) then y else x))
