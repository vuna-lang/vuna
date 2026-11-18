open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dTrait_dTraversable_dTraversable = C_Dict_uBase_dTrait_dTraversable_dTraversable_Traversable of (Obj.t)

# 13 "Base/Trait/Traversable.vuna"
let v_Base_dTrait_dTraversable_dmapM = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dTrait_dTraversable_dTraversable_Traversable (dtb__0) -> (((Obj.magic dtb__0) x2) x3)
  | _ -> failwith "DT: impossible branch"
))
