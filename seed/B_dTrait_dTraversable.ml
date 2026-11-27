open Vuna_runtime
type ('a0, 'a1) t_Traversable = C_Traversable_Traversable of (Obj.t)

# 13 "Base/Trait/Traversable.vuna"
let v_mapM = (fun dtb_u_u3 dtb_u_u6 dtb_u_u7 -> (match dtb_u_u3 with
  | C_Traversable_Traversable (dtb_u_u8) -> (((Obj.magic dtb_u_u8) dtb_u_u6) dtb_u_u7)
  | _ -> failwith "DT: impossible branch"
))
