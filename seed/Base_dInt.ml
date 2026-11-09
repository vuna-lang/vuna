open Vuna_runtime
let v_Eq_uInt = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

let v_Ord_uInt = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

let v_Show_uInt = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun x -> (bi_strFromInt x))))

let v_Hashable_uInt = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun n -> n)))
