open Vuna_runtime
type ('a0, 'a1) t_Dict_uBase_dRecord_dHasField = C_Dict_uBase_dRecord_dHasField_HasField of (('a0) -> 'a1)

# 16 "Base/Record.vuna"
let v_Base_dRecord_dgetField = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dRecord_dHasField_HasField (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
