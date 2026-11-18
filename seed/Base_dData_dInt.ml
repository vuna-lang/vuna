open Vuna_runtime
# 13 "Base/Data/Int.vuna"
let v_Eq_uInt = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 17 "Base/Data/Int.vuna"
let v_Ord_uInt = (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 24 "Base/Data/Int.vuna"
let v_Num_uInt = (Base_dTrait_dNum.C_Dict_uBase_dTrait_dNum_dNum_Num ((fun x y -> (x + y)), (fun x y -> (x - y)), (fun x y -> (x * y)), (fun x y -> (if y = 0 then failwith "division by zero" else x / y))))

# 31 "Base/Data/Int.vuna"
let v_Neg_uInt = (Base_dTrait_dNeg.C_Dict_uBase_dTrait_dNeg_dNeg_Neg ((fun x -> (0 - x))))

# 34 "Base/Data/Int.vuna"
let v_Show_uInt = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun x -> (bi_strFromInt x))))

# 38 "Base/Data/Int.vuna"
let v_Hashable_uInt = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun n -> n)))
