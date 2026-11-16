open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dFunctor_dFunctor = C_Dict_uBase_dFunctor_dFunctor_Functor of ('a1)

# 10 "Base/Functor.vuna"
let v_Base_dFunctor_dfmap = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dFunctor_dFunctor_Functor (dtb__0) -> ((dtb__0 x2) x3)
  | _ -> failwith "DT: impossible branch"
))
