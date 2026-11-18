open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dFunctor_dFunctor = C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor of (Obj.t)

# 9 "Base/Trait/Functor.vuna"
let v_Base_dTrait_dFunctor_dfmap = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor (dtb__0) -> (((Obj.magic dtb__0) x2) x3)
  | _ -> failwith "DT: impossible branch"
))
