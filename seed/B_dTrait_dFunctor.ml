open Vuna_runtime
type 'a0 t_Functor = C_Functor_Functor of (Obj.t)

# 9 "Base/Trait/Functor.vuna"
let v_fmap = (fun dtb_u_u2 dtb_u_u5 dtb_u_u6 -> (match dtb_u_u2 with
  | C_Functor_Functor (dtb_u_u7) -> (((Obj.magic dtb_u_u7) dtb_u_u5) dtb_u_u6)
  | _ -> failwith "DT: impossible branch"
))
