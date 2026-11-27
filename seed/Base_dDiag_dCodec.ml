open Vuna_runtime
# 20 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_diagCodec = "diagnostics 2"

# 26 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_sevTag = (fun (dtb_u_u1 : Base_dDiag.t_Severity) -> (match dtb_u_u1 with
  | Base_dDiag.C_Severity_SevHelp -> 3
  | Base_dDiag.C_Severity_SevNote -> 2
  | Base_dDiag.C_Severity_SevWarning -> 1
  | Base_dDiag.C_Severity_SevError -> 0
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_sevOfTag = (fun (dtb_u_u2 : int) -> (if (dtb_u_u2 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevError)) else (if (dtb_u_u2 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevWarning)) else (if (dtb_u_u2 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevNote)) else (if (dtb_u_u2 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Severity_SevHelp)) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 39 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_phaseTag = (fun (dtb_u_u3 : Base_dDiag.t_Phase) -> (match dtb_u_u3 with
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
let v_phaseOfTag = (fun (dtb_u_u4 : int) -> (if (dtb_u_u4 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhLex)) else (if (dtb_u_u4 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhParse)) else (if (dtb_u_u4 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhResolve)) else (if (dtb_u_u4 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhLoad)) else (if (dtb_u_u4 = 4) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhElab)) else (if (dtb_u_u4 = 5) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhUnify)) else (if (dtb_u_u4 = 6) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhCoverage)) else (if (dtb_u_u4 = 7) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhTermination)) else (if (dtb_u_u4 = 8) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhUsage)) else (if (dtb_u_u4 = 9) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhCodegen)) else (if (dtb_u_u4 = 10) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhPackage)) else (if (dtb_u_u4 = 11) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhDriver)) else (if (dtb_u_u4 = 12) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhTool)) else (if (dtb_u_u4 = 13) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Phase_PhInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))

# 72 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_catTag = (fun (dtb_u_u5 : Base_dDiag.t_Category) -> (match dtb_u_u5 with
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
let v_catOfTag = (fun (dtb_u_u6 : int) -> (if (dtb_u_u6 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatSyntax)) else (if (dtb_u_u6 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatNames)) else (if (dtb_u_u6 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTypes)) else (if (dtb_u_u6 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatUniverses)) else (if (dtb_u_u6 = 4) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatCoverage)) else (if (dtb_u_u6 = 5) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTermination)) else (if (dtb_u_u6 = 6) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatQuantity)) else (if (dtb_u_u6 = 7) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatEffects)) else (if (dtb_u_u6 = 8) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatRecords)) else (if (dtb_u_u6 = 9) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTraits)) else (if (dtb_u_u6 = 10) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatCodegen)) else (if (dtb_u_u6 = 11) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatPackage)) else (if (dtb_u_u6 = 12) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatTool)) else (if (dtb_u_u6 = 13) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Category_CatInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))))

# 105 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_styleTag = (fun (dtb_u_u7 : Base_dDiag.t_LabelStyle) -> (match dtb_u_u7 with
  | Base_dDiag.C_LabelStyle_LabelContext -> 2
  | Base_dDiag.C_LabelStyle_LabelSecondary -> 1
  | Base_dDiag.C_LabelStyle_LabelPrimary -> 0
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_styleOfTag = (fun (dtb_u_u8 : int) -> (if (dtb_u_u8 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelPrimary)) else (if (dtb_u_u8 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelSecondary)) else (if (dtb_u_u8 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_LabelStyle_LabelContext)) else B_dData_dMaybe.C_Maybe_Nothing))))

# 116 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_applicabilityTag = (fun (dtb_u_u9 : Base_dDiag.t_Applicability) -> (match dtb_u_u9 with
  | Base_dDiag.C_Applicability_HasPlaceholder -> 2
  | Base_dDiag.C_Applicability_MaybeIncorrect -> 1
  | Base_dDiag.C_Applicability_MachineApplicable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_applicabilityOfTag = (fun (dtb_u_u10 : int) -> (if (dtb_u_u10 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_MachineApplicable)) else (if (dtb_u_u10 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_MaybeIncorrect)) else (if (dtb_u_u10 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Applicability_HasPlaceholder)) else B_dData_dMaybe.C_Maybe_Nothing))))

