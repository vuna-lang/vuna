open Vuna_runtime
let v_Vuna_dCompiler_dDiag_dFormat_dseverityName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "help"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dphaseName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal -> "internal"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTool -> "tool"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhDriver -> "driver"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhPackage -> "package"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCodegen -> "codegen"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUsage -> "usage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhTermination -> "termination"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCoverage -> "coverage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhUnify -> "unify"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhElab -> "elab"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad -> "load"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhResolve -> "resolve"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhParse -> "parse"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLex -> "lex"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dcategoryName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal -> "internal"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTool -> "tool"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage -> "package"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCodegen -> "codegen"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTraits -> "traits"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatRecords -> "records"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatEffects -> "effects"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatQuantity -> "quantity"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTermination -> "termination"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCoverage -> "coverage"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatUniverses -> "universes"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatTypes -> "types"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatNames -> "names"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatSyntax -> "syntax"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_doriginName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__0) -> "cascade"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> "direct"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_HasPlaceholder -> "has-placeholder"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MaybeIncorrect -> "maybe-incorrect"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable -> "machine-applicable"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_drenderShort = (fun _uarity0 -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText _uarity0))

let rec v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (match dtb__1 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__3; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__4; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__5; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__6 } -> (match dtb__5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__3
  | _ -> (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan dtb__2)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiag_dFormat_dprimaryText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__7 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__9; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__10; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__11; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__12 } -> (match dtb__11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> dtb__10
  | _ -> (v_Vuna_dCompiler_dDiag_dFormat_dprimaryText dtb__8)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiag_dFormat_dlineAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (mc1 <= 1) then dtb__13 else ((v_Vuna_dCompiler_dDiag_dFormat_dlineAt dtb__14) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dtabToSpace = (fun mc0 -> (if (mc0 = 9) then 32 else mc0))

let v_Vuna_dCompiler_dDiag_dFormat_ddisplayLine = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dtabToSpace) (Base_dList.dtp_unpack s))))

let rec v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace = (fun n -> (if (n <= 0) then "" else (" " ^ (v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (n - 1)))))

let v_Vuna_dCompiler_dDiag_dFormat_dpadLeft = (fun n s -> (if ((bi_strLength s) >= n) then s else ((v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (n - (bi_strLength s))) ^ s)))

let v_Vuna_dCompiler_dDiag_dFormat_dcaretWidth = (fun sp -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine sp) <> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)) then 1 else (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp) > (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)) then ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp) - (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)) else 1)))

let v_Vuna_dCompiler_dDiag_dFormat_dsnippetOf = (fun sp text -> ((fun lines -> ((fun src -> ((fun display -> ((fun lineNumber -> ((fun width -> ((fun start -> ((fun carets -> ((fun gutter -> ((fun numberRow -> ((fun caretRow -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons (("  --> " ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc sp)), (Base_dList.C_Base_dList_dList_Cons (gutter, (Base_dList.C_Base_dList_dList_Cons (numberRow, (Base_dList.C_Base_dList_dList_Cons (caretRow, Base_dList.C_Base_dList_dList_Nil)))))))))) (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (width + 1)); "|"; (v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (start + 1)); ((Base_dString.v_Base_dString_drepeat (bi_natFromInt carets)) "^")]))) (String.concat "" [((v_Vuna_dCompiler_dDiag_dFormat_dpadLeft width) lineNumber); " | "; display]))) ((v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace (width + 1)) ^ "|"))) (v_Vuna_dCompiler_dDiag_dFormat_dcaretWidth sp))) (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp) <= 0) then 0 else ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp) - 1)))) (bi_strLength lineNumber))) (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)))) (v_Vuna_dCompiler_dDiag_dFormat_ddisplayLine src))) ((v_Vuna_dCompiler_dDiag_dFormat_dlineAt lines) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)))) (Base_dString.v_Base_dString_dlines text)))

