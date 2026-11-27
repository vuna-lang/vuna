open Vuna_runtime
# 18 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_diagBody = (fun (template : string) (args : string B_dData_dVec.t_Vec) -> ((B_dData_dVec.v_substTemplate template) args))

# 22 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_mkDiag = (fun (sev : Base_dDiag.t_Severity) (phase : Base_dDiag.t_Phase) (cat : Base_dDiag.t_Category) (code : string) (msg : string) -> (((((Base_dDiag.v_diagNoLoc sev) phase) cat) code) msg))

# 26 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_withDiagSpan = (fun (sp : Base_dSource.t_Span) (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) d))

# 30 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_withDiagDef = (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (name : string) (d : Base_dDiag.t_Diagnostic) -> (((Base_dDiag.v_withContext msp) name) d))

# 35 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let rec v_concatLists = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> ((B_dData_dList.v_append dtb__0) (v_concatLists dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
