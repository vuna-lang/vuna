open Vuna_runtime
# 20 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_severityTag = (fun (dtb_u_u1 : Base_dDiag.t_Severity) -> (match dtb_u_u1 with
  | Base_dDiag.C_Severity_SevHelp -> "H"
  | Base_dDiag.C_Severity_SevNote -> "N"
  | Base_dDiag.C_Severity_SevWarning -> "W"
  | Base_dDiag.C_Severity_SevError -> "E"
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_tagPart = (fun (dtb_u_u2 : string) -> (String.concat "" [(string_of_int (String.length dtb_u_u2)); ":"; dtb_u_u2]))

# 42 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_spanPart = (fun (dtb_u_u3 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u4) -> (String.concat "" ["1:"; (v_tagPart (dtb_u_u4).Base_dSource.f_Span_spanFile); ":"; (string_of_int (dtb_u_u4).Base_dSource.f_Span_spanStartLine); ":"; (string_of_int (dtb_u_u4).Base_dSource.f_Span_spanStartCol); ":"; (string_of_int (dtb_u_u4).Base_dSource.f_Span_spanEndLine); ","])
  | B_dData_dMaybe.C_Maybe_Nothing -> "0,"
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_spansKey = (fun (dtb_u_u5 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> ((v_spanPart (dtb_u_u6).Base_dDiag.f_Label_labelSpan) ^ (v_spansKey dtb_u_u7))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_diagKey = (fun (dtb_u_u8 : Base_dDiag.t_Diagnostic) -> (String.concat "" [(v_severityTag (dtb_u_u8).Base_dDiag.f_Diagnostic_diagSeverity); "|"; (v_tagPart (dtb_u_u8).Base_dDiag.f_Diagnostic_diagCode); "|"; (v_tagPart (dtb_u_u8).Base_dDiag.f_Diagnostic_diagMessage); "|"; (v_spansKey (dtb_u_u8).Base_dDiag.f_Diagnostic_diagLabels)]))

# 52 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_dedupeGo = (fun (dtb_u_u9 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u10 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u11 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (let dtb_u_u14 = (v_diagKey dtb_u_u12) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u14) dtb_u_u10) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u15) -> (((v_dedupeGo dtb_u_u13) dtb_u_u10) dtb_u_u11)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeGo dtb_u_u13) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u14) true) dtb_u_u10)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u11)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u11)
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_dedupeWarnings = (fun (dtb_u_u16 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((v_dedupeGo dtb_u_u16) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))
