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
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u4 with
  | C_Check_ErrC (dtb_u_u5) -> (C_Check_ErrC (dtb_u_u5))
  | C_Check_OkC (dtb_u_u6) -> (C_Check_OkC ((dtb_u_u3 dtb_u_u6)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 527 "Vuna/Compiler/Base/Diag.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u9 dtb_u_u10 -> (match dtb_u_u9 with
  | C_Check_ErrC (dtb_u_u11) -> (C_Check_ErrC (dtb_u_u11))
  | C_Check_OkC (dtb_u_u12) -> (dtb_u_u10 dtb_u_u12)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 531 "Vuna/Compiler/Base/Diag.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u14 -> (C_Check_OkC (dtb_u_u14)))) : Obj.t), ((Obj.magic (fun dtb_u_u17 dtb_u_u18 -> (match dtb_u_u17 with
  | C_Check_OkC (dtb_u_u19) -> (match dtb_u_u18 with
  | C_Check_OkC (dtb_u_u20) -> (C_Check_OkC ((dtb_u_u19 dtb_u_u20)))
  | C_Check_ErrC (dtb_u_u21) -> (C_Check_ErrC (dtb_u_u21))
  | _ -> failwith "DT: impossible branch"
)
  | C_Check_ErrC (dtb_u_u22) -> (C_Check_ErrC (dtb_u_u22))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun dtb_u_u26 dtb_u_u27 dtb_u_u28 -> (match dtb_u_u27 with
  | C_Check_ErrC (dtb_u_u29) -> (C_Check_ErrC (dtb_u_u29))
  | C_Check_OkC (dtb_u_u30) -> (match dtb_u_u28 with
  | C_Check_ErrC (dtb_u_u31) -> (C_Check_ErrC (dtb_u_u31))
  | C_Check_OkC (dtb_u_u32) -> (C_Check_OkC (((dtb_u_u26 dtb_u_u30) dtb_u_u32)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 192 "Vuna/Compiler/Base/Diag.vuna"
let v_diagNoLoc = (fun (dtb_u_u33 : t_Severity) (dtb_u_u34 : t_Phase) (dtb_u_u35 : t_Category) (dtb_u_u36 : string) (dtb_u_u37 : string) -> { f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = dtb_u_u33; f_Diagnostic_diagPhase = dtb_u_u34; f_Diagnostic_diagCategory = dtb_u_u35; f_Diagnostic_diagCode = dtb_u_u36; f_Diagnostic_diagMessage = dtb_u_u37; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsSynthetic)); f_Diagnostic_diagStability = C_Stability_Volatile })

# 214 "Vuna/Compiler/Base/Diag.vuna"
let v_diagAt = (fun (dtb_u_u38 : Base_dSource.t_Span) (dtb_u_u39 : t_Severity) (dtb_u_u40 : t_Phase) (dtb_u_u41 : t_Category) (dtb_u_u42 : string) (dtb_u_u43 : string) -> { f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = dtb_u_u39; f_Diagnostic_diagPhase = dtb_u_u40; f_Diagnostic_diagCategory = dtb_u_u41; f_Diagnostic_diagCode = dtb_u_u42; f_Diagnostic_diagMessage = dtb_u_u43; f_Diagnostic_diagLabels = (B_dData_dList.C_List__x58__x58_ ({ f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u38)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagStability = C_Stability_Stable })

# 236 "Vuna/Compiler/Base/Diag.vuna"
let v_err = (fun (dtb_u_u45 : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhTool; f_Diagnostic_diagCategory = C_Category_CatTool; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = dtb_u_u45; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsToolUsage)); f_Diagnostic_diagStability = C_Stability_Volatile })))

# 242 "Vuna/Compiler/Base/Diag.vuna"
let v_rawAt = (fun (dtb_u_u47 : Base_dSource.t_Span) (dtb_u_u48 : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhElab; f_Diagnostic_diagCategory = C_Category_CatTypes; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = dtb_u_u48; f_Diagnostic_diagLabels = (B_dData_dList.C_List__x58__x58_ ({ f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u47)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }, B_dData_dList.C_List_Nil)); f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagStability = C_Stability_Stable })))

# 248 "Vuna/Compiler/Base/Diag.vuna"
let v_rawNoLoc = (fun (dtb_u_u50 : string) -> (C_Check_ErrC ({ f_Diagnostic_diagId = 0; f_Diagnostic_diagSeverity = C_Severity_SevError; f_Diagnostic_diagPhase = C_Phase_PhElab; f_Diagnostic_diagCategory = C_Category_CatTypes; f_Diagnostic_diagCode = ""; f_Diagnostic_diagMessage = dtb_u_u50; f_Diagnostic_diagLabels = B_dData_dList.C_List_Nil; f_Diagnostic_diagFields = B_dData_dList.C_List_Nil; f_Diagnostic_diagTrace = B_dData_dList.C_List_Nil; f_Diagnostic_diagNotes = B_dData_dList.C_List_Nil; f_Diagnostic_diagSuggestions = B_dData_dList.C_List_Nil; f_Diagnostic_diagOrigin = C_Origin_OriginDirect; f_Diagnostic_diagChildren = B_dData_dList.C_List_Nil; f_Diagnostic_diagInternal = false; f_Diagnostic_diagIce = B_dData_dMaybe.C_Maybe_Nothing; f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsSynthetic)); f_Diagnostic_diagStability = C_Stability_Volatile })))

# 271 "Vuna/Compiler/Base/Diag.vuna"
let v_withStability = (fun (dtb_u_u51 : t_Stability) (dtb_u_u52 : t_Diagnostic) -> { dtb_u_u52 with f_Diagnostic_diagStability = dtb_u_u51 })

