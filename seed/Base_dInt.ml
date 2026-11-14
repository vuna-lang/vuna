open Vuna_runtime
# 22 "Base/Int.vuna"
let v_Eq_uInt = (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 26 "Base/Int.vuna"
let v_Ord_uInt = (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 34 "Base/Int.vuna"
let v_Num_uInt = (Base_dNum.C_Dict_uBase_dNum_dNum_Num ((fun x y -> (x + y)), (fun x y -> (x - y)), (fun x y -> (x * y)), (fun x y -> (if y = 0 then failwith "division by zero" else x / y))))

# 41 "Base/Int.vuna"
let v_Show_uInt = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun x -> (bi_strFromInt x))))

# 45 "Base/Int.vuna"
let v_Hashable_uInt = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun n -> n)))
