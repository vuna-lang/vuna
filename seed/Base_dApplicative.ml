open Vuna_runtime
type ('a0, 'a1, 'a2) t_Dict_uBase_dApplicative_dApplicative = C_Dict_uBase_dApplicative_dApplicative_Applicative of ('a1) * ('a2)

let v_Base_dApplicative_dpure = (fun _ud x1 -> (match _ud with
  | C_Dict_uBase_dApplicative_dApplicative_Applicative (dtb__0, dtb__1) -> (dtb__0 x1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dApplicative_dliftA2 = (fun _ud x3 x4 x5 -> (match _ud with
  | C_Dict_uBase_dApplicative_dApplicative_Applicative (dtb__2, dtb__3) -> (((dtb__3 x3) x4) x5)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dApplicative_d_uapply = (fun f x -> (f x))

let v_Base_dApplicative_dap = (fun _uctx0 mf mx -> ((((v_Base_dApplicative_dliftA2 _uctx0) v_Base_dApplicative_d_uapply) mf) mx))
