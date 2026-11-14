open Vuna_runtime
type t_Vuna_dCompiler_dDiag_dSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError | C_Vuna_dCompiler_dDiag_dSeverity_SevWarning | C_Vuna_dCompiler_dDiag_dSeverity_SevNote | C_Vuna_dCompiler_dDiag_dSeverity_SevHelp
and t_Vuna_dCompiler_dDiag_dPhase = C_Vuna_dCompiler_dDiag_dPhase_PhLex | C_Vuna_dCompiler_dDiag_dPhase_PhParse | C_Vuna_dCompiler_dDiag_dPhase_PhResolve | C_Vuna_dCompiler_dDiag_dPhase_PhLoad | C_Vuna_dCompiler_dDiag_dPhase_PhElab | C_Vuna_dCompiler_dDiag_dPhase_PhUnify | C_Vuna_dCompiler_dDiag_dPhase_PhCoverage | C_Vuna_dCompiler_dDiag_dPhase_PhTermination | C_Vuna_dCompiler_dDiag_dPhase_PhUsage | C_Vuna_dCompiler_dDiag_dPhase_PhCodegen | C_Vuna_dCompiler_dDiag_dPhase_PhPackage | C_Vuna_dCompiler_dDiag_dPhase_PhDriver | C_Vuna_dCompiler_dDiag_dPhase_PhTool | C_Vuna_dCompiler_dDiag_dPhase_PhInternal
and t_Vuna_dCompiler_dDiag_dCategory = C_Vuna_dCompiler_dDiag_dCategory_CatSyntax | C_Vuna_dCompiler_dDiag_dCategory_CatNames | C_Vuna_dCompiler_dDiag_dCategory_CatTypes | C_Vuna_dCompiler_dDiag_dCategory_CatUniverses | C_Vuna_dCompiler_dDiag_dCategory_CatCoverage | C_Vuna_dCompiler_dDiag_dCategory_CatTermination | C_Vuna_dCompiler_dDiag_dCategory_CatQuantity | C_Vuna_dCompiler_dDiag_dCategory_CatEffects | C_Vuna_dCompiler_dDiag_dCategory_CatRecords | C_Vuna_dCompiler_dDiag_dCategory_CatTraits | C_Vuna_dCompiler_dDiag_dCategory_CatCodegen | C_Vuna_dCompiler_dDiag_dCategory_CatPackage | C_Vuna_dCompiler_dDiag_dCategory_CatTool | C_Vuna_dCompiler_dDiag_dCategory_CatInternal
and t_Vuna_dCompiler_dDiag_dLabelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext
and t_Vuna_dCompiler_dDiag_dOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect | C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade of (int Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dDiag_dApplicability = C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable | C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect | C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder
and t_Vuna_dCompiler_dDiag_dNoSourceReason = C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsPackageGraph | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal
and t_Vuna_dCompiler_dDiag_dStability = C_Vuna_dCompiler_dDiag_dStability_Stable | C_Vuna_dCompiler_dDiag_dStability_Volatile
and t_Vuna_dCompiler_dDiag_dLabel = { f_Vuna_dCompiler_dDiag_dLabel_labelSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dLabel_labelText : string; f_Vuna_dCompiler_dDiag_dLabel_labelStyle : t_Vuna_dCompiler_dDiag_dLabelStyle; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dDiagEdit = { f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText : string }
and t_Vuna_dCompiler_dDiag_dSuggestion = { f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle : string; f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability : t_Vuna_dCompiler_dDiag_dApplicability; f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits : t_Vuna_dCompiler_dDiag_dDiagEdit Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDiag_dCandidate = { f_Vuna_dCompiler_dDiag_dCandidate_candidateText : string; f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dCandidate_candidateReason : string Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dCallInfo = { f_Vuna_dCompiler_dDiag_dCallInfo_callCallee : string; f_Vuna_dCompiler_dDiag_dCallInfo_callArg : string; f_Vuna_dCompiler_dDiag_dCallInfo_callRelation : string; f_Vuna_dCompiler_dDiag_dCallInfo_callSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dDiagField = C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldFound of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldName of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates of (t_Vuna_dCompiler_dDiag_dCandidate Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dDiag_dDiagField_FieldCall of (t_Vuna_dCompiler_dDiag_dCallInfo) | C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity of (string) * (int) * (int) | C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldModule of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dDiag_dDiagField_FieldNote of (string)
and t_Vuna_dCompiler_dDiag_dTraceFrame = { f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dTraceFrame_traceText : string; f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren : t_Vuna_dCompiler_dDiag_dTraceFrame Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDiag_dIceInfo = { f_Vuna_dCompiler_dDiag_dIceInfo_icePhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceHint : string }
and t_Vuna_dCompiler_dDiag_dDiagnostic = { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId : int; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity : t_Vuna_dCompiler_dDiag_dSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory : t_Vuna_dCompiler_dDiag_dCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode : string; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage : string; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels : t_Vuna_dCompiler_dDiag_dLabel Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields : t_Vuna_dCompiler_dDiag_dDiagField Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace : t_Vuna_dCompiler_dDiag_dTraceFrame Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions : t_Vuna_dCompiler_dDiag_dSuggestion Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin : t_Vuna_dCompiler_dDiag_dOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren : t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal : bool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce : t_Vuna_dCompiler_dDiag_dIceInfo Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent : t_Vuna_dCompiler_dDiag_dNoSourceReason Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability : t_Vuna_dCompiler_dDiag_dStability }
and 'a0 t_Vuna_dCompiler_dDiag_dCheck = C_Vuna_dCompiler_dDiag_dCheck_OkC of ('a0) | C_Vuna_dCompiler_dDiag_dCheck_ErrC of (t_Vuna_dCompiler_dDiag_dDiagnostic)

# 357 "Vuna/Compiler/Diag.vuna"
let v_Functor_uVuna_uCompiler_uDiag_uCheck = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0))
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))))

