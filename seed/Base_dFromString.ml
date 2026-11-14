open Vuna_runtime
type 'a0 t_Dict_uBase_dFromString_dFromString = C_Dict_uBase_dFromString_dFromString_FromString of ((string) -> 'a0)

# 15 "Base/FromString.vuna"
let v_FromString_uString = (C_Dict_uBase_dFromString_dFromString_FromString ((fun s -> s)))

# 12 "Base/FromString.vuna"
let v_Base_dFromString_dfromString = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dFromString_dFromString_FromString (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
