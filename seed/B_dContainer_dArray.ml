open Vuna_runtime
# 12 "Base/Container/Array.vuna"
let v_fromList = (fun xs -> ((fun xs -> Array.of_list (B_dData_dList.dtp_ocamlOf xs)) xs))

# 16 "Base/Container/Array.vuna"
let v_toList = (fun a -> ((fun a -> B_dData_dList.dtp_listOf (Array.to_list a)) a))

# 35 "Base/Container/Array.vuna"
let rec v_Eq_u018fc178ff3df1b4_uArray_ua = (fun _uctx0 -> (B_dTrait_dEq.C_Eq_Eq ((fun a b -> (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) (v_toList a)) (v_toList b))), (fun a b -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uArray_ua _uctx0)) a) b) then false else true)))))

# 40 "Base/Container/Array.vuna"
let v_Show_u0077d73cf424e521_uArray_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun a -> ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) (v_toList a))))))

# 20 "Base/Container/Array.vuna"
let v_length = (fun a -> (bi_natFromInt (Array.length a)))

# 24 "Base/Container/Array.vuna"
let v_get = (fun a (i : int) -> ((Array.get a) i))

# 28 "Base/Container/Array.vuna"
let v_set = (fun a (i : int) v -> (((dtp_arraySet a) i) v))

# 32 "Base/Container/Array.vuna"
let v_make = (fun (n : int) v -> ((Array.make n) v))
