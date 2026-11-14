open Vuna_runtime
# 48 "Base/Bool.vuna"
let v_Show_uBase_uBool_uBool = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun b -> (if b then "True" else "False"))))

# 52 "Base/Bool.vuna"
let v_Hashable_uBase_uBool_uBool = (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun b -> (if b then 1 else 0))))

# 23 "Base/Bool.vuna"
let v_Base_dBool_dnot = (fun mc0 -> (if mc0 then false else true))

# 28 "Base/Bool.vuna"
let v_Base_dBool_dand = (fun mc0 mc1 -> (if mc0 then mc1 else false))

# 33 "Base/Bool.vuna"
let v_Base_dBool_dor = (fun mc0 mc1 -> (if mc0 then true else mc1))

# 38 "Base/Bool.vuna"
let v_Base_dBool_dxor = (fun mc0 mc1 -> (if mc0 then (v_Base_dBool_dnot mc1) else mc1))

# 43 "Base/Bool.vuna"
let v_Base_dBool_dbool = (fun mc0 mc1 mc2 -> (if mc2 then mc1 else mc0))
