open Vuna_runtime
# 13 "Base/Data/Int.vuna"
let v_Eq_u018fc178ff3df1b4_uInt = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 17 "Base/Data/Int.vuna"
let v_Ord_u5afb3bbeddafcb50_uInt = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 24 "Base/Data/Int.vuna"
let v_Num_ub27c21f837ed69cc_uInt = (B_dTrait_dNum.C_Num_Num ((fun x y -> (x + y)), (fun x y -> (x - y)), (fun x y -> (x * y)), (fun x y -> (if y = 0 then failwith "division by zero" else x / y))))

# 31 "Base/Data/Int.vuna"
let v_Neg_uc22890dadc3767a7_uInt = (B_dTrait_dNeg.C_Neg_Neg ((fun x -> (0 - x))))

# 34 "Base/Data/Int.vuna"
let v_Show_u0077d73cf424e521_uInt = (B_dTrait_dShow.C_Show_Show ((fun x -> (string_of_int x))))

# 38 "Base/Data/Int.vuna"
let v_Hashable_ue4b0f10b020a5e82_uInt = (B_dTrait_dHashable.C_Hashable_Hashable ((fun n -> n)))