# 127 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentTag = (fun (dtb_u_u11 : Base_dDiag.t_NoSourceReason) -> (match dtb_u_u11 with
  | Base_dDiag.C_NoSourceReason_NsInternal -> 3
  | Base_dDiag.C_NoSourceReason_NsPackageGraph -> 2
  | Base_dDiag.C_NoSourceReason_NsToolUsage -> 1
  | Base_dDiag.C_NoSourceReason_NsSynthetic -> 0
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentOfTag = (fun (dtb_u_u12 : int) -> (if (dtb_u_u12 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsSynthetic)) else (if (dtb_u_u12 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsToolUsage)) else (if (dtb_u_u12 = 2) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsPackageGraph)) else (if (dtb_u_u12 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_NoSourceReason_NsInternal)) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 140 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_stabilityTag = (fun (dtb_u_u13 : Base_dDiag.t_Stability) -> (match dtb_u_u13 with
  | Base_dDiag.C_Stability_Volatile -> 1
  | Base_dDiag.C_Stability_Stable -> 0
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_stabilityOfTag = (fun (dtb_u_u14 : int) -> (if (dtb_u_u14 = 0) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Stability_Stable)) else (if (dtb_u_u14 = 1) then (B_dData_dMaybe.C_Maybe_Just (Base_dDiag.C_Stability_Volatile)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 152 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encSpan = (fun (dtb_u_u15 : Base_dSource.t_Span) (dtb_u_u16 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u15).Base_dSource.f_Span_spanFile) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanStartLine) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanStartCol) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanEndLine) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanEndCol) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanStartOffset) ((Base_dBytes.v_encInt (dtb_u_u15).Base_dSource.f_Span_spanEndOffset) dtb_u_u16))))))))

# 166 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_readCount = (fun (dtb_u_u17 : int) (dtb_u_u18 : int) (dtb_u_u19 : Base_dBytes.t_Cur) -> (if (dtb_u_u17 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u20 = (Base_dBytes.v_curChar dtb_u_u19) in (match dtb_u_u20 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u21) -> (if (dtb_u_u21 = 58) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u18; B_dData_dPair.f_Pair_second = (Base_dBytes.v_curSkip dtb_u_u19) })) else (if (if (dtb_u_u21 >= 48) then (dtb_u_u21 <= 57) else false) then (((v_readCount (dtb_u_u17 - 1)) ((dtb_u_u18 * 10) + (dtb_u_u21 - 48))) (Base_dBytes.v_curSkip dtb_u_u19)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))))

# 176 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCount = (fun (dtb_u_u22 : int) (dtb_u_u23 : Base_dBytes.t_Cur) -> (let dtb_u_u24 = (Base_dBytes.v_curChar dtb_u_u23) in (match dtb_u_u24 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u25) -> (if (dtb_u_u25 = 91) then (((v_readCount (dtb_u_u22 - 1)) 0) (Base_dBytes.v_curSkip dtb_u_u23)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 182 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_thenPair = (fun dtb_u_u28 dtb_u_u29 -> (match dtb_u_u28 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u30) -> (match dtb_u_u30 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u31; B_dData_dPair.f_Pair_second = dtb_u_u32 } -> ((dtb_u_u29 dtb_u_u31) dtb_u_u32)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decSpan = (fun (dtb_u_u33 : int) (dtb_u_u34 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u33 - 1)) dtb_u_u34)) (fun (dtb_u_u35 : string) (dtb_u_u36 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u36)) (fun (dtb_u_u37 : int) (dtb_u_u38 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u38)) (fun (dtb_u_u39 : int) (dtb_u_u40 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u40)) (fun (dtb_u_u41 : int) (dtb_u_u42 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u42)) (fun (dtb_u_u43 : int) (dtb_u_u44 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u44)) (fun (dtb_u_u45 : int) (dtb_u_u46 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u33 - 1)) dtb_u_u46)) (fun (dtb_u_u47 : int) (dtb_u_u48 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dSource.f_Span_spanFile = dtb_u_u35; Base_dSource.f_Span_spanStartLine = dtb_u_u37; Base_dSource.f_Span_spanStartCol = dtb_u_u39; Base_dSource.f_Span_spanEndLine = dtb_u_u41; Base_dSource.f_Span_spanEndCol = dtb_u_u43; Base_dSource.f_Span_spanStartOffset = dtb_u_u45; Base_dSource.f_Span_spanEndOffset = dtb_u_u47 }; B_dData_dPair.f_Pair_second = dtb_u_u48 })))))))))))))))))

# 186 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encLabel = (fun (dtb_u_u49 : Base_dDiag.t_Label) (dtb_u_u50 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encMaybe v_encSpan) (dtb_u_u49).Base_dDiag.f_Label_labelSpan) ((Base_dBytes.v_encStr (dtb_u_u49).Base_dDiag.f_Label_labelText) ((Base_dBytes.v_encTag (v_styleTag (dtb_u_u49).Base_dDiag.f_Label_labelStyle)) (((Base_dBytes.v_encMaybe v_encSpan) (dtb_u_u49).Base_dDiag.f_Label_labelProvenance) dtb_u_u50)))))