# 305 "Vuna/Compiler/Base/Diag.vuna"
let v_mapSpanPath = (fun (dtb_u_u53 : (string) -> string) (dtb_u_u54 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u54 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u55) -> (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = (dtb_u_u53 (dtb_u_u55).Base_dSource.f_Span_spanFile); Base_dSource.f_Span_spanStartLine = (dtb_u_u55).Base_dSource.f_Span_spanStartLine; Base_dSource.f_Span_spanStartCol = (dtb_u_u55).Base_dSource.f_Span_spanStartCol; Base_dSource.f_Span_spanEndLine = (dtb_u_u55).Base_dSource.f_Span_spanEndLine; Base_dSource.f_Span_spanEndCol = (dtb_u_u55).Base_dSource.f_Span_spanEndCol; Base_dSource.f_Span_spanStartOffset = (dtb_u_u55).Base_dSource.f_Span_spanStartOffset; Base_dSource.f_Span_spanEndOffset = (dtb_u_u55).Base_dSource.f_Span_spanEndOffset }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Base/Diag.vuna"
let v_mapLabelFile = (fun (dtb_u_u56 : (string) -> string) (dtb_u_u57 : t_Label) -> (match dtb_u_u57 with
  | { f_Label_labelSpan = dtb_u_u58; f_Label_labelText = dtb_u_u59; f_Label_labelStyle = dtb_u_u60; f_Label_labelProvenance = dtb_u_u61 } -> { f_Label_labelSpan = ((v_mapSpanPath dtb_u_u56) dtb_u_u58); f_Label_labelText = dtb_u_u59; f_Label_labelStyle = dtb_u_u60; f_Label_labelProvenance = ((v_mapSpanPath dtb_u_u56) dtb_u_u61) }
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Base/Diag.vuna"
let rec v_mapSpanFile = (fun (dtb_u_u62 : (string) -> string) (dtb_u_u63 : t_Diagnostic) -> (match dtb_u_u63 with
  | { f_Diagnostic_diagId = dtb_u_u64; f_Diagnostic_diagSeverity = dtb_u_u65; f_Diagnostic_diagPhase = dtb_u_u66; f_Diagnostic_diagCategory = dtb_u_u67; f_Diagnostic_diagCode = dtb_u_u68; f_Diagnostic_diagMessage = dtb_u_u69; f_Diagnostic_diagLabels = dtb_u_u70; f_Diagnostic_diagFields = dtb_u_u71; f_Diagnostic_diagTrace = dtb_u_u72; f_Diagnostic_diagNotes = dtb_u_u73; f_Diagnostic_diagSuggestions = dtb_u_u74; f_Diagnostic_diagOrigin = dtb_u_u75; f_Diagnostic_diagChildren = dtb_u_u76; f_Diagnostic_diagInternal = dtb_u_u77; f_Diagnostic_diagIce = dtb_u_u78; f_Diagnostic_diagAbsent = dtb_u_u79; f_Diagnostic_diagStability = dtb_u_u80 } -> { f_Diagnostic_diagId = dtb_u_u64; f_Diagnostic_diagSeverity = dtb_u_u65; f_Diagnostic_diagPhase = dtb_u_u66; f_Diagnostic_diagCategory = dtb_u_u67; f_Diagnostic_diagCode = dtb_u_u68; f_Diagnostic_diagMessage = dtb_u_u69; f_Diagnostic_diagLabels = ((B_dData_dList.v_map (v_mapLabelFile dtb_u_u62)) dtb_u_u70); f_Diagnostic_diagFields = dtb_u_u71; f_Diagnostic_diagTrace = dtb_u_u72; f_Diagnostic_diagNotes = dtb_u_u73; f_Diagnostic_diagSuggestions = dtb_u_u74; f_Diagnostic_diagOrigin = dtb_u_u75; f_Diagnostic_diagChildren = ((v_mapDiagChildren dtb_u_u62) dtb_u_u76); f_Diagnostic_diagInternal = dtb_u_u77; f_Diagnostic_diagIce = dtb_u_u78; f_Diagnostic_diagAbsent = dtb_u_u79; f_Diagnostic_diagStability = dtb_u_u80 }
  | _ -> failwith "DT: impossible branch"
))
# 297 "Vuna/Compiler/Base/Diag.vuna"
and v_mapDiagChildren = (fun (dtb_u_u81 : (string) -> string) (dtb_u_u82 : t_Diagnostic B_dData_dList.t_List) -> (match dtb_u_u82 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u83, dtb_u_u84) -> (B_dData_dList.C_List__x58__x58_ (((v_mapSpanFile dtb_u_u81) dtb_u_u83), ((v_mapDiagChildren dtb_u_u81) dtb_u_u84)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Base/Diag.vuna"
let v_stabilityOfAbsent = (fun (dtb_u_u85 : t_NoSourceReason) -> (match dtb_u_u85 with
  | C_NoSourceReason_NsInternal -> C_Stability_Volatile
  | C_NoSourceReason_NsPackageGraph -> C_Stability_Volatile
  | C_NoSourceReason_NsToolUsage -> C_Stability_Volatile
  | C_NoSourceReason_NsSynthetic -> C_Stability_Volatile
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Base/Diag.vuna"
let v_withField = (fun (dtb_u_u86 : t_DiagField) (dtb_u_u87 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u87).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u87).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u87).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u87).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u87).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u87).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u87).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = ((B_dData_dList.v_append (dtb_u_u87).f_Diagnostic_diagFields) (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, B_dData_dList.C_List_Nil))); f_Diagnostic_diagTrace = (dtb_u_u87).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u87).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u87).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u87).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u87).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u87).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u87).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u87).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u87).f_Diagnostic_diagStability })

# 348 "Vuna/Compiler/Base/Diag.vuna"
let v_withNote = (fun (dtb_u_u88 : string) (dtb_u_u89 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u89).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u89).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u89).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u89).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u89).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u89).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u89).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u89).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u89).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = ((B_dData_dList.v_append (dtb_u_u89).f_Diagnostic_diagNotes) (B_dData_dList.C_List__x58__x58_ (dtb_u_u88, B_dData_dList.C_List_Nil))); f_Diagnostic_diagSuggestions = (dtb_u_u89).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u89).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u89).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u89).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u89).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u89).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u89).f_Diagnostic_diagStability })

# 370 "Vuna/Compiler/Base/Diag.vuna"
let v_withHelp = (fun (dtb_u_u90 : string) (dtb_u_u91 : t_Diagnostic) -> ((v_withNote ("help: " ^ dtb_u_u90)) dtb_u_u91))

# 374 "Vuna/Compiler/Base/Diag.vuna"
let v_withSuggestion = (fun (dtb_u_u92 : t_Suggestion) (dtb_u_u93 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u93).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u93).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u93).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u93).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u93).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u93).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u93).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u93).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u93).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u93).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = ((B_dData_dList.v_append (dtb_u_u93).f_Diagnostic_diagSuggestions) (B_dData_dList.C_List__x58__x58_ (dtb_u_u92, B_dData_dList.C_List_Nil))); f_Diagnostic_diagOrigin = (dtb_u_u93).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u93).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u93).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u93).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u93).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u93).f_Diagnostic_diagStability })

# 396 "Vuna/Compiler/Base/Diag.vuna"
let v_withTrace = (fun (dtb_u_u94 : t_TraceFrame) (dtb_u_u95 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u95).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u95).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u95).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u95).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u95).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u95).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u95).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u95).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = ((B_dData_dList.v_append (dtb_u_u95).f_Diagnostic_diagTrace) (B_dData_dList.C_List__x58__x58_ (dtb_u_u94, B_dData_dList.C_List_Nil))); f_Diagnostic_diagNotes = (dtb_u_u95).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u95).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u95).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u95).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u95).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u95).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u95).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u95).f_Diagnostic_diagStability })

# 418 "Vuna/Compiler/Base/Diag.vuna"
let v_withOrigin = (fun (dtb_u_u96 : t_Origin) (dtb_u_u97 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u97).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u97).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u97).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u97).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u97).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u97).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u97).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u97).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u97).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u97).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u97).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = dtb_u_u96; f_Diagnostic_diagChildren = (dtb_u_u97).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u97).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u97).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u97).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u97).f_Diagnostic_diagStability })

