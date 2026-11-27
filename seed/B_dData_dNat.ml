open Vuna_runtime
# 66 "Base/Data/Nat.vuna"
let v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dNum.C_Num_Num ((fun dtb_u_u1 dtb_u_u2 -> (bi_natAdd dtb_u_u1 dtb_u_u2)), (fun dtb_u_u3 dtb_u_u4 -> (bi_natSub dtb_u_u3 dtb_u_u4)), (fun dtb_u_u5 dtb_u_u6 -> (bi_natMul dtb_u_u5 dtb_u_u6)), (fun dtb_u_u7 dtb_u_u8 -> (bi_natDiv dtb_u_u7 dtb_u_u8))))

# 81 "Base/Data/Nat.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dMonoid.C_Monoid_Monoid (0))

# 25 "Base/Data/Nat.vuna"
let v_plus = bi_natAdd

# 78 "Base/Data/Nat.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dMonoid.C_Semigroup_Semigroup (v_plus))

# 29 "Base/Data/Nat.vuna"
let v_minus = bi_natSub

# 33 "Base/Data/Nat.vuna"
let v_mult = bi_natMul

# 37 "Base/Data/Nat.vuna"
let v_toInt = bi_natToInt

# 55 "Base/Data/Nat.vuna"
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u9 dtb_u_u10 -> ((v_toInt dtb_u_u9) = (v_toInt dtb_u_u10))), (fun dtb_u_u11 dtb_u_u12 -> ((v_toInt dtb_u_u11) <> (v_toInt dtb_u_u12)))))

# 59 "Base/Data/Nat.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u13 dtb_u_u14 -> ((v_toInt dtb_u_u13) < (v_toInt dtb_u_u14))), (fun dtb_u_u15 dtb_u_u16 -> ((v_toInt dtb_u_u15) <= (v_toInt dtb_u_u16))), (fun dtb_u_u17 dtb_u_u18 -> ((v_toInt dtb_u_u17) > (v_toInt dtb_u_u18))), (fun dtb_u_u19 dtb_u_u20 -> ((v_toInt dtb_u_u19) >= (v_toInt dtb_u_u20)))))

# 72 "Base/Data/Nat.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u21 -> (string_of_int (v_toInt dtb_u_u21)))))

# 75 "Base/Data/Nat.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u22 -> (v_toInt dtb_u_u22))))

# 85 "Base/Data/Nat.vuna"
let v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat_uInt = (B_dTrait_dConvert.C_Convert_Convert (v_toInt))

# 41 "Base/Data/Nat.vuna"
let v_fromIntClamp = bi_natFromInt

# 45 "Base/Data/Nat.vuna"
let v_fromIntMaybe = (fun (dtb_u_u23 : int) -> (if (dtb_u_u23 < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_fromIntClamp dtb_u_u23)))))

# 88 "Base/Data/Nat.vuna"
let v_ConvertMaybe_ud297f329ba596d0d_uInt_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dConvert.C_ConvertMaybe_ConvertMaybe (v_fromIntMaybe))

# 49 "Base/Data/Nat.vuna"
let v_pred = (fun (dtb_u_u24 : int) -> ((v_minus dtb_u_u24) 1))

# 53 "Base/Data/Nat.vuna"
let v_isZero = (fun (dtb_u_u25 : int) -> ((v_toInt dtb_u_u25) = 0))
