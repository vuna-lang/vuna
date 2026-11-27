open Vuna_runtime
type 'a0 t_Applicative = C_Applicative_Applicative of (Obj.t) * (Obj.t) * (Obj.t)

# 14 "Base/Trait/Applicative.vuna"
let v_pure = (fun dtb_u_u2 dtb_u_u4 -> (match dtb_u_u2 with
  | C_Applicative_Applicative (dtb_u_u5, dtb_u_u6, dtb_u_u7) -> ((Obj.magic dtb_u_u5) dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Trait/Applicative.vuna"
let v_ap = (fun dtb_u_u9 dtb_u_u12 dtb_u_u13 -> (match dtb_u_u9 with
  | C_Applicative_Applicative (dtb_u_u14, dtb_u_u15, dtb_u_u16) -> (((Obj.magic dtb_u_u15) dtb_u_u12) dtb_u_u13)
  | _ -> failwith "DT: impossible branch"
))

# 18 "Base/Trait/Applicative.vuna"
let v_liftA2 = (fun dtb_u_u18 dtb_u_u22 dtb_u_u23 dtb_u_u24 -> (match dtb_u_u18 with
  | C_Applicative_Applicative (dtb_u_u25, dtb_u_u26, dtb_u_u27) -> ((((Obj.magic dtb_u_u27) dtb_u_u22) dtb_u_u23) dtb_u_u24)
  | _ -> failwith "DT: impossible branch"
))
