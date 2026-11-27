open Vuna_runtime
type 'a0 t_Neg = C_Neg_Neg of (('a0) -> 'a0)

# 10 "Base/Trait/Neg.vuna"
let v_negate = (fun _ud x0 -> (match _ud with
  | C_Neg_Neg (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
