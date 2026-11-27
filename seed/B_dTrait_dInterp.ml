open Vuna_runtime
type 'a0 t_Interp = C_Interp_Interp of (('a0) -> string)

# 18 "Base/Trait/Interp.vuna"
let v_Interp_uc9feaa570847b590_ua = (fun dtb_u_u2 -> (C_Interp_Interp ((fun dtb_u_u3 -> ((B_dTrait_dShow.v_show dtb_u_u2) dtb_u_u3)))))

# 22 "Base/Trait/Interp.vuna"
let v_Interp_uc9feaa570847b590_uString = (C_Interp_Interp ((fun dtb_u_u4 -> dtb_u_u4)))

# 15 "Base/Trait/Interp.vuna"
let v_interp = (fun dtb_u_u6 dtb_u_u7 -> (match dtb_u_u6 with
  | C_Interp_Interp (dtb_u_u8) -> (dtb_u_u8 dtb_u_u7)
  | _ -> failwith "DT: impossible branch"
))
