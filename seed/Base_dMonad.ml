open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dMonad_dFunctor = C_Dict_uBase_dMonad_dFunctor_Functor of ('a1)
and ('a0, 'a1) t_Dict_uBase_dMonad_dMonad = C_Dict_uBase_dMonad_dMonad_Monad of ('a1)

let v_Base_dMonad_dfmap = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dMonad_dFunctor_Functor (dtb__0) -> ((dtb__0 x2) x3)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMonad_dbind = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dMonad_dMonad_Monad (dtb__1) -> ((dtb__1 x2) x3)
  | _ -> failwith "DT: impossible branch"
))
