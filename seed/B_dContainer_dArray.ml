open Vuna_runtime
# 12 "Base/Container/Array.vuna"
let v_fromList = (fun dtb_u_u2 -> ((fun xs -> Array.of_list (B_dData_dList.dtp_ocamlOf xs)) dtb_u_u2))

# 16 "Base/Container/Array.vuna"
let v_toList = (fun dtb_u_u4 -> ((fun a -> B_dData_dList.dtp_listOf (Array.to_list a)) dtb_u_u4))

# 35 "Base/Container/Array.vuna"
let rec v_Eq_u018fc178ff3df1b4_uArray_ua = (fun dtb_u_u6 -> (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u7 dtb_u_u8 -> (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u6)) (v_toList dtb_u_u7)) (v_toList dtb_u_u8))), (fun dtb_u_u9 dtb_u_u10 -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uArray_ua dtb_u_u6)) dtb_u_u9) dtb_u_u10) then false else true)))))

# 40 "Base/Container/Array.vuna"
let v_Show_u0077d73cf424e521_uArray_ua = (fun dtb_u_u12 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u13 -> ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u12)) (v_toList dtb_u_u13))))))

# 20 "Base/Container/Array.vuna"
let v_length = (fun dtb_u_u15 -> (bi_natFromInt (Array.length dtb_u_u15)))

# 24 "Base/Container/Array.vuna"
let v_get = (fun dtb_u_u17 (dtb_u_u18 : int) -> ((Array.get dtb_u_u17) dtb_u_u18))

# 28 "Base/Container/Array.vuna"
let v_set = (fun dtb_u_u20 (dtb_u_u21 : int) dtb_u_u22 -> (((dtp_arraySet dtb_u_u20) dtb_u_u21) dtb_u_u22))

# 32 "Base/Container/Array.vuna"
let v_make = (fun (dtb_u_u24 : int) dtb_u_u25 -> ((Array.make dtb_u_u24) dtb_u_u25))