# 452 "Vuna/Compiler/Base/Diag.vuna"
let rec v_primarySpanOf = (fun (dtb_u_u98 : t_Label B_dData_dList.t_List) -> (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u99, dtb_u_u100) -> (match dtb_u_u99 with
  | { f_Label_labelSpan = dtb_u_u101; f_Label_labelText = dtb_u_u102; f_Label_labelStyle = dtb_u_u103; f_Label_labelProvenance = dtb_u_u104 } -> (match dtb_u_u103 with
  | C_LabelStyle_LabelPrimary -> dtb_u_u101
  | _ -> (v_primarySpanOf dtb_u_u100)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Base/Diag.vuna"
let rec v_contextPrefixOf = (fun (dtb_u_u105 : t_Label B_dData_dList.t_List) -> (match dtb_u_u105 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107) -> (match dtb_u_u106 with
  | { f_Label_labelSpan = dtb_u_u108; f_Label_labelText = dtb_u_u109; f_Label_labelStyle = dtb_u_u110; f_Label_labelProvenance = dtb_u_u111 } -> (match dtb_u_u110 with
  | C_LabelStyle_LabelContext -> (dtb_u_u109 ^ ": ")
  | _ -> (v_contextPrefixOf dtb_u_u107)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Base/Diag.vuna"
let v_locPrefixOf = (fun (dtb_u_u112 : t_Label B_dData_dList.t_List) -> (match (v_primarySpanOf dtb_u_u112) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u113) -> ((Base_dSource.v_showSpanLoc dtb_u_u113) ^ ": ")
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Base/Diag.vuna"
let v_diagText = (fun (dtb_u_u114 : t_Diagnostic) -> (let dtb_u_u115 = (if ((dtb_u_u114).f_Diagnostic_diagCode = "") then (dtb_u_u114).f_Diagnostic_diagMessage else (String.concat "" ["["; (dtb_u_u114).f_Diagnostic_diagCode; "] "; (dtb_u_u114).f_Diagnostic_diagMessage])) in (String.concat "" [(v_locPrefixOf (dtb_u_u114).f_Diagnostic_diagLabels); (v_contextPrefixOf (dtb_u_u114).f_Diagnostic_diagLabels); dtb_u_u115])))

# 478 "Vuna/Compiler/Base/Diag.vuna"
let v_withMessage = (fun (dtb_u_u116 : string) (dtb_u_u117 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u117).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u117).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u117).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u117).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u117).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = dtb_u_u116; f_Diagnostic_diagLabels = (dtb_u_u117).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u117).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u117).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u117).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u117).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u117).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u117).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u117).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u117).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u117).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u117).f_Diagnostic_diagStability })

# 500 "Vuna/Compiler/Base/Diag.vuna"
let v_appendMessage = (fun (dtb_u_u118 : string) (dtb_u_u119 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u119).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u119).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u119).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u119).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u119).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = ((dtb_u_u119).f_Diagnostic_diagMessage ^ dtb_u_u118); f_Diagnostic_diagLabels = (dtb_u_u119).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u119).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u119).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u119).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u119).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u119).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u119).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u119).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u119).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u119).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u119).f_Diagnostic_diagStability })

# 547 "Vuna/Compiler/Base/Diag.vuna"
let v_withChildren = (fun (dtb_u_u120 : t_Diagnostic B_dData_dList.t_List) (dtb_u_u121 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u121).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u121).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u121).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u121).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u121).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u121).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u121).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u121).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u121).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u121).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u121).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u121).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = dtb_u_u120; f_Diagnostic_diagInternal = (dtb_u_u121).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u121).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u121).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u121).f_Diagnostic_diagStability })

# 596 "Vuna/Compiler/Base/Diag.vuna"
let v_withLabelFileIfEmpty = (fun (dtb_u_u122 : string) (dtb_u_u123 : t_Label) -> (match dtb_u_u123 with
  | { f_Label_labelSpan = dtb_u_u124; f_Label_labelText = dtb_u_u125; f_Label_labelStyle = dtb_u_u126; f_Label_labelProvenance = dtb_u_u127 } -> (match dtb_u_u124 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u128) -> (if ((Base_dSource.v_spanFile dtb_u_u128) = "") then { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ({ Base_dSource.f_Span_spanFile = dtb_u_u122; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine dtb_u_u128); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol dtb_u_u128); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine dtb_u_u128); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol dtb_u_u128); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset dtb_u_u128); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset dtb_u_u128) })); f_Label_labelText = dtb_u_u125; f_Label_labelStyle = dtb_u_u126; f_Label_labelProvenance = dtb_u_u127 } else { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u128)); f_Label_labelText = dtb_u_u125; f_Label_labelStyle = dtb_u_u126; f_Label_labelProvenance = dtb_u_u127 })
  | B_dData_dMaybe.C_Maybe_Nothing -> { f_Label_labelSpan = B_dData_dMaybe.C_Maybe_Nothing; f_Label_labelText = dtb_u_u125; f_Label_labelStyle = dtb_u_u126; f_Label_labelProvenance = dtb_u_u127 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Base/Diag.vuna"
let v_withSpanFileIfEmpty = (fun (dtb_u_u129 : string) (dtb_u_u130 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u130).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u130).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u130).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u130).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u130).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u130).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = ((B_dData_dList.v_map (v_withLabelFileIfEmpty dtb_u_u129)) (dtb_u_u130).f_Diagnostic_diagLabels); f_Diagnostic_diagFields = (dtb_u_u130).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u130).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u130).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u130).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u130).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u130).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u130).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u130).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u130).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u130).f_Diagnostic_diagStability })

# 608 "Vuna/Compiler/Base/Diag.vuna"
let rec v_hasPrimaryLabel = (fun (dtb_u_u131 : t_Label B_dData_dList.t_List) -> (match dtb_u_u131 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u132 with
  | { f_Label_labelSpan = dtb_u_u134; f_Label_labelText = dtb_u_u135; f_Label_labelStyle = dtb_u_u136; f_Label_labelProvenance = dtb_u_u137 } -> (match dtb_u_u136 with
  | C_LabelStyle_LabelPrimary -> true
  | _ -> (v_hasPrimaryLabel dtb_u_u133)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Base/Diag.vuna"
let v_normalizeSite = (fun (dtb_u_u138 : t_Diagnostic) -> (if (v_hasPrimaryLabel (dtb_u_u138).f_Diagnostic_diagLabels) then { { dtb_u_u138 with f_Diagnostic_diagAbsent = B_dData_dMaybe.C_Maybe_Nothing } with f_Diagnostic_diagStability = C_Stability_Stable } else dtb_u_u138))

# 257 "Vuna/Compiler/Base/Diag.vuna"
let v_withLabel = (fun (dtb_u_u139 : t_Label) (dtb_u_u140 : t_Diagnostic) -> (v_normalizeSite { f_Diagnostic_diagId = (dtb_u_u140).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u140).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u140).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u140).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u140).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u140).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = ((B_dData_dList.v_append (dtb_u_u140).f_Diagnostic_diagLabels) (B_dData_dList.C_List__x58__x58_ (dtb_u_u139, B_dData_dList.C_List_Nil))); f_Diagnostic_diagFields = (dtb_u_u140).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u140).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u140).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u140).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u140).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u140).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = (dtb_u_u140).f_Diagnostic_diagInternal; f_Diagnostic_diagIce = (dtb_u_u140).f_Diagnostic_diagIce; f_Diagnostic_diagAbsent = (dtb_u_u140).f_Diagnostic_diagAbsent; f_Diagnostic_diagStability = (dtb_u_u140).f_Diagnostic_diagStability }))

# 312 "Vuna/Compiler/Base/Diag.vuna"
let v_withAbsent = (fun (dtb_u_u141 : t_NoSourceReason) (dtb_u_u142 : t_Diagnostic) -> (if (v_hasPrimaryLabel (dtb_u_u142).f_Diagnostic_diagLabels) then dtb_u_u142 else { { dtb_u_u142 with f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u141)) } with f_Diagnostic_diagStability = (v_stabilityOfAbsent dtb_u_u141) }))

# 440 "Vuna/Compiler/Base/Diag.vuna"
let v_withContext = (fun (dtb_u_u143 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u144 : string) (dtb_u_u145 : t_Diagnostic) -> (let dtb_u_u146 = ((v_withLabel { f_Label_labelSpan = dtb_u_u143; f_Label_labelText = (String.concat "" ["in `"; dtb_u_u144; "`"]); f_Label_labelStyle = C_LabelStyle_LabelContext; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) dtb_u_u145) in (match dtb_u_u143 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u147) -> ((v_withLabel { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u147)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) dtb_u_u146)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u146
  | _ -> failwith "DT: impossible branch"
)))

