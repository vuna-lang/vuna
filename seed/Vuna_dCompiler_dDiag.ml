open Vuna_runtime
type t_Vuna_dCompiler_dDiag_dSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError | C_Vuna_dCompiler_dDiag_dSeverity_SevWarning | C_Vuna_dCompiler_dDiag_dSeverity_SevNote | C_Vuna_dCompiler_dDiag_dSeverity_SevHelp
and t_Vuna_dCompiler_dDiag_dPhase = C_Vuna_dCompiler_dDiag_dPhase_PhLex | C_Vuna_dCompiler_dDiag_dPhase_PhParse | C_Vuna_dCompiler_dDiag_dPhase_PhResolve | C_Vuna_dCompiler_dDiag_dPhase_PhLoad | C_Vuna_dCompiler_dDiag_dPhase_PhElab | C_Vuna_dCompiler_dDiag_dPhase_PhUnify | C_Vuna_dCompiler_dDiag_dPhase_PhCoverage | C_Vuna_dCompiler_dDiag_dPhase_PhTermination | C_Vuna_dCompiler_dDiag_dPhase_PhUsage | C_Vuna_dCompiler_dDiag_dPhase_PhCodegen | C_Vuna_dCompiler_dDiag_dPhase_PhPackage | C_Vuna_dCompiler_dDiag_dPhase_PhDriver | C_Vuna_dCompiler_dDiag_dPhase_PhTool | C_Vuna_dCompiler_dDiag_dPhase_PhInternal
and t_Vuna_dCompiler_dDiag_dCategory = C_Vuna_dCompiler_dDiag_dCategory_CatSyntax | C_Vuna_dCompiler_dDiag_dCategory_CatNames | C_Vuna_dCompiler_dDiag_dCategory_CatTypes | C_Vuna_dCompiler_dDiag_dCategory_CatUniverses | C_Vuna_dCompiler_dDiag_dCategory_CatCoverage | C_Vuna_dCompiler_dDiag_dCategory_CatTermination | C_Vuna_dCompiler_dDiag_dCategory_CatQuantity | C_Vuna_dCompiler_dDiag_dCategory_CatEffects | C_Vuna_dCompiler_dDiag_dCategory_CatRecords | C_Vuna_dCompiler_dDiag_dCategory_CatTraits | C_Vuna_dCompiler_dDiag_dCategory_CatCodegen | C_Vuna_dCompiler_dDiag_dCategory_CatPackage | C_Vuna_dCompiler_dDiag_dCategory_CatTool | C_Vuna_dCompiler_dDiag_dCategory_CatInternal
and t_Vuna_dCompiler_dDiag_dLabelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext
and t_Vuna_dCompiler_dDiag_dOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect | C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade of (int Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dDiag_dApplicability = C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable | C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect | C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder
and t_Vuna_dCompiler_dDiag_dLabel = { f_Vuna_dCompiler_dDiag_dLabel_labelSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dLabel_labelText : string; f_Vuna_dCompiler_dDiag_dLabel_labelStyle : t_Vuna_dCompiler_dDiag_dLabelStyle; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dDiagEdit = { f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText : string }
and t_Vuna_dCompiler_dDiag_dSuggestion = { f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle : string; f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability : t_Vuna_dCompiler_dDiag_dApplicability; f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits : t_Vuna_dCompiler_dDiag_dDiagEdit Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDiag_dCandidate = { f_Vuna_dCompiler_dDiag_dCandidate_candidateText : string; f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dCandidate_candidateReason : string Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dCallInfo = { f_Vuna_dCompiler_dDiag_dCallInfo_callCallee : string; f_Vuna_dCompiler_dDiag_dCallInfo_callArg : string; f_Vuna_dCompiler_dDiag_dCallInfo_callRelation : string; f_Vuna_dCompiler_dDiag_dCallInfo_callSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dDiag_dDiagField = C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldFound of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldName of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates of (t_Vuna_dCompiler_dDiag_dCandidate Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dDiag_dDiagField_FieldCall of (t_Vuna_dCompiler_dDiag_dCallInfo) | C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity of (string) * (int) * (int) | C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldModule of (string) | C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dDiag_dDiagField_FieldNote of (string)
and t_Vuna_dCompiler_dDiag_dTraceFrame = { f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dTraceFrame_traceText : string; f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren : t_Vuna_dCompiler_dDiag_dTraceFrame Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDiag_dIceInfo = { f_Vuna_dCompiler_dDiag_dIceInfo_icePhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint : string; f_Vuna_dCompiler_dDiag_dIceInfo_iceHint : string }
and t_Vuna_dCompiler_dDiag_dDiagnostic = { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId : int; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity : t_Vuna_dCompiler_dDiag_dSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase : t_Vuna_dCompiler_dDiag_dPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory : t_Vuna_dCompiler_dDiag_dCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode : string; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage : string; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels : t_Vuna_dCompiler_dDiag_dLabel Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields : t_Vuna_dCompiler_dDiag_dDiagField Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace : t_Vuna_dCompiler_dDiag_dTraceFrame Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions : t_Vuna_dCompiler_dDiag_dSuggestion Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin : t_Vuna_dCompiler_dDiag_dOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren : t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal : bool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce : t_Vuna_dCompiler_dDiag_dIceInfo Base_dMaybe.t_Base_dMaybe_dMaybe }
and 'a0 t_Vuna_dCompiler_dDiag_dCheck = C_Vuna_dCompiler_dDiag_dCheck_OkC of ('a0) | C_Vuna_dCompiler_dDiag_dCheck_ErrC of (t_Vuna_dCompiler_dDiag_dDiagnostic)

let v_Functor_uVuna_uCompiler_uDiag_uCheck = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0))
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Monad_uVuna_uCompiler_uDiag_uCheck = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2))
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

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

let v_Vuna_dCompiler_dDiag_ddiagNoLoc = (fun sev phase cat code msg -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = sev; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = phase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = cat; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = code; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })

let v_Vuna_dCompiler_dDiag_ddiagAt = (fun sp sev phase cat code msg -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = sev; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = phase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = cat; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = code; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })

