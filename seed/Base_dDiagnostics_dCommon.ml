open Vuna_runtime
# 18 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_diagBody = (fun (dtb_u_u2 : string) (dtb_u_u3 : string B_dData_dVec.t_Vec) -> ((B_dData_dVec.v_substTemplate dtb_u_u2) dtb_u_u3))

# 22 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_mkDiag = (fun (dtb_u_u4 : Base_dDiag.t_Severity) (dtb_u_u5 : Base_dDiag.t_Phase) (dtb_u_u6 : Base_dDiag.t_Category) (dtb_u_u7 : string) (dtb_u_u8 : string) -> (((((Base_dDiag.v_diagNoLoc dtb_u_u4) dtb_u_u5) dtb_u_u6) dtb_u_u7) dtb_u_u8))

# 26 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_withDiagSpan = (fun (dtb_u_u9 : Base_dSource.t_Span) (dtb_u_u10 : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) dtb_u_u10))

# 30 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let v_withDiagDef = (fun (dtb_u_u11 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u12 : string) (dtb_u_u13 : Base_dDiag.t_Diagnostic) -> (((Base_dDiag.v_withContext dtb_u_u11) dtb_u_u12) dtb_u_u13))

# 35 "Vuna/Compiler/Base/Diagnostics/Common.vuna"
let rec v_concatLists = (fun dtb_u_u15 -> (match dtb_u_u15 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> ((B_dData_dList.v_append dtb_u_u16) (v_concatLists dtb_u_u17))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
