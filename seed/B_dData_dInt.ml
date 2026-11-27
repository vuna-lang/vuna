open Vuna_runtime
# 13 "Base/Data/Int.vuna"
let v_Eq_u018fc178ff3df1b4_uInt = (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u1 dtb_u_u2 -> (dtb_u_u1 = dtb_u_u2)), (fun dtb_u_u3 dtb_u_u4 -> (dtb_u_u3 <> dtb_u_u4))))

# 17 "Base/Data/Int.vuna"
let v_Ord_u5afb3bbeddafcb50_uInt = (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u5 dtb_u_u6 -> (dtb_u_u5 < dtb_u_u6)), (fun dtb_u_u7 dtb_u_u8 -> (dtb_u_u7 <= dtb_u_u8)), (fun dtb_u_u9 dtb_u_u10 -> (dtb_u_u9 > dtb_u_u10)), (fun dtb_u_u11 dtb_u_u12 -> (dtb_u_u11 >= dtb_u_u12))))

# 24 "Base/Data/Int.vuna"
let v_Num_ub27c21f837ed69cc_uInt = (B_dTrait_dNum.C_Num_Num ((fun dtb_u_u13 dtb_u_u14 -> (dtb_u_u13 + dtb_u_u14)), (fun dtb_u_u15 dtb_u_u16 -> (dtb_u_u15 - dtb_u_u16)), (fun dtb_u_u17 dtb_u_u18 -> (dtb_u_u17 * dtb_u_u18)), (fun dtb_u_u19 dtb_u_u20 -> (if dtb_u_u20 = 0 then failwith "division by zero" else dtb_u_u19 / dtb_u_u20))))

# 31 "Base/Data/Int.vuna"
let v_Neg_uc22890dadc3767a7_uInt = (B_dTrait_dNeg.C_Neg_Neg ((fun dtb_u_u21 -> (0 - dtb_u_u21))))

# 34 "Base/Data/Int.vuna"
let v_Show_u0077d73cf424e521_uInt = (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u22 -> (string_of_int dtb_u_u22))))

# 38 "Base/Data/Int.vuna"
let v_Hashable_ue4b0f10b020a5e82_uInt = (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u23 -> dtb_u_u23)))
