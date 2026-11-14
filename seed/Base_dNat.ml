open Vuna_runtime
# 75 "Base/Nat.vuna"
let v_Num_uBase_uNat_uNat = (Base_dNum.C_Dict_uBase_dNum_dNum_Num ((fun x y -> (bi_natAdd x y)), (fun x y -> (bi_natSub x y)), (fun x y -> (bi_natMul x y)), (fun x y -> (bi_natDiv x y))))

# 90 "Base/Nat.vuna"
let v_Monoid_uBase_uNat_uNat = (Base_dMonoid.C_Dict_uBase_dMonoid_dMonoid_Monoid (0))

# 32 "Base/Nat.vuna"
let v_Base_dNat_dplus = (fun _uarity0 _uarity1 -> (bi_natAdd _uarity0 _uarity1))

# 87 "Base/Nat.vuna"
let v_Semigroup_uBase_uNat_uNat = (Base_dMonoid.C_Dict_uBase_dMonoid_dSemigroup_Semigroup ((fun _uarity0 _uarity1 -> ((v_Base_dNat_dplus _uarity0) _uarity1))))

# 36 "Base/Nat.vuna"
let v_Base_dNat_dminus = (fun _uarity0 _uarity1 -> (bi_natSub _uarity0 _uarity1))

# 40 "Base/Nat.vuna"
let v_Base_dNat_dmult = (fun _uarity0 _uarity1 -> (bi_natMul _uarity0 _uarity1))

# 44 "Base/Nat.vuna"
let v_Base_dNat_dtoInt = (fun _uarity0 -> _uarity0)

# 62 "Base/Nat.vuna"
let v_Eq_uBase_uNat_uNat = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun x y -> ((v_Base_dNat_dtoInt x) = (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) <> (v_Base_dNat_dtoInt y)))))

# 66 "Base/Nat.vuna"
let v_Ord_uBase_uNat_uNat = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun x y -> ((v_Base_dNat_dtoInt x) < (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) <= (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) > (v_Base_dNat_dtoInt y))), (fun x y -> ((v_Base_dNat_dtoInt x) >= (v_Base_dNat_dtoInt y)))))

# 81 "Base/Nat.vuna"
let v_Show_uBase_uNat_uNat = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun n -> (bi_strFromInt (v_Base_dNat_dtoInt n)))))

# 84 "Base/Nat.vuna"
let v_Hashable_uBase_uNat_uNat = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun n -> (v_Base_dNat_dtoInt n))))

# 48 "Base/Nat.vuna"
let v_Base_dNat_dfromInt = (fun _uarity0 -> (bi_natFromInt _uarity0))

# 52 "Base/Nat.vuna"
let v_Base_dNat_dfromIntMaybe = (fun n -> (if (n < 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Base_dNat_dfromInt n)))))

# 56 "Base/Nat.vuna"
let v_Base_dNat_dpred = (fun n -> ((v_Base_dNat_dminus n) 1))

# 60 "Base/Nat.vuna"
let v_Base_dNat_disZero = (fun n -> ((v_Base_dNat_dtoInt n) = 0))
