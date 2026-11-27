open Vuna_runtime
type t_Ordering = C_Ordering_LT | C_Ordering_EQ | C_Ordering_GT
and 'a0 t_Ord = C_Ord_Ord of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

# 26 "Base/Trait/Ord.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (C_Ord_Ord ((fun (dtb_u_u1 : bool) (dtb_u_u2 : bool) -> (if dtb_u_u1 then false else (if dtb_u_u2 then true else false))), (fun (dtb_u_u3 : bool) (dtb_u_u4 : bool) -> (if dtb_u_u3 then dtb_u_u4 else true)), (fun (dtb_u_u5 : bool) (dtb_u_u6 : bool) -> (if dtb_u_u5 then (if dtb_u_u6 then false else true) else false)), (fun (dtb_u_u7 : bool) (dtb_u_u8 : bool) -> (if dtb_u_u7 then true else dtb_u_u8))))

# 45 "Base/Trait/Ord.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dEq.C_Eq_Eq ((fun (dtb_u_u9 : t_Ordering) (dtb_u_u10 : t_Ordering) -> (match dtb_u_u9 with
  | C_Ordering_GT -> (match dtb_u_u10 with
  | C_Ordering_GT -> true
  | _ -> false
)
  | C_Ordering_EQ -> (match dtb_u_u10 with
  | C_Ordering_EQ -> true
  | _ -> false
)
  | C_Ordering_LT -> (match dtb_u_u10 with
  | C_Ordering_LT -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u11 dtb_u_u12 -> (if (((B_dTrait_dEq.v__x61__x61_ v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) dtb_u_u11) dtb_u_u12) then false else true))))

# 70 "Base/Trait/Ord.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u13 -> (match dtb_u_u13 with
  | C_Ordering_LT -> "LT"
  | C_Ordering_EQ -> "EQ"
  | C_Ordering_GT -> "GT"
  | _ -> failwith "DT: impossible branch"
))))

# 93 "Base/Trait/Ord.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u14 -> (match dtb_u_u14 with
  | C_Ordering_LT -> 0
  | C_Ordering_EQ -> 1
  | C_Ordering_GT -> 2
  | _ -> failwith "DT: impossible branch"
))))

# 17 "Base/Trait/Ord.vuna"
let v__x60_ = (fun dtb_u_u16 dtb_u_u17 dtb_u_u18 -> (match dtb_u_u16 with
  | C_Ord_Ord (dtb_u_u19, dtb_u_u20, dtb_u_u21, dtb_u_u22) -> ((dtb_u_u19 dtb_u_u17) dtb_u_u18)
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Trait/Ord.vuna"
let v__x60__x61_ = (fun dtb_u_u24 dtb_u_u25 dtb_u_u26 -> (match dtb_u_u24 with
  | C_Ord_Ord (dtb_u_u27, dtb_u_u28, dtb_u_u29, dtb_u_u30) -> ((dtb_u_u28 dtb_u_u25) dtb_u_u26)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Trait/Ord.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering = (C_Ord_Ord ((fun dtb_u_u31 dtb_u_u32 -> (match dtb_u_u31 with
  | C_Ordering_LT -> (match dtb_u_u32 with
  | C_Ordering_LT -> false
  | C_Ordering_EQ -> true
  | C_Ordering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Ordering_EQ -> (match dtb_u_u32 with
  | C_Ordering_LT -> false
  | C_Ordering_EQ -> false
  | C_Ordering_GT -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Ordering_GT -> false
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u33 dtb_u_u34 -> (if (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) dtb_u_u33) dtb_u_u34) then true else (B_dData_dBool.v_not (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) dtb_u_u34) dtb_u_u33)))), (fun dtb_u_u35 dtb_u_u36 -> (((v__x60_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) dtb_u_u36) dtb_u_u35)), (fun dtb_u_u37 dtb_u_u38 -> (((v__x60__x61_ v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering) dtb_u_u38) dtb_u_u37))))

# 21 "Base/Trait/Ord.vuna"
let v__x62_ = (fun dtb_u_u40 dtb_u_u41 dtb_u_u42 -> (match dtb_u_u40 with
  | C_Ord_Ord (dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46) -> ((dtb_u_u45 dtb_u_u41) dtb_u_u42)
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Trait/Ord.vuna"
let v__x62__x61_ = (fun dtb_u_u48 dtb_u_u49 dtb_u_u50 -> (match dtb_u_u48 with
  | C_Ord_Ord (dtb_u_u51, dtb_u_u52, dtb_u_u53, dtb_u_u54) -> ((dtb_u_u54 dtb_u_u49) dtb_u_u50)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Base/Trait/Ord.vuna"
let v_compare = (fun dtb_u_u56 dtb_u_u57 dtb_u_u58 -> (if (((v__x60_ dtb_u_u56) dtb_u_u57) dtb_u_u58) then C_Ordering_LT else (if (((v__x60_ dtb_u_u56) dtb_u_u58) dtb_u_u57) then C_Ordering_GT else C_Ordering_EQ)))

# 83 "Base/Trait/Ord.vuna"
let v_min = (fun dtb_u_u60 dtb_u_u61 dtb_u_u62 -> (if (((v__x60__x61_ dtb_u_u60) dtb_u_u61) dtb_u_u62) then dtb_u_u61 else dtb_u_u62))

# 87 "Base/Trait/Ord.vuna"
let v_max = (fun dtb_u_u64 dtb_u_u65 dtb_u_u66 -> (if (((v__x60__x61_ dtb_u_u64) dtb_u_u65) dtb_u_u66) then dtb_u_u66 else dtb_u_u65))

# 91 "Base/Trait/Ord.vuna"
let v_clamp = (fun dtb_u_u68 dtb_u_u69 dtb_u_u70 dtb_u_u71 -> (((v_max dtb_u_u68) dtb_u_u69) (((v_min dtb_u_u68) dtb_u_u70) dtb_u_u71)))
