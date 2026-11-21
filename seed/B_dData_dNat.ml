open Vuna_runtime
# 65 "Base/Data/Nat.vuna"
let v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dNum.C_Num_Num ((fun x y -> (bi_natAdd x y)), (fun x y -> (bi_natSub x y)), (fun x y -> (bi_natMul x y)), (fun x y -> (bi_natDiv x y))))

# 80 "Base/Data/Nat.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dMonoid.C_Monoid_Monoid (0))

# 24 "Base/Data/Nat.vuna"
let v_plus = bi_natAdd

# 77 "Base/Data/Nat.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dMonoid.C_Semigroup_Semigroup (v_plus))

# 28 "Base/Data/Nat.vuna"
let v_minus = bi_natSub

# 32 "Base/Data/Nat.vuna"
let v_mult = bi_natMul

# 36 "Base/Data/Nat.vuna"
let v_toInt = bi_natToInt

# 54 "Base/Data/Nat.vuna"
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> ((v_toInt x) = (v_toInt y))), (fun x y -> ((v_toInt x) <> (v_toInt y)))))

# 58 "Base/Data/Nat.vuna"
let v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> ((v_toInt x) < (v_toInt y))), (fun x y -> ((v_toInt x) <= (v_toInt y))), (fun x y -> ((v_toInt x) > (v_toInt y))), (fun x y -> ((v_toInt x) >= (v_toInt y)))))

# 71 "Base/Data/Nat.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dShow.C_Show_Show ((fun n -> (bi_strFromInt (v_toInt n)))))

# 74 "Base/Data/Nat.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat = (B_dTrait_dHashable.C_Hashable_Hashable ((fun n -> (v_toInt n))))

# 40 "Base/Data/Nat.vuna"
let v_fromInt = bi_natFromInt

# 44 "Base/Data/Nat.vuna"
let v_fromIntMaybe = (fun (n : int) -> (if (n < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_fromInt n)))))

# 48 "Base/Data/Nat.vuna"
let v_pred = (fun (n : int) -> ((v_minus n) 1))

# 52 "Base/Data/Nat.vuna"
let v_isZero = (fun (n : int) -> ((v_toInt n) = 0))
