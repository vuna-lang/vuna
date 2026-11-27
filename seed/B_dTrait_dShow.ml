open Vuna_runtime
type 'a0 t_Show = C_Show_Show of (('a0) -> string)
and 'a0 t_DebugShow = C_DebugShow_DebugShow of (('a0) -> string)

# 14 "Base/Trait/Show.vuna"
let v_Show_u0077d73cf424e521_uString = (C_Show_Show ((fun dtb_u_u1 -> (dt_show_string dtb_u_u1))))

# 11 "Base/Trait/Show.vuna"
let v_show = (fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u3 with
  | C_Show_Show (dtb_u_u5) -> (dtb_u_u5 dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Trait/Show.vuna"
let v_DebugShow_ub9614133c0738231_ua = (fun dtb_u_u7 -> (C_DebugShow_DebugShow ((fun dtb_u_u8 -> ((v_show dtb_u_u7) dtb_u_u8)))))

# 21 "Base/Trait/Show.vuna"
let v_debugShow = (fun dtb_u_u10 dtb_u_u11 -> (match dtb_u_u10 with
  | C_DebugShow_DebugShow (dtb_u_u12) -> (dtb_u_u12 dtb_u_u11)
  | _ -> failwith "DT: impossible branch"
))
