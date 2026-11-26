open Vuna_runtime
# 20 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_diagCodec = "diagnostics 2"

# 26 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_sevTag = (fun (mc0 : Base_dDiag.t_Severity) -> (match mc0 with
  | Base_dDiag.C_Severity_SevHelp -> 3
  | Base_dDiag.C_Severity_SevNote -> 2
  | Base_dDiag.C_Severity_SevWarning -> 1
  | Base_dDiag.C_Severity_SevError -> 0
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_sevOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevError)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevWarning)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevNote)) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevHelp)) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 39 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_phaseTag = (fun (mc0 : Base_dDiag.t_Phase) -> (match mc0 with
  | Base_dDiag.C_Phase_PhInternal -> 13
  | Base_dDiag.C_Phase_PhTool -> 12
  | Base_dDiag.C_Phase_PhDriver -> 11
  | Base_dDiag.C_Phase_PhPackage -> 10
  | Base_dDiag.C_Phase_PhCodegen -> 9
  | Base_dDiag.C_Phase_PhUsage -> 8
  | Base_dDiag.C_Phase_PhTermination -> 7
  | Base_dDiag.C_Phase_PhCoverage -> 6
  | Base_dDiag.C_Phase_PhUnify -> 5
  | Base_dDiag.C_Phase_PhElab -> 4
  | Base_dDiag.C_Phase_PhLoad -> 3
  | Base_dDiag.C_Phase_PhResolve -> 2
  | Base_dDiag.C_Phase_PhParse -> 1
  | Base_dDiag.C_Phase_PhLex -> 0
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_phaseOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhLex)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhParse)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhResolve)) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhLoad)) else (if (mc0 = 4) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhElab)) else (if (mc0 = 5) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhUnify)) else (if (mc0 = 6) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhCoverage)) else (if (mc0 = 7) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhTermination)) else (if (mc0 = 8) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhUsage)) else (if (mc0 = 9) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhCodegen)) else (if (mc0 = 10) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhPackage)) else (if (mc0 = 11) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhDriver)) else (if (mc0 = 12) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhTool)) else (if (mc0 = 13) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))

# 72 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_catTag = (fun (mc0 : Base_dDiag.t_Category) -> (match mc0 with
  | Base_dDiag.C_Category_CatInternal -> 13
  | Base_dDiag.C_Category_CatTool -> 12
  | Base_dDiag.C_Category_CatPackage -> 11
  | Base_dDiag.C_Category_CatCodegen -> 10
  | Base_dDiag.C_Category_CatTraits -> 9
  | Base_dDiag.C_Category_CatRecords -> 8
  | Base_dDiag.C_Category_CatEffects -> 7
  | Base_dDiag.C_Category_CatQuantity -> 6
  | Base_dDiag.C_Category_CatTermination -> 5
  | Base_dDiag.C_Category_CatCoverage -> 4
  | Base_dDiag.C_Category_CatUniverses -> 3
  | Base_dDiag.C_Category_CatTypes -> 2
  | Base_dDiag.C_Category_CatNames -> 1
  | Base_dDiag.C_Category_CatSyntax -> 0
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_catOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatSyntax)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatNames)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTypes)) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatUniverses)) else (if (mc0 = 4) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatCoverage)) else (if (mc0 = 5) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTermination)) else (if (mc0 = 6) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatQuantity)) else (if (mc0 = 7) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatEffects)) else (if (mc0 = 8) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatRecords)) else (if (mc0 = 9) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTraits)) else (if (mc0 = 10) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatCodegen)) else (if (mc0 = 11) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatPackage)) else (if (mc0 = 12) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTool)) else (if (mc0 = 13) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))

# 105 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_styleTag = (fun (mc0 : Base_dDiag.t_LabelStyle) -> (match mc0 with
  | Base_dDiag.C_LabelStyle_LabelContext -> 2
  | Base_dDiag.C_LabelStyle_LabelSecondary -> 1
  | Base_dDiag.C_LabelStyle_LabelPrimary -> 0
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_styleOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelPrimary)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelSecondary)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelContext)) else B_dData_dMaybe.C_Maybe_Nothing))))

