open Vuna_runtime
# 43 "Base/Data/Bool.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u1 -> (if dtb_u_u1 then "True" else "False"))))

# 47 "Base/Data/Bool.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u2 -> (if dtb_u_u2 then 1 else 0))))

# 19 "Base/Data/Bool.vuna"
let v_not = (fun (dtb_u_u3 : bool) -> (if dtb_u_u3 then false else true))

# 24 "Base/Data/Bool.vuna"
let v_and = (fun (dtb_u_u4 : bool) (dtb_u_u5 : bool) -> (if dtb_u_u4 then dtb_u_u5 else false))

# 29 "Base/Data/Bool.vuna"
let v_or = (fun (dtb_u_u6 : bool) (dtb_u_u7 : bool) -> (if dtb_u_u6 then true else dtb_u_u7))

# 34 "Base/Data/Bool.vuna"
let v_xor = (fun (dtb_u_u8 : bool) (dtb_u_u9 : bool) -> (if dtb_u_u8 then (v_not dtb_u_u9) else dtb_u_u9))

# 39 "Base/Data/Bool.vuna"
let v_bool = (fun dtb_u_u11 dtb_u_u12 (dtb_u_u13 : bool) -> (if dtb_u_u13 then dtb_u_u12 else dtb_u_u11))
