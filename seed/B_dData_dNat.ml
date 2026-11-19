open Vuna_runtime
# 65 "Base/Data/Nat.vuna"
let v_Num_uBase_uData_uNat_uNat = (B_dTrait_dNum.C_Num_Num ((fun x y -> (bi_natAdd x y)), (fun x y -> (bi_natSub x y)), (fun x y -> (bi_natMul x y)), (fun x y -> (bi_natDiv x y))))

# 80 "Base/Data/Nat.vuna"
let v_Monoid_uBase_uData_uNat_uNat = (B_dTrait_dMonoid.C_Monoid_Monoid (0))

# 24 "Base/Data/Nat.vuna"
let v_plus = (fun (_uarity0 : int) (_uarity1 : int) -> (bi_natAdd _uarity0 _uarity1))

# 77 "Base/Data/Nat.vuna"
let v_Semigroup_uBase_uData_uNat_uNat = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun _uarity0 _uarity1 -> ((v_plus _uarity0) _uarity1))))

# 28 "Base/Data/Nat.vuna"
let v_minus = (fun (_uarity0 : int) (_uarity1 : int) -> (bi_natSub _uarity0 _uarity1))

# 32 "Base/Data/Nat.vuna"
let v_mult = (fun (_uarity0 : int) (_uarity1 : int) -> (bi_natMul _uarity0 _uarity1))

# 36 "Base/Data/Nat.vuna"
let v_toInt = (fun (_uarity0 : int) -> _uarity0)

# 54 "Base/Data/Nat.vuna"
let v_Eq_uBase_uData_uNat_uNat = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> ((v_toInt x) = (v_toInt y))), (fun x y -> ((v_toInt x) <> (v_toInt y)))))

# 58 "Base/Data/Nat.vuna"
let v_Ord_uBase_uData_uNat_uNat = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> ((v_toInt x) < (v_toInt y))), (fun x y -> ((v_toInt x) <= (v_toInt y))), (fun x y -> ((v_toInt x) > (v_toInt y))), (fun x y -> ((v_toInt x) >= (v_toInt y)))))

# 71 "Base/Data/Nat.vuna"
let v_Show_uBase_uData_uNat_uNat = (B_dTrait_dShow.C_Show_Show ((fun n -> (bi_strFromInt (v_toInt n)))))

# 74 "Base/Data/Nat.vuna"
let v_Hashable_uBase_uData_uNat_uNat = (B_dTrait_dHashable.C_Hashable_Hashable ((fun n -> (v_toInt n))))

# 40 "Base/Data/Nat.vuna"
let v_fromInt = (fun (_uarity0 : int) -> (bi_natFromInt _uarity0))

# 44 "Base/Data/Nat.vuna"
let v_fromIntMaybe = (fun (n : int) -> (if (n < 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_fromInt n)))))

# 48 "Base/Data/Nat.vuna"
let v_pred = (fun (n : int) -> ((v_minus n) 1))

# 52 "Base/Data/Nat.vuna"
let v_isZero = (fun (n : int) -> ((v_toInt n) = 0))
