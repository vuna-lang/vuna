open Vuna_runtime
type 'a0 t_Hashable = C_Hashable_Hashable of (('a0) -> int)

# 16 "Base/Trait/Hashable.vuna"
let v_hash = (fun dtb_u_u2 dtb_u_u3 -> (match dtb_u_u2 with
  | C_Hashable_Hashable (dtb_u_u4) -> (dtb_u_u4 dtb_u_u3)
  | _ -> failwith "DT: impossible branch"
))

# 20 "Base/Trait/Hashable.vuna"
let v_hashStr = (fun (dtb_u_u5 : string) -> (dtp_strHash dtb_u_u5))

# 24 "Base/Trait/Hashable.vuna"
let v_hashCombine = (fun (dtb_u_u6 : int) (dtb_u_u7 : int) -> ((dtb_u_u6 * 31) + dtb_u_u7))
