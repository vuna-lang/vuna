open Vuna_runtime
let v_Eq_uInt = (Base_dEq.C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

let v_Ord_uInt = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_MkDict_uBase_dOrd_dOrd ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))
