open Vuna_runtime
type t_Base_dUnit_dUnit = C_Base_dUnit_dUnit_MkUnit

let v_Eq_uBase_dUnit_dUnit = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dUnit_dUnit_MkUnit -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun mc0 mc1 -> (match mc0 with
  | C_Base_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dUnit_dUnit_MkUnit -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Ord_uBase_dUnit_dUnit = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun _u _u -> false), (fun _u _u -> true), (fun _u _u -> false), (fun _u _u -> true)))

let v_Show_uBase_dUnit_dUnit = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun mc0 -> (match mc0 with
  | C_Base_dUnit_dUnit_MkUnit -> "MkUnit"
  | _ -> failwith "DT: impossible branch"
))))

let v_Hashable_uBase_dUnit_dUnit = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun mc0 -> (match mc0 with
  | C_Base_dUnit_dUnit_MkUnit -> 0
  | _ -> failwith "DT: impossible branch"
))))

let v_Semigroup_uBase_dUnit_dUnit = (Base_dMonoid.C_Dict_uBase_dMonoid_dSemigroup_Semigroup ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dUnit_dUnit_MkUnit -> (match mc1 with
  | C_Base_dUnit_dUnit_MkUnit -> C_Base_dUnit_dUnit_MkUnit
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Monoid_uBase_dUnit_dUnit = (Base_dMonoid.C_Dict_uBase_dMonoid_dMonoid_Monoid (C_Base_dUnit_dUnit_MkUnit))