let v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet = (fun sp -> (if (Base_dEff.v_Base_dEff_drunPure (Base_dHost.v_Base_dHost_dfileExists (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp))) then (if (Base_dEff.v_Base_dEff_drunPure (Base_dHost.v_Base_dHost_disDirectory (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp))) then "" else ((v_Vuna_dCompiler_dDiag_dFormat_dsnippetOf sp) (Base_dEff.v_Base_dEff_drunPure (Base_dHost.v_Base_dHost_dreadFile (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp))))) else ""))

let v_Vuna_dCompiler_dDiag_dFormat_dhexDigit = (fun n -> (if (n < 10) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) 1) "0123456789abcdef") else (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) 1) "0123456789abcdef")))

let v_Vuna_dCompiler_dDiag_dFormat_dhex2 = (fun n -> ((fun hi -> ((fun lo -> ((v_Vuna_dCompiler_dDiag_dFormat_dhexDigit hi) ^ (v_Vuna_dCompiler_dDiag_dFormat_dhexDigit lo))) (n - (hi * 16)))) (if 16 = 0 then failwith "division by zero" else n / 16)))

let v_Vuna_dCompiler_dDiag_dFormat_djsonEscapeChar = (fun mc0 -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (mc0 = 10) then "\\n" else (if (mc0 = 13) then "\\r" else (if (mc0 = 9) then "\\t" else (if (mc0 < 32) then ("\\u00" ^ (v_Vuna_dCompiler_dDiag_dFormat_dhex2 mc0)) else (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))))))))))

let v_Vuna_dCompiler_dDiag_dFormat_djsonEscape = (fun s -> ((Base_dString.v_Base_dString_djoin "") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonEscapeChar) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDiag_dFormat_djsonStr = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dDiag_dFormat_djsonEscape s); "\""]))

