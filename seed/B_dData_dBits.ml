open Vuna_runtime
# 8 "Base/Data/Bits.vuna"
let v_band = (fun (dtb_u_u1 : int) (dtb_u_u2 : int) -> (dtb_u_u1 land dtb_u_u2))

# 12 "Base/Data/Bits.vuna"
let v_bor = (fun (dtb_u_u3 : int) (dtb_u_u4 : int) -> (dtb_u_u3 lor dtb_u_u4))

# 16 "Base/Data/Bits.vuna"
let v_bxor = (fun (dtb_u_u5 : int) (dtb_u_u6 : int) -> (dtb_u_u5 lxor dtb_u_u6))

# 20 "Base/Data/Bits.vuna"
let v_bnot = (fun (dtb_u_u7 : int) -> (lnot dtb_u_u7))

# 24 "Base/Data/Bits.vuna"
let v_shl = (fun (dtb_u_u8 : int) (dtb_u_u9 : int) -> (if dtb_u_u9 < 0 || dtb_u_u9 >= 63 then 0 else dtb_u_u8 lsl dtb_u_u9))

# 28 "Base/Data/Bits.vuna"
let v_shr = (fun (dtb_u_u10 : int) (dtb_u_u11 : int) -> (if dtb_u_u11 < 0 || dtb_u_u11 >= 63 then 0 else dtb_u_u10 lsr dtb_u_u11))

# 32 "Base/Data/Bits.vuna"
let v_mask32 = (fun (dtb_u_u12 : int) -> ((v_band dtb_u_u12) 4294967295))

# 36 "Base/Data/Bits.vuna"
let v_mask8 = (fun (dtb_u_u13 : int) -> ((v_band dtb_u_u13) 255))

# 41 "Base/Data/Bits.vuna"
let v_shl32 = (fun (dtb_u_u14 : int) (dtb_u_u15 : int) -> (v_mask32 ((v_shl dtb_u_u14) dtb_u_u15)))

# 45 "Base/Data/Bits.vuna"
let v_shr32 = (fun (dtb_u_u16 : int) (dtb_u_u17 : int) -> ((v_shr (v_mask32 dtb_u_u16)) dtb_u_u17))

# 49 "Base/Data/Bits.vuna"
let v_add32 = (fun (dtb_u_u18 : int) (dtb_u_u19 : int) -> (v_mask32 (dtb_u_u18 + dtb_u_u19)))

# 53 "Base/Data/Bits.vuna"
let v_rotr32 = (fun (dtb_u_u20 : int) (dtb_u_u21 : int) -> (let dtb_u_u22 = (dtb_u_u21 - ((if 32 = 0 then failwith "division by zero" else dtb_u_u21 / 32) * 32)) in (let dtb_u_u23 = ((v_band dtb_u_u20) (((v_shl 1) dtb_u_u22) - 1)) in ((v_bor ((v_shr32 dtb_u_u20) dtb_u_u22)) ((v_shl dtb_u_u23) (32 - dtb_u_u22))))))

# 61 "Base/Data/Bits.vuna"
let v_rol32 = (fun (dtb_u_u24 : int) (dtb_u_u25 : int) -> (let dtb_u_u26 = (dtb_u_u25 - ((if 32 = 0 then failwith "division by zero" else dtb_u_u25 / 32) * 32)) in (let dtb_u_u27 = ((v_shl32 dtb_u_u24) dtb_u_u26) in (let dtb_u_u28 = ((v_shr32 dtb_u_u24) (32 - dtb_u_u26)) in ((v_bor dtb_u_u27) dtb_u_u28)))))
