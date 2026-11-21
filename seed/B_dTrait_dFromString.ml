open Vuna_runtime
type 'a0 t_FromString = C_FromString_FromString of ((string) -> 'a0)

# 14 "Base/Trait/FromString.vuna"
let v_FromString_u11e06e551e33c59c_uString = (C_FromString_FromString ((fun s -> s)))

# 11 "Base/Trait/FromString.vuna"
let v_fromString = (fun _ud (x0 : string) -> (match _ud with
  | C_FromString_FromString (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
