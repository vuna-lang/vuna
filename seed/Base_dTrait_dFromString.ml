open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dFromString_dFromString = C_Dict_uBase_dTrait_dFromString_dFromString_FromString of ((string) -> 'a0)

# 14 "Base/Trait/FromString.vuna"
let v_FromString_uString = (C_Dict_uBase_dTrait_dFromString_dFromString_FromString ((fun s -> s)))

# 11 "Base/Trait/FromString.vuna"
let v_Base_dTrait_dFromString_dfromString = (fun _ud (x0 : string) -> (match _ud with
  | C_Dict_uBase_dTrait_dFromString_dFromString_FromString (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
