open Vuna_runtime
let v_Show_uBase_dBool_dBool = (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun b -> (if b then "True" else "False"))))

let v_Base_dBool_dnot = (fun mc0 -> (if mc0 then false else true))

let v_Base_dBool_dand = (fun mc0 mc1 -> (if mc0 then mc1 else false))

let v_Base_dBool_dor = (fun mc0 mc1 -> (if mc0 then true else mc1))

let v_Base_dBool_dxor = (fun mc0 mc1 -> (if mc0 then (v_Base_dBool_dnot mc1) else mc1))

let v_Base_dBool_dbool = (fun mc0 mc1 mc2 -> (if mc2 then mc1 else mc0))