# 116 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_applicabilityTag = (fun (mc0 : Base_dDiag.t_Applicability) -> (match mc0 with
  | Base_dDiag.C_Applicability_HasPlaceholder -> 2
  | Base_dDiag.C_Applicability_MaybeIncorrect -> 1
  | Base_dDiag.C_Applicability_MachineApplicable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_applicabilityOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_MachineApplicable)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_MaybeIncorrect)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_HasPlaceholder)) else B_dData_dMaybe.C_Maybe_Nothing))))

# 127 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentTag = (fun (mc0 : Base_dDiag.t_NoSourceReason) -> (match mc0 with
  | Base_dDiag.C_NoSourceReason_NsInternal -> 3
  | Base_dDiag.C_NoSourceReason_NsPackageGraph -> 2
  | Base_dDiag.C_NoSourceReason_NsToolUsage -> 1
  | Base_dDiag.C_NoSourceReason_NsSynthetic -> 0
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsSynthetic)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsToolUsage)) else (if (mc0 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsPackageGraph)) else (if (mc0 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 140 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_stabilityTag = (fun (mc0 : Base_dDiag.t_Stability) -> (match mc0 with
  | Base_dDiag.C_Stability_Volatile -> 1
  | Base_dDiag.C_Stability_Stable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_stabilityOfTag = (fun (mc0 : int) -> (if (mc0 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Stability_Stable)) else (if (mc0 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Stability_Volatile)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 152 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encSpan = (fun (sp : Base_dSource.t_Span) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (sp).Base_dSource.f_Span_spanFile) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanStartLine) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanStartCol) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanEndLine) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanEndCol) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanStartOffset) ((Base_dBytes.v_encInt (sp).Base_dSource.f_Span_spanEndOffset) acc))))))))

# 166 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_readCount = (fun (fuel : int) (acc : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut3 = (Base_dBytes.v_curChar c) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (if (dtb__0 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip c) })) else (if (if (dtb__0 >= 48) then (dtb__0 <= 57) else false) then (((v_readCount (fuel - 1)) ((acc * 10) + (dtb__0 - 48))) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))))

# 176 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCount = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (let nd_uscrut2 = (Base_dBytes.v_curChar c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> (if (dtb__1 = 91) then (((v_readCount (fuel - 1)) 0) (Base_dBytes.v_curSkip c)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 182 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_thenPair = (fun mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (match dtb__2 with
  | { B_dData_dPair.f_Pair_first = dtb__3; B_dData_dPair.f_Pair_second = dtb__4 } -> ((mc1 dtb__3) dtb__4)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decSpan = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (file : string) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b1)) (fun (sl : int) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (sc : int) (b3 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b3)) (fun (el : int) (b4 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b4)) (fun (ec : int) (b5 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b5)) (fun (so : int) (b6 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b6)) (fun (eo : int) (b7 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = sl; Base_dSource.f_Span_spanStartCol = sc; Base_dSource.f_Span_spanEndLine = el; Base_dSource.f_Span_spanEndCol = ec; Base_dSource.f_Span_spanStartOffset = so; Base_dSource.f_Span_spanEndOffset = eo }; B_dData_dPair.f_Pair_second = b7 })))))))))))))))))

# 186 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encLabel = (fun (l : Base_dDiag.t_Label) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encSpan) (l).Base_dDiag.f_Label_labelSpan) ((Base_dBytes.v_encStr (l).Base_dDiag.f_Label_labelText) ((Base_dBytes.v_encTag (v_styleTag (l).Base_dDiag.f_Label_labelStyle)) (((Base_dBytes.v_encMaybe v_encSpan) (l).Base_dDiag.f_Label_labelProvenance) acc)))))

# 193 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decLabel = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) c)) (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (text : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b2)) (fun (stag : int) (b3 : Base_dBytes.t_Cur) -> (match (v_styleOfTag stag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) b3)) (fun (prov : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Label_labelSpan = msp; Base_dDiag.f_Label_labelText = text; Base_dDiag.f_Label_labelStyle = dtb__5; Base_dDiag.f_Label_labelProvenance = prov }; B_dData_dPair.f_Pair_second = b4 }))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 208 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encEdit = (fun (e : Base_dDiag.t_DiagEdit) (acc : string B_dData_dList.t_List) -> ((v_encSpan (e).Base_dDiag.f_DiagEdit_editSpan) ((Base_dBytes.v_encStr (e).Base_dDiag.f_DiagEdit_editNewText) acc)))

