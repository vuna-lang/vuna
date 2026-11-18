open Vuna_runtime
# 18 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_ddiagBody = (fun template args -> ((Base_dData_dVec.v_Base_dData_dVec_dsubstTemplate template) args))

# 22 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dmkDiag = (fun sev phase cat code msg -> (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc sev) phase) cat) code) msg))

# 26 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dwithDiagSpan = (fun sp d -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithLabel { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelSpan = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp)); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelText = ""; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelStyle = Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dLabelStyle_LabelPrimary; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelProvenance = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }) d))

# 30 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dwithDiagDef = (fun msp name d -> (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext msp) name) d))

# 35 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dconcatLists = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> ((Base_dData_dList.v_Base_dData_dList_dappend dtb__0) (v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dconcatLists dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
