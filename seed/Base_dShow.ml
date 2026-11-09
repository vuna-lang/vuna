open Vuna_runtime
type 'a0 t_Dict_uBase_dShow_dShow = C_Dict_uBase_dShow_dShow_Show of (('a0) -> string)

let v_Show_uString = (C_Dict_uBase_dShow_dShow_Show ((fun s -> (dt_show_string s))))

let v_Base_dShow_dshow = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dShow_dShow_Show (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