# 211 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decEdit = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decSpan (fuel - 1)) c)) (fun (sp : Base_dSource.t_Span) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (t : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_DiagEdit_editSpan = sp; Base_dDiag.f_DiagEdit_editNewText = t }; B_dData_dPair.f_Pair_second = b2 })))))))

# 217 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encSuggestion = (fun (s : Base_dDiag.t_Suggestion) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (s).Base_dDiag.f_Suggestion_suggestionTitle) ((Base_dBytes.v_encTag (v_applicabilityTag (s).Base_dDiag.f_Suggestion_suggestionApplicability)) (((Base_dBytes.v_encList v_encEdit) (s).Base_dDiag.f_Suggestion_suggestionEdits) acc))))

# 223 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decSuggestion = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (title : string) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b1)) (fun (atag : int) (b2 : Base_dBytes.t_Cur) -> (match (v_applicabilityOfTag atag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> ((v_thenPair (((Base_dBytes.v_decList v_decEdit) (fuel - 1)) b2)) (fun (es : Base_dDiag.t_DiagEdit B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Suggestion_suggestionTitle = title; Base_dDiag.f_Suggestion_suggestionApplicability = dtb__6; Base_dDiag.f_Suggestion_suggestionEdits = es }; B_dData_dPair.f_Pair_second = b3 }))))
  | _ -> failwith "DT: impossible branch"
))))))

# 235 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encCandidate = (fun (cand : Base_dDiag.t_Candidate) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (cand).Base_dDiag.f_Candidate_candidateText) (((Base_dBytes.v_encMaybe v_encSpan) (cand).Base_dDiag.f_Candidate_candidateSpan) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (cand).Base_dDiag.f_Candidate_candidateReason) acc))))

# 241 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCandidate = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (text : string) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) b1)) (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (fuel - 1)) b2)) (fun (reason : string B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Candidate_candidateText = text; Base_dDiag.f_Candidate_candidateSpan = msp; Base_dDiag.f_Candidate_candidateReason = reason }; B_dData_dPair.f_Pair_second = b3 })))))))))

# 247 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encCall = (fun (ci : Base_dDiag.t_CallInfo) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (ci).Base_dDiag.f_CallInfo_callCallee) ((Base_dBytes.v_encStr (ci).Base_dDiag.f_CallInfo_callArg) ((Base_dBytes.v_encStr (ci).Base_dDiag.f_CallInfo_callRelation) (((Base_dBytes.v_encMaybe v_encSpan) (ci).Base_dDiag.f_CallInfo_callSpan) acc)))))

# 253 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCall = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (callee : string) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (arg : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b2)) (fun (rel : string) (b3 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) b3)) (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_CallInfo_callCallee = callee; Base_dDiag.f_CallInfo_callArg = arg; Base_dDiag.f_CallInfo_callRelation = rel; Base_dDiag.f_CallInfo_callSpan = msp }; B_dData_dPair.f_Pair_second = b4 })))))))))))

