open Vuna_runtime
type 'a0 t_Monad = C_Monad_Monad of (Obj.t)

# 15 "Base/Trait/Monad.vuna"
let v__x62__x62__x61_ = (fun dtb_u_u2 dtb_u_u5 dtb_u_u6 -> (match dtb_u_u2 with
  | C_Monad_Monad (dtb_u_u7) -> (((Obj.magic dtb_u_u7) dtb_u_u5) dtb_u_u6)
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Trait/Monad.vuna"
let v__x62__x62_ = (fun dtb_u_u11 dtb_u_u12 dtb_u_u13 -> (((v__x62__x62__x61_ dtb_u_u11) dtb_u_u12) (fun dtb_u_u14 -> dtb_u_u13)))