# 193 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decLabel = (fun (dtb_u_u51 : int) (dtb_u_u52 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u51 - 1)) dtb_u_u52)) (fun (dtb_u_u53 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u54 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u51 - 1)) dtb_u_u54)) (fun (dtb_u_u55 : string) (dtb_u_u56 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u51 - 1)) dtb_u_u56)) (fun (dtb_u_u57 : int) (dtb_u_u58 : Base_dBytes.t_Cur) -> (match (v_styleOfTag dtb_u_u57) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u51 - 1)) dtb_u_u58)) (fun (dtb_u_u60 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u61 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Label_labelSpan = dtb_u_u53; Base_dDiag.f_Label_labelText = dtb_u_u55; Base_dDiag.f_Label_labelStyle = dtb_u_u59; Base_dDiag.f_Label_labelProvenance = dtb_u_u60 }; B_dData_dPair.f_Pair_second = dtb_u_u61 }))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 208 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encEdit = (fun (dtb_u_u62 : Base_dDiag.t_DiagEdit) (dtb_u_u63 : string B_dData_dList.t_List) -> ((v_encSpan (dtb_u_u62).Base_dDiag.f_DiagEdit_editSpan) ((Base_dBytes.v_encStr (dtb_u_u62).Base_dDiag.f_DiagEdit_editNewText) dtb_u_u63)))

# 211 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decEdit = (fun (dtb_u_u64 : int) (dtb_u_u65 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decSpan (dtb_u_u64 - 1)) dtb_u_u65)) (fun (dtb_u_u66 : Base_dSource.t_Span) (dtb_u_u67 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u64 - 1)) dtb_u_u67)) (fun (dtb_u_u68 : string) (dtb_u_u69 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_DiagEdit_editSpan = dtb_u_u66; Base_dDiag.f_DiagEdit_editNewText = dtb_u_u68 }; B_dData_dPair.f_Pair_second = dtb_u_u69 })))))))

# 217 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encSuggestion = (fun (dtb_u_u70 : Base_dDiag.t_Suggestion) (dtb_u_u71 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u70).Base_dDiag.f_Suggestion_suggestionTitle) ((Base_dBytes.v_encTag (v_applicabilityTag (dtb_u_u70).Base_dDiag.f_Suggestion_suggestionApplicability)) (((Base_dBytes.v_encList v_encEdit) (dtb_u_u70).Base_dDiag.f_Suggestion_suggestionEdits) dtb_u_u71))))

# 223 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decSuggestion = (fun (dtb_u_u72 : int) (dtb_u_u73 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u72 - 1)) dtb_u_u73)) (fun (dtb_u_u74 : string) (dtb_u_u75 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u72 - 1)) dtb_u_u75)) (fun (dtb_u_u76 : int) (dtb_u_u77 : Base_dBytes.t_Cur) -> (match (v_applicabilityOfTag dtb_u_u76) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u78) -> ((v_thenPair (((Base_dBytes.v_decList v_decEdit) (dtb_u_u72 - 1)) dtb_u_u77)) (fun (dtb_u_u79 : Base_dDiag.t_DiagEdit B_dData_dList.t_List) (dtb_u_u80 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Suggestion_suggestionTitle = dtb_u_u74; Base_dDiag.f_Suggestion_suggestionApplicability = dtb_u_u78; Base_dDiag.f_Suggestion_suggestionEdits = dtb_u_u79 }; B_dData_dPair.f_Pair_second = dtb_u_u80 }))))
  | _ -> failwith "DT: impossible branch"
))))))

# 235 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encCandidate = (fun (dtb_u_u81 : Base_dDiag.t_Candidate) (dtb_u_u82 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u81).Base_dDiag.f_Candidate_candidateText) (((Base_dBytes.v_encMaybe v_encSpan) (dtb_u_u81).Base_dDiag.f_Candidate_candidateSpan) (((Base_dBytes.v_encMaybe Base_dBytes.v_encStr) (dtb_u_u81).Base_dDiag.f_Candidate_candidateReason) dtb_u_u82))))

# 241 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCandidate = (fun (dtb_u_u83 : int) (dtb_u_u84 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u83 - 1)) dtb_u_u84)) (fun (dtb_u_u85 : string) (dtb_u_u86 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u83 - 1)) dtb_u_u86)) (fun (dtb_u_u87 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u88 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decStr) (dtb_u_u83 - 1)) dtb_u_u88)) (fun (dtb_u_u89 : string B_dData_dMaybe.t_Maybe) (dtb_u_u90 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Candidate_candidateText = dtb_u_u85; Base_dDiag.f_Candidate_candidateSpan = dtb_u_u87; Base_dDiag.f_Candidate_candidateReason = dtb_u_u89 }; B_dData_dPair.f_Pair_second = dtb_u_u90 })))))))))

