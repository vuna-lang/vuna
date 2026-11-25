open Vuna_runtime
# 66 "Base/Data/Nat.vuna"
let v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dNum.C_Num_Num ((fun x y -> (bi_natAdd x y)), (fun x y -> (bi_natSub x y)), (fun x y -> (bi_natMul x y)), (fun x y -> (bi_natDiv x y))))

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
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> ((v_toInt x) = (v_toInt y))), (fun x y -> ((v_toInt x) <> (v_toInt y)))))

# 59 "Base/Data/Nat.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> ((v_toInt x) < (v_toInt y))), (fun x y -> ((v_toInt x) <= (v_toInt y))), (fun x y -> ((v_toInt x) > (v_toInt y))), (fun x y -> ((v_toInt x) >= (v_toInt y)))))

# 72 "Base/Data/Nat.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dShow.C_Show_Show ((fun n -> (bi_strFromInt (v_toInt n)))))

# 75 "Base/Data/Nat.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dHashable.C_Hashable_Hashable ((fun n -> (v_toInt n))))

# 85 "Base/Data/Nat.vuna"
let v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat_uInt = (B_dTrait_dConvert.C_Convert_Convert (v_toInt))

# 41 "Base/Data/Nat.vuna"
let v_fromIntClamp = bi_natFromInt

# 45 "Base/Data/Nat.vuna"
let v_fromIntMaybe = (fun (n : int) -> (if (n < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_fromIntClamp n)))))

# 88 "Base/Data/Nat.vuna"
let v_ConvertMaybe_ud297f329ba596d0d_uInt_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dConvert.C_ConvertMaybe_ConvertMaybe (v_fromIntMaybe))

# 49 "Base/Data/Nat.vuna"
let v_pred = (fun (n : int) -> ((v_minus n) 1))

# 53 "Base/Data/Nat.vuna"
let v_isZero = (fun (n : int) -> ((v_toInt n) = 0))
