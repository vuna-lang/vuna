open Vuna_runtime
# 65 "Base/Data/Nat.vuna"
let v_Num_uBase_uData_uNat_uNat = (Base_dTrait_dNum.C_Dict_uBase_dTrait_dNum_dNum_Num ((fun x y -> (bi_natAdd x y)), (fun x y -> (bi_natSub x y)), (fun x y -> (bi_natMul x y)), (fun x y -> (bi_natDiv x y))))

# 80 "Base/Data/Nat.vuna"
let v_Monoid_uBase_uData_uNat_uNat = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dMonoid_Monoid (0))

# 24 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dplus = (fun _uarity0 _uarity1 -> (bi_natAdd _uarity0 _uarity1))

# 77 "Base/Data/Nat.vuna"
let v_Semigroup_uBase_uData_uNat_uNat = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dSemigroup_Semigroup ((fun _uarity0 _uarity1 -> ((v_Base_dData_dNat_dplus _uarity0) _uarity1))))

# 28 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dminus = (fun _uarity0 _uarity1 -> (bi_natSub _uarity0 _uarity1))

# 32 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dmult = (fun _uarity0 _uarity1 -> (bi_natMul _uarity0 _uarity1))

# 36 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dtoInt = (fun _uarity0 -> _uarity0)

# 54 "Base/Data/Nat.vuna"
let v_Eq_uBase_uData_uNat_uNat = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun x y -> ((v_Base_dData_dNat_dtoInt x) = (v_Base_dData_dNat_dtoInt y))), (fun x y -> ((v_Base_dData_dNat_dtoInt x) <> (v_Base_dData_dNat_dtoInt y)))))

# 58 "Base/Data/Nat.vuna"
let v_Ord_uBase_uData_uNat_uNat = (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun x y -> ((v_Base_dData_dNat_dtoInt x) < (v_Base_dData_dNat_dtoInt y))), (fun x y -> ((v_Base_dData_dNat_dtoInt x) <= (v_Base_dData_dNat_dtoInt y))), (fun x y -> ((v_Base_dData_dNat_dtoInt x) > (v_Base_dData_dNat_dtoInt y))), (fun x y -> ((v_Base_dData_dNat_dtoInt x) >= (v_Base_dData_dNat_dtoInt y)))))

# 71 "Base/Data/Nat.vuna"
let v_Show_uBase_uData_uNat_uNat = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun n -> (bi_strFromInt (v_Base_dData_dNat_dtoInt n)))))

# 74 "Base/Data/Nat.vuna"
let v_Hashable_uBase_uData_uNat_uNat = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun n -> (v_Base_dData_dNat_dtoInt n))))

# 40 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dfromInt = (fun _uarity0 -> (bi_natFromInt _uarity0))

# 44 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dfromIntMaybe = (fun n -> (if (n < 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Base_dData_dNat_dfromInt n)))))

# 48 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_dpred = (fun n -> ((v_Base_dData_dNat_dminus n) 1))

# 52 "Base/Data/Nat.vuna"
let v_Base_dData_dNat_disZero = (fun n -> ((v_Base_dData_dNat_dtoInt n) = 0))