let v_Vuna_dCompiler_dDiag_dFormat_djsonPos = (fun line col -> (String.concat "" ["{\"line\":"; (bi_strFromInt line); ",\"column\":"; (bi_strFromInt col); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_djsonSpan = (fun sp -> (String.concat "" ["{\"file\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile); ",\"start\":"; ((v_Vuna_dCompiler_dDiag_dFormat_djsonPos (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol); ",\"end\":"; ((v_Vuna_dCompiler_dDiag_dFormat_djsonPos (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_dstyleName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext -> "context"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelSecondary -> "secondary"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> "primary"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan dtb__15)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_djsonLabel = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__16; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__17; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__18; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__19 } -> (String.concat "" ["{\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan dtb__16); ",\"style\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dstyleName dtb__18)); ",\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__17); ",\"provenance\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan dtb__19); "}"])
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonString = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__20)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_djsonCandidate = (fun c -> (String.concat "" ["{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan); ",\"reason\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonString (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_djsonField = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (dtb__21) -> (String.concat "" ["{\"kind\":\"note\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__21); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (dtb__22, dtb__23) -> (String.concat "" ["{\"kind\":\"span\",\"name\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__22); ",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan dtb__23); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (dtb__24) -> (String.concat "" ["{\"kind\":\"module\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__24); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (dtb__25) -> (String.concat "" ["{\"kind\":\"effect\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__25); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (dtb__26, dtb__27, dtb__28) -> (String.concat "" ["{\"kind\":\"quantity\",\"value\":{\"name\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__26); ",\"declared\":"; (bi_strFromInt dtb__27); ",\"observed\":"; (bi_strFromInt dtb__28); "}}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (dtb__29) -> (String.concat "" ["{\"kind\":\"call\",\"value\":{\"callee\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__29).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee); ",\"arg\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__29).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg); ",\"relation\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (dtb__29).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (dtb__29).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan); "}}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (dtb__30) -> (String.concat "" ["{\"kind\":\"candidates\",\"value\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonCandidate) dtb__30)); "]}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (dtb__31) -> (String.concat "" ["{\"kind\":\"name\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__31); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (dtb__32) -> (String.concat "" ["{\"kind\":\"found\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__32); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (dtb__33) -> (String.concat "" ["{\"kind\":\"expected\",\"value\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr dtb__33); "}"])
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_djsonDiagEdit = (fun e -> (String.concat "" ["{\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonSpan (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan); ",\"newText\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (e).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_djsonSuggestion = (fun s -> (String.concat "" ["{\"title\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle); ",\"applicability\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability)); ",\"edits\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonDiagEdit) (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits)); "]}"]))

let rec v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel = (fun fuel t -> (if (fuel <= 0) then "{\"phase\":\"truncated\"}" else (String.concat "" ["{\"phase\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase)); ",\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText); ",\"span\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceSpan); ",\"children\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel (fuel - 1))) (t).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceChildren)); "]}"])))

let v_Vuna_dCompiler_dDiag_dFormat_djsonTrace = (fun t -> ((v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel 64) t))

let v_Vuna_dCompiler_dDiag_dFormat_djsonIce = (fun i -> (String.concat "" ["{\"phase\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_icePhase)); ",\"function\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFunction); ",\"invariant\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceInvariant); ",\"fingerprint\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceFingerprint); ",\"hint\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (i).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dIceInfo_iceHint); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonIce = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__34) -> (v_Vuna_dCompiler_dDiag_dFormat_djsonIce dtb__34)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dmaybeParent = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> (bi_strFromInt dtb__35)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_doriginJson = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__36) -> (String.concat "" ["{\"kind\":\"cascade\",\"parent\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeParent dtb__36); "}"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> "{\"kind\":\"direct\"}"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifLevel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId = (fun d -> (if ((d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then "vuna" else (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion = (fun sp -> (String.concat "" ["{\"startLine\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)); ",\"startColumn\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol sp)); ",\"endLine\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine sp)); ",\"endColumn\":"; (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol sp)); "}"]))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifLocation = (fun file sp -> (String.concat "" ["{\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr file); "},\"region\":"; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion sp); "}}"]))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifRelated = (fun file l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (String.concat "" ["{\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText); "}}"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__37) -> (String.concat "" ["{\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText); "},\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__37)); "},\"region\":"; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion dtb__37); "}}"])
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_disPrimaryLabel = (fun l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> true
  | _ -> false
))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifResult = (fun d -> ((fun primary -> ((fun related -> ((fun relJson -> ((fun notesText -> ((fun msg -> (String.concat "" ["{\"ruleId\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d)); ",\"level\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifLevel (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity)); ",\"message\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr msg); "}"; primary; relJson; ",\"properties\":{\"vuna.origin\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_doriginName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin)); "}}"])) (if (notesText = "") then (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage else (String.concat "" [(d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage; "\n"; notesText])))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap (fun n -> ("note: " ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)))) (if ((Base_dList.v_Base_dList_dlength related) = 0) then "" else (String.concat "" [",\"relatedLocations\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDiag_dFormat_dsarifRelated (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d))) related)); "]"])))) ((Base_dList.v_Base_dList_dfilter (fun l -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDiag_dFormat_disPrimaryLabel l)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels))) (match (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (String.concat "" [",\"locations\":["; ((v_Vuna_dCompiler_dDiag_dFormat_dsarifLocation (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dtb__38)) dtb__38); "]"])
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDiag_dFormat_dmemCode = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (mc0 = dtb__39) then true else ((v_Vuna_dCompiler_dDiag_dFormat_dmemCode mc0) dtb__40))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_duniqueCodes = (fun ds -> (((Base_dList.v_Base_dList_dfoldl (fun acc d -> (if ((v_Vuna_dCompiler_dDiag_dFormat_dmemCode (v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d)) acc) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId d), Base_dList.C_Base_dList_dList_Nil)))))) Base_dList.C_Base_dList_dList_Nil) ds))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifLevelName = (fun mc0 -> (if (mc0 = "error") then "error" else (if (mc0 = "warning") then "warning" else "note")))

let v_Vuna_dCompiler_dDiag_dFormat_druleJson = (fun code -> ((fun desc -> ((fun sev -> ((fun phase -> ((fun cat -> (String.concat "" ["{\"id\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr code); ",\"shortDescription\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr desc); "},\"help\":{\"text\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr desc); "},\"defaultConfiguration\":{\"level\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dsarifLevelName sev)); "},\"properties\":{\"tags\":["; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr phase); ","; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr cat); "]}}"])) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagCategoryOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagPhaseOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagSeverityOf (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_dcodeDomain code)))) (match (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagDescOf code) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> dtb__41
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> code
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDiag_dFormat_dsarifRules = (fun ds -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_druleJson) (v_Vuna_dCompiler_dDiag_dFormat_duniqueCodes ds))))

let v_Vuna_dCompiler_dDiag_dFormat_drenderSarif = (fun ds -> (String.concat "" ["{\"$schema\":\"https://json.schemastore.org/sarif-2.1.0.json\",\"version\":\"2.1.0\",\"runs\":[{\"tool\":{\"driver\":{\"name\":\"vuna\",\"version\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion); ",\"rules\":["; (v_Vuna_dCompiler_dDiag_dFormat_dsarifRules ds); "]}},\"results\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dsarifResult) ds)); "]}]}"]))

let v_Vuna_dCompiler_dDiag_dFormat_dlangRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef "en"))

let v_Vuna_dCompiler_dDiag_dFormat_dsetDiagLang = (fun lang -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDiag_dFormat_dlangRef) lang)))

let v_Vuna_dCompiler_dDiag_dFormat_ddiagLang = (fun _u -> (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDiag_dFormat_dlangRef)))

let v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage = (fun d -> (if ((v_Vuna_dCompiler_dDiag_dFormat_ddiagLang 0) = "zh") then (match (Vuna_dCompiler_dDiagnostics.v_Vuna_dCompiler_dDiagnostics_ddiagDescOf (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> dtb__42
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage
  | _ -> failwith "DT: impossible branch"
) else (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage))

let v_Vuna_dCompiler_dDiag_dFormat_dheaderOf = (fun d -> ((fun msg -> (if ((d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = "") then (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity); ": "; msg]) else (String.concat "" [(v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity); "["; (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode; "]: "; msg]))) (v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage d)))

let v_Vuna_dCompiler_dDiag_dFormat_ddiagDescLine = (fun d -> "")

let rec v_Vuna_dCompiler_dDiag_dFormat_dtraceLines = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["  = trace["; (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (dtb__43).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_tracePhase); "]: "; (dtb__43).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dTraceFrame_traceText]), Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dDiag_dFormat_dtraceLines mc0) dtb__44))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiag_dFormat_dindent = (fun n -> (if (n <= 0) then "" else ("  " ^ (v_Vuna_dCompiler_dDiag_dFormat_dindent (n - 1)))))

let v_Vuna_dCompiler_dDiag_dFormat_dsuggestionLine = (fun s -> (String.concat "" ["  = help: "; (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle; " ("; (v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName (s).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability); ")"]))

let v_Vuna_dCompiler_dDiag_dFormat_dshowInt = (fun n -> (bi_strFromInt n))

let v_Vuna_dCompiler_dDiag_dFormat_dcandidateTextOf = (fun c -> (c).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText)

let v_Vuna_dCompiler_dDiag_dFormat_dcallSpanSuffix = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (String.concat "" [" at "; (dtb__45).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; ":"; (bi_strFromInt (dtb__45).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine)])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_dfieldLine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (dtb__46) -> ("  = note: " ^ dtb__46)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan (dtb__47, dtb__48) -> (String.concat "" ["  = span: "; dtb__47; " at "; (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dshowSpanLoc dtb__48)])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldModule (dtb__49) -> ("  = module: " ^ dtb__49)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (dtb__50) -> ("  = effect: " ^ dtb__50)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (dtb__51, dtb__52, dtb__53) -> (String.concat "" ["  = quantity: "; dtb__51; " (declared "; (v_Vuna_dCompiler_dDiag_dFormat_dshowInt dtb__52); ", observed "; (v_Vuna_dCompiler_dDiag_dFormat_dshowInt dtb__53); ")"])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCall (dtb__54) -> (String.concat "" ["  = call: "; (dtb__54).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callCallee; " <- "; (dtb__54).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callArg; " ("; (dtb__54).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callRelation; ")"; (v_Vuna_dCompiler_dDiag_dFormat_dcallSpanSuffix (dtb__54).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCallInfo_callSpan)])
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (dtb__55) -> ("  = candidates: " ^ ((Base_dString.v_Base_dString_djoin ", ") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dcandidateTextOf) ((Base_dList.v_Base_dList_dtake 8) dtb__55))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (dtb__56) -> ("  = name: " ^ dtb__56)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldFound (dtb__57) -> ("  = found: " ^ dtb__57)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldExpected (dtb__58) -> ("  = expected: " ^ dtb__58)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiag_dFormat_drenderHuman = (fun d -> ((fun primary -> ((fun ptext -> ((fun snippet -> ((fun labelNote -> ((fun notes -> ((fun descLine -> ((fun origLine -> ((fun fieldBlock -> ((fun traceBlock -> ((fun helpBlock -> ((fun block -> (Base_dString.v_Base_dString_dtrim block)) ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDiag_dFormat_dheaderOf d), (Base_dList.C_Base_dList_dList_Cons (snippet, (Base_dList.C_Base_dList_dList_Cons (labelNote, (Base_dList.C_Base_dList_dList_Cons (origLine, (Base_dList.C_Base_dList_dList_Cons (notes, (Base_dList.C_Base_dList_dList_Cons (fieldBlock, (Base_dList.C_Base_dList_dList_Cons (traceBlock, (Base_dList.C_Base_dList_dList_Cons (helpBlock, (Base_dList.C_Base_dList_dList_Cons (descLine, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dsuggestionLine) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions)))) ((Base_dString.v_Base_dString_djoin "\n") ((v_Vuna_dCompiler_dDiag_dFormat_dtraceLines 0) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace)))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_dfieldLine) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields)))) (if ((v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage d) = (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) then "" else ("  = message: " ^ (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage)))) (v_Vuna_dCompiler_dDiag_dFormat_ddiagDescLine d))) ((Base_dString.v_Base_dString_djoin "\n") ((Base_dList.v_Base_dList_dmap (fun n -> ("  = note: " ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)))) (if (ptext = "") then "" else ("  = note: " ^ ptext)))) (match primary with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet dtb__59)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dDiag_dFormat_dprimaryText (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels))) (v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)))

let v_Vuna_dCompiler_dDiag_dFormat_dlocalizedJsonField = (fun d -> ((fun lm -> (if (lm = (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) then "" else (",\"localizedMessage\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr lm)))) (v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage d)))

let v_Vuna_dCompiler_dDiag_dFormat_djsonDiag = (fun d -> ((Base_dString.v_Base_dString_djoin "") (Base_dList.C_Base_dList_dList_Cons (("{\"code\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode)), (Base_dList.C_Base_dList_dList_Cons ((",\"severity\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dseverityName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity))), (Base_dList.C_Base_dList_dList_Cons ((",\"phase\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dphaseName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase))), (Base_dList.C_Base_dList_dList_Cons ((",\"category\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (v_Vuna_dCompiler_dDiag_dFormat_dcategoryName (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory))), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"message\":"; (v_Vuna_dCompiler_dDiag_dFormat_djsonStr (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage); (v_Vuna_dCompiler_dDiag_dFormat_dlocalizedJsonField d)]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"labels\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonLabel) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"fields\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonField) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"trace\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonTrace) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"notes\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonStr) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"suggestions\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonSuggestion) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions)); "]"]), (Base_dList.C_Base_dList_dList_Cons ((",\"origin\":" ^ (v_Vuna_dCompiler_dDiag_dFormat_doriginJson (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin)), (Base_dList.C_Base_dList_dList_Cons ((",\"internal\":" ^ (if (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal then "true" else "false")), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [",\"ice\":"; (v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonIce (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce); "}"]), Base_dList.C_Base_dList_dList_Nil))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDiag_dFormat_drenderJson = (fun d -> (v_Vuna_dCompiler_dDiag_dFormat_djsonDiag d))

let v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList = (fun ds -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"diagnostics\":["; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDiag_dFormat_djsonDiag) ds)); "]}"]))
