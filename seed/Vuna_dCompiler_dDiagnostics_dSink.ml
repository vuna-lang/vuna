open Vuna_runtime
# 22 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_dseverityTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "H"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "N"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "W"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "E"
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_dtagPart = (fun s -> (String.concat "" [(bi_strFromInt (bi_strLength s)); ":"; s]))

# 44 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_dspanPart = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (String.concat "" ["1:"; (v_Vuna_dCompiler_dDiagnostics_dSink_dtagPart (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol); ":"; (bi_strFromInt (dtb__0).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine); ","])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "0,"
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Diagnostics/Sink.vuna"
let rec v_Vuna_dCompiler_dDiagnostics_dSink_dspansKey = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dDiagnostics_dSink_dspanPart (dtb__1).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan) ^ (v_Vuna_dCompiler_dDiagnostics_dSink_dspansKey dtb__2))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_ddiagKey = (fun d -> (String.concat "" [(v_Vuna_dCompiler_dDiagnostics_dSink_dseverityTag (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity); "|"; (v_Vuna_dCompiler_dDiagnostics_dSink_dtagPart (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode); "|"; (v_Vuna_dCompiler_dDiagnostics_dSink_dtagPart (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage); "|"; (v_Vuna_dCompiler_dDiagnostics_dSink_dspansKey (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)]))

# 58 "Vuna/Compiler/Diagnostics/Sink.vuna"
let rec v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (((v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeGo dtb__4) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeGo dtb__4) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) true) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__3, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDiagnostics_dSink_ddiagKey dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Diagnostics/Sink.vuna"
let v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings = (fun ds -> (((v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeGo ds) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))