# 247 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encCall = (fun (dtb_u_u91 : Base_dDiag.t_CallInfo) (dtb_u_u92 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encStr (dtb_u_u91).Base_dDiag.f_CallInfo_callCallee) ((Base_dBytes.v_encStr (dtb_u_u91).Base_dDiag.f_CallInfo_callArg) ((Base_dBytes.v_encStr (dtb_u_u91).Base_dDiag.f_CallInfo_callRelation) (((Base_dBytes.v_encMaybe v_encSpan) (dtb_u_u91).Base_dDiag.f_CallInfo_callSpan) dtb_u_u92)))))

# 253 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decCall = (fun (dtb_u_u93 : int) (dtb_u_u94 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u93 - 1)) dtb_u_u94)) (fun (dtb_u_u95 : string) (dtb_u_u96 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u93 - 1)) dtb_u_u96)) (fun (dtb_u_u97 : string) (dtb_u_u98 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u93 - 1)) dtb_u_u98)) (fun (dtb_u_u99 : string) (dtb_u_u100 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u93 - 1)) dtb_u_u100)) (fun (dtb_u_u101 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u102 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_CallInfo_callCallee = dtb_u_u95; Base_dDiag.f_CallInfo_callArg = dtb_u_u97; Base_dDiag.f_CallInfo_callRelation = dtb_u_u99; Base_dDiag.f_CallInfo_callSpan = dtb_u_u101 }; B_dData_dPair.f_Pair_second = dtb_u_u102 })))))))))))

# 260 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encField = (fun (dtb_u_u103 : Base_dDiag.t_DiagField) (dtb_u_u104 : string B_dData_dList.t_List) -> (match dtb_u_u103 with
  | Base_dDiag.C_DiagField_FieldNote (dtb_u_u105) -> ((Base_dBytes.v_encTag 9) ((Base_dBytes.v_encStr dtb_u_u105) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldSpan (dtb_u_u106, dtb_u_u107) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb_u_u106) ((v_encSpan dtb_u_u107) dtb_u_u104)))
  | Base_dDiag.C_DiagField_FieldModule (dtb_u_u108) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb_u_u108) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldEffect (dtb_u_u109) -> ((Base_dBytes.v_encTag 6) ((Base_dBytes.v_encStr dtb_u_u109) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u110, dtb_u_u111, dtb_u_u112) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb_u_u110) ((Base_dBytes.v_encInt dtb_u_u111) ((Base_dBytes.v_encInt dtb_u_u112) dtb_u_u104))))
  | Base_dDiag.C_DiagField_FieldCall (dtb_u_u113) -> ((Base_dBytes.v_encTag 4) ((v_encCall dtb_u_u113) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u114) -> ((Base_dBytes.v_encTag 3) (((Base_dBytes.v_encList v_encCandidate) dtb_u_u114) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldName (dtb_u_u115) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u115) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldFound (dtb_u_u116) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encStr dtb_u_u116) dtb_u_u104))
  | Base_dDiag.C_DiagField_FieldExpected (dtb_u_u117) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u117) dtb_u_u104))
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decField = (fun (dtb_u_u118 : int) (dtb_u_u119 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u118 - 1)) dtb_u_u119)) (fun (dtb_u_u120 : int) (dtb_u_u121 : Base_dBytes.t_Cur) -> (if (dtb_u_u120 = 0) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u122 : string) (dtb_u_u123 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldExpected (dtb_u_u122)); B_dData_dPair.f_Pair_second = dtb_u_u123 })))) else (if (dtb_u_u120 = 1) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u124 : string) (dtb_u_u125 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldFound (dtb_u_u124)); B_dData_dPair.f_Pair_second = dtb_u_u125 })))) else (if (dtb_u_u120 = 2) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u126 : string) (dtb_u_u127 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldName (dtb_u_u126)); B_dData_dPair.f_Pair_second = dtb_u_u127 })))) else (if (dtb_u_u120 = 3) then ((v_thenPair (((Base_dBytes.v_decList v_decCandidate) (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u128 : Base_dDiag.t_Candidate B_dData_dList.t_List) (dtb_u_u129 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u128)); B_dData_dPair.f_Pair_second = dtb_u_u129 })))) else (if (dtb_u_u120 = 4) then ((v_thenPair ((v_decCall (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u130 : Base_dDiag.t_CallInfo) (dtb_u_u131 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldCall (dtb_u_u130)); B_dData_dPair.f_Pair_second = dtb_u_u131 })))) else (if (dtb_u_u120 = 5) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u132 : string) (dtb_u_u133 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u118 - 1)) dtb_u_u133)) (fun (dtb_u_u134 : int) (dtb_u_u135 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u118 - 1)) dtb_u_u135)) (fun (dtb_u_u136 : int) (dtb_u_u137 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u132, dtb_u_u134, dtb_u_u136)); B_dData_dPair.f_Pair_second = dtb_u_u137 })))))))) else (if (dtb_u_u120 = 6) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u138 : string) (dtb_u_u139 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldEffect (dtb_u_u138)); B_dData_dPair.f_Pair_second = dtb_u_u139 })))) else (if (dtb_u_u120 = 7) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u140 : string) (dtb_u_u141 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldModule (dtb_u_u140)); B_dData_dPair.f_Pair_second = dtb_u_u141 })))) else (if (dtb_u_u120 = 8) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u142 : string) (dtb_u_u143 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decSpan (dtb_u_u118 - 1)) dtb_u_u143)) (fun (dtb_u_u144 : Base_dSource.t_Span) (dtb_u_u145 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldSpan (dtb_u_u142, dtb_u_u144)); B_dData_dPair.f_Pair_second = dtb_u_u145 })))))) else (if (dtb_u_u120 = 9) then ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u118 - 1)) dtb_u_u121)) (fun (dtb_u_u146 : string) (dtb_u_u147 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_DiagField_FieldNote (dtb_u_u146)); B_dData_dPair.f_Pair_second = dtb_u_u147 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))))))))))

