open Vuna_runtime
type t_Severity = C_Severity_SevError | C_Severity_SevWarning | C_Severity_SevNote | C_Severity_SevHelp
and t_Phase = C_Phase_PhLex | C_Phase_PhParse | C_Phase_PhResolve | C_Phase_PhLoad | C_Phase_PhElab | C_Phase_PhUnify | C_Phase_PhCoverage | C_Phase_PhTermination | C_Phase_PhUsage | C_Phase_PhCodegen | C_Phase_PhPackage | C_Phase_PhDriver | C_Phase_PhTool | C_Phase_PhInternal
and t_Category = C_Category_CatSyntax | C_Category_CatNames | C_Category_CatTypes | C_Category_CatUniverses | C_Category_CatCoverage | C_Category_CatTermination | C_Category_CatQuantity | C_Category_CatEffects | C_Category_CatRecords | C_Category_CatTraits | C_Category_CatCodegen | C_Category_CatPackage | C_Category_CatTool | C_Category_CatInternal
and t_LabelStyle = C_LabelStyle_LabelPrimary | C_LabelStyle_LabelSecondary | C_LabelStyle_LabelContext
and t_Origin = C_Origin_OriginDirect | C_Origin_OriginCascade of (int B_dData_dMaybe.t_Maybe)
and t_Applicability = C_Applicability_MachineApplicable | C_Applicability_MaybeIncorrect | C_Applicability_HasPlaceholder
and t_NoSourceReason = C_NoSourceReason_NsSynthetic | C_NoSourceReason_NsToolUsage | C_NoSourceReason_NsPackageGraph | C_NoSourceReason_NsInternal
and t_Stability = C_Stability_Stable | C_Stability_Volatile
and t_Label = { f_Label_labelSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe; f_Label_labelText : string; f_Label_labelStyle : t_LabelStyle; f_Label_labelProvenance : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_DiagEdit = { f_DiagEdit_editSpan : Base_dSource.t_Span; f_DiagEdit_editNewText : string }
and t_Suggestion = { f_Suggestion_suggestionTitle : string; f_Suggestion_suggestionApplicability : t_Applicability; f_Suggestion_suggestionEdits : t_DiagEdit B_dData_dList.t_List }
and t_Candidate = { f_Candidate_candidateText : string; f_Candidate_candidateSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe; f_Candidate_candidateReason : string B_dData_dMaybe.t_Maybe }
and t_CallInfo = { f_CallInfo_callCallee : string; f_CallInfo_callArg : string; f_CallInfo_callRelation : string; f_CallInfo_callSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_DiagField = C_DiagField_FieldExpected of (string) | C_DiagField_FieldFound of (string) | C_DiagField_FieldName of (string) | C_DiagField_FieldCandidates of (t_Candidate B_dData_dList.t_List) | C_DiagField_FieldCall of (t_CallInfo) | C_DiagField_FieldQuantity of (string) * (int) * (int) | C_DiagField_FieldEffect of (string) | C_DiagField_FieldModule of (string) | C_DiagField_FieldSpan of (string) * (Base_dSource.t_Span) | C_DiagField_FieldNote of (string)
and t_TraceFrame = { f_TraceFrame_tracePhase : t_Phase; f_TraceFrame_traceText : string; f_TraceFrame_traceSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe; f_TraceFrame_traceChildren : t_TraceFrame B_dData_dList.t_List }
and t_IceInfo = { f_IceInfo_icePhase : t_Phase; f_IceInfo_iceFunction : string; f_IceInfo_iceInvariant : string; f_IceInfo_iceFingerprint : string; f_IceInfo_iceHint : string }
and t_Diagnostic = { f_Diagnostic_diagId : int; f_Diagnostic_diagSeverity : t_Severity; f_Diagnostic_diagPhase : t_Phase; f_Diagnostic_diagCategory : t_Category; f_Diagnostic_diagCode : string; f_Diagnostic_diagMessage : string; f_Diagnostic_diagLabels : t_Label B_dData_dList.t_List; f_Diagnostic_diagFields : t_DiagField B_dData_dList.t_List; f_Diagnostic_diagTrace : t_TraceFrame B_dData_dList.t_List; f_Diagnostic_diagNotes : string B_dData_dList.t_List; f_Diagnostic_diagSuggestions : t_Suggestion B_dData_dList.t_List; f_Diagnostic_diagOrigin : t_Origin; f_Diagnostic_diagChildren : t_Diagnostic B_dData_dList.t_List; f_Diagnostic_diagInternal : bool; f_Diagnostic_diagIce : t_IceInfo B_dData_dMaybe.t_Maybe; f_Diagnostic_diagAbsent : t_NoSourceReason B_dData_dMaybe.t_Maybe; f_Diagnostic_diagStability : t_Stability }
and 'a0 t_Check = C_Check_OkC of ('a0) | C_Check_ErrC of (t_Diagnostic)

# 523 "Vuna/Compiler/Base/Diag.vuna"
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun mc0 mc1 -> (match mc1 with
  | C_Check_ErrC (dtb__0) -> (C_Check_ErrC (dtb__0))
  | C_Check_OkC (dtb__1) -> (C_Check_OkC ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 527 "Vuna/Compiler/Base/Diag.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun mc0 mc1 -> (match mc0 with
  | C_Check_ErrC (dtb__2) -> (C_Check_ErrC (dtb__2))
  | C_Check_OkC (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 531 "Vuna/Compiler/Base/Diag.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun _heta0 -> (C_Check_OkC (_heta0)))) : Obj.t), ((Obj.magic (fun mf mx -> (match mf with
  | C_Check_OkC (dtb__4) -> (match mx with
  | C_Check_OkC (dtb__5) -> (C_Check_OkC ((dtb__4 dtb__5)))
  | C_Check_ErrC (dtb__6) -> (C_Check_ErrC (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Check_ErrC (dtb__7) -> (C_Check_ErrC (dtb__7))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Check_ErrC (dtb__8) -> (C_Check_ErrC (dtb__8))
  | C_Check_OkC (dtb__9) -> (match mc2 with
  | C_Check_ErrC (dtb__10) -> (C_Check_ErrC (dtb__10))
  | C_Check_OkC (dtb__11) -> (C_Check_OkC (((mc0 dtb__9) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 192 "Vuna/Compiler/Base/Diag.vuna"
let v_diagNoLoc = (fun (sev : t_Severity) (phase : t_Phase) (cat : t_Category) (code : string) (msg : string) -> { f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = sev; f_Diagnostic_diagPhase = phase; f_Diagnostic_diagCategory = cat; f_Diagnostic_diagCode = code; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsSynthetic)); f_Diagnostic_diagStability = C_Stability_Volatile })

# 214 "Vuna/Compiler/Base/Diag.vuna"
let v_diagAt = (fun (sp : Base_dSource.t_Span) (sev : t_Severity) (phase : t_Phase) (cat : t_Category) (code : string) (msg : string) -> { f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = sev; f_Diagnostic_diagPhase = phase; f_Diagnostic_diagCategory = cat; f_Diagnostic_diagCode = code; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = (B_dData_dList.C_List__x58__x58_ ({ f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagStability = C_Stability_Stable })

# 236 "Vuna/Compiler/Base/Diag.vuna"
let v_err = (fun (msg : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhTool; f_Diagnostic_diagCategory = C_Category_CatTool; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsToolUsage)); f_Diagnostic_diagStability = C_Stability_Volatile })))

# 242 "Vuna/Compiler/Base/Diag.vuna"
let v_rawAt = (fun (sp : Base_dSource.t_Span) (msg : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhElab; f_Diagnostic_diagCategory = C_Category_CatTypes; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = (B_dData_dList.C_List__x58__x58_ ({ f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagStability = C_Stability_Stable })))

# 248 "Vuna/Compiler/Base/Diag.vuna"
let v_rawNoLoc = (fun (msg : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhElab; f_Diagnostic_diagCategory = C_Category_CatTypes; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsSynthetic)); f_Diagnostic_diagStability = C_Stability_Volatile })))

# 271 "Vuna/Compiler/Base/Diag.vuna"
let v_withStability = (fun (s : t_Stability) (d : t_Diagnostic) -> { d with f_Diagnostic_diagStability = s })

# 305 "Vuna/Compiler/Base/Diag.vuna"
let v_mapSpanPath = (fun (mc0 : (string) -> string) (mc1 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = (mc0 (dtb__12).Base_dSource.f_Span_spanFile); Base_dSource.f_Span_spanStartLine = (dtb__12).Base_dSource.f_Span_spanStartLine; Base_dSource.f_Span_spanStartCol = (dtb__12).Base_dSource.f_Span_spanStartCol; Base_dSource.f_Span_spanEndLine = (dtb__12).Base_dSource.f_Span_spanEndLine; Base_dSource.f_Span_spanEndCol = (dtb__12).Base_dSource.f_Span_spanEndCol; Base_dSource.f_Span_spanStartOffset = (dtb__12).Base_dSource.f_Span_spanStartOffset; Base_dSource.f_Span_spanEndOffset = (dtb__12).Base_dSource.f_Span_spanEndOffset }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Base/Diag.vuna"
let v_mapLabelFile = (fun (mc0 : (string) -> string) (mc1 : t_Label) -> (match mc1 with
  | { f_Label_labelSpan = dtb__13; f_Label_labelText = dtb__14; f_Label_labelStyle = dtb__15; f_Label_labelProvenance = dtb__16 } -> { f_Label_labelSpan = ((v_mapSpanPath mc0) dtb__13); f_Label_labelText = dtb__14; f_Label_labelStyle = dtb__15; f_Label_labelProvenance = ((v_mapSpanPath mc0) dtb__16) }
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Base/Diag.vuna"
let rec v_mapSpanFile = (fun (mc0 : (string) -> string) (mc1 : t_Diagnostic) -> (match mc1 with
  | { f_Diagnostic_diagId = dtb__17; f_Diagnostic_diagSeverity = dtb__18; f_Diagnostic_diagPhase = dtb__19; f_Diagnostic_diagCategory = dtb__20; f_Diagnostic_diagCode = dtb__21; f_Diagnostic_diagMessage = dtb__22; f_Diagnostic_diagLabels = dtb__23; f_Diagnostic_diagFields = dtb__24; f_Diagnostic_diagTrace = dtb__25; f_Diagnostic_diagNotes = dtb__26; f_Diagnostic_diagSuggestions = dtb__27; f_Diagnostic_diagOrigin = dtb__28; f_Diagnostic_diagChildren = dtb__29; f_Diagnostic_diagInternal = dtb__30; f_Diagnostic_diagIce = dtb__31; f_Diagnostic_diagAbsent = dtb__32; f_Diagnostic_diagStability = dtb__33 } -> { f_Diagnostic_diagId = dtb__17; f_Diagnostic_diagSeverity = dtb__18; f_Diagnostic_diagPhase = dtb__19; f_Diagnostic_diagCategory = dtb__20; f_Diagnostic_diagCode = dtb__21; f_Diagnostic_diagMessage = dtb__22; f_Diagnostic_diagLabels = ((B_dData_dList.v_map (v_mapLabelFile mc0)) dtb__23); f_Diagnostic_diagFields = dtb__24; f_Diagnostic_diagTrace = dtb__25; f_Diagnostic_diagNotes = dtb__26; f_Diagnostic_diagSuggestions = dtb__27; f_Diagnostic_diagOrigin = dtb__28; f_Diagnostic_diagChildren = ((v_mapDiagChildren mc0) dtb__29); f_Diagnostic_diagInternal = dtb__30; f_Diagnostic_diagIce = dtb__31; f_Diagnostic_diagAbsent = dtb__32; f_Diagnostic_diagStability = dtb__33 }
  | _ -> failwith "DT: impossible branch"
))
# 297 "Vuna/Compiler/Base/Diag.vuna"
and v_mapDiagChildren = (fun (mc0 : (string) -> string) (mc1 : t_Diagnostic B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (B_dData_dList.C_List__x58__x58_ (((v_mapSpanFile mc0) dtb__34), ((v_mapDiagChildren mc0) dtb__35)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Base/Diag.vuna"
let v_stabilityOfAbsent = (fun (mc0 : t_NoSourceReason) -> (match mc0 with
  | C_NoSourceReason_NsInternal -> C_Stability_Volatile
  | C_NoSourceReason_NsPackageGraph -> C_Stability_Volatile
  | C_NoSourceReason_NsToolUsage -> C_Stability_Volatile
  | C_NoSourceReason_NsSynthetic -> C_Stability_Volatile
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Base/Diag.vuna"
let v_withField = (fun (f : t_DiagField) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = ((B_dData_dList.v_append (d).f_Diagnostic_diagFields) (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil))); f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 348 "Vuna/Compiler/Base/Diag.vuna"
let v_withNote = (fun (n : string) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = ((B_dData_dList.v_append (d).f_Diagnostic_diagNotes) (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))); f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 370 "Vuna/Compiler/Base/Diag.vuna"
let v_withHelp = (fun (h : string) (d : t_Diagnostic) -> ((v_withNote ("help: " ^ h)) d))

# 374 "Vuna/Compiler/Base/Diag.vuna"
let v_withSuggestion = (fun (s : t_Suggestion) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = ((B_dData_dList.v_append (d).f_Diagnostic_diagSuggestions) (B_dData_dList.C_List__x58__x58_ (s, B_dData_dList.C_List_Nil))); f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 396 "Vuna/Compiler/Base/Diag.vuna"
let v_withTrace = (fun (t : t_TraceFrame) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = ((B_dData_dList.v_append (d).f_Diagnostic_diagTrace) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))); f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 418 "Vuna/Compiler/Base/Diag.vuna"
let v_withOrigin = (fun (o : t_Origin) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = o; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 452 "Vuna/Compiler/Base/Diag.vuna"
let rec v_primarySpanOf = (fun (mc0 : t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__36 with
  | { f_Label_labelSpan = dtb__38; f_Label_labelText = dtb__39; f_Label_labelStyle = dtb__40; f_Label_labelProvenance = dtb__41 } -> (match dtb__40 with
  | C_LabelStyle_LabelPrimary -> dtb__38
  | _ -> (v_primarySpanOf dtb__37)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Base/Diag.vuna"
let rec v_contextPrefixOf = (fun (mc0 : t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { f_Label_labelSpan = dtb__44; f_Label_labelText = dtb__45; f_Label_labelStyle = dtb__46; f_Label_labelProvenance = dtb__47 } -> (match dtb__46 with
  | C_LabelStyle_LabelContext -> (dtb__45 ^ ": ")
  | _ -> (v_contextPrefixOf dtb__43)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Base/Diag.vuna"
let v_locPrefixOf = (fun (labels : t_Label B_dData_dList.t_List) -> (match (v_primarySpanOf labels) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> ((Base_dSource.v_showSpanLoc dtb__48) ^ ": ")
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Base/Diag.vuna"
let v_diagText = (fun (d : t_Diagnostic) -> (let body = (if ((d).f_Diagnostic_diagCode = "") then (d).f_Diagnostic_diagMessage else (String.concat "" ["["; (d).f_Diagnostic_diagCode; "] "; (d).f_Diagnostic_diagMessage])) in (String.concat "" [(v_locPrefixOf (d).f_Diagnostic_diagLabels); (v_contextPrefixOf (d).f_Diagnostic_diagLabels); body])))

# 478 "Vuna/Compiler/Base/Diag.vuna"
let v_withMessage = (fun (msg : string) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = msg; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 500 "Vuna/Compiler/Base/Diag.vuna"
let v_appendMessage = (fun (suffix : string) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = ((d).f_Diagnostic_diagMessage ^ suffix); f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 547 "Vuna/Compiler/Base/Diag.vuna"
let v_withChildren = (fun (cs : t_Diagnostic B_dData_dList.t_List) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = cs; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 596 "Vuna/Compiler/Base/Diag.vuna"
let v_withLabelFileIfEmpty = (fun (mc0 : string) (mc1 : t_Label) -> (match mc1 with
  | { f_Label_labelSpan = dtb__49; f_Label_labelText = dtb__50; f_Label_labelStyle = dtb__51; f_Label_labelProvenance = dtb__52 } -> (match dtb__49 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (if ((Base_dSource.v_spanFile dtb__53) = "") then { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine dtb__53); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol dtb__53); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine dtb__53); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol dtb__53); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset dtb__53); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset dtb__53) })); f_Label_labelText = dtb__50; f_Label_labelStyle = dtb__51; f_Label_labelProvenance = dtb__52 } else { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__53)); f_Label_labelText = dtb__50; f_Label_labelStyle = dtb__51; f_Label_labelProvenance = dtb__52 })
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_Label_labelSpan = B_dData_dMaybe.C_Maybe_Nothing; f_Label_labelText = dtb__50; f_Label_labelStyle = dtb__51; f_Label_labelProvenance = dtb__52 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Base/Diag.vuna"
let v_withSpanFileIfEmpty = (fun (path : string) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = ((B_dData_dList.v_map (v_withLabelFileIfEmpty path)) (d).f_Diagnostic_diagLabels); f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability })

# 608 "Vuna/Compiler/Base/Diag.vuna"
let rec v_hasPrimaryLabel = (fun (mc0 : t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__54 with
  | { f_Label_labelSpan = dtb__56; f_Label_labelText = dtb__57; f_Label_labelStyle = dtb__58; f_Label_labelProvenance = dtb__59 } -> (match dtb__58 with
  | C_LabelStyle_LabelPrimary -> true
  | _ -> (v_hasPrimaryLabel dtb__55)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Base/Diag.vuna"
let v_normalizeSite = (fun (d : t_Diagnostic) -> (if (v_hasPrimaryLabel (d).f_Diagnostic_diagLabels) then { { d with f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing } with f_Diagnostic_diagStability = C_Stability_Stable } else d))

# 257 "Vuna/Compiler/Base/Diag.vuna"
let v_withLabel = (fun (l : t_Label) (d : t_Diagnostic) -> (v_normalizeSite { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = ((B_dData_dList.v_append (d).f_Diagnostic_diagLabels) (B_dData_dList.C_List__x58__x58_ (l, B_dData_dList.C_List_Nil))); f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (d).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (d).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (d).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (d).f_Diagnostic_diagStability }))

# 312 "Vuna/Compiler/Base/Diag.vuna"
let v_withAbsent = (fun (reason : t_NoSourceReason) (d : t_Diagnostic) -> (if (v_hasPrimaryLabel (d).f_Diagnostic_diagLabels) then d else { { d with f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (reason)) } with f_Diagnostic_diagStability = (v_stabilityOfAbsent reason) }))

# 440 "Vuna/Compiler/Base/Diag.vuna"
let v_withContext = (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (name : string) (d : t_Diagnostic) -> (let added = ((v_withLabel { f_Label_labelSpan = msp; f_Label_labelText = (String.concat "" ["in `"; name; "`"]); f_Label_labelStyle = C_LabelStyle_LabelContext; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) d) in (match msp with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> ((v_withLabel { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__60)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) added)
  | B_dData_dMaybe.C_Maybe_Nothing -> added
  | _ -> failwith "DT: impossible branch"
)))

# 569 "Vuna/Compiler/Base/Diag.vuna"
let v_withFallbackSpan = (fun (sp : Base_dSource.t_Span) (d : t_Diagnostic) -> (if (v_hasPrimaryLabel (d).f_Diagnostic_diagLabels) then d else ((v_withLabel { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) d)))

# 617 "Vuna/Compiler/Base/Diag.vuna"
let v_markInternal = (fun (fn : string) (invariant : string) (d : t_Diagnostic) -> { f_Diagnostic_diagId = (d).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (d).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (d).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (d).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (d).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (d).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (d).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (d).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (d).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (d).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (d).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (d).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (d).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = true; f_Diagnostic_diagIce = (B_dData_dMaybe.C_Maybe_Just ({ f_IceInfo_icePhase = C_Phase_PhInternal; f_IceInfo_iceFunction = fn; f_IceInfo_iceInvariant = invariant; f_IceInfo_iceFingerprint = ""; f_IceInfo_iceHint = "this is a compiler bug; please report it with the command line and source" })); f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsInternal)); f_Diagnostic_diagStability = C_Stability_Volatile })

# 639 "Vuna/Compiler/Base/Diag.vuna"
let v_icFuel = (fun (phase : string) -> (C_Check_ErrC ((((v_markInternal "fuel") phase) (((((v_diagNoLoc C_Severity_SevError) C_Phase_PhInternal) C_Category_CatInternal) "IC_FuelExhausted") (phase ^ " ran out of fuel (compiler invariant: the phase must make progress)"))))))

# 645 "Vuna/Compiler/Base/Diag.vuna"
let v_icInternal = (fun (what : string) -> (C_Check_ErrC ((((v_markInternal "invariant") what) (((((v_diagNoLoc C_Severity_SevError) C_Phase_PhInternal) C_Category_CatInternal) "IC_InvariantViolated") ("internal invariant violated: " ^ what))))))

# 651 "Vuna/Compiler/Base/Diag.vuna"
let v_onErrDiag = (fun (mc0 : (t_Diagnostic) -> t_Diagnostic) mc1 -> (match mc1 with
  | C_Check_OkC (dtb__61) -> (C_Check_OkC (dtb__61))
  | C_Check_ErrC (dtb__62) -> (C_Check_ErrC ((mc0 dtb__62)))
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Base/Diag.vuna"
let rec v_primaryLabelOf = (fun (mc0 : t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (let nd_uscrut4 = dtb__63 in (match nd_uscrut4 with
  | { f_Label_labelSpan = dtb__65; f_Label_labelText = dtb__66; f_Label_labelStyle = dtb__67; f_Label_labelProvenance = dtb__68 } -> (match dtb__67 with
  | C_LabelStyle_LabelPrimary -> (B_dData_dMaybe.C_Maybe_Just (dtb__63))
  | _ -> (v_primaryLabelOf dtb__64)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Base/Diag.vuna"
let v_diagFileOf = (fun (d : t_Diagnostic) -> (let nd_uscrut1 = (v_primaryLabelOf (d).f_Diagnostic_diagLabels) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (match dtb__69 with
  | { f_Label_labelSpan = dtb__70; f_Label_labelText = dtb__71; f_Label_labelStyle = dtb__72; f_Label_labelProvenance = dtb__73 } -> (match dtb__70 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (Base_dSource.v_spanFile dtb__74)
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

# 670 "Vuna/Compiler/Base/Diag.vuna"
let v_sameSeverity = (fun (mc0 : t_Severity) (mc1 : t_Severity) -> (match mc0 with
  | C_Severity_SevHelp -> (match mc1 with
  | C_Severity_SevHelp -> true
  | _ -> false
)
  | C_Severity_SevNote -> (match mc1 with
  | C_Severity_SevNote -> true
  | _ -> false
)
  | C_Severity_SevWarning -> (match mc1 with
  | C_Severity_SevWarning -> true
  | _ -> false
)
  | C_Severity_SevError -> (match mc1 with
  | C_Severity_SevError -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Base/Diag.vuna"
let rec v_labelSpanOf = (fun (mc0 : t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { f_Label_labelSpan = dtb__77; f_Label_labelText = dtb__78; f_Label_labelStyle = dtb__79; f_Label_labelProvenance = dtb__80 } -> (match dtb__77 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = 0 } } }, (v_labelSpanOf dtb__76)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanFile dtb__81); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartLine dtb__81); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartCol dtb__81); B_dData_dPair.f_Pair_second = (Base_dSource.v_spanEndLine dtb__81) } } }, (v_labelSpanOf dtb__76)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 678 "Vuna/Compiler/Base/Diag.vuna"
let v_sameDiag = (fun (a : t_Diagnostic) (b : t_Diagnostic) -> (if (if (if ((a).f_Diagnostic_diagCode = (b).f_Diagnostic_diagCode) then ((a).f_Diagnostic_diagMessage = (b).f_Diagnostic_diagMessage) else false) then ((v_sameSeverity (a).f_Diagnostic_diagSeverity) (b).f_Diagnostic_diagSeverity) else false) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt))))) (v_labelSpanOf (a).f_Diagnostic_diagLabels)) (v_labelSpanOf (b).f_Diagnostic_diagLabels)) else false))

# 100 "Vuna/Compiler/Base/Diag.vuna"
let v_labelSpan = (fun (p : t_Label) -> (match p with
  | { f_Label_labelSpan = dtb__82; f_Label_labelText = dtb__83; f_Label_labelStyle = dtb__84; f_Label_labelProvenance = dtb__85 } -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Base/Diag.vuna"
let v_labelText = (fun (p : t_Label) -> (match p with
  | { f_Label_labelSpan = dtb__86; f_Label_labelText = dtb__87; f_Label_labelStyle = dtb__88; f_Label_labelProvenance = dtb__89 } -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Base/Diag.vuna"
let v_labelStyle = (fun (p : t_Label) -> (match p with
  | { f_Label_labelSpan = dtb__90; f_Label_labelText = dtb__91; f_Label_labelStyle = dtb__92; f_Label_labelProvenance = dtb__93 } -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Base/Diag.vuna"
let v_labelProvenance = (fun (p : t_Label) -> (match p with
  | { f_Label_labelSpan = dtb__94; f_Label_labelText = dtb__95; f_Label_labelStyle = dtb__96; f_Label_labelProvenance = dtb__97 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Base/Diag.vuna"
let v_editSpan = (fun (p : t_DiagEdit) -> (match p with
  | { f_DiagEdit_editSpan = dtb__98; f_DiagEdit_editNewText = dtb__99 } -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Base/Diag.vuna"
let v_editNewText = (fun (p : t_DiagEdit) -> (match p with
  | { f_DiagEdit_editSpan = dtb__100; f_DiagEdit_editNewText = dtb__101 } -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionTitle = (fun (p : t_Suggestion) -> (match p with
  | { f_Suggestion_suggestionTitle = dtb__102; f_Suggestion_suggestionApplicability = dtb__103; f_Suggestion_suggestionEdits = dtb__104 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionApplicability = (fun (p : t_Suggestion) -> (match p with
  | { f_Suggestion_suggestionTitle = dtb__105; f_Suggestion_suggestionApplicability = dtb__106; f_Suggestion_suggestionEdits = dtb__107 } -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionEdits = (fun (p : t_Suggestion) -> (match p with
  | { f_Suggestion_suggestionTitle = dtb__108; f_Suggestion_suggestionApplicability = dtb__109; f_Suggestion_suggestionEdits = dtb__110 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateText = (fun (p : t_Candidate) -> (match p with
  | { f_Candidate_candidateText = dtb__111; f_Candidate_candidateSpan = dtb__112; f_Candidate_candidateReason = dtb__113 } -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateSpan = (fun (p : t_Candidate) -> (match p with
  | { f_Candidate_candidateText = dtb__114; f_Candidate_candidateSpan = dtb__115; f_Candidate_candidateReason = dtb__116 } -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateReason = (fun (p : t_Candidate) -> (match p with
  | { f_Candidate_candidateText = dtb__117; f_Candidate_candidateSpan = dtb__118; f_Candidate_candidateReason = dtb__119 } -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Base/Diag.vuna"
let v_callCallee = (fun (p : t_CallInfo) -> (match p with
  | { f_CallInfo_callCallee = dtb__120; f_CallInfo_callArg = dtb__121; f_CallInfo_callRelation = dtb__122; f_CallInfo_callSpan = dtb__123 } -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Base/Diag.vuna"
let v_callArg = (fun (p : t_CallInfo) -> (match p with
  | { f_CallInfo_callCallee = dtb__124; f_CallInfo_callArg = dtb__125; f_CallInfo_callRelation = dtb__126; f_CallInfo_callSpan = dtb__127 } -> dtb__125
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Base/Diag.vuna"
let v_callRelation = (fun (p : t_CallInfo) -> (match p with
  | { f_CallInfo_callCallee = dtb__128; f_CallInfo_callArg = dtb__129; f_CallInfo_callRelation = dtb__130; f_CallInfo_callSpan = dtb__131 } -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Base/Diag.vuna"
let v_callSpan = (fun (p : t_CallInfo) -> (match p with
  | { f_CallInfo_callCallee = dtb__132; f_CallInfo_callArg = dtb__133; f_CallInfo_callRelation = dtb__134; f_CallInfo_callSpan = dtb__135 } -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Base/Diag.vuna"
let v_tracePhase = (fun (p : t_TraceFrame) -> (match p with
  | { f_TraceFrame_tracePhase = dtb__136; f_TraceFrame_traceText = dtb__137; f_TraceFrame_traceSpan = dtb__138; f_TraceFrame_traceChildren = dtb__139 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Base/Diag.vuna"
let v_traceText = (fun (p : t_TraceFrame) -> (match p with
  | { f_TraceFrame_tracePhase = dtb__140; f_TraceFrame_traceText = dtb__141; f_TraceFrame_traceSpan = dtb__142; f_TraceFrame_traceChildren = dtb__143 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Base/Diag.vuna"
let v_traceSpan = (fun (p : t_TraceFrame) -> (match p with
  | { f_TraceFrame_tracePhase = dtb__144; f_TraceFrame_traceText = dtb__145; f_TraceFrame_traceSpan = dtb__146; f_TraceFrame_traceChildren = dtb__147 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Base/Diag.vuna"
let v_traceChildren = (fun (p : t_TraceFrame) -> (match p with
  | { f_TraceFrame_tracePhase = dtb__148; f_TraceFrame_traceText = dtb__149; f_TraceFrame_traceSpan = dtb__150; f_TraceFrame_traceChildren = dtb__151 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Base/Diag.vuna"
let v_icePhase = (fun (p : t_IceInfo) -> (match p with
  | { f_IceInfo_icePhase = dtb__152; f_IceInfo_iceFunction = dtb__153; f_IceInfo_iceInvariant = dtb__154; f_IceInfo_iceFingerprint = dtb__155; f_IceInfo_iceHint = dtb__156 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Base/Diag.vuna"
let v_iceFunction = (fun (p : t_IceInfo) -> (match p with
  | { f_IceInfo_icePhase = dtb__157; f_IceInfo_iceFunction = dtb__158; f_IceInfo_iceInvariant = dtb__159; f_IceInfo_iceFingerprint = dtb__160; f_IceInfo_iceHint = dtb__161 } -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Base/Diag.vuna"
let v_iceInvariant = (fun (p : t_IceInfo) -> (match p with
  | { f_IceInfo_icePhase = dtb__162; f_IceInfo_iceFunction = dtb__163; f_IceInfo_iceInvariant = dtb__164; f_IceInfo_iceFingerprint = dtb__165; f_IceInfo_iceHint = dtb__166 } -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Base/Diag.vuna"
let v_iceFingerprint = (fun (p : t_IceInfo) -> (match p with
  | { f_IceInfo_icePhase = dtb__167; f_IceInfo_iceFunction = dtb__168; f_IceInfo_iceInvariant = dtb__169; f_IceInfo_iceFingerprint = dtb__170; f_IceInfo_iceHint = dtb__171 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Diag.vuna"
let v_iceHint = (fun (p : t_IceInfo) -> (match p with
  | { f_IceInfo_icePhase = dtb__172; f_IceInfo_iceFunction = dtb__173; f_IceInfo_iceInvariant = dtb__174; f_IceInfo_iceFingerprint = dtb__175; f_IceInfo_iceHint = dtb__176 } -> dtb__176
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Base/Diag.vuna"
let v_diagId = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__177; f_Diagnostic_diagSeverity = dtb__178; f_Diagnostic_diagPhase = dtb__179; f_Diagnostic_diagCategory = dtb__180; f_Diagnostic_diagCode = dtb__181; f_Diagnostic_diagMessage = dtb__182; f_Diagnostic_diagLabels = dtb__183; f_Diagnostic_diagFields = dtb__184; f_Diagnostic_diagTrace = dtb__185; f_Diagnostic_diagNotes = dtb__186; f_Diagnostic_diagSuggestions = dtb__187; f_Diagnostic_diagOrigin = dtb__188; f_Diagnostic_diagChildren = dtb__189; f_Diagnostic_diagInternal = dtb__190; f_Diagnostic_diagIce = dtb__191; f_Diagnostic_diagAbsent = dtb__192; f_Diagnostic_diagStability = dtb__193 } -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Base/Diag.vuna"
let v_diagSeverity = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__194; f_Diagnostic_diagSeverity = dtb__195; f_Diagnostic_diagPhase = dtb__196; f_Diagnostic_diagCategory = dtb__197; f_Diagnostic_diagCode = dtb__198; f_Diagnostic_diagMessage = dtb__199; f_Diagnostic_diagLabels = dtb__200; f_Diagnostic_diagFields = dtb__201; f_Diagnostic_diagTrace = dtb__202; f_Diagnostic_diagNotes = dtb__203; f_Diagnostic_diagSuggestions = dtb__204; f_Diagnostic_diagOrigin = dtb__205; f_Diagnostic_diagChildren = dtb__206; f_Diagnostic_diagInternal = dtb__207; f_Diagnostic_diagIce = dtb__208; f_Diagnostic_diagAbsent = dtb__209; f_Diagnostic_diagStability = dtb__210 } -> dtb__195
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Base/Diag.vuna"
let v_diagPhase = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__211; f_Diagnostic_diagSeverity = dtb__212; f_Diagnostic_diagPhase = dtb__213; f_Diagnostic_diagCategory = dtb__214; f_Diagnostic_diagCode = dtb__215; f_Diagnostic_diagMessage = dtb__216; f_Diagnostic_diagLabels = dtb__217; f_Diagnostic_diagFields = dtb__218; f_Diagnostic_diagTrace = dtb__219; f_Diagnostic_diagNotes = dtb__220; f_Diagnostic_diagSuggestions = dtb__221; f_Diagnostic_diagOrigin = dtb__222; f_Diagnostic_diagChildren = dtb__223; f_Diagnostic_diagInternal = dtb__224; f_Diagnostic_diagIce = dtb__225; f_Diagnostic_diagAbsent = dtb__226; f_Diagnostic_diagStability = dtb__227 } -> dtb__213
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Base/Diag.vuna"
let v_diagCategory = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__228; f_Diagnostic_diagSeverity = dtb__229; f_Diagnostic_diagPhase = dtb__230; f_Diagnostic_diagCategory = dtb__231; f_Diagnostic_diagCode = dtb__232; f_Diagnostic_diagMessage = dtb__233; f_Diagnostic_diagLabels = dtb__234; f_Diagnostic_diagFields = dtb__235; f_Diagnostic_diagTrace = dtb__236; f_Diagnostic_diagNotes = dtb__237; f_Diagnostic_diagSuggestions = dtb__238; f_Diagnostic_diagOrigin = dtb__239; f_Diagnostic_diagChildren = dtb__240; f_Diagnostic_diagInternal = dtb__241; f_Diagnostic_diagIce = dtb__242; f_Diagnostic_diagAbsent = dtb__243; f_Diagnostic_diagStability = dtb__244 } -> dtb__231
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Base/Diag.vuna"
let v_diagCode = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__245; f_Diagnostic_diagSeverity = dtb__246; f_Diagnostic_diagPhase = dtb__247; f_Diagnostic_diagCategory = dtb__248; f_Diagnostic_diagCode = dtb__249; f_Diagnostic_diagMessage = dtb__250; f_Diagnostic_diagLabels = dtb__251; f_Diagnostic_diagFields = dtb__252; f_Diagnostic_diagTrace = dtb__253; f_Diagnostic_diagNotes = dtb__254; f_Diagnostic_diagSuggestions = dtb__255; f_Diagnostic_diagOrigin = dtb__256; f_Diagnostic_diagChildren = dtb__257; f_Diagnostic_diagInternal = dtb__258; f_Diagnostic_diagIce = dtb__259; f_Diagnostic_diagAbsent = dtb__260; f_Diagnostic_diagStability = dtb__261 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Base/Diag.vuna"
let v_diagMessage = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__262; f_Diagnostic_diagSeverity = dtb__263; f_Diagnostic_diagPhase = dtb__264; f_Diagnostic_diagCategory = dtb__265; f_Diagnostic_diagCode = dtb__266; f_Diagnostic_diagMessage = dtb__267; f_Diagnostic_diagLabels = dtb__268; f_Diagnostic_diagFields = dtb__269; f_Diagnostic_diagTrace = dtb__270; f_Diagnostic_diagNotes = dtb__271; f_Diagnostic_diagSuggestions = dtb__272; f_Diagnostic_diagOrigin = dtb__273; f_Diagnostic_diagChildren = dtb__274; f_Diagnostic_diagInternal = dtb__275; f_Diagnostic_diagIce = dtb__276; f_Diagnostic_diagAbsent = dtb__277; f_Diagnostic_diagStability = dtb__278 } -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Base/Diag.vuna"
let v_diagLabels = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__279; f_Diagnostic_diagSeverity = dtb__280; f_Diagnostic_diagPhase = dtb__281; f_Diagnostic_diagCategory = dtb__282; f_Diagnostic_diagCode = dtb__283; f_Diagnostic_diagMessage = dtb__284; f_Diagnostic_diagLabels = dtb__285; f_Diagnostic_diagFields = dtb__286; f_Diagnostic_diagTrace = dtb__287; f_Diagnostic_diagNotes = dtb__288; f_Diagnostic_diagSuggestions = dtb__289; f_Diagnostic_diagOrigin = dtb__290; f_Diagnostic_diagChildren = dtb__291; f_Diagnostic_diagInternal = dtb__292; f_Diagnostic_diagIce = dtb__293; f_Diagnostic_diagAbsent = dtb__294; f_Diagnostic_diagStability = dtb__295 } -> dtb__285
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Base/Diag.vuna"
let v_diagFields = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__296; f_Diagnostic_diagSeverity = dtb__297; f_Diagnostic_diagPhase = dtb__298; f_Diagnostic_diagCategory = dtb__299; f_Diagnostic_diagCode = dtb__300; f_Diagnostic_diagMessage = dtb__301; f_Diagnostic_diagLabels = dtb__302; f_Diagnostic_diagFields = dtb__303; f_Diagnostic_diagTrace = dtb__304; f_Diagnostic_diagNotes = dtb__305; f_Diagnostic_diagSuggestions = dtb__306; f_Diagnostic_diagOrigin = dtb__307; f_Diagnostic_diagChildren = dtb__308; f_Diagnostic_diagInternal = dtb__309; f_Diagnostic_diagIce = dtb__310; f_Diagnostic_diagAbsent = dtb__311; f_Diagnostic_diagStability = dtb__312 } -> dtb__303
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Base/Diag.vuna"
let v_diagTrace = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__313; f_Diagnostic_diagSeverity = dtb__314; f_Diagnostic_diagPhase = dtb__315; f_Diagnostic_diagCategory = dtb__316; f_Diagnostic_diagCode = dtb__317; f_Diagnostic_diagMessage = dtb__318; f_Diagnostic_diagLabels = dtb__319; f_Diagnostic_diagFields = dtb__320; f_Diagnostic_diagTrace = dtb__321; f_Diagnostic_diagNotes = dtb__322; f_Diagnostic_diagSuggestions = dtb__323; f_Diagnostic_diagOrigin = dtb__324; f_Diagnostic_diagChildren = dtb__325; f_Diagnostic_diagInternal = dtb__326; f_Diagnostic_diagIce = dtb__327; f_Diagnostic_diagAbsent = dtb__328; f_Diagnostic_diagStability = dtb__329 } -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Diag.vuna"
let v_diagNotes = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__330; f_Diagnostic_diagSeverity = dtb__331; f_Diagnostic_diagPhase = dtb__332; f_Diagnostic_diagCategory = dtb__333; f_Diagnostic_diagCode = dtb__334; f_Diagnostic_diagMessage = dtb__335; f_Diagnostic_diagLabels = dtb__336; f_Diagnostic_diagFields = dtb__337; f_Diagnostic_diagTrace = dtb__338; f_Diagnostic_diagNotes = dtb__339; f_Diagnostic_diagSuggestions = dtb__340; f_Diagnostic_diagOrigin = dtb__341; f_Diagnostic_diagChildren = dtb__342; f_Diagnostic_diagInternal = dtb__343; f_Diagnostic_diagIce = dtb__344; f_Diagnostic_diagAbsent = dtb__345; f_Diagnostic_diagStability = dtb__346 } -> dtb__339
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Base/Diag.vuna"
let v_diagSuggestions = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__347; f_Diagnostic_diagSeverity = dtb__348; f_Diagnostic_diagPhase = dtb__349; f_Diagnostic_diagCategory = dtb__350; f_Diagnostic_diagCode = dtb__351; f_Diagnostic_diagMessage = dtb__352; f_Diagnostic_diagLabels = dtb__353; f_Diagnostic_diagFields = dtb__354; f_Diagnostic_diagTrace = dtb__355; f_Diagnostic_diagNotes = dtb__356; f_Diagnostic_diagSuggestions = dtb__357; f_Diagnostic_diagOrigin = dtb__358; f_Diagnostic_diagChildren = dtb__359; f_Diagnostic_diagInternal = dtb__360; f_Diagnostic_diagIce = dtb__361; f_Diagnostic_diagAbsent = dtb__362; f_Diagnostic_diagStability = dtb__363 } -> dtb__357
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Base/Diag.vuna"
let v_diagOrigin = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__364; f_Diagnostic_diagSeverity = dtb__365; f_Diagnostic_diagPhase = dtb__366; f_Diagnostic_diagCategory = dtb__367; f_Diagnostic_diagCode = dtb__368; f_Diagnostic_diagMessage = dtb__369; f_Diagnostic_diagLabels = dtb__370; f_Diagnostic_diagFields = dtb__371; f_Diagnostic_diagTrace = dtb__372; f_Diagnostic_diagNotes = dtb__373; f_Diagnostic_diagSuggestions = dtb__374; f_Diagnostic_diagOrigin = dtb__375; f_Diagnostic_diagChildren = dtb__376; f_Diagnostic_diagInternal = dtb__377; f_Diagnostic_diagIce = dtb__378; f_Diagnostic_diagAbsent = dtb__379; f_Diagnostic_diagStability = dtb__380 } -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Base/Diag.vuna"
let v_diagChildren = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__381; f_Diagnostic_diagSeverity = dtb__382; f_Diagnostic_diagPhase = dtb__383; f_Diagnostic_diagCategory = dtb__384; f_Diagnostic_diagCode = dtb__385; f_Diagnostic_diagMessage = dtb__386; f_Diagnostic_diagLabels = dtb__387; f_Diagnostic_diagFields = dtb__388; f_Diagnostic_diagTrace = dtb__389; f_Diagnostic_diagNotes = dtb__390; f_Diagnostic_diagSuggestions = dtb__391; f_Diagnostic_diagOrigin = dtb__392; f_Diagnostic_diagChildren = dtb__393; f_Diagnostic_diagInternal = dtb__394; f_Diagnostic_diagIce = dtb__395; f_Diagnostic_diagAbsent = dtb__396; f_Diagnostic_diagStability = dtb__397 } -> dtb__393
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Diag.vuna"
let v_diagInternal = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__398; f_Diagnostic_diagSeverity = dtb__399; f_Diagnostic_diagPhase = dtb__400; f_Diagnostic_diagCategory = dtb__401; f_Diagnostic_diagCode = dtb__402; f_Diagnostic_diagMessage = dtb__403; f_Diagnostic_diagLabels = dtb__404; f_Diagnostic_diagFields = dtb__405; f_Diagnostic_diagTrace = dtb__406; f_Diagnostic_diagNotes = dtb__407; f_Diagnostic_diagSuggestions = dtb__408; f_Diagnostic_diagOrigin = dtb__409; f_Diagnostic_diagChildren = dtb__410; f_Diagnostic_diagInternal = dtb__411; f_Diagnostic_diagIce = dtb__412; f_Diagnostic_diagAbsent = dtb__413; f_Diagnostic_diagStability = dtb__414 } -> dtb__411
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Base/Diag.vuna"
let v_diagIce = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__415; f_Diagnostic_diagSeverity = dtb__416; f_Diagnostic_diagPhase = dtb__417; f_Diagnostic_diagCategory = dtb__418; f_Diagnostic_diagCode = dtb__419; f_Diagnostic_diagMessage = dtb__420; f_Diagnostic_diagLabels = dtb__421; f_Diagnostic_diagFields = dtb__422; f_Diagnostic_diagTrace = dtb__423; f_Diagnostic_diagNotes = dtb__424; f_Diagnostic_diagSuggestions = dtb__425; f_Diagnostic_diagOrigin = dtb__426; f_Diagnostic_diagChildren = dtb__427; f_Diagnostic_diagInternal = dtb__428; f_Diagnostic_diagIce = dtb__429; f_Diagnostic_diagAbsent = dtb__430; f_Diagnostic_diagStability = dtb__431 } -> dtb__429
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Diag.vuna"
let v_diagAbsent = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__432; f_Diagnostic_diagSeverity = dtb__433; f_Diagnostic_diagPhase = dtb__434; f_Diagnostic_diagCategory = dtb__435; f_Diagnostic_diagCode = dtb__436; f_Diagnostic_diagMessage = dtb__437; f_Diagnostic_diagLabels = dtb__438; f_Diagnostic_diagFields = dtb__439; f_Diagnostic_diagTrace = dtb__440; f_Diagnostic_diagNotes = dtb__441; f_Diagnostic_diagSuggestions = dtb__442; f_Diagnostic_diagOrigin = dtb__443; f_Diagnostic_diagChildren = dtb__444; f_Diagnostic_diagInternal = dtb__445; f_Diagnostic_diagIce = dtb__446; f_Diagnostic_diagAbsent = dtb__447; f_Diagnostic_diagStability = dtb__448 } -> dtb__447
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Base/Diag.vuna"
let v_diagStability = (fun (p : t_Diagnostic) -> (match p with
  | { f_Diagnostic_diagId = dtb__449; f_Diagnostic_diagSeverity = dtb__450; f_Diagnostic_diagPhase = dtb__451; f_Diagnostic_diagCategory = dtb__452; f_Diagnostic_diagCode = dtb__453; f_Diagnostic_diagMessage = dtb__454; f_Diagnostic_diagLabels = dtb__455; f_Diagnostic_diagFields = dtb__456; f_Diagnostic_diagTrace = dtb__457; f_Diagnostic_diagNotes = dtb__458; f_Diagnostic_diagSuggestions = dtb__459; f_Diagnostic_diagOrigin = dtb__460; f_Diagnostic_diagChildren = dtb__461; f_Diagnostic_diagInternal = dtb__462; f_Diagnostic_diagIce = dtb__463; f_Diagnostic_diagAbsent = dtb__464; f_Diagnostic_diagStability = dtb__465 } -> dtb__465
  | _ -> failwith "DT: impossible branch"
))
