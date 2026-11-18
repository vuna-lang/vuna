open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dFoldable_dFoldable = C_Dict_uBase_dTrait_dFoldable_dFoldable_Foldable of (Obj.t)

# 13 "Base/Trait/Foldable.vuna"
let v_Base_dTrait_dFoldable_dfold = (fun _ud x2 x3 x4 -> (match _ud with
  | C_Dict_uBase_dTrait_dFoldable_dFoldable_Foldable (dtb__0) -> ((((Obj.magic dtb__0) x2) x3) x4)
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Trait/Foldable.vuna"
let v_Base_dTrait_dFoldable_dfoldMap = (fun _uctx0 _uctx1 _uctx2 f xs -> ((((v_Base_dTrait_dFoldable_dfold _uctx2) (fun v acc -> (((Base_dTrait_dMonoid.v_Base_dTrait_dMonoid_dmappend _uctx0) (f v)) acc))) (Base_dTrait_dMonoid.v_Base_dTrait_dMonoid_dmempty _uctx1)) xs))
