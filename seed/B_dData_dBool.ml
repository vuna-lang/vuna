open Vuna_runtime
# 43 "Base/Data/Bool.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (B_dTrait_dShow.C_Show_Show ((fun b -> (if b then "True" else "False"))))

# 47 "Base/Data/Bool.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool = (B_dTrait_dHashable.C_Hashable_Hashable ((fun b -> (if b then 1 else 0))))

# 19 "Base/Data/Bool.vuna"
let v_not = (fun (mc0 : bool) -> (if mc0 then false else true))

# 24 "Base/Data/Bool.vuna"
let v_and = (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then mc1 else false))

# 29 "Base/Data/Bool.vuna"
let v_or = (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then true else mc1))

# 34 "Base/Data/Bool.vuna"
let v_xor = (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then (v_not mc1) else mc1))

# 39 "Base/Data/Bool.vuna"
let v_bool = (fun mc0 mc1 (mc2 : bool) -> (if mc2 then mc1 else mc0))