# 569 "Vuna/Compiler/Base/Diag.vuna"
let v_withFallbackSpan = (fun (dtb_u_u148 : Base_dSource.t_Span) (dtb_u_u149 : t_Diagnostic) -> (if (v_hasPrimaryLabel (dtb_u_u149).f_Diagnostic_diagLabels) then dtb_u_u149 else ((v_withLabel { f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u148)); f_Label_labelText = ""; f_Label_labelStyle = C_LabelStyle_LabelPrimary; f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) dtb_u_u149)))

# 617 "Vuna/Compiler/Base/Diag.vuna"
let v_markInternal = (fun (dtb_u_u150 : string) (dtb_u_u151 : string) (dtb_u_u152 : t_Diagnostic) -> { f_Diagnostic_diagId = (dtb_u_u152).f_Diagnostic_diagId; f_Diagnostic_diagSeverity = (dtb_u_u152).f_Diagnostic_diagSeverity; f_Diagnostic_diagPhase = (dtb_u_u152).f_Diagnostic_diagPhase; f_Diagnostic_diagCategory = (dtb_u_u152).f_Diagnostic_diagCategory; f_Diagnostic_diagCode = (dtb_u_u152).f_Diagnostic_diagCode; f_Diagnostic_diagMessage = (dtb_u_u152).f_Diagnostic_diagMessage; f_Diagnostic_diagLabels = (dtb_u_u152).f_Diagnostic_diagLabels; f_Diagnostic_diagFields = (dtb_u_u152).f_Diagnostic_diagFields; f_Diagnostic_diagTrace = (dtb_u_u152).f_Diagnostic_diagTrace; f_Diagnostic_diagNotes = (dtb_u_u152).f_Diagnostic_diagNotes; f_Diagnostic_diagSuggestions = (dtb_u_u152).f_Diagnostic_diagSuggestions; f_Diagnostic_diagOrigin = (dtb_u_u152).f_Diagnostic_diagOrigin; f_Diagnostic_diagChildren = (dtb_u_u152).f_Diagnostic_diagChildren; f_Diagnostic_diagInternal = true; f_Diagnostic_diagIce = (B_dData_dMaybe.C_Maybe_Just ({ f_IceInfo_icePhase = C_Phase_PhInternal; f_IceInfo_iceFunction = dtb_u_u150; f_IceInfo_iceInvariant = dtb_u_u151; f_IceInfo_iceFingerprint = ""; f_IceInfo_iceHint = "this is a compiler bug; please report it with the command line and source" })); f_Diagnostic_diagAbsent = (B_dData_dMaybe.C_Maybe_Just (C_NoSourceReason_NsInternal)); f_Diagnostic_diagStability = C_Stability_Volatile })

# 639 "Vuna/Compiler/Base/Diag.vuna"
let v_icFuel = (fun (dtb_u_u154 : string) -> (C_Check_ErrC ((((v_markInternal "fuel") dtb_u_u154) (((((v_diagNoLoc C_Severity_SevError) C_Phase_PhInternal) C_Category_CatInternal) "IC_FuelExhausted") (dtb_u_u154 ^ " ran out of fuel (compiler invariant: the phase must make progress)"))))))

# 645 "Vuna/Compiler/Base/Diag.vuna"
let v_icInternal = (fun (dtb_u_u156 : string) -> (C_Check_ErrC ((((v_markInternal "invariant") dtb_u_u156) (((((v_diagNoLoc C_Severity_SevError) C_Phase_PhInternal) C_Category_CatInternal) "IC_InvariantViolated") ("internal invariant violated: " ^ dtb_u_u156))))))

# 651 "Vuna/Compiler/Base/Diag.vuna"
let v_onErrDiag = (fun (dtb_u_u158 : (t_Diagnostic) -> t_Diagnostic) dtb_u_u159 -> (match dtb_u_u159 with
  | C_Check_OkC (dtb_u_u160) -> (C_Check_OkC (dtb_u_u160))
  | C_Check_ErrC (dtb_u_u161) -> (C_Check_ErrC ((dtb_u_u158 dtb_u_u161)))
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Base/Diag.vuna"
let rec v_primaryLabelOf = (fun (dtb_u_u162 : t_Label B_dData_dList.t_List) -> (match dtb_u_u162 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u163, dtb_u_u164) -> (let dtb_u_u165 = dtb_u_u163 in (match dtb_u_u165 with
  | { f_Label_labelSpan = dtb_u_u166; f_Label_labelText = dtb_u_u167; f_Label_labelStyle = dtb_u_u168; f_Label_labelProvenance = dtb_u_u169 } -> (match dtb_u_u168 with
  | C_LabelStyle_LabelPrimary -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u163))
  | _ -> (v_primaryLabelOf dtb_u_u164)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Base/Diag.vuna"
let v_diagFileOf = (fun (dtb_u_u170 : t_Diagnostic) -> (let dtb_u_u171 = (v_primaryLabelOf (dtb_u_u170).f_Diagnostic_diagLabels) in (match dtb_u_u171 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u172) -> (match dtb_u_u172 with
  | { f_Label_labelSpan = dtb_u_u173; f_Label_labelText = dtb_u_u174; f_Label_labelStyle = dtb_u_u175; f_Label_labelProvenance = dtb_u_u176 } -> (match dtb_u_u173 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u177) -> (Base_dSource.v_spanFile dtb_u_u177)
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

# 670 "Vuna/Compiler/Base/Diag.vuna"
let v_sameSeverity = (fun (dtb_u_u178 : t_Severity) (dtb_u_u179 : t_Severity) -> (match dtb_u_u178 with
  | C_Severity_SevHelp -> (match dtb_u_u179 with
  | C_Severity_SevHelp -> true
  | _ -> false
)
  | C_Severity_SevNote -> (match dtb_u_u179 with
  | C_Severity_SevNote -> true
  | _ -> false
)
  | C_Severity_SevWarning -> (match dtb_u_u179 with
  | C_Severity_SevWarning -> true
  | _ -> false
)
  | C_Severity_SevError -> (match dtb_u_u179 with
  | C_Severity_SevError -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Base/Diag.vuna"
let[@tail_mod_cons] rec v_labelSpanOf = (fun (dtb_u_u180 : t_Label B_dData_dList.t_List) -> (match dtb_u_u180 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (match dtb_u_u181 with
  | { f_Label_labelSpan = dtb_u_u183; f_Label_labelText = dtb_u_u184; f_Label_labelStyle = dtb_u_u185; f_Label_labelProvenance = dtb_u_u186 } -> (match dtb_u_u183 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = 0 } } }, (v_labelSpanOf dtb_u_u182)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u187) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanFile dtb_u_u187); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartLine dtb_u_u187); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartCol dtb_u_u187); B_dData_dPair.f_Pair_second = (Base_dSource.v_spanEndLine dtb_u_u187) } } }, (v_labelSpanOf dtb_u_u182)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 678 "Vuna/Compiler/Base/Diag.vuna"
let v_sameDiag = (fun (dtb_u_u188 : t_Diagnostic) (dtb_u_u189 : t_Diagnostic) -> (if (if (if ((dtb_u_u188).f_Diagnostic_diagCode = (dtb_u_u189).f_Diagnostic_diagCode) then ((dtb_u_u188).f_Diagnostic_diagMessage = (dtb_u_u189).f_Diagnostic_diagMessage) else false) then ((v_sameSeverity (dtb_u_u188).f_Diagnostic_diagSeverity) (dtb_u_u189).f_Diagnostic_diagSeverity) else false) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dPair.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt))))) (v_labelSpanOf (dtb_u_u188).f_Diagnostic_diagLabels)) (v_labelSpanOf (dtb_u_u189).f_Diagnostic_diagLabels)) else false))

