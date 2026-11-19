open Vuna_runtime
type t_Unit = C_Unit_MkUnit

# 16 "Base/Data/Unit.vuna"
let v_Eq_uBase_uData_uUnit_uUnit = (B_dTrait_dEq.C_Eq_Eq ((fun (mc0 : t_Unit) (mc1 : t_Unit) -> (match mc0 with
  | C_Unit_MkUnit -> (match mc1 with
  | C_Unit_MkUnit -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun (mc0 : t_Unit) (mc1 : t_Unit) -> (match mc0 with
  | C_Unit_MkUnit -> (match mc1 with
  | C_Unit_MkUnit -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 20 "Base/Data/Unit.vuna"
let v_Ord_uBase_uData_uUnit_uUnit = (B_dTrait_dOrd.C_Ord_Ord ((fun _u _u -> false), (fun _u _u -> true), (fun _u _u -> false), (fun _u _u -> true)))

# 26 "Base/Data/Unit.vuna"
let v_Show_uBase_uData_uUnit_uUnit = (B_dTrait_dShow.C_Show_Show ((fun (mc0 : t_Unit) -> (match mc0 with
  | C_Unit_MkUnit -> "MkUnit"
  | _ -> failwith "DT: impossible branch"
))))

# 29 "Base/Data/Unit.vuna"
let v_Hashable_uBase_uData_uUnit_uUnit = (B_dTrait_dHashable.C_Hashable_Hashable ((fun (mc0 : t_Unit) -> (match mc0 with
  | C_Unit_MkUnit -> 0
  | _ -> failwith "DT: impossible branch"
))))

# 32 "Base/Data/Unit.vuna"
let v_Semigroup_uBase_uData_uUnit_uUnit = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun (mc0 : t_Unit) (mc1 : t_Unit) -> (match mc0 with
  | C_Unit_MkUnit -> (match mc1 with
  | C_Unit_MkUnit -> C_Unit_MkUnit
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 35 "Base/Data/Unit.vuna"
let v_Monoid_uBase_uData_uUnit_uUnit = (B_dTrait_dMonoid.C_Monoid_Monoid (C_Unit_MkUnit))
