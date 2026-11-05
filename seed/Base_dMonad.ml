open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dMonad_dFunctor = C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor of ('a1)
and ('a0, 'a1, 'a2) t_Dict_uBase_dMonad_dMonad = C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad of ('a1) * ('a2)

let v_Base_dMonad_dfmap = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor (dtb__0) -> ((dtb__0 x2) x3)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMonad_dbind = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad (dtb__1, dtb__2) -> ((dtb__1 x2) x3)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMonad_dpure = (fun _ud x1 -> (match _ud with
  | C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad (dtb__3, dtb__4) -> (dtb__4 x1)
  | _ -> failwith "DT: impossible branch"
))
