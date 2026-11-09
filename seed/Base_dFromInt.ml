open Vuna_runtime
type 'a0 t_Dict_uBase_dFromInt_dFromInt = C_Dict_uBase_dFromInt_dFromInt_FromInt of ((int) -> 'a0)

let v_FromInt_uInt = (C_Dict_uBase_dFromInt_dFromInt_FromInt ((fun n -> n)))

let v_Base_dFromInt_dfromInt = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dFromInt_dFromInt_FromInt (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