# 260 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encField = (fun (mc0 : Base_dDiag.t_DiagField) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Base_dDiag.C_DiagField_FieldNote (dtb__7) -> ((Base_dBytes.v_encTag 9) ((Base_dBytes.v_encStr dtb__7) mc1))
  | Base_dDiag.C_DiagField_FieldSpan (dtb__8, dtb__9) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb__8) ((v_encSpan dtb__9) mc1)))
  | Base_dDiag.C_DiagField_FieldModule (dtb__10) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb__10) mc1))
  | Base_dDiag.C_DiagField_FieldEffect (dtb__11) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb__11) mc1))
  | Base_dDiag.C_DiagField_FieldQuantity (dtb__12, dtb__13, dtb__14) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__12) ((Base_dBytes.v_encInt dtb__13) ((Base_dBytes.v_encInt dtb__14) mc1))))
  | Base_dDiag.C_DiagField_FieldCall (dtb__15) -> ((Base_dBytes.v_encTag 4) ((v_encCall dtb__15) mc1))
  | Base_dDiag.C_DiagField_FieldCandidates (dtb__16) -> ((Base_dBytes.v_encTag 3) (((Base_dBytes.v_encList v_encCandidate) dtb__16) mc1))
  | Base_dDiag.C_DiagField_FieldName (dtb__17) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__17) mc1))
  | Base_dDiag.C_DiagField_FieldFound (dtb__18) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb__18) mc1))
  | Base_dDiag.C_DiagField_FieldExpected (dtb__19) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__19) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decField = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) c)) (fun (tg : int) (b1 : Base_dBytes.t_Cur) -> (if (tg = 0) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldExpected (s)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 1) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldFound (s)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 2) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldName (s)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 3) then ((v_thenPair (((Base_dBytes.v_decList v_decCandidate) (fuel - 1)) b1)) (fun (cs : Base_dDiag.t_Candidate B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldCandidates (cs)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 4) then ((v_thenPair ((v_decCall (fuel - 1)) b1)) (fun (ci : Base_dDiag.t_CallInfo) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldCall (ci)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 5) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (name : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b2)) (fun (d : int) (b3 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) b3)) (fun (o : int) (b4 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldQuantity (name, d, o)); B_dData_dPair.f_Pair_second = b4 })))))))) else (if (tg = 6) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldEffect (s)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 7) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldModule (s)); B_dData_dPair.f_Pair_second = b2 })))) else (if (tg = 8) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (name : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decSpan (fuel - 1)) b2)) (fun (sp : Base_dSource.t_Span) (b3 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldSpan (name, sp)); B_dData_dPair.f_Pair_second = b3 })))))) else (if (tg = 9) then ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (s : string) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldNote (s)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))