# 361 "Vuna/Compiler/Diag.vuna"
let v_Monad_uVuna_uCompiler_uDiag_uCheck = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2))
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 365 "Vuna/Compiler/Diag.vuna"
let v_Applicative_uVuna_uCompiler_uDiag_uCheck = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun _uarity1 -> (C_Vuna_dCompiler_dDiag_dCheck_OkC (_uarity1))), (fun mf mx -> (match mf with
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__4) -> (match mx with
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__5) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__4 dtb__5)))
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__7) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__7))
  | _ -> failwith "DT: impossible branch"
)), (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__8) -> (match mc2 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9))
  | _ -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__8))
)
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10) -> (match mc2 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__11) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__11))
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__12) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC (((mc0 dtb__10) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 192 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_ddiagNoLoc = (fun sev phase cat code msg -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = sev; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = phase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = cat; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = code; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Volatile })

# 198 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_ddiagAt = (fun sp sev phase cat code msg -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = sev; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = phase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = cat; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = code; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Stable })

# 204 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_derr = (fun msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhTool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Volatile })))

# 210 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_drawAt = (fun sp msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhElab; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTypes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Stable })))

# 216 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_drawNoLoc = (fun msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhElab; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTypes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Volatile })))

# 237 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithStability = (fun s d -> { d with f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = s })

# 255 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dmapSpanPath = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (mc0 (dtb__13).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (dtb__13).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (dtb__13).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (dtb__13).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (dtb__13).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dmapLabelFile = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__14; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__15; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__16; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__17 } -> { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = ((v_Vuna_dCompiler_dDiag_dmapSpanPath mc0) dtb__14); f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__15; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__16; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = ((v_Vuna_dCompiler_dDiag_dmapSpanPath mc0) dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dmapSpanFile = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = dtb__18; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__19; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__20; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__21; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = dtb__22; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = dtb__23; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = dtb__24; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = dtb__25; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = dtb__26; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = dtb__27; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = dtb__28; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = dtb__29; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = dtb__30; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = dtb__31; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = dtb__32; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__33; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__34 } -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = dtb__18; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__19; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__20; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__21; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = dtb__22; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = dtb__23; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dmapLabelFile mc0)) dtb__24); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = dtb__25; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = dtb__26; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = dtb__27; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = dtb__28; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = dtb__29; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = ((v_Vuna_dCompiler_dDiag_dmapDiagChildren mc0) dtb__30); f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = dtb__31; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = dtb__32; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__33; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__34 }
  | _ -> failwith "DT: impossible branch"
))
# 247 "Vuna/Compiler/Diag.vuna"
and v_Vuna_dCompiler_dDiag_dmapDiagChildren = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDiag_dmapSpanFile mc0) dtb__35), ((v_Vuna_dCompiler_dDiag_dmapDiagChildren mc0) dtb__36)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dstabilityOfAbsent = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal -> C_Vuna_dCompiler_dDiag_dStability_Volatile
  | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsPackageGraph -> C_Vuna_dCompiler_dDiag_dStability_Volatile
  | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsToolUsage -> C_Vuna_dCompiler_dDiag_dStability_Volatile
  | C_Vuna_dCompiler_dDiag_dNoSourceReason_NsSynthetic -> C_Vuna_dCompiler_dDiag_dStability_Volatile
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithField = (fun f d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields) (Base_dList.C_Base_dList_dList_Cons (f, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 280 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithNote = (fun n d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes) (Base_dList.C_Base_dList_dList_Cons (n, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 287 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithHelp = (fun h d -> ((v_Vuna_dCompiler_dDiag_dwithNote ("help: " ^ h)) d))

# 291 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithSuggestion = (fun s d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions) (Base_dList.C_Base_dList_dList_Cons (s, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 298 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithTrace = (fun t d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 305 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithOrigin = (fun o d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = o; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 324 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dprimarySpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__37 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__39; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__40; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__41; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__42 } -> (match dtb__41 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__39
  | _ -> (v_Vuna_dCompiler_dDiag_dprimarySpanOf dtb__38)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dcontextPrefixOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (match dtb__43 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__45; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__46; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__47; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__48 } -> (match dtb__47 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> (dtb__46 ^ ": ")
  | _ -> (v_Vuna_dCompiler_dDiag_dcontextPrefixOf dtb__44)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dlocPrefixOf = (fun labels -> (match (v_Vuna_dCompiler_dDiag_dprimarySpanOf labels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc dtb__49) ^ ": ")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_ddiagText = (fun d -> ((fun body -> (String.concat "" [(v_Vuna_dCompiler_dDiag_dlocPrefixOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels); (v_Vuna_dCompiler_dDiag_dcontextPrefixOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels); body])) (if ((d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage else (String.concat "" ["["; (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; "] "; (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage]))))

# 349 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dappendMessage = (fun suffix d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = ((d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage ^ suffix); f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 379 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithChildren = (fun cs d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = cs; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 399 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithLabelFileIfEmpty = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__50; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__51; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__52; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__53 } -> (match dtb__50 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__54) = "") then { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = mc0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__54); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol dtb__54); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine dtb__54); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol dtb__54) })); f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__51; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__52; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__53 } else { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54)); f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__51; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__52; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__53 })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__51; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__52; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__53 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithSpanFileIfEmpty = (fun path d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dwithLabelFileIfEmpty path)) (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability })

# 406 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dhasPrimaryLabel = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__55 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__57; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__58; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__59; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__60 } -> (match dtb__59 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> true
  | _ -> (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel dtb__56)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dnormalizeSite = (fun d -> (if (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) then { { d with f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing } with f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Stable } else d))

# 225 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithLabel = (fun l d -> (v_Vuna_dCompiler_dDiag_dnormalizeSite { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) (Base_dList.C_Base_dList_dList_Cons (l, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce; f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent; f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability }))

# 261 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithAbsent = (fun reason d -> (if (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) then d else { { d with f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (reason)) } with f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = (v_Vuna_dCompiler_dDiag_dstabilityOfAbsent reason) }))

# 312 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithContext = (fun msp name d -> ((fun added -> (match msp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) added)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> added
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = msp; f_Vuna_dCompiler_dDiag_dLabel_labelText = (String.concat "" ["in `"; name; "`"]); f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) d)))

# 386 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dwithFallbackSpan = (fun sp d -> (if (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) then d else ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) d)))

# 415 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dmarkInternal = (fun fn invariant d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = true; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDiag_dIceInfo_icePhase = C_Vuna_dCompiler_dDiag_dPhase_PhInternal; f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction = fn; f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant = invariant; f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint = ""; f_Vuna_dCompiler_dDiag_dIceInfo_iceHint = "this is a compiler bug; please report it with the command line and source" })); f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (C_Vuna_dCompiler_dDiag_dNoSourceReason_NsInternal)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = C_Vuna_dCompiler_dDiag_dStability_Volatile })

# 424 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dicFuel = (fun phase -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dDiag_dmarkInternal "fuel") phase) (((((v_Vuna_dCompiler_dDiag_ddiagNoLoc C_Vuna_dCompiler_dDiag_dSeverity_SevError) C_Vuna_dCompiler_dDiag_dPhase_PhInternal) C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_FuelExhausted") (phase ^ " ran out of fuel (compiler invariant: the phase must make progress)"))))))

# 430 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dicInternal = (fun what -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dDiag_dmarkInternal "invariant") what) (((((v_Vuna_dCompiler_dDiag_ddiagNoLoc C_Vuna_dCompiler_dDiag_dSeverity_SevError) C_Vuna_dCompiler_dDiag_dPhase_PhInternal) C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_InvariantViolated") ("internal invariant violated: " ^ what))))))

# 436 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_donErrDiag = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__62) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__62))
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__63) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((mc0 dtb__63)))
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dprimaryLabelOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__66; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__67; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__68; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__69 } -> (match dtb__68 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64))
  | _ -> (v_Vuna_dCompiler_dDiag_dprimaryLabelOf dtb__65)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__64)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_ddiagFileOf = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (match dtb__70 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__71; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__72; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__73; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__74 } -> (match dtb__71 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__75)
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDiag_dprimaryLabelOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)))

# 453 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dsameSeverity = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dDiag_dSeverity_SevError -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dSeverity_SevError -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Diag.vuna"
let rec v_Vuna_dCompiler_dDiag_dlabelSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match dtb__76 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__78; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__79; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__80; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__81 } -> (match dtb__78 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = 0 } } }, (v_Vuna_dCompiler_dDiag_dlabelSpanOf dtb__77)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__82); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__82); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol dtb__82); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine dtb__82) } } }, (v_Vuna_dCompiler_dDiag_dlabelSpanOf dtb__77)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Diag.vuna"
let v_Vuna_dCompiler_dDiag_dsameDiag = (fun a b -> (if (if (if ((a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode) then ((a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) else false) then ((v_Vuna_dCompiler_dDiag_dsameSeverity (a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity) (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity) else false) then (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dString.v_Eq_uString) ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dInt.v_Eq_uInt) ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dInt.v_Eq_uInt) Base_dInt.v_Eq_uInt))))) (v_Vuna_dCompiler_dDiag_dlabelSpanOf (a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)) (v_Vuna_dCompiler_dDiag_dlabelSpanOf (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)) else false))
