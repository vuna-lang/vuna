open Vuna_runtime
# 22 "Base/Array.vuna"
let v_Base_dArray_dfromList = (fun xs -> ((fun xs -> Array.of_list (Base_dList.dtp_ocamlOf xs)) xs))

# 26 "Base/Array.vuna"
let v_Base_dArray_dtoList = (fun a -> ((fun a -> Base_dList.dtp_listOf (Array.to_list a)) a))

# 45 "Base/Array.vuna"
let rec v_Eq_uArray_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun a b -> (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua _uctx0)) (v_Base_dArray_dtoList a)) (v_Base_dArray_dtoList b))), (fun a b -> (if (((Base_dEq.v_Base_dEq_deq (v_Eq_uArray_ua _uctx0)) a) b) then false else true)))))

# 50 "Base/Array.vuna"
let v_Show_uArray_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun a -> ((Base_dShow.v_Base_dShow_dshow (Base_dList.v_Show_uBase_uList_uList_ua _uctx0)) (v_Base_dArray_dtoList a))))))

# 30 "Base/Array.vuna"
let v_Base_dArray_dlength = (fun a -> (bi_natFromInt (Array.length a)))

# 34 "Base/Array.vuna"
let v_Base_dArray_dget = (fun a i -> ((Array.get a) i))

# 38 "Base/Array.vuna"
let v_Base_dArray_dset = (fun a i v -> (((dtp_arraySet a) i) v))

# 42 "Base/Array.vuna"
let v_Base_dArray_dmake = (fun n v -> ((Array.make n) v))