# 100 "Vuna/Compiler/Base/Diag.vuna"
let v_labelSpan = (fun (dtb_u_u190 : t_Label) -> (match dtb_u_u190 with
  | { f_Label_labelSpan = dtb_u_u191; f_Label_labelText = dtb_u_u192; f_Label_labelStyle = dtb_u_u193; f_Label_labelProvenance = dtb_u_u194 } -> dtb_u_u191
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Base/Diag.vuna"
let v_labelText = (fun (dtb_u_u195 : t_Label) -> (match dtb_u_u195 with
  | { f_Label_labelSpan = dtb_u_u196; f_Label_labelText = dtb_u_u197; f_Label_labelStyle = dtb_u_u198; f_Label_labelProvenance = dtb_u_u199 } -> dtb_u_u197
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Base/Diag.vuna"
let v_labelStyle = (fun (dtb_u_u200 : t_Label) -> (match dtb_u_u200 with
  | { f_Label_labelSpan = dtb_u_u201; f_Label_labelText = dtb_u_u202; f_Label_labelStyle = dtb_u_u203; f_Label_labelProvenance = dtb_u_u204 } -> dtb_u_u203
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Base/Diag.vuna"
let v_labelProvenance = (fun (dtb_u_u205 : t_Label) -> (match dtb_u_u205 with
  | { f_Label_labelSpan = dtb_u_u206; f_Label_labelText = dtb_u_u207; f_Label_labelStyle = dtb_u_u208; f_Label_labelProvenance = dtb_u_u209 } -> dtb_u_u209
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Base/Diag.vuna"
let v_editSpan = (fun (dtb_u_u210 : t_DiagEdit) -> (match dtb_u_u210 with
  | { f_DiagEdit_editSpan = dtb_u_u211; f_DiagEdit_editNewText = dtb_u_u212 } -> dtb_u_u211
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Base/Diag.vuna"
let v_editNewText = (fun (dtb_u_u213 : t_DiagEdit) -> (match dtb_u_u213 with
  | { f_DiagEdit_editSpan = dtb_u_u214; f_DiagEdit_editNewText = dtb_u_u215 } -> dtb_u_u215
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionTitle = (fun (dtb_u_u216 : t_Suggestion) -> (match dtb_u_u216 with
  | { f_Suggestion_suggestionTitle = dtb_u_u217; f_Suggestion_suggestionApplicability = dtb_u_u218; f_Suggestion_suggestionEdits = dtb_u_u219 } -> dtb_u_u217
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionApplicability = (fun (dtb_u_u220 : t_Suggestion) -> (match dtb_u_u220 with
  | { f_Suggestion_suggestionTitle = dtb_u_u221; f_Suggestion_suggestionApplicability = dtb_u_u222; f_Suggestion_suggestionEdits = dtb_u_u223 } -> dtb_u_u222
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Base/Diag.vuna"
let v_suggestionEdits = (fun (dtb_u_u224 : t_Suggestion) -> (match dtb_u_u224 with
  | { f_Suggestion_suggestionTitle = dtb_u_u225; f_Suggestion_suggestionApplicability = dtb_u_u226; f_Suggestion_suggestionEdits = dtb_u_u227 } -> dtb_u_u227
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateText = (fun (dtb_u_u228 : t_Candidate) -> (match dtb_u_u228 with
  | { f_Candidate_candidateText = dtb_u_u229; f_Candidate_candidateSpan = dtb_u_u230; f_Candidate_candidateReason = dtb_u_u231 } -> dtb_u_u229
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateSpan = (fun (dtb_u_u232 : t_Candidate) -> (match dtb_u_u232 with
  | { f_Candidate_candidateText = dtb_u_u233; f_Candidate_candidateSpan = dtb_u_u234; f_Candidate_candidateReason = dtb_u_u235 } -> dtb_u_u234
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Base/Diag.vuna"
let v_candidateReason = (fun (dtb_u_u236 : t_Candidate) -> (match dtb_u_u236 with
  | { f_Candidate_candidateText = dtb_u_u237; f_Candidate_candidateSpan = dtb_u_u238; f_Candidate_candidateReason = dtb_u_u239 } -> dtb_u_u239
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Base/Diag.vuna"
let v_callCallee = (fun (dtb_u_u240 : t_CallInfo) -> (match dtb_u_u240 with
  | { f_CallInfo_callCallee = dtb_u_u241; f_CallInfo_callArg = dtb_u_u242; f_CallInfo_callRelation = dtb_u_u243; f_CallInfo_callSpan = dtb_u_u244 } -> dtb_u_u241
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Base/Diag.vuna"
let v_callArg = (fun (dtb_u_u245 : t_CallInfo) -> (match dtb_u_u245 with
  | { f_CallInfo_callCallee = dtb_u_u246; f_CallInfo_callArg = dtb_u_u247; f_CallInfo_callRelation = dtb_u_u248; f_CallInfo_callSpan = dtb_u_u249 } -> dtb_u_u247
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Base/Diag.vuna"
let v_callRelation = (fun (dtb_u_u250 : t_CallInfo) -> (match dtb_u_u250 with
  | { f_CallInfo_callCallee = dtb_u_u251; f_CallInfo_callArg = dtb_u_u252; f_CallInfo_callRelation = dtb_u_u253; f_CallInfo_callSpan = dtb_u_u254 } -> dtb_u_u253
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Base/Diag.vuna"
let v_callSpan = (fun (dtb_u_u255 : t_CallInfo) -> (match dtb_u_u255 with
  | { f_CallInfo_callCallee = dtb_u_u256; f_CallInfo_callArg = dtb_u_u257; f_CallInfo_callRelation = dtb_u_u258; f_CallInfo_callSpan = dtb_u_u259 } -> dtb_u_u259
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Base/Diag.vuna"
let v_tracePhase = (fun (dtb_u_u260 : t_TraceFrame) -> (match dtb_u_u260 with
  | { f_TraceFrame_tracePhase = dtb_u_u261; f_TraceFrame_traceText = dtb_u_u262; f_TraceFrame_traceSpan = dtb_u_u263; f_TraceFrame_traceChildren = dtb_u_u264 } -> dtb_u_u261
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Base/Diag.vuna"
let v_traceText = (fun (dtb_u_u265 : t_TraceFrame) -> (match dtb_u_u265 with
  | { f_TraceFrame_tracePhase = dtb_u_u266; f_TraceFrame_traceText = dtb_u_u267; f_TraceFrame_traceSpan = dtb_u_u268; f_TraceFrame_traceChildren = dtb_u_u269 } -> dtb_u_u267
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Base/Diag.vuna"
let v_traceSpan = (fun (dtb_u_u270 : t_TraceFrame) -> (match dtb_u_u270 with
  | { f_TraceFrame_tracePhase = dtb_u_u271; f_TraceFrame_traceText = dtb_u_u272; f_TraceFrame_traceSpan = dtb_u_u273; f_TraceFrame_traceChildren = dtb_u_u274 } -> dtb_u_u273
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Base/Diag.vuna"
let v_traceChildren = (fun (dtb_u_u275 : t_TraceFrame) -> (match dtb_u_u275 with
  | { f_TraceFrame_tracePhase = dtb_u_u276; f_TraceFrame_traceText = dtb_u_u277; f_TraceFrame_traceSpan = dtb_u_u278; f_TraceFrame_traceChildren = dtb_u_u279 } -> dtb_u_u279
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Base/Diag.vuna"
let v_icePhase = (fun (dtb_u_u280 : t_IceInfo) -> (match dtb_u_u280 with
  | { f_IceInfo_icePhase = dtb_u_u281; f_IceInfo_iceFunction = dtb_u_u282; f_IceInfo_iceInvariant = dtb_u_u283; f_IceInfo_iceFingerprint = dtb_u_u284; f_IceInfo_iceHint = dtb_u_u285 } -> dtb_u_u281
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Base/Diag.vuna"
let v_iceFunction = (fun (dtb_u_u286 : t_IceInfo) -> (match dtb_u_u286 with
  | { f_IceInfo_icePhase = dtb_u_u287; f_IceInfo_iceFunction = dtb_u_u288; f_IceInfo_iceInvariant = dtb_u_u289; f_IceInfo_iceFingerprint = dtb_u_u290; f_IceInfo_iceHint = dtb_u_u291 } -> dtb_u_u288
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Base/Diag.vuna"
let v_iceInvariant = (fun (dtb_u_u292 : t_IceInfo) -> (match dtb_u_u292 with
  | { f_IceInfo_icePhase = dtb_u_u293; f_IceInfo_iceFunction = dtb_u_u294; f_IceInfo_iceInvariant = dtb_u_u295; f_IceInfo_iceFingerprint = dtb_u_u296; f_IceInfo_iceHint = dtb_u_u297 } -> dtb_u_u295
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Base/Diag.vuna"
let v_iceFingerprint = (fun (dtb_u_u298 : t_IceInfo) -> (match dtb_u_u298 with
  | { f_IceInfo_icePhase = dtb_u_u299; f_IceInfo_iceFunction = dtb_u_u300; f_IceInfo_iceInvariant = dtb_u_u301; f_IceInfo_iceFingerprint = dtb_u_u302; f_IceInfo_iceHint = dtb_u_u303 } -> dtb_u_u302
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Diag.vuna"
let v_iceHint = (fun (dtb_u_u304 : t_IceInfo) -> (match dtb_u_u304 with
  | { f_IceInfo_icePhase = dtb_u_u305; f_IceInfo_iceFunction = dtb_u_u306; f_IceInfo_iceInvariant = dtb_u_u307; f_IceInfo_iceFingerprint = dtb_u_u308; f_IceInfo_iceHint = dtb_u_u309 } -> dtb_u_u309
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Base/Diag.vuna"
let v_diagId = (fun (dtb_u_u310 : t_Diagnostic) -> (match dtb_u_u310 with
  | { f_Diagnostic_diagId = dtb_u_u311; f_Diagnostic_diagSeverity = dtb_u_u312; f_Diagnostic_diagPhase = dtb_u_u313; f_Diagnostic_diagCategory = dtb_u_u314; f_Diagnostic_diagCode = dtb_u_u315; f_Diagnostic_diagMessage = dtb_u_u316; f_Diagnostic_diagLabels = dtb_u_u317; f_Diagnostic_diagFields = dtb_u_u318; f_Diagnostic_diagTrace = dtb_u_u319; f_Diagnostic_diagNotes = dtb_u_u320; f_Diagnostic_diagSuggestions = dtb_u_u321; f_Diagnostic_diagOrigin = dtb_u_u322; f_Diagnostic_diagChildren = dtb_u_u323; f_Diagnostic_diagInternal = dtb_u_u324; f_Diagnostic_diagIce = dtb_u_u325; f_Diagnostic_diagAbsent = dtb_u_u326; f_Diagnostic_diagStability = dtb_u_u327 } -> dtb_u_u311
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Base/Diag.vuna"
let v_diagSeverity = (fun (dtb_u_u328 : t_Diagnostic) -> (match dtb_u_u328 with
  | { f_Diagnostic_diagId = dtb_u_u329; f_Diagnostic_diagSeverity = dtb_u_u330; f_Diagnostic_diagPhase = dtb_u_u331; f_Diagnostic_diagCategory = dtb_u_u332; f_Diagnostic_diagCode = dtb_u_u333; f_Diagnostic_diagMessage = dtb_u_u334; f_Diagnostic_diagLabels = dtb_u_u335; f_Diagnostic_diagFields = dtb_u_u336; f_Diagnostic_diagTrace = dtb_u_u337; f_Diagnostic_diagNotes = dtb_u_u338; f_Diagnostic_diagSuggestions = dtb_u_u339; f_Diagnostic_diagOrigin = dtb_u_u340; f_Diagnostic_diagChildren = dtb_u_u341; f_Diagnostic_diagInternal = dtb_u_u342; f_Diagnostic_diagIce = dtb_u_u343; f_Diagnostic_diagAbsent = dtb_u_u344; f_Diagnostic_diagStability = dtb_u_u345 } -> dtb_u_u330
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Base/Diag.vuna"
let v_diagPhase = (fun (dtb_u_u346 : t_Diagnostic) -> (match dtb_u_u346 with
  | { f_Diagnostic_diagId = dtb_u_u347; f_Diagnostic_diagSeverity = dtb_u_u348; f_Diagnostic_diagPhase = dtb_u_u349; f_Diagnostic_diagCategory = dtb_u_u350; f_Diagnostic_diagCode = dtb_u_u351; f_Diagnostic_diagMessage = dtb_u_u352; f_Diagnostic_diagLabels = dtb_u_u353; f_Diagnostic_diagFields = dtb_u_u354; f_Diagnostic_diagTrace = dtb_u_u355; f_Diagnostic_diagNotes = dtb_u_u356; f_Diagnostic_diagSuggestions = dtb_u_u357; f_Diagnostic_diagOrigin = dtb_u_u358; f_Diagnostic_diagChildren = dtb_u_u359; f_Diagnostic_diagInternal = dtb_u_u360; f_Diagnostic_diagIce = dtb_u_u361; f_Diagnostic_diagAbsent = dtb_u_u362; f_Diagnostic_diagStability = dtb_u_u363 } -> dtb_u_u349
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Base/Diag.vuna"
let v_diagCategory = (fun (dtb_u_u364 : t_Diagnostic) -> (match dtb_u_u364 with
  | { f_Diagnostic_diagId = dtb_u_u365; f_Diagnostic_diagSeverity = dtb_u_u366; f_Diagnostic_diagPhase = dtb_u_u367; f_Diagnostic_diagCategory = dtb_u_u368; f_Diagnostic_diagCode = dtb_u_u369; f_Diagnostic_diagMessage = dtb_u_u370; f_Diagnostic_diagLabels = dtb_u_u371; f_Diagnostic_diagFields = dtb_u_u372; f_Diagnostic_diagTrace = dtb_u_u373; f_Diagnostic_diagNotes = dtb_u_u374; f_Diagnostic_diagSuggestions = dtb_u_u375; f_Diagnostic_diagOrigin = dtb_u_u376; f_Diagnostic_diagChildren = dtb_u_u377; f_Diagnostic_diagInternal = dtb_u_u378; f_Diagnostic_diagIce = dtb_u_u379; f_Diagnostic_diagAbsent = dtb_u_u380; f_Diagnostic_diagStability = dtb_u_u381 } -> dtb_u_u368
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Base/Diag.vuna"
let v_diagCode = (fun (dtb_u_u382 : t_Diagnostic) -> (match dtb_u_u382 with
  | { f_Diagnostic_diagId = dtb_u_u383; f_Diagnostic_diagSeverity = dtb_u_u384; f_Diagnostic_diagPhase = dtb_u_u385; f_Diagnostic_diagCategory = dtb_u_u386; f_Diagnostic_diagCode = dtb_u_u387; f_Diagnostic_diagMessage = dtb_u_u388; f_Diagnostic_diagLabels = dtb_u_u389; f_Diagnostic_diagFields = dtb_u_u390; f_Diagnostic_diagTrace = dtb_u_u391; f_Diagnostic_diagNotes = dtb_u_u392; f_Diagnostic_diagSuggestions = dtb_u_u393; f_Diagnostic_diagOrigin = dtb_u_u394; f_Diagnostic_diagChildren = dtb_u_u395; f_Diagnostic_diagInternal = dtb_u_u396; f_Diagnostic_diagIce = dtb_u_u397; f_Diagnostic_diagAbsent = dtb_u_u398; f_Diagnostic_diagStability = dtb_u_u399 } -> dtb_u_u387
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Base/Diag.vuna"
let v_diagMessage = (fun (dtb_u_u400 : t_Diagnostic) -> (match dtb_u_u400 with
  | { f_Diagnostic_diagId = dtb_u_u401; f_Diagnostic_diagSeverity = dtb_u_u402; f_Diagnostic_diagPhase = dtb_u_u403; f_Diagnostic_diagCategory = dtb_u_u404; f_Diagnostic_diagCode = dtb_u_u405; f_Diagnostic_diagMessage = dtb_u_u406; f_Diagnostic_diagLabels = dtb_u_u407; f_Diagnostic_diagFields = dtb_u_u408; f_Diagnostic_diagTrace = dtb_u_u409; f_Diagnostic_diagNotes = dtb_u_u410; f_Diagnostic_diagSuggestions = dtb_u_u411; f_Diagnostic_diagOrigin = dtb_u_u412; f_Diagnostic_diagChildren = dtb_u_u413; f_Diagnostic_diagInternal = dtb_u_u414; f_Diagnostic_diagIce = dtb_u_u415; f_Diagnostic_diagAbsent = dtb_u_u416; f_Diagnostic_diagStability = dtb_u_u417 } -> dtb_u_u406
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Base/Diag.vuna"
let v_diagLabels = (fun (dtb_u_u418 : t_Diagnostic) -> (match dtb_u_u418 with
  | { f_Diagnostic_diagId = dtb_u_u419; f_Diagnostic_diagSeverity = dtb_u_u420; f_Diagnostic_diagPhase = dtb_u_u421; f_Diagnostic_diagCategory = dtb_u_u422; f_Diagnostic_diagCode = dtb_u_u423; f_Diagnostic_diagMessage = dtb_u_u424; f_Diagnostic_diagLabels = dtb_u_u425; f_Diagnostic_diagFields = dtb_u_u426; f_Diagnostic_diagTrace = dtb_u_u427; f_Diagnostic_diagNotes = dtb_u_u428; f_Diagnostic_diagSuggestions = dtb_u_u429; f_Diagnostic_diagOrigin = dtb_u_u430; f_Diagnostic_diagChildren = dtb_u_u431; f_Diagnostic_diagInternal = dtb_u_u432; f_Diagnostic_diagIce = dtb_u_u433; f_Diagnostic_diagAbsent = dtb_u_u434; f_Diagnostic_diagStability = dtb_u_u435 } -> dtb_u_u425
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Base/Diag.vuna"
let v_diagFields = (fun (dtb_u_u436 : t_Diagnostic) -> (match dtb_u_u436 with
  | { f_Diagnostic_diagId = dtb_u_u437; f_Diagnostic_diagSeverity = dtb_u_u438; f_Diagnostic_diagPhase = dtb_u_u439; f_Diagnostic_diagCategory = dtb_u_u440; f_Diagnostic_diagCode = dtb_u_u441; f_Diagnostic_diagMessage = dtb_u_u442; f_Diagnostic_diagLabels = dtb_u_u443; f_Diagnostic_diagFields = dtb_u_u444; f_Diagnostic_diagTrace = dtb_u_u445; f_Diagnostic_diagNotes = dtb_u_u446; f_Diagnostic_diagSuggestions = dtb_u_u447; f_Diagnostic_diagOrigin = dtb_u_u448; f_Diagnostic_diagChildren = dtb_u_u449; f_Diagnostic_diagInternal = dtb_u_u450; f_Diagnostic_diagIce = dtb_u_u451; f_Diagnostic_diagAbsent = dtb_u_u452; f_Diagnostic_diagStability = dtb_u_u453 } -> dtb_u_u444
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Base/Diag.vuna"
let v_diagTrace = (fun (dtb_u_u454 : t_Diagnostic) -> (match dtb_u_u454 with
  | { f_Diagnostic_diagId = dtb_u_u455; f_Diagnostic_diagSeverity = dtb_u_u456; f_Diagnostic_diagPhase = dtb_u_u457; f_Diagnostic_diagCategory = dtb_u_u458; f_Diagnostic_diagCode = dtb_u_u459; f_Diagnostic_diagMessage = dtb_u_u460; f_Diagnostic_diagLabels = dtb_u_u461; f_Diagnostic_diagFields = dtb_u_u462; f_Diagnostic_diagTrace = dtb_u_u463; f_Diagnostic_diagNotes = dtb_u_u464; f_Diagnostic_diagSuggestions = dtb_u_u465; f_Diagnostic_diagOrigin = dtb_u_u466; f_Diagnostic_diagChildren = dtb_u_u467; f_Diagnostic_diagInternal = dtb_u_u468; f_Diagnostic_diagIce = dtb_u_u469; f_Diagnostic_diagAbsent = dtb_u_u470; f_Diagnostic_diagStability = dtb_u_u471 } -> dtb_u_u463
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Diag.vuna"
let v_diagNotes = (fun (dtb_u_u472 : t_Diagnostic) -> (match dtb_u_u472 with
  | { f_Diagnostic_diagId = dtb_u_u473; f_Diagnostic_diagSeverity = dtb_u_u474; f_Diagnostic_diagPhase = dtb_u_u475; f_Diagnostic_diagCategory = dtb_u_u476; f_Diagnostic_diagCode = dtb_u_u477; f_Diagnostic_diagMessage = dtb_u_u478; f_Diagnostic_diagLabels = dtb_u_u479; f_Diagnostic_diagFields = dtb_u_u480; f_Diagnostic_diagTrace = dtb_u_u481; f_Diagnostic_diagNotes = dtb_u_u482; f_Diagnostic_diagSuggestions = dtb_u_u483; f_Diagnostic_diagOrigin = dtb_u_u484; f_Diagnostic_diagChildren = dtb_u_u485; f_Diagnostic_diagInternal = dtb_u_u486; f_Diagnostic_diagIce = dtb_u_u487; f_Diagnostic_diagAbsent = dtb_u_u488; f_Diagnostic_diagStability = dtb_u_u489 } -> dtb_u_u482
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Base/Diag.vuna"
let v_diagSuggestions = (fun (dtb_u_u490 : t_Diagnostic) -> (match dtb_u_u490 with
  | { f_Diagnostic_diagId = dtb_u_u491; f_Diagnostic_diagSeverity = dtb_u_u492; f_Diagnostic_diagPhase = dtb_u_u493; f_Diagnostic_diagCategory = dtb_u_u494; f_Diagnostic_diagCode = dtb_u_u495; f_Diagnostic_diagMessage = dtb_u_u496; f_Diagnostic_diagLabels = dtb_u_u497; f_Diagnostic_diagFields = dtb_u_u498; f_Diagnostic_diagTrace = dtb_u_u499; f_Diagnostic_diagNotes = dtb_u_u500; f_Diagnostic_diagSuggestions = dtb_u_u501; f_Diagnostic_diagOrigin = dtb_u_u502; f_Diagnostic_diagChildren = dtb_u_u503; f_Diagnostic_diagInternal = dtb_u_u504; f_Diagnostic_diagIce = dtb_u_u505; f_Diagnostic_diagAbsent = dtb_u_u506; f_Diagnostic_diagStability = dtb_u_u507 } -> dtb_u_u501
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Base/Diag.vuna"
let v_diagOrigin = (fun (dtb_u_u508 : t_Diagnostic) -> (match dtb_u_u508 with
  | { f_Diagnostic_diagId = dtb_u_u509; f_Diagnostic_diagSeverity = dtb_u_u510; f_Diagnostic_diagPhase = dtb_u_u511; f_Diagnostic_diagCategory = dtb_u_u512; f_Diagnostic_diagCode = dtb_u_u513; f_Diagnostic_diagMessage = dtb_u_u514; f_Diagnostic_diagLabels = dtb_u_u515; f_Diagnostic_diagFields = dtb_u_u516; f_Diagnostic_diagTrace = dtb_u_u517; f_Diagnostic_diagNotes = dtb_u_u518; f_Diagnostic_diagSuggestions = dtb_u_u519; f_Diagnostic_diagOrigin = dtb_u_u520; f_Diagnostic_diagChildren = dtb_u_u521; f_Diagnostic_diagInternal = dtb_u_u522; f_Diagnostic_diagIce = dtb_u_u523; f_Diagnostic_diagAbsent = dtb_u_u524; f_Diagnostic_diagStability = dtb_u_u525 } -> dtb_u_u520
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Base/Diag.vuna"
let v_diagChildren = (fun (dtb_u_u526 : t_Diagnostic) -> (match dtb_u_u526 with
  | { f_Diagnostic_diagId = dtb_u_u527; f_Diagnostic_diagSeverity = dtb_u_u528; f_Diagnostic_diagPhase = dtb_u_u529; f_Diagnostic_diagCategory = dtb_u_u530; f_Diagnostic_diagCode = dtb_u_u531; f_Diagnostic_diagMessage = dtb_u_u532; f_Diagnostic_diagLabels = dtb_u_u533; f_Diagnostic_diagFields = dtb_u_u534; f_Diagnostic_diagTrace = dtb_u_u535; f_Diagnostic_diagNotes = dtb_u_u536; f_Diagnostic_diagSuggestions = dtb_u_u537; f_Diagnostic_diagOrigin = dtb_u_u538; f_Diagnostic_diagChildren = dtb_u_u539; f_Diagnostic_diagInternal = dtb_u_u540; f_Diagnostic_diagIce = dtb_u_u541; f_Diagnostic_diagAbsent = dtb_u_u542; f_Diagnostic_diagStability = dtb_u_u543 } -> dtb_u_u539
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Base/Diag.vuna"
let v_diagInternal = (fun (dtb_u_u544 : t_Diagnostic) -> (match dtb_u_u544 with
  | { f_Diagnostic_diagId = dtb_u_u545; f_Diagnostic_diagSeverity = dtb_u_u546; f_Diagnostic_diagPhase = dtb_u_u547; f_Diagnostic_diagCategory = dtb_u_u548; f_Diagnostic_diagCode = dtb_u_u549; f_Diagnostic_diagMessage = dtb_u_u550; f_Diagnostic_diagLabels = dtb_u_u551; f_Diagnostic_diagFields = dtb_u_u552; f_Diagnostic_diagTrace = dtb_u_u553; f_Diagnostic_diagNotes = dtb_u_u554; f_Diagnostic_diagSuggestions = dtb_u_u555; f_Diagnostic_diagOrigin = dtb_u_u556; f_Diagnostic_diagChildren = dtb_u_u557; f_Diagnostic_diagInternal = dtb_u_u558; f_Diagnostic_diagIce = dtb_u_u559; f_Diagnostic_diagAbsent = dtb_u_u560; f_Diagnostic_diagStability = dtb_u_u561 } -> dtb_u_u558
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Base/Diag.vuna"
let v_diagIce = (fun (dtb_u_u562 : t_Diagnostic) -> (match dtb_u_u562 with
  | { f_Diagnostic_diagId = dtb_u_u563; f_Diagnostic_diagSeverity = dtb_u_u564; f_Diagnostic_diagPhase = dtb_u_u565; f_Diagnostic_diagCategory = dtb_u_u566; f_Diagnostic_diagCode = dtb_u_u567; f_Diagnostic_diagMessage = dtb_u_u568; f_Diagnostic_diagLabels = dtb_u_u569; f_Diagnostic_diagFields = dtb_u_u570; f_Diagnostic_diagTrace = dtb_u_u571; f_Diagnostic_diagNotes = dtb_u_u572; f_Diagnostic_diagSuggestions = dtb_u_u573; f_Diagnostic_diagOrigin = dtb_u_u574; f_Diagnostic_diagChildren = dtb_u_u575; f_Diagnostic_diagInternal = dtb_u_u576; f_Diagnostic_diagIce = dtb_u_u577; f_Diagnostic_diagAbsent = dtb_u_u578; f_Diagnostic_diagStability = dtb_u_u579 } -> dtb_u_u577
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Diag.vuna"
let v_diagAbsent = (fun (dtb_u_u580 : t_Diagnostic) -> (match dtb_u_u580 with
  | { f_Diagnostic_diagId = dtb_u_u581; f_Diagnostic_diagSeverity = dtb_u_u582; f_Diagnostic_diagPhase = dtb_u_u583; f_Diagnostic_diagCategory = dtb_u_u584; f_Diagnostic_diagCode = dtb_u_u585; f_Diagnostic_diagMessage = dtb_u_u586; f_Diagnostic_diagLabels = dtb_u_u587; f_Diagnostic_diagFields = dtb_u_u588; f_Diagnostic_diagTrace = dtb_u_u589; f_Diagnostic_diagNotes = dtb_u_u590; f_Diagnostic_diagSuggestions = dtb_u_u591; f_Diagnostic_diagOrigin = dtb_u_u592; f_Diagnostic_diagChildren = dtb_u_u593; f_Diagnostic_diagInternal = dtb_u_u594; f_Diagnostic_diagIce = dtb_u_u595; f_Diagnostic_diagAbsent = dtb_u_u596; f_Diagnostic_diagStability = dtb_u_u597 } -> dtb_u_u596
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Base/Diag.vuna"
let v_diagStability = (fun (dtb_u_u598 : t_Diagnostic) -> (match dtb_u_u598 with
  | { f_Diagnostic_diagId = dtb_u_u599; f_Diagnostic_diagSeverity = dtb_u_u600; f_Diagnostic_diagPhase = dtb_u_u601; f_Diagnostic_diagCategory = dtb_u_u602; f_Diagnostic_diagCode = dtb_u_u603; f_Diagnostic_diagMessage = dtb_u_u604; f_Diagnostic_diagLabels = dtb_u_u605; f_Diagnostic_diagFields = dtb_u_u606; f_Diagnostic_diagTrace = dtb_u_u607; f_Diagnostic_diagNotes = dtb_u_u608; f_Diagnostic_diagSuggestions = dtb_u_u609; f_Diagnostic_diagOrigin = dtb_u_u610; f_Diagnostic_diagChildren = dtb_u_u611; f_Diagnostic_diagInternal = dtb_u_u612; f_Diagnostic_diagIce = dtb_u_u613; f_Diagnostic_diagAbsent = dtb_u_u614; f_Diagnostic_diagStability = dtb_u_u615 } -> dtb_u_u615
  | _ -> failwith "DT: impossible branch"
))
