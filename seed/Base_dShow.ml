open Vuna_runtime
type 'a0 t_Dict_uBase_dShow_dShow = C_Dict_uBase_dShow_dShow_Show of (('a0) -> string)
and 'a0 t_Dict_uBase_dShow_dDebugShow = C_Dict_uBase_dShow_dDebugShow_DebugShow of (('a0) -> string)

let v_Show_uString = (C_Dict_uBase_dShow_dShow_Show ((fun s -> (dt_show_string s))))

let v_Base_dShow_dshow = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dShow_dShow_Show (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

let v_DebugShow_ua = (fun _uctx0 -> (C_Dict_uBase_dShow_dDebugShow_DebugShow ((fun x -> ((v_Base_dShow_dshow _uctx0) x)))))

let v_Base_dShow_ddebugShow = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dShow_dDebugShow_DebugShow (dtb__1) -> (dtb__1 x0)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dShow_ddbgShow = (fun _uctx0 x -> (((fun s x -> prerr_string s; prerr_newline (); x) ((v_Base_dShow_ddebugShow _uctx0) x)) x))
