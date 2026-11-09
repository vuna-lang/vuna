open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dFoldable_dFoldable = C_Dict_uBase_dFoldable_dFoldable_Foldable of ('a1)

let v_Base_dFoldable_dfold = (fun _ud x2 x3 x4 -> (match _ud with
  | C_Dict_uBase_dFoldable_dFoldable_Foldable (dtb__0) -> (((dtb__0 x2) x3) x4)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dFoldable_dfoldMap = (fun _uctx0 _uctx1 _uctx2 f xs -> ((((v_Base_dFoldable_dfold _uctx2) (fun v acc -> (((Base_dMonoid.v_Base_dMonoid_dmappend _uctx0) (f v)) acc))) (Base_dMonoid.v_Base_dMonoid_dmempty _uctx1)) xs))
