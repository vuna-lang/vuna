open Vuna_runtime
# 43 "Base/Data/Bool.vuna"
let v_Show_uBase_uData_uBool_uBool = (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun b -> (if b then "True" else "False"))))

# 47 "Base/Data/Bool.vuna"
let v_Hashable_uBase_uData_uBool_uBool = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun b -> (if b then 1 else 0))))

# 19 "Base/Data/Bool.vuna"
let v_Base_dData_dBool_dnot = (fun mc0 -> (if mc0 then false else true))

# 24 "Base/Data/Bool.vuna"
let v_Base_dData_dBool_dand = (fun mc0 mc1 -> (if mc0 then mc1 else false))

# 29 "Base/Data/Bool.vuna"
let v_Base_dData_dBool_dor = (fun mc0 mc1 -> (if mc0 then true else mc1))

# 34 "Base/Data/Bool.vuna"
let v_Base_dData_dBool_dxor = (fun mc0 mc1 -> (if mc0 then (v_Base_dData_dBool_dnot mc1) else mc1))

# 39 "Base/Data/Bool.vuna"
let v_Base_dData_dBool_dbool = (fun mc0 mc1 mc2 -> (if mc2 then mc1 else mc0))
