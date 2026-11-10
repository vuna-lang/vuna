open Vuna_runtime
type ('a0, 'a1, 'a2, 'a3) t_Dict_uBase_dApplicative_dApplicative = C_Dict_uBase_dApplicative_dApplicative_Applicative of ('a1) * ('a2) * ('a3)

let v_Base_dApplicative_dpure = (fun _ud x1 -> (match _ud with
  | C_Dict_uBase_dApplicative_dApplicative_Applicative (dtb__0, dtb__1, dtb__2) -> (dtb__0 x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dApplicative_dap = (fun _ud x2 x3 -> (match _ud with
  | C_Dict_uBase_dApplicative_dApplicative_Applicative (dtb__3, dtb__4, dtb__5) -> ((dtb__4 x2) x3)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dApplicative_dliftA2 = (fun _ud x3 x4 x5 -> (match _ud with
  | C_Dict_uBase_dApplicative_dApplicative_Applicative (dtb__6, dtb__7, dtb__8) -> (((dtb__8 x3) x4) x5)
  | _ -> failwith "DT: impossible branch"
))