let v_Vuna_dCompiler_dDiag_derr = (fun msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhTool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTool; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))

let v_Vuna_dCompiler_dDiag_drawAt = (fun sp msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhElab; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTypes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))

let v_Vuna_dCompiler_dDiag_drawNoLoc = (fun msg -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ({ f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = 0; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = C_Vuna_dCompiler_dDiag_dSeverity_SevError; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = C_Vuna_dCompiler_dDiag_dPhase_PhElab; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = C_Vuna_dCompiler_dDiag_dCategory_CatTypes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = ""; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = msg; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = false; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })))

let v_Vuna_dCompiler_dDiag_dwithLabel = (fun l d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) (Base_dList.C_Base_dList_dList_Cons (l, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithField = (fun f d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields) (Base_dList.C_Base_dList_dList_Cons (f, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithNote = (fun n d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes) (Base_dList.C_Base_dList_dList_Cons (n, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithHelp = (fun h d -> ((v_Vuna_dCompiler_dDiag_dwithNote ("help: " ^ h)) d))

let v_Vuna_dCompiler_dDiag_dwithSuggestion = (fun s d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions) (Base_dList.C_Base_dList_dList_Cons (s, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithTrace = (fun t d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = ((Base_dList.v_Base_dList_dappend (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithOrigin = (fun o d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = o; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let v_Vuna_dCompiler_dDiag_dwithContext = (fun msp name d -> ((fun added -> (match msp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) added)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> added
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = msp; f_Vuna_dCompiler_dDiag_dLabel_labelText = (String.concat "" ["in `"; name; "`"]); f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) d)))

let rec v_Vuna_dCompiler_dDiag_dprimarySpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__14 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__16; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__17; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__18; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__19 } -> (match dtb__18 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__16
  | _ -> (v_Vuna_dCompiler_dDiag_dprimarySpanOf dtb__15)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiag_dcontextPrefixOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__20 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__22; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__23; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__24; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__25 } -> (match dtb__24 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> (dtb__23 ^ ": ")
  | _ -> (v_Vuna_dCompiler_dDiag_dcontextPrefixOf dtb__21)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dlocPrefixOf = (fun labels -> (match (v_Vuna_dCompiler_dDiag_dprimarySpanOf labels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc dtb__26) ^ ": ")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_ddiagText = (fun d -> ((fun body -> (String.concat "" [(v_Vuna_dCompiler_dDiag_dlocPrefixOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels); (v_Vuna_dCompiler_dDiag_dcontextPrefixOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels); body])) (if ((d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage else (String.concat "" ["["; (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; "] "; (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage]))))

let v_Vuna_dCompiler_dDiag_dappendMessage = (fun suffix d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = ((d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage ^ suffix); f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce })

let rec v_Vuna_dCompiler_dDiag_dhasPrimaryLabel = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__29; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__30; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__31; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__32 } -> (match dtb__31 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> true
  | _ -> (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel dtb__28)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dwithFallbackSpan = (fun sp d -> (if (v_Vuna_dCompiler_dDiag_dhasPrimaryLabel (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) then d else ((v_Vuna_dCompiler_dDiag_dwithLabel { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)); f_Vuna_dCompiler_dDiag_dLabel_labelText = ""; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) d)))

let v_Vuna_dCompiler_dDiag_dmarkInternal = (fun fn invariant d -> { f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagId; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity; f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory; f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels; f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields; f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace; f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes; f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions; f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin; f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren; f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = true; f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDiag_dIceInfo_icePhase = C_Vuna_dCompiler_dDiag_dPhase_PhInternal; f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction = fn; f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant = invariant; f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint = ""; f_Vuna_dCompiler_dDiag_dIceInfo_iceHint = "this is a compiler bug; please report it with the command line and source" })) })

let v_Vuna_dCompiler_dDiag_dicFuel = (fun phase -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dDiag_dmarkInternal "fuel") phase) (((((v_Vuna_dCompiler_dDiag_ddiagNoLoc C_Vuna_dCompiler_dDiag_dSeverity_SevError) C_Vuna_dCompiler_dDiag_dPhase_PhInternal) C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_FuelExhausted") (phase ^ " ran out of fuel (compiler invariant: the phase must make progress)"))))))

let v_Vuna_dCompiler_dDiag_dicInternal = (fun what -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dDiag_dmarkInternal "invariant") what) (((((v_Vuna_dCompiler_dDiag_ddiagNoLoc C_Vuna_dCompiler_dDiag_dSeverity_SevError) C_Vuna_dCompiler_dDiag_dPhase_PhInternal) C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_InvariantViolated") ("internal invariant violated: " ^ what))))))

let v_Vuna_dCompiler_dDiag_donErrDiag = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__33) -> (C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__33))
  | C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__34) -> (C_Vuna_dCompiler_dDiag_dCheck_ErrC ((mc0 dtb__34)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiag_dprimaryLabelOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__37; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__38; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__39; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__40 } -> (match dtb__39 with
  | C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35))
  | _ -> (v_Vuna_dCompiler_dDiag_dprimaryLabelOf dtb__36)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__35)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_ddiagFileOf = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> (match dtb__41 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__42; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__43; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__44; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__45 } -> (match dtb__42 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__46)
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDiag_dprimaryLabelOf (d).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)))

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

let rec v_Vuna_dCompiler_dDiag_dlabelSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (match dtb__47 with
  | { f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__49; f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__50; f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__51; f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__52 } -> (match dtb__49 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = 0 } } }, (v_Vuna_dCompiler_dDiag_dlabelSpanOf dtb__48)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__53); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__53); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol dtb__53); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine dtb__53) } } }, (v_Vuna_dCompiler_dDiag_dlabelSpanOf dtb__48)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dsameDiag = (fun a b -> (if (if (if ((a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode) then ((a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) else false) then ((v_Vuna_dCompiler_dDiag_dsameSeverity (a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity) (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity) else false) then (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dString.v_Eq_uString) ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dInt.v_Eq_uInt) ((Base_dPair.v_Eq_uBase_uPair_uPair_ua_ub Base_dInt.v_Eq_uInt) Base_dInt.v_Eq_uInt))))) (v_Vuna_dCompiler_dDiag_dlabelSpanOf (a).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)) (v_Vuna_dCompiler_dDiag_dlabelSpanOf (b).f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)) else false))
