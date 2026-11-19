open Vuna_runtime
type 'a0 t_FromInt = C_FromInt_FromInt of ((int) -> 'a0)

# 14 "Base/Trait/FromInt.vuna"
let v_FromInt_uInt = (C_FromInt_FromInt ((fun n -> n)))

# 11 "Base/Trait/FromInt.vuna"
let v_fromInt = (fun _ud (x0 : int) -> (match _ud with
  | C_FromInt_FromInt (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
