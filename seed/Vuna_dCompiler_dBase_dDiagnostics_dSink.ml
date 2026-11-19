open Vuna_runtime
# 20 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dseverityTag = (fun (mc0 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dSeverity) -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevHelp -> "H"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevNote -> "N"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevWarning -> "W"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError -> "E"
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dtagPart = (fun (s : string) -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

# 42 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspanPart = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (String.concat "" ["1:"; (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dtagPart (dtb__0).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine); ","])
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> "0,"
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspansKey = (fun (mc0 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dLabel Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspanPart (dtb__1).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelSpan) ^ (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspansKey dtb__2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddiagKey = (fun (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (String.concat "" [(v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dseverityTag (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagSeverity); "|"; (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dtagPart (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCode); "|"; (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dtagPart (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagMessage); "|"; (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspansKey (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagLabels)]))

# 52 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeGo = (fun (mc0 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((fun key -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) key) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__5) -> (((v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeGo dtb__4) mc1) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeGo dtb__4) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) key) true) mc1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddiagKey dtb__3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings = (fun (ds : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeGo ds) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
