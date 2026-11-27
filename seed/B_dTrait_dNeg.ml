open Vuna_runtime
type 'a0 t_Neg = C_Neg_Neg of (('a0) -> 'a0)

# 10 "Base/Trait/Neg.vuna"
let v_negate = (fun dtb_u_u2 dtb_u_u3 -> (match dtb_u_u2 with
  | C_Neg_Neg (dtb_u_u4) -> (dtb_u_u4 dtb_u_u3)
  | _ -> failwith "DT: impossible branch"
))
