open Vuna_runtime
type 'a0 t_Num = C_Num_Num of (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0)

# 11 "Base/Trait/Num.vuna"
let v__x43_ = (fun dtb_u_u2 dtb_u_u3 dtb_u_u4 -> (match dtb_u_u2 with
  | C_Num_Num (dtb_u_u5, dtb_u_u6, dtb_u_u7, dtb_u_u8) -> ((dtb_u_u5 dtb_u_u3) dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 13 "Base/Trait/Num.vuna"
let v__x45_ = (fun dtb_u_u10 dtb_u_u11 dtb_u_u12 -> (match dtb_u_u10 with
  | C_Num_Num (dtb_u_u13, dtb_u_u14, dtb_u_u15, dtb_u_u16) -> ((dtb_u_u14 dtb_u_u11) dtb_u_u12)
  | _ -> failwith "DT: impossible branch"
))

# 15 "Base/Trait/Num.vuna"
let v__x42_ = (fun dtb_u_u18 dtb_u_u19 dtb_u_u20 -> (match dtb_u_u18 with
  | C_Num_Num (dtb_u_u21, dtb_u_u22, dtb_u_u23, dtb_u_u24) -> ((dtb_u_u23 dtb_u_u19) dtb_u_u20)
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Trait/Num.vuna"
let v__x47_ = (fun dtb_u_u26 dtb_u_u27 dtb_u_u28 -> (match dtb_u_u26 with
  | C_Num_Num (dtb_u_u29, dtb_u_u30, dtb_u_u31, dtb_u_u32) -> ((dtb_u_u32 dtb_u_u27) dtb_u_u28)
  | _ -> failwith "DT: impossible branch"
))
