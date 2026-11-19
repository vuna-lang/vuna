open Vuna_runtime
# 13 "Base/Data/Int.vuna"
let v_Eq_uInt = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 17 "Base/Data/Int.vuna"
let v_Ord_uInt = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 24 "Base/Data/Int.vuna"
let v_Num_uInt = (B_dTrait_dNum.C_Num_Num ((fun x y -> (x + y)), (fun x y -> (x - y)), (fun x y -> (x * y)), (fun x y -> (if y = 0 then failwith "division by zero" else x / y))))

# 31 "Base/Data/Int.vuna"
let v_Neg_uInt = (B_dTrait_dNeg.C_Neg_Neg ((fun x -> (0 - x))))

# 34 "Base/Data/Int.vuna"
let v_Show_uInt = (B_dTrait_dShow.C_Show_Show ((fun x -> (bi_strFromInt x))))

# 38 "Base/Data/Int.vuna"
let v_Hashable_uInt = (B_dTrait_dHashable.C_Hashable_Hashable ((fun n -> n)))