# 291 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encOrigin = (fun (mc0 : Base_dDiag.t_Origin) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Base_dDiag.C_Origin_OriginCascade (dtb__20) -> ((Base_dBytes.v_encTag 1) (((Base_dBytes.v_encMaybe Base_dBytes.v_encInt) dtb__20) mc1))
  | Base_dDiag.C_Origin_OriginDirect -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decOrigin = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) c)) (fun (tg : int) (b1 : Base_dBytes.t_Cur) -> (if (tg = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Base_dDiag.C_Origin_OriginDirect; B_dData_dPair.f_Pair_second = b1 })) else (if (tg = 1) then ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decInt) (fuel - 1)) b1)) (fun (p : int B_dData_dMaybe.t_Maybe) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_Origin_OriginCascade (p)); B_dData_dPair.f_Pair_second = b2 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 305 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encIce = (fun (mc0 : Base_dDiag.t_IceInfo) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Base_dDiag.f_IceInfo_icePhase = dtb__21; Base_dDiag.f_IceInfo_iceFunction = dtb__22; Base_dDiag.f_IceInfo_iceInvariant = dtb__23; Base_dDiag.f_IceInfo_iceFingerprint = dtb__24; Base_dDiag.f_IceInfo_iceHint = dtb__25 } -> ((Base_dBytes.v_encTag (v_phaseTag dtb__21)) ((Base_dBytes.v_encStr dtb__22) ((Base_dBytes.v_encStr dtb__23) ((Base_dBytes.v_encStr dtb__24) ((Base_dBytes.v_encStr dtb__25) mc1)))))
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decIce = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) c)) (fun (pt : int) (b1 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag pt) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (fn : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b2)) (fun (inv : string) (b3 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b3)) (fun (fp : string) (b4 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b4)) (fun (hint : string) (b5 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_IceInfo_icePhase = dtb__26; Base_dDiag.f_IceInfo_iceFunction = fn; Base_dDiag.f_IceInfo_iceInvariant = inv; Base_dDiag.f_IceInfo_iceFingerprint = fp; Base_dDiag.f_IceInfo_iceHint = hint }; B_dData_dPair.f_Pair_second = b5 }))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 318 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decTrace = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) c)) (fun (pt : int) (b1 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag pt) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b1)) (fun (text : string) (b2 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (fuel - 1)) b2)) (fun (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (b3 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decCount (fuel - 1)) b3)) (fun (n : int) (b4 : Base_dBytes.t_Cur) -> (if (n = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_TraceFrame_tracePhase = dtb__27; Base_dDiag.f_TraceFrame_traceText = text; Base_dDiag.f_TraceFrame_traceSpan = msp; Base_dDiag.f_TraceFrame_traceChildren = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = b4 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 335 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encTrace = (fun (mc0 : Base_dDiag.t_TraceFrame) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Base_dDiag.f_TraceFrame_tracePhase = dtb__28; Base_dDiag.f_TraceFrame_traceText = dtb__29; Base_dDiag.f_TraceFrame_traceSpan = dtb__30; Base_dDiag.f_TraceFrame_traceChildren = dtb__31 } -> ((Base_dBytes.v_encTag (v_phaseTag dtb__28)) ((Base_dBytes.v_encStr dtb__29) (((Base_dBytes.v_encMaybe v_encSpan) dtb__30) (B_dData_dList.C_List__x58__x58_ ("[0:", mc1)))))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_mtAbsent = (fun (mc0 : int B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (match (v_absentOfTag dtb__32) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dMaybe.C_Maybe_Just (dtb__33))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_decDiag = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((v_thenPair ((Base_dBytes.v_decInt (fuel - 1)) c)) (fun (id : int) (b1 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b1)) (fun (st : int) (b2 : Base_dBytes.t_Cur) -> (match (v_sevOfTag st) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b2)) (fun (pt : int) (b3 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag pt) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b3)) (fun (ct : int) (b4 : Base_dBytes.t_Cur) -> (match (v_catOfTag ct) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b4)) (fun (code : string) (b5 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) b5)) (fun (msg : string) (b6 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decLabel) (fuel - 1)) b6)) (fun (labels : Base_dDiag.t_Label B_dData_dList.t_List) (b7 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decField) (fuel - 1)) b7)) (fun (fields : Base_dDiag.t_DiagField B_dData_dList.t_List) (b8 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decTrace) (fuel - 1)) b8)) (fun (trace : Base_dDiag.t_TraceFrame B_dData_dList.t_List) (b9 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b9)) (fun (notes : string B_dData_dList.t_List) (b10 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decSuggestion) (fuel - 1)) b10)) (fun (sugs : Base_dDiag.t_Suggestion B_dData_dList.t_List) (b11 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decOrigin (fuel - 1)) b11)) (fun (origin : Base_dDiag.t_Origin) (b12 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decDiagList (fuel - 1)) b12)) (fun (kids : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (b13 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decBool (fuel - 1)) b13)) (fun (internal : bool) (b14 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decIce) (fuel - 1)) b14)) (fun (ice : Base_dDiag.t_IceInfo B_dData_dMaybe.t_Maybe) (b15 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decTag) (fuel - 1)) b15)) (fun (mtag : int B_dData_dMaybe.t_Maybe) (b16 : Base_dBytes.t_Cur) -> (match (v_mtAbsent mtag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> ((v_thenPair ((Base_dBytes.v_decTag (fuel - 1)) b16)) (fun (stab : int) (b17 : Base_dBytes.t_Cur) -> (match (v_stabilityOfTag stab) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Diagnostic_diagId = id; Base_dDiag.f_Diagnostic_diagSeverity = dtb__34; Base_dDiag.f_Diagnostic_diagPhase = dtb__35; Base_dDiag.f_Diagnostic_diagCategory = dtb__36; Base_dDiag.f_Diagnostic_diagCode = code; Base_dDiag.f_Diagnostic_diagMessage = msg; Base_dDiag.f_Diagnostic_diagLabels = labels; Base_dDiag.f_Diagnostic_diagFields = fields; Base_dDiag.f_Diagnostic_diagTrace = trace; Base_dDiag.f_Diagnostic_diagNotes = notes; Base_dDiag.f_Diagnostic_diagSuggestions = sugs; Base_dDiag.f_Diagnostic_diagOrigin = origin; Base_dDiag.f_Diagnostic_diagChildren = kids; Base_dDiag.f_Diagnostic_diagInternal = internal; Base_dDiag.f_Diagnostic_diagIce = ice; Base_dDiag.f_Diagnostic_diagAbsent = dtb__37; Base_dDiag.f_Diagnostic_diagStability = dtb__38 }; B_dData_dPair.f_Pair_second = b17 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
# 418 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_decDiagList = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut2 = ((v_decCount (fuel - 1)) c) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__39) -> (match dtb__39 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> ((((v_decDiagItems (fuel - 1)) dtb__40) dtb__41) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 427 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_decDiagItems = (fun (fuel : int) (n : int) (c : Base_dBytes.t_Cur) (acc : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = c })) else (let nd_uscrut4 = ((v_decDiag (fuel - 1)) c) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> ((((v_decDiagItems (fuel - 1)) (n - 1)) dtb__44) (B_dData_dList.C_List__x58__x58_ (dtb__43, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 446 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentEnc = (fun (r : Base_dDiag.t_NoSourceReason) (acc : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag (v_absentTag r)) acc))

# 327 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_encDiagList = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Base_dBytes.v_lenOf ds)); ":"]), ((v_encDiagListGo ds) acc))))
# 330 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_encDiagListGo = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> ((v_encDiag dtb__45) ((v_encDiagListGo dtb__46) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 339 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_encDiag = (fun (mc0 : Base_dDiag.t_Diagnostic) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Base_dDiag.f_Diagnostic_diagId = dtb__47; Base_dDiag.f_Diagnostic_diagSeverity = dtb__48; Base_dDiag.f_Diagnostic_diagPhase = dtb__49; Base_dDiag.f_Diagnostic_diagCategory = dtb__50; Base_dDiag.f_Diagnostic_diagCode = dtb__51; Base_dDiag.f_Diagnostic_diagMessage = dtb__52; Base_dDiag.f_Diagnostic_diagLabels = dtb__53; Base_dDiag.f_Diagnostic_diagFields = dtb__54; Base_dDiag.f_Diagnostic_diagTrace = dtb__55; Base_dDiag.f_Diagnostic_diagNotes = dtb__56; Base_dDiag.f_Diagnostic_diagSuggestions = dtb__57; Base_dDiag.f_Diagnostic_diagOrigin = dtb__58; Base_dDiag.f_Diagnostic_diagChildren = dtb__59; Base_dDiag.f_Diagnostic_diagInternal = dtb__60; Base_dDiag.f_Diagnostic_diagIce = dtb__61; Base_dDiag.f_Diagnostic_diagAbsent = dtb__62; Base_dDiag.f_Diagnostic_diagStability = dtb__63 } -> ((Base_dBytes.v_encInt dtb__47) ((Base_dBytes.v_encTag (v_sevTag dtb__48)) ((Base_dBytes.v_encTag (v_phaseTag dtb__49)) ((Base_dBytes.v_encTag (v_catTag dtb__50)) ((Base_dBytes.v_encStr dtb__51) ((Base_dBytes.v_encStr dtb__52) (((Base_dBytes.v_encList v_encLabel) dtb__53) (((Base_dBytes.v_encList v_encField) dtb__54) (((Base_dBytes.v_encList v_encTrace) dtb__55) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb__56) (((Base_dBytes.v_encList v_encSuggestion) dtb__57) ((v_encOrigin dtb__58) ((v_encDiagList dtb__59) ((Base_dBytes.v_encBool dtb__60) (((Base_dBytes.v_encMaybe v_encIce) dtb__61) (((Base_dBytes.v_encMaybe v_absentEnc) dtb__62) ((Base_dBytes.v_encTag (v_stabilityTag dtb__63)) mc1)))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encDiagnostics = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dBytes.v_encConcat ((v_encDiagList ds) B_dData_dList.C_List_Nil)))

# 456 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decDiagnostics = (fun (payload : string) -> (let fuel = ((bi_strLength payload) + 1) in (let nd_uscrut2 = ((v_decDiagList fuel) (Base_dBytes.v_curOf payload)) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (if (Base_dBytes.v_curAtEnd dtb__66) then (B_dData_dMaybe.C_Maybe_Just (dtb__65)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
