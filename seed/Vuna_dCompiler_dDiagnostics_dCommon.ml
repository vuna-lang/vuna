open Vuna_runtime
let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagMsg = (fun code template args -> (String.concat "" ["["; code; "] "; ((Base_dVec.v_Base_dVec_dsubstTemplate template) args)]))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagErr = (fun msg -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (msg)))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagErrAt = (fun sp msg -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagDefLoc = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (String.concat "" ["in `"; mc1; "`: "])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__0); ": in `"; mc1; "`: "])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__1, dtb__2) -> ((Base_dList.v_Base_dList_dappend dtb__1) (v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists dtb__2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
