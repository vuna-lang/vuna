open Vuna_runtime
type t_Unit = C_Unit_MkUnit

# 16 "Base/Data/Unit.vuna"
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dEq.C_Eq_Eq ((fun (dtb_u_u1 : t_Unit) (dtb_u_u2 : t_Unit) -> (match dtb_u_u1 with
  | C_Unit_MkUnit -> (match dtb_u_u2 with
  | C_Unit_MkUnit -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun (dtb_u_u3 : t_Unit) (dtb_u_u4 : t_Unit) -> (match dtb_u_u3 with
  | C_Unit_MkUnit -> (match dtb_u_u4 with
  | C_Unit_MkUnit -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 20 "Base/Data/Unit.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u5 dtb_u_u6 -> false), (fun dtb_u_u7 dtb_u_u8 -> true), (fun dtb_u_u9 dtb_u_u10 -> false), (fun dtb_u_u11 dtb_u_u12 -> true)))

# 26 "Base/Data/Unit.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dShow.C_Show_Show ((fun (dtb_u_u13 : t_Unit) -> (match dtb_u_u13 with
  | C_Unit_MkUnit -> "MkUnit"
  | _ -> failwith "DT: impossible branch"
))))

# 29 "Base/Data/Unit.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dHashable.C_Hashable_Hashable ((fun (dtb_u_u14 : t_Unit) -> (match dtb_u_u14 with
  | C_Unit_MkUnit -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 32 "Base/Data/Unit.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun (dtb_u_u15 : t_Unit) (dtb_u_u16 : t_Unit) -> (match dtb_u_u15 with
  | C_Unit_MkUnit -> (match dtb_u_u16 with
  | C_Unit_MkUnit -> C_Unit_MkUnit
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 35 "Base/Data/Unit.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit = (B_dTrait_dMonoid.C_Monoid_Monoid (C_Unit_MkUnit))
