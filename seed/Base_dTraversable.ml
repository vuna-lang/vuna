open Vuna_runtime
type ('a0, 'a1, 'a2) t_Dict_uBase_dTraversable_dTraversable = C_Dict_uBase_dTraversable_dTraversable_Traversable of ('a2)

let v_Base_dTraversable_dmapM = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dTraversable_dTraversable_Traversable (dtb__0) -> ((dtb__0 x2) x3)
  | _ -> failwith "DT: impossible branch"
))
