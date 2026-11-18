open Vuna_runtime
# 12 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dfromList = (fun xs -> ((fun xs -> Array.of_list (Base_dData_dList.dtp_ocamlOf xs)) xs))

# 16 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dtoList = (fun a -> ((fun a -> Base_dData_dList.dtp_listOf (Array.to_list a)) a))

# 35 "Base/Container/Array.vuna"
let rec v_Eq_uArray_ua = (fun _uctx0 -> (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun a b -> (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dList.v_Eq_uBase_uData_uList_uList_ua _uctx0)) (v_Base_dContainer_dArray_dtoList a)) (v_Base_dContainer_dArray_dtoList b))), (fun a b -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (v_Eq_uArray_ua _uctx0)) a) b) then false else true)))))

# 40 "Base/Container/Array.vuna"
let v_Show_uArray_ua = (fun _uctx0 -> (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun a -> ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow (Base_dData_dList.v_Show_uBase_uData_uList_uList_ua _uctx0)) (v_Base_dContainer_dArray_dtoList a))))))

# 20 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dlength = (fun a -> (bi_natFromInt (Array.length a)))

# 24 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dget = (fun a i -> ((Array.get a) i))

# 28 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dset = (fun a i v -> (((dtp_arraySet a) i) v))

# 32 "Base/Container/Array.vuna"
let v_Base_dContainer_dArray_dmake = (fun n v -> ((Array.make n) v))
