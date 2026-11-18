open Vuna_runtime
type t_Base_dData_dUnit_dUnit = C_Base_dData_dUnit_dUnit_MkUnit

# 16 "Base/Data/Unit.vuna"
let v_Eq_uBase_uData_uUnit_uUnit = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun mc0 mc1 -> (match mc0 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 20 "Base/Data/Unit.vuna"
let v_Ord_uBase_uData_uUnit_uUnit = (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun _u _u -> false), (fun _u _u -> true), (fun _u _u -> false), (fun _u _u -> true)))

# 26 "Base/Data/Unit.vuna"
let v_Show_uBase_uData_uUnit_uUnit = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun mc0 -> (match mc0 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> "MkUnit"
  | _ -> failwith "DT: impossible branch"
))))

# 29 "Base/Data/Unit.vuna"
let v_Hashable_uBase_uData_uUnit_uUnit = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun mc0 -> (match mc0 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 32 "Base/Data/Unit.vuna"
let v_Semigroup_uBase_uData_uUnit_uUnit = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dSemigroup_Semigroup ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dData_dUnit_dUnit_MkUnit -> C_Base_dData_dUnit_dUnit_MkUnit
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 35 "Base/Data/Unit.vuna"
let v_Monoid_uBase_uData_uUnit_uUnit = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dMonoid_Monoid (C_Base_dData_dUnit_dUnit_MkUnit))
