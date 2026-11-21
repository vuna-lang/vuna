open Vuna_runtime
type t_Ordering = C_Ordering_LT | C_Ordering_EQ | C_Ordering_GT
and 'a0 t_Ord = C_Ord_Ord of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

# 26 "Base/Trait/Ord.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (C_Ord_Ord ((fun (mc0 : bool) (mc1 : bool) -> (if mc0 then false else (if mc1 then true else false))), (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then mc1 else true)), (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then (if mc1 then false else true) else false)), (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then true else mc1))))

# 45 "Base/Trait/Ord.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dEq.C_Eq_Eq ((fun (mc0 : t_Ordering) (mc1 : t_Ordering) -> (match mc0 with
  | C_Ordering_GT -> (match mc1 with
  | C_Ordering_GT -> true
  | _ -> false
)
  | C_Ordering_EQ -> (match mc1 with
  | C_Ordering_EQ -> true
  | _ -> false
)
  | C_Ordering_LT -> (match mc1 with
  | C_Ordering_LT -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) a) b) then false else true))))

# 70 "Base/Trait/Ord.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dShow.C_Show_Show ((fun o -> (match o with
  | C_Ordering_LT -> "LT"
  | C_Ordering_EQ -> "EQ"
  | C_Ordering_GT -> "GT"
  | _ -> failwith "DT: impossible branch"
))))

# 89 "Base/Trait/Ord.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dHashable.C_Hashable_Hashable ((fun o -> (match o with
  | C_Ordering_LT -> 0
  | C_Ordering_EQ -> 1
  | C_Ordering_GT -> 2
  | _ -> failwith "DT: impossible branch"
))))

# 17 "Base/Trait/Ord.vuna"
let v__x60_ = (fun _ud x0 x1 -> (match _ud with
  | C_Ord_Ord (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Trait/Ord.vuna"
let v__x60__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Ord_Ord (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Trait/Ord.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (C_Ord_Ord ((fun a b -> (match a with
  | C_Ordering_LT -> (match b with
  | C_Ordering_LT -> false
  | C_Ordering_EQ -> true
  | C_Ordering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Ordering_EQ -> (match b with
  | C_Ordering_LT -> false
  | C_Ordering_EQ -> false
  | C_Ordering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Ordering_GT -> false
  | _ -> failwith "DT: impossible branch"
)), (fun a b -> (if (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) a) b) then true else (B_dData_dBool.v_not (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) b) a)))), (fun a b -> (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) b) a)), (fun a b -> (((v__x60__x61_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) b) a))))

# 21 "Base/Trait/Ord.vuna"
let v__x62_ = (fun _ud x0 x1 -> (match _ud with
  | C_Ord_Ord (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Trait/Ord.vuna"
let v__x62__x61_ = (fun _ud x0 x1 -> (match _ud with
  | C_Ord_Ord (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Base/Trait/Ord.vuna"
let v_compare = (fun _uctx0 x y -> (if (((v__x60_ _uctx0) x) y) then C_Ordering_LT else (if (((v__x60_ _uctx0) y) x) then C_Ordering_GT else C_Ordering_EQ)))

# 83 "Base/Trait/Ord.vuna"
let v_min = (fun _uctx0 x y -> (if (((v__x60__x61_ _uctx0) x) y) then x else y))

# 87 "Base/Trait/Ord.vuna"
let v_max = (fun _uctx0 x y -> (if (((v__x60__x61_ _uctx0) x) y) then y else x))