# 291 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encOrigin = (fun (dtb_u_u148 : Base_dDiag.t_Origin) (dtb_u_u149 : string B_dData_dList.t_List) -> (match dtb_u_u148 with
  | Base_dDiag.C_Origin_OriginCascade (dtb_u_u150) -> ((Base_dBytes.v_encTag 1) (((Base_dBytes.v_encMaybe Base_dBytes.v_encInt) dtb_u_u150) dtb_u_u149))
  | Base_dDiag.C_Origin_OriginDirect -> ((Base_dBytes.v_encTag 0) dtb_u_u149)
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decOrigin = (fun (dtb_u_u151 : int) (dtb_u_u152 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u151 - 1)) dtb_u_u152)) (fun (dtb_u_u153 : int) (dtb_u_u154 : Base_dBytes.t_Cur) -> (if (dtb_u_u153 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Base_dDiag.C_Origin_OriginDirect; B_dData_dPair.f_Pair_second = dtb_u_u154 })) else (if (dtb_u_u153 = 1) then ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decInt) (dtb_u_u151 - 1)) dtb_u_u154)) (fun (dtb_u_u155 : int B_dData_dMaybe.t_Maybe) (dtb_u_u156 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dDiag.C_Origin_OriginCascade (dtb_u_u155)); B_dData_dPair.f_Pair_second = dtb_u_u156 })))) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 305 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encIce = (fun (dtb_u_u157 : Base_dDiag.t_IceInfo) (dtb_u_u158 : string B_dData_dList.t_List) -> (match dtb_u_u157 with
  | { Base_dDiag.f_IceInfo_icePhase = dtb_u_u159; Base_dDiag.f_IceInfo_iceFunction = dtb_u_u160; Base_dDiag.f_IceInfo_iceInvariant = dtb_u_u161; Base_dDiag.f_IceInfo_iceFingerprint = dtb_u_u162; Base_dDiag.f_IceInfo_iceHint = dtb_u_u163 } -> ((Base_dBytes.v_encTag (v_phaseTag dtb_u_u159)) ((Base_dBytes.v_encStr dtb_u_u160) ((Base_dBytes.v_encStr dtb_u_u161) ((Base_dBytes.v_encStr dtb_u_u162) ((Base_dBytes.v_encStr dtb_u_u163) dtb_u_u158)))))
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decIce = (fun (dtb_u_u164 : int) (dtb_u_u165 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u164 - 1)) dtb_u_u165)) (fun (dtb_u_u166 : int) (dtb_u_u167 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag dtb_u_u166) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u168) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u164 - 1)) dtb_u_u167)) (fun (dtb_u_u169 : string) (dtb_u_u170 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u164 - 1)) dtb_u_u170)) (fun (dtb_u_u171 : string) (dtb_u_u172 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u164 - 1)) dtb_u_u172)) (fun (dtb_u_u173 : string) (dtb_u_u174 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u164 - 1)) dtb_u_u174)) (fun (dtb_u_u175 : string) (dtb_u_u176 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_IceInfo_icePhase = dtb_u_u168; Base_dDiag.f_IceInfo_iceFunction = dtb_u_u169; Base_dDiag.f_IceInfo_iceInvariant = dtb_u_u171; Base_dDiag.f_IceInfo_iceFingerprint = dtb_u_u173; Base_dDiag.f_IceInfo_iceHint = dtb_u_u175 }; B_dData_dPair.f_Pair_second = dtb_u_u176 }))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 318 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decTrace = (fun (dtb_u_u177 : int) (dtb_u_u178 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u177 - 1)) dtb_u_u178)) (fun (dtb_u_u179 : int) (dtb_u_u180 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag dtb_u_u179) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u181) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u177 - 1)) dtb_u_u180)) (fun (dtb_u_u182 : string) (dtb_u_u183 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decSpan) (dtb_u_u177 - 1)) dtb_u_u183)) (fun (dtb_u_u184 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u185 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decCount (dtb_u_u177 - 1)) dtb_u_u185)) (fun (dtb_u_u186 : int) (dtb_u_u187 : Base_dBytes.t_Cur) -> (if (dtb_u_u186 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_TraceFrame_tracePhase = dtb_u_u181; Base_dDiag.f_TraceFrame_traceText = dtb_u_u182; Base_dDiag.f_TraceFrame_traceSpan = dtb_u_u184; Base_dDiag.f_TraceFrame_traceChildren = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = dtb_u_u187 })) else B_dData_dMaybe.C_Maybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 335 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encTrace = (fun (dtb_u_u188 : Base_dDiag.t_TraceFrame) (dtb_u_u189 : string B_dData_dList.t_List) -> (match dtb_u_u188 with
  | { Base_dDiag.f_TraceFrame_tracePhase = dtb_u_u190; Base_dDiag.f_TraceFrame_traceText = dtb_u_u191; Base_dDiag.f_TraceFrame_traceSpan = dtb_u_u192; Base_dDiag.f_TraceFrame_traceChildren = dtb_u_u193 } -> ((Base_dBytes.v_encTag (v_phaseTag dtb_u_u190)) ((Base_dBytes.v_encStr dtb_u_u191) (((Base_dBytes.v_encMaybe v_encSpan) dtb_u_u192) (B_dData_dList.C_List__x58__x58_ ("[0:", dtb_u_u189)))))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_mtAbsent = (fun (dtb_u_u194 : int B_dData_dMaybe.t_Maybe) -> (match dtb_u_u194 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u195) -> (match (v_absentOfTag dtb_u_u195) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u196) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u196))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_decDiag = (fun (dtb_u_u197 : int) (dtb_u_u198 : Base_dBytes.t_Cur) -> (if (dtb_u_u197 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((v_thenPair ((Base_dBytes.v_decInt (dtb_u_u197 - 1)) dtb_u_u198)) (fun (dtb_u_u199 : int) (dtb_u_u200 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u197 - 1)) dtb_u_u200)) (fun (dtb_u_u201 : int) (dtb_u_u202 : Base_dBytes.t_Cur) -> (match (v_sevOfTag dtb_u_u201) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u203) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u197 - 1)) dtb_u_u202)) (fun (dtb_u_u204 : int) (dtb_u_u205 : Base_dBytes.t_Cur) -> (match (v_phaseOfTag dtb_u_u204) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u206) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u197 - 1)) dtb_u_u205)) (fun (dtb_u_u207 : int) (dtb_u_u208 : Base_dBytes.t_Cur) -> (match (v_catOfTag dtb_u_u207) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u209) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u197 - 1)) dtb_u_u208)) (fun (dtb_u_u210 : string) (dtb_u_u211 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decStr (dtb_u_u197 - 1)) dtb_u_u211)) (fun (dtb_u_u212 : string) (dtb_u_u213 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decLabel) (dtb_u_u197 - 1)) dtb_u_u213)) (fun (dtb_u_u214 : Base_dDiag.t_Label B_dData_dList.t_List) (dtb_u_u215 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decField) (dtb_u_u197 - 1)) dtb_u_u215)) (fun (dtb_u_u216 : Base_dDiag.t_DiagField B_dData_dList.t_List) (dtb_u_u217 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decTrace) (dtb_u_u197 - 1)) dtb_u_u217)) (fun (dtb_u_u218 : Base_dDiag.t_TraceFrame B_dData_dList.t_List) (dtb_u_u219 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (dtb_u_u197 - 1)) dtb_u_u219)) (fun (dtb_u_u220 : string B_dData_dList.t_List) (dtb_u_u221 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decList v_decSuggestion) (dtb_u_u197 - 1)) dtb_u_u221)) (fun (dtb_u_u222 : Base_dDiag.t_Suggestion B_dData_dList.t_List) (dtb_u_u223 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decOrigin (dtb_u_u197 - 1)) dtb_u_u223)) (fun (dtb_u_u224 : Base_dDiag.t_Origin) (dtb_u_u225 : Base_dBytes.t_Cur) -> ((v_thenPair ((v_decDiagList (dtb_u_u197 - 1)) dtb_u_u225)) (fun (dtb_u_u226 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u227 : Base_dBytes.t_Cur) -> ((v_thenPair ((Base_dBytes.v_decBool (dtb_u_u197 - 1)) dtb_u_u227)) (fun (dtb_u_u228 : bool) (dtb_u_u229 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe v_decIce) (dtb_u_u197 - 1)) dtb_u_u229)) (fun (dtb_u_u230 : Base_dDiag.t_IceInfo B_dData_dMaybe.t_Maybe) (dtb_u_u231 : Base_dBytes.t_Cur) -> ((v_thenPair (((Base_dBytes.v_decMaybe Base_dBytes.v_decTag) (dtb_u_u197 - 1)) dtb_u_u231)) (fun (dtb_u_u232 : int B_dData_dMaybe.t_Maybe) (dtb_u_u233 : Base_dBytes.t_Cur) -> (match (v_mtAbsent dtb_u_u232) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u234) -> ((v_thenPair ((Base_dBytes.v_decTag (dtb_u_u197 - 1)) dtb_u_u233)) (fun (dtb_u_u235 : int) (dtb_u_u236 : Base_dBytes.t_Cur) -> (match (v_stabilityOfTag dtb_u_u235) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u237) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Base_dDiag.f_Diagnostic_diagId = dtb_u_u199; Base_dDiag.f_Diagnostic_diagSeverity = dtb_u_u203; Base_dDiag.f_Diagnostic_diagPhase = dtb_u_u206; Base_dDiag.f_Diagnostic_diagCategory = dtb_u_u209; Base_dDiag.f_Diagnostic_diagCode = dtb_u_u210; Base_dDiag.f_Diagnostic_diagMessage = dtb_u_u212; Base_dDiag.f_Diagnostic_diagLabels = dtb_u_u214; Base_dDiag.f_Diagnostic_diagFields = dtb_u_u216; Base_dDiag.f_Diagnostic_diagTrace = dtb_u_u218; Base_dDiag.f_Diagnostic_diagNotes = dtb_u_u220; Base_dDiag.f_Diagnostic_diagSuggestions = dtb_u_u222; Base_dDiag.f_Diagnostic_diagOrigin = dtb_u_u224; Base_dDiag.f_Diagnostic_diagChildren = dtb_u_u226; Base_dDiag.f_Diagnostic_diagInternal = dtb_u_u228; Base_dDiag.f_Diagnostic_diagIce = dtb_u_u230; Base_dDiag.f_Diagnostic_diagAbsent = dtb_u_u234; Base_dDiag.f_Diagnostic_diagStability = dtb_u_u237 }; B_dData_dPair.f_Pair_second = dtb_u_u236 }))
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
and v_decDiagList = (fun (dtb_u_u238 : int) (dtb_u_u239 : Base_dBytes.t_Cur) -> (if (dtb_u_u238 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u240 = ((v_decCount (dtb_u_u238 - 1)) dtb_u_u239) in (match dtb_u_u240 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u241) -> (match dtb_u_u241 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u242; B_dData_dPair.f_Pair_second = dtb_u_u243 } -> ((((v_decDiagItems (dtb_u_u238 - 1)) dtb_u_u242) dtb_u_u243) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 427 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_decDiagItems = (fun (dtb_u_u244 : int) (dtb_u_u245 : int) (dtb_u_u246 : Base_dBytes.t_Cur) (dtb_u_u247 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (dtb_u_u244 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u245 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u247); B_dData_dPair.f_Pair_second = dtb_u_u246 })) else (let dtb_u_u248 = ((v_decDiag (dtb_u_u244 - 1)) dtb_u_u246) in (match dtb_u_u248 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u249) -> (match dtb_u_u249 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u250; B_dData_dPair.f_Pair_second = dtb_u_u251 } -> ((((v_decDiagItems (dtb_u_u244 - 1)) (dtb_u_u245 - 1)) dtb_u_u251) (B_dData_dList.C_List__x58__x58_ (dtb_u_u250, dtb_u_u247)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 446 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_absentEnc = (fun (dtb_u_u252 : Base_dDiag.t_NoSourceReason) (dtb_u_u253 : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTag (v_absentTag dtb_u_u252)) dtb_u_u253))

# 327 "Vuna/Compiler/Base/Diag/Codec.vuna"
let rec v_encDiagList = (fun (dtb_u_u254 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u255 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["["; (string_of_int (Base_dBytes.v_lenOf dtb_u_u254)); ":"]), ((v_encDiagListGo dtb_u_u254) dtb_u_u255))))
# 330 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_encDiagListGo = (fun (dtb_u_u256 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u257 : string B_dData_dList.t_List) -> (match dtb_u_u256 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u258, dtb_u_u259) -> ((v_encDiag dtb_u_u258) ((v_encDiagListGo dtb_u_u259) dtb_u_u257))
  | B_dData_dList.C_List_Nil -> dtb_u_u257
  | _ -> failwith "DT: impossible branch"
))
# 339 "Vuna/Compiler/Base/Diag/Codec.vuna"
and v_encDiag = (fun (dtb_u_u260 : Base_dDiag.t_Diagnostic) (dtb_u_u261 : string B_dData_dList.t_List) -> (match dtb_u_u260 with
  | { Base_dDiag.f_Diagnostic_diagId = dtb_u_u262; Base_dDiag.f_Diagnostic_diagSeverity = dtb_u_u263; Base_dDiag.f_Diagnostic_diagPhase = dtb_u_u264; Base_dDiag.f_Diagnostic_diagCategory = dtb_u_u265; Base_dDiag.f_Diagnostic_diagCode = dtb_u_u266; Base_dDiag.f_Diagnostic_diagMessage = dtb_u_u267; Base_dDiag.f_Diagnostic_diagLabels = dtb_u_u268; Base_dDiag.f_Diagnostic_diagFields = dtb_u_u269; Base_dDiag.f_Diagnostic_diagTrace = dtb_u_u270; Base_dDiag.f_Diagnostic_diagNotes = dtb_u_u271; Base_dDiag.f_Diagnostic_diagSuggestions = dtb_u_u272; Base_dDiag.f_Diagnostic_diagOrigin = dtb_u_u273; Base_dDiag.f_Diagnostic_diagChildren = dtb_u_u274; Base_dDiag.f_Diagnostic_diagInternal = dtb_u_u275; Base_dDiag.f_Diagnostic_diagIce = dtb_u_u276; Base_dDiag.f_Diagnostic_diagAbsent = dtb_u_u277; Base_dDiag.f_Diagnostic_diagStability = dtb_u_u278 } -> ((Base_dBytes.v_encInt dtb_u_u262) ((Base_dBytes.v_encTag (v_sevTag dtb_u_u263)) ((Base_dBytes.v_encTag (v_phaseTag dtb_u_u264)) ((Base_dBytes.v_encTag (v_catTag dtb_u_u265)) ((Base_dBytes.v_encStr dtb_u_u266) ((Base_dBytes.v_encStr dtb_u_u267) (((Base_dBytes.v_encList v_encLabel) dtb_u_u268) (((Base_dBytes.v_encList v_encField) dtb_u_u269) (((Base_dBytes.v_encList v_encTrace) dtb_u_u270) (((Base_dBytes.v_encList Base_dBytes.v_encStr) dtb_u_u271) (((Base_dBytes.v_encList v_encSuggestion) dtb_u_u272) ((v_encOrigin dtb_u_u273) ((v_encDiagList dtb_u_u274) ((Base_dBytes.v_encBool dtb_u_u275) (((Base_dBytes.v_encMaybe v_encIce) dtb_u_u276) (((Base_dBytes.v_encMaybe v_absentEnc) dtb_u_u277) ((Base_dBytes.v_encTag (v_stabilityTag dtb_u_u278)) dtb_u_u261)))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_encDiagnostics = (fun (dtb_u_u279 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dBytes.v_encConcat ((v_encDiagList dtb_u_u279) B_dData_dList.C_List_Nil)))

# 456 "Vuna/Compiler/Base/Diag/Codec.vuna"
let v_decDiagnostics = (fun (dtb_u_u280 : string) -> (let dtb_u_u281 = ((String.length dtb_u_u280) + 1) in (let dtb_u_u282 = ((v_decDiagList dtb_u_u281) (Base_dBytes.v_curOf dtb_u_u280)) in (match dtb_u_u282 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u283) -> (match dtb_u_u283 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u284; B_dData_dPair.f_Pair_second = dtb_u_u285 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u285) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u284)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
