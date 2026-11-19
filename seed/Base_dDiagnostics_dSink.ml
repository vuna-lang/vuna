open Vuna_runtime
# 20 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_severityTag = (fun (mc0 : Base_dDiag.t_Severity) -> (match mc0 with
  | Base_dDiag.C_Severity_SevHelp -> "H"
  | Base_dDiag.C_Severity_SevNote -> "N"
  | Base_dDiag.C_Severity_SevWarning -> "W"
  | Base_dDiag.C_Severity_SevError -> "E"
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_tagPart = (fun (s : string) -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

# 42 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_spanPart = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (String.concat "" ["1:"; (v_tagPart (dtb__0).Base_dSource.f_Span_spanFile); ":"; (bi_strFromInt (dtb__0).Base_dSource.f_Span_spanStartLine); ":"; (bi_strFromInt (dtb__0).Base_dSource.f_Span_spanStartCol); ":"; (bi_strFromInt (dtb__0).Base_dSource.f_Span_spanEndLine); ","])
  | B_dData_dMaybe.C_Maybe_Nothing -> "0,"
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_spansKey = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> ((v_spanPart (dtb__1).Base_dDiag.f_Label_labelSpan) ^ (v_spansKey dtb__2))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_diagKey = (fun (d : Base_dDiag.t_Diagnostic) -> (String.concat "" [(v_severityTag (d).Base_dDiag.f_Diagnostic_diagSeverity); "|"; (v_tagPart (d).Base_dDiag.f_Diagnostic_diagCode); "|"; (v_tagPart (d).Base_dDiag.f_Diagnostic_diagMessage); "|"; (v_spansKey (d).Base_dDiag.f_Diagnostic_diagLabels)]))

# 52 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_dedupeGo = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> ((fun key -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (((v_dedupeGo dtb__4) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeGo dtb__4) ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) key) true) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__3, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_diagKey dtb__3))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_dedupeWarnings = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((v_dedupeGo ds) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))
