open Vuna_runtime
type 'a0 t_Eq = C_Eq_Eq of (('a0) -> ('a0) -> bool) * (('a0) -> ('a0) -> bool)

# 17 "Base/Trait/Eq.vuna"
let v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (C_Eq_Eq ((fun (dtb_u_u1 : bool) (dtb_u_u2 : bool) -> (if dtb_u_u1 then (if dtb_u_u2 then true else false) else (if dtb_u_u2 then false else true))), (fun (dtb_u_u3 : bool) (dtb_u_u4 : bool) -> (if dtb_u_u3 then (if dtb_u_u4 then false else true) else (if dtb_u_u4 then true else false)))))

# 12 "Base/Trait/Eq.vuna"
let v__x61__x61_ = (fun dtb_u_u6 dtb_u_u7 dtb_u_u8 -> (match dtb_u_u6 with
  | C_Eq_Eq (dtb_u_u9, dtb_u_u10) -> ((dtb_u_u9 dtb_u_u7) dtb_u_u8)
  | _ -> failwith "DT: impossible branch"
))

# 14 "Base/Trait/Eq.vuna"
let v__x47__x61_ = (fun dtb_u_u12 dtb_u_u13 dtb_u_u14 -> (match dtb_u_u12 with
  | C_Eq_Eq (dtb_u_u15, dtb_u_u16) -> ((dtb_u_u16 dtb_u_u13) dtb_u_u14)
  | _ -> failwith "DT: impossible branch"
))
