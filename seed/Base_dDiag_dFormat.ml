open Vuna_runtime
type t_SourceRef = { f_SourceRef_srcFile : string; f_SourceRef_srcDigest : string; f_SourceRef_srcPackage : string; f_SourceRef_srcModule : string; f_SourceRef_srcRelPath : string }

# 28 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_severityName = (fun (dtb_u_u1 : Base_dDiag.t_Severity) -> (match dtb_u_u1 with
  | Base_dDiag.C_Severity_SevHelp -> "help"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_phaseName = (fun (dtb_u_u2 : Base_dDiag.t_Phase) -> (match dtb_u_u2 with
  | Base_dDiag.C_Phase_PhInternal -> "internal"
  | Base_dDiag.C_Phase_PhTool -> "tool"
  | Base_dDiag.C_Phase_PhDriver -> "driver"
  | Base_dDiag.C_Phase_PhPackage -> "package"
  | Base_dDiag.C_Phase_PhCodegen -> "codegen"
  | Base_dDiag.C_Phase_PhUsage -> "usage"
  | Base_dDiag.C_Phase_PhTermination -> "termination"
  | Base_dDiag.C_Phase_PhCoverage -> "coverage"
  | Base_dDiag.C_Phase_PhUnify -> "unify"
  | Base_dDiag.C_Phase_PhElab -> "elab"
  | Base_dDiag.C_Phase_PhLoad -> "load"
  | Base_dDiag.C_Phase_PhResolve -> "resolve"
  | Base_dDiag.C_Phase_PhParse -> "parse"
  | Base_dDiag.C_Phase_PhLex -> "lex"
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_categoryName = (fun (dtb_u_u3 : Base_dDiag.t_Category) -> (match dtb_u_u3 with
  | Base_dDiag.C_Category_CatInternal -> "internal"
  | Base_dDiag.C_Category_CatTool -> "tool"
  | Base_dDiag.C_Category_CatPackage -> "package"
  | Base_dDiag.C_Category_CatCodegen -> "codegen"
  | Base_dDiag.C_Category_CatTraits -> "traits"
  | Base_dDiag.C_Category_CatRecords -> "records"
  | Base_dDiag.C_Category_CatEffects -> "effects"
  | Base_dDiag.C_Category_CatQuantity -> "quantity"
  | Base_dDiag.C_Category_CatTermination -> "termination"
  | Base_dDiag.C_Category_CatCoverage -> "coverage"
  | Base_dDiag.C_Category_CatUniverses -> "universes"
  | Base_dDiag.C_Category_CatTypes -> "types"
  | Base_dDiag.C_Category_CatNames -> "names"
  | Base_dDiag.C_Category_CatSyntax -> "syntax"
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_originName = (fun (dtb_u_u4 : Base_dDiag.t_Origin) -> (match dtb_u_u4 with
  | Base_dDiag.C_Origin_OriginCascade (dtb_u_u5) -> "cascade"
  | Base_dDiag.C_Origin_OriginDirect -> "direct"
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_applicabilityName = (fun (dtb_u_u6 : Base_dDiag.t_Applicability) -> (match dtb_u_u6 with
  | Base_dDiag.C_Applicability_HasPlaceholder -> "has-placeholder"
  | Base_dDiag.C_Applicability_MaybeIncorrect -> "maybe-incorrect"
  | Base_dDiag.C_Applicability_MachineApplicable -> "machine-applicable"
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderShort = Base_dDiag.v_diagText

# 85 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_primarySpan = (fun (dtb_u_u7 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (match dtb_u_u8 with
  | { Base_dDiag.f_Label_labelSpan = dtb_u_u10; Base_dDiag.f_Label_labelText = dtb_u_u11; Base_dDiag.f_Label_labelStyle = dtb_u_u12; Base_dDiag.f_Label_labelProvenance = dtb_u_u13 } -> (match dtb_u_u12 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> dtb_u_u10
  | _ -> (v_primarySpan dtb_u_u9)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_primaryText = (fun (dtb_u_u14 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (match dtb_u_u15 with
  | { Base_dDiag.f_Label_labelSpan = dtb_u_u17; Base_dDiag.f_Label_labelText = dtb_u_u18; Base_dDiag.f_Label_labelStyle = dtb_u_u19; Base_dDiag.f_Label_labelProvenance = dtb_u_u20 } -> (match dtb_u_u19 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> dtb_u_u18
  | _ -> (v_primaryText dtb_u_u16)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_lineAt = (fun (dtb_u_u21 : string B_dData_dList.t_List) (dtb_u_u22 : int) -> (match dtb_u_u21 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u23, dtb_u_u24) -> (if (dtb_u_u22 <= 1) then dtb_u_u23 else ((v_lineAt dtb_u_u24) (dtb_u_u22 - 1)))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_tabToSpace = (fun (dtb_u_u25 : int) -> (if (dtb_u_u25 = 9) then 32 else dtb_u_u25))

# 102 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_displayLine = (fun (dtb_u_u26 : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_tabToSpace) (B_dData_dList.dtp_unpack dtb_u_u26))))

# 109 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_repeatSpace = (fun (dtb_u_u27 : int) -> (if (dtb_u_u27 <= 0) then "" else (" " ^ (v_repeatSpace (dtb_u_u27 - 1)))))

# 112 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_padLeft = (fun (dtb_u_u28 : int) (dtb_u_u29 : string) -> (if ((String.length dtb_u_u29) >= dtb_u_u28) then dtb_u_u29 else ((v_repeatSpace (dtb_u_u28 - (String.length dtb_u_u29))) ^ dtb_u_u29)))

# 117 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isUtf8Cont = (fun (dtb_u_u30 : int) -> (if (dtb_u_u30 >= 128) then (dtb_u_u30 < 192) else false))

# 121 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_displayColGo = (fun (dtb_u_u31 : int B_dData_dList.t_List) (dtb_u_u32 : int) (dtb_u_u33 : int) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (if (dtb_u_u32 <= 0) then dtb_u_u33 else (((v_displayColGo dtb_u_u35) (dtb_u_u32 - 1)) (if (v_isUtf8Cont dtb_u_u34) then dtb_u_u33 else (dtb_u_u33 + 1))))
  | B_dData_dList.C_List_Nil -> dtb_u_u33
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_displayColOf = (fun (dtb_u_u36 : string) (dtb_u_u37 : int) -> ((((v_displayColGo (B_dData_dList.dtp_unpack dtb_u_u36)) (if (dtb_u_u37 <= 1) then 0 else (dtb_u_u37 - 1))) 0) + 1))

# 132 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_caretWidthIn = (fun (dtb_u_u38 : string) (dtb_u_u39 : Base_dSource.t_Span) -> (if ((Base_dSource.v_spanEndLine dtb_u_u39) <> (Base_dSource.v_spanStartLine dtb_u_u39)) then 1 else (let dtb_u_u40 = (((v_displayColOf dtb_u_u38) (if ((Base_dSource.v_spanEndCol dtb_u_u39) <= 0) then 1 else (Base_dSource.v_spanEndCol dtb_u_u39))) - ((v_displayColOf dtb_u_u38) (if ((Base_dSource.v_spanStartCol dtb_u_u39) <= 0) then 1 else (Base_dSource.v_spanStartCol dtb_u_u39)))) in (if (dtb_u_u40 > 0) then dtb_u_u40 else 1))))

# 142 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_snippetOf = (fun (dtb_u_u41 : Base_dSource.t_Span) (dtb_u_u42 : string) -> (let dtb_u_u43 = (B_dData_dString.v_lines dtb_u_u42) in (let dtb_u_u44 = ((v_lineAt dtb_u_u43) (Base_dSource.v_spanStartLine dtb_u_u41)) in (let dtb_u_u45 = (v_displayLine dtb_u_u44) in (let dtb_u_u46 = (string_of_int (Base_dSource.v_spanStartLine dtb_u_u41)) in (let dtb_u_u47 = (String.length dtb_u_u46) in (let dtb_u_u48 = (if ((Base_dSource.v_spanStartCol dtb_u_u41) <= 0) then 0 else (((v_displayColOf dtb_u_u44) (Base_dSource.v_spanStartCol dtb_u_u41)) - 1)) in (let dtb_u_u49 = ((v_caretWidthIn dtb_u_u44) dtb_u_u41) in (let dtb_u_u50 = ((v_repeatSpace (dtb_u_u47 + 1)) ^ "|") in (let dtb_u_u51 = (String.concat "" [((v_padLeft dtb_u_u47) dtb_u_u46); " | "; dtb_u_u45]) in (let dtb_u_u52 = (String.concat "" [(v_repeatSpace (dtb_u_u47 + 1)); "|"; (v_repeatSpace (dtb_u_u48 + 1)); ((B_dData_dString.v_repeat (bi_natFromInt dtb_u_u49)) "^")]) in ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("  --> " ^ (Base_dSource.v_showSpanLoc dtb_u_u41)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u50, (B_dData_dList.C_List__x58__x58_ (dtb_u_u51, (B_dData_dList.C_List__x58__x58_ (dtb_u_u52, B_dData_dList.C_List_Nil))))))))))))))))))))

# 159 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderSnippet = (fun (dtb_u_u53 : string) (dtb_u_u56 : Base_dSource.t_Span) -> (Obj.repr ((fun (dtb_u_u61 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u64 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u53) (Base_dSource.v_spanFile dtb_u_u56)) dtb_u_u61) in (if dtb_u_u64 then (let dtb_u_u72 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u53) (Base_dSource.v_spanFile dtb_u_u56)) dtb_u_u61) in (if dtb_u_u72 then (let dtb_u_u74 = "" in dtb_u_u74) else (let dtb_u_u83 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u53) (Base_dSource.v_spanFile dtb_u_u56)) dtb_u_u61) in (let dtb_u_u85 = ((v_snippetOf dtb_u_u56) dtb_u_u83) in dtb_u_u85)))) else (let dtb_u_u88 = "" in dtb_u_u88)))))))

# 159 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderSnippet_u_udirect = (fun (nFs : string) (sp : Base_dSource.t_Span) _u_ueffTok -> (let dtb_u_u64 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (Base_dSource.v_spanFile sp)) _u_ueffTok) in (if dtb_u_u64 then (let dtb_u_u72 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) (Base_dSource.v_spanFile sp)) _u_ueffTok) in (if dtb_u_u72 then (let dtb_u_u74 = "" in dtb_u_u74) else (let dtb_u_u83 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) (Base_dSource.v_spanFile sp)) _u_ueffTok) in (let dtb_u_u85 = ((v_snippetOf sp) dtb_u_u83) in dtb_u_u85)))) else (let dtb_u_u88 = "" in dtb_u_u88))))

# 177 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderShortSnippetEff = (fun (dtb_u_u90 : string) (dtb_u_u93 : Base_dDiag.t_Diagnostic) -> (match (v_primarySpan (dtb_u_u93).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u95 = "" in (Obj.repr ((fun (dtb_u_u96 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u95))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u97) -> (Obj.repr ((fun (dtb_u_u102 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u105 = (((v_renderSnippet_u_udirect dtb_u_u90) dtb_u_u97) dtb_u_u102) in (let dtb_u_u107 = (if (dtb_u_u105 = "") then "" else ("\n" ^ dtb_u_u105)) in dtb_u_u107)))))
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderShortSnippetEff_u_udirect = (fun (nFs : string) (d : Base_dDiag.t_Diagnostic) _u_ueffTok -> (match (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u95 = "" in dtb_u_u95)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u97) -> (let dtb_u_u105 = (((v_renderSnippet_u_udirect nFs) dtb_u_u97) _u_ueffTok) in (let dtb_u_u107 = (if (dtb_u_u105 = "") then "" else ("\n" ^ dtb_u_u105)) in dtb_u_u107))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sameSpan = (fun (dtb_u_u109 : Base_dSource.t_Span) (dtb_u_u110 : Base_dSource.t_Span) -> (if (if (if (if ((dtb_u_u109).Base_dSource.f_Span_spanFile = (dtb_u_u110).Base_dSource.f_Span_spanFile) then ((dtb_u_u109).Base_dSource.f_Span_spanStartLine = (dtb_u_u110).Base_dSource.f_Span_spanStartLine) else false) then ((dtb_u_u109).Base_dSource.f_Span_spanStartCol = (dtb_u_u110).Base_dSource.f_Span_spanStartCol) else false) then ((dtb_u_u109).Base_dSource.f_Span_spanEndLine = (dtb_u_u110).Base_dSource.f_Span_spanEndLine) else false) then ((dtb_u_u109).Base_dSource.f_Span_spanEndCol = (dtb_u_u110).Base_dSource.f_Span_spanEndCol) else false))

# 196 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sameAsPrimary = (fun (dtb_u_u111 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u112 : Base_dSource.t_Span) -> (match dtb_u_u111 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u113) -> ((v_sameSpan dtb_u_u113) dtb_u_u112)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isPrimaryStyle = (fun (dtb_u_u114 : Base_dDiag.t_LabelStyle) -> (match dtb_u_u114 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> true
  | _ -> false
))

# 204 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isContextStyle = (fun (dtb_u_u115 : Base_dDiag.t_LabelStyle) -> (match dtb_u_u115 with
  | Base_dDiag.C_LabelStyle_LabelContext -> true
  | _ -> false
))

# 208 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_relatedBlocks = (fun (dtb_u_u116 : string) (dtb_u_u119 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u120 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match dtb_u_u120 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (match dtb_u_u121 with
  | { Base_dDiag.f_Label_labelSpan = dtb_u_u123; Base_dDiag.f_Label_labelText = dtb_u_u124; Base_dDiag.f_Label_labelStyle = dtb_u_u125; Base_dDiag.f_Label_labelProvenance = dtb_u_u126 } -> (Obj.repr ((fun (dtb_u_u131 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u134 = ((((v_relatedBlocks_u_udirect dtb_u_u116) dtb_u_u119) dtb_u_u122) dtb_u_u131) in (if (v_isPrimaryStyle dtb_u_u125) then (let dtb_u_u136 = dtb_u_u134 in dtb_u_u136) else (match dtb_u_u123 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u139 = dtb_u_u134 in dtb_u_u139)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u141) -> (let dtb_u_u142 = (if (dtb_u_u124 = "") then "" else (if (v_isContextStyle dtb_u_u125) then ("  = " ^ dtb_u_u124) else ("  = note: " ^ dtb_u_u124))) in (if ((v_sameAsPrimary dtb_u_u119) dtb_u_u141) then (if (dtb_u_u142 = "") then (let dtb_u_u144 = dtb_u_u134 in dtb_u_u144) else (let dtb_u_u147 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, dtb_u_u134)) in dtb_u_u147)) else (let dtb_u_u156 = (((v_renderSnippet_u_udirect dtb_u_u116) dtb_u_u141) dtb_u_u131) in (let dtb_u_u157 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (dtb_u_u161 : string) -> (dtb_u_u161 <> ""))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u156, (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, B_dData_dList.C_List_Nil)))))) in (let dtb_u_u159 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u134)) in dtb_u_u159)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u163 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u164 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u163))))
  | _ -> failwith "DT: impossible branch"
))
# 208 "Vuna/Compiler/Base/Diag/Format.vuna"
and v_relatedBlocks_u_udirect = (fun (nFs : string) (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Base_dDiag.t_Label B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (match dtb_u_u121 with
  | { Base_dDiag.f_Label_labelSpan = dtb_u_u123; Base_dDiag.f_Label_labelText = dtb_u_u124; Base_dDiag.f_Label_labelStyle = dtb_u_u125; Base_dDiag.f_Label_labelProvenance = dtb_u_u126 } -> (let dtb_u_u134 = ((((v_relatedBlocks_u_udirect nFs) mc0) dtb_u_u122) _u_ueffTok) in (if (v_isPrimaryStyle dtb_u_u125) then (let dtb_u_u136 = dtb_u_u134 in dtb_u_u136) else (match dtb_u_u123 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u139 = dtb_u_u134 in dtb_u_u139)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u141) -> (let dtb_u_u142 = (if (dtb_u_u124 = "") then "" else (if (v_isContextStyle dtb_u_u125) then ("  = " ^ dtb_u_u124) else ("  = note: " ^ dtb_u_u124))) in (if ((v_sameAsPrimary mc0) dtb_u_u141) then (if (dtb_u_u142 = "") then (let dtb_u_u144 = dtb_u_u134 in dtb_u_u144) else (let dtb_u_u147 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, dtb_u_u134)) in dtb_u_u147)) else (let dtb_u_u156 = (((v_renderSnippet_u_udirect nFs) dtb_u_u141) _u_ueffTok) in (let dtb_u_u157 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (dtb_u_u161 : string) -> (dtb_u_u161 <> ""))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u156, (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, B_dData_dList.C_List_Nil)))))) in (let dtb_u_u159 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u134)) in dtb_u_u159)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u163 = B_dData_dList.C_List_Nil in dtb_u_u163)
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderRelated = (fun (dtb_u_u165 : string) (dtb_u_u168 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u169 : Base_dDiag.t_Label B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u174 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u177 = ((((v_relatedBlocks_u_udirect dtb_u_u165) dtb_u_u168) dtb_u_u169) dtb_u_u174) in (let dtb_u_u179 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (dtb_u_u181 : string) -> (dtb_u_u181 <> ""))) dtb_u_u177)) in dtb_u_u179))))))

# 230 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderRelated_u_udirect = (fun (nFs : string) (primary : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (labels : Base_dDiag.t_Label B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u177 = ((((v_relatedBlocks_u_udirect nFs) primary) labels) _u_ueffTok) in (let dtb_u_u179 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (dtb_u_u181 : string) -> (dtb_u_u181 <> ""))) dtb_u_u177)) in dtb_u_u179)))

# 241 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_ghChar = (fun (dtb_u_u182 : int) -> (if (dtb_u_u182 = 37) then "%25" else (if (dtb_u_u182 = 13) then "%0D" else (if (dtb_u_u182 = 10) then "%0A" else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil)))))))

# 238 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_githubEscape = (fun (dtb_u_u183 : string) -> ((B_dData_dString.v_join "") ((B_dData_dList.v_map v_ghChar) (B_dData_dList.dtp_unpack dtb_u_u183))))

# 247 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderGithub = (fun (dtb_u_u184 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u185 = (v_githubEscape (dtb_u_u184).Base_dDiag.f_Diagnostic_diagMessage) in (let dtb_u_u186 = (if ((dtb_u_u184).Base_dDiag.f_Diagnostic_diagCode = "") then "" else (String.concat "" ["["; (dtb_u_u184).Base_dDiag.f_Diagnostic_diagCode; "] "])) in (match (v_primarySpan (dtb_u_u184).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u187) -> (String.concat "" ["::error file="; (dtb_u_u187).Base_dSource.f_Span_spanFile; ",line="; (string_of_int (dtb_u_u187).Base_dSource.f_Span_spanStartLine); ",col="; (string_of_int (dtb_u_u187).Base_dSource.f_Span_spanStartCol); ",endLine="; (string_of_int (dtb_u_u187).Base_dSource.f_Span_spanEndLine); ",endColumn="; (string_of_int (dtb_u_u187).Base_dSource.f_Span_spanEndCol); "::"; dtb_u_u186; dtb_u_u185])
  | B_dData_dMaybe.C_Maybe_Nothing -> (String.concat "" ["::error::"; dtb_u_u186; dtb_u_u185])
  | _ -> failwith "DT: impossible branch"
))))

# 258 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_localizedMessage = (fun (dtb_u_u188 : string) (dtb_u_u189 : Base_dDiag.t_Diagnostic) -> (if (dtb_u_u188 = "zh") then (match (Base_dDiagnostics.v_diagDescOf (dtb_u_u189).Base_dDiag.f_Diagnostic_diagCode) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u190) -> dtb_u_u190
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u189).Base_dDiag.f_Diagnostic_diagMessage
  | _ -> failwith "DT: impossible branch"
) else (dtb_u_u189).Base_dDiag.f_Diagnostic_diagMessage))

# 267 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_headerOf = (fun (dtb_u_u191 : string) (dtb_u_u192 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u193 = ((v_localizedMessage dtb_u_u191) dtb_u_u192) in (if ((dtb_u_u192).Base_dDiag.f_Diagnostic_diagCode = "") then (String.concat "" [(v_severityName (dtb_u_u192).Base_dDiag.f_Diagnostic_diagSeverity); ": "; dtb_u_u193]) else (String.concat "" [(v_severityName (dtb_u_u192).Base_dDiag.f_Diagnostic_diagSeverity); "["; (dtb_u_u192).Base_dDiag.f_Diagnostic_diagCode; "]: "; dtb_u_u193]))))

# 317 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_hexDigit = (fun (dtb_u_u194 : int) -> (if (dtb_u_u194 < 10) then (((B_dData_dString.v_substring (bi_natFromInt dtb_u_u194)) 1) "0123456789abcdef") else (((B_dData_dString.v_substring (bi_natFromInt dtb_u_u194)) 1) "0123456789abcdef")))

# 310 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_hex2 = (fun (dtb_u_u195 : int) -> (let dtb_u_u196 = (if 16 = 0 then failwith "division by zero" else dtb_u_u195 / 16) in (let dtb_u_u197 = (dtb_u_u195 - (dtb_u_u196 * 16)) in ((v_hexDigit dtb_u_u196) ^ (v_hexDigit dtb_u_u197)))))

# 302 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonEscapeChar = (fun (dtb_u_u198 : int) -> (if (dtb_u_u198 = 34) then "\\\"" else (if (dtb_u_u198 = 92) then "\\\\" else (if (dtb_u_u198 = 10) then "\\n" else (if (dtb_u_u198 = 13) then "\\r" else (if (dtb_u_u198 = 9) then "\\t" else (if (dtb_u_u198 < 32) then ("\\u00" ^ (v_hex2 dtb_u_u198)) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb_u_u198, B_dData_dList.C_List_Nil))))))))))

# 324 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonEscape = (fun (dtb_u_u199 : string) -> ((B_dData_dString.v_join "") ((B_dData_dList.v_map v_jsonEscapeChar) (B_dData_dList.dtp_unpack dtb_u_u199))))

# 327 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonStr = (fun (dtb_u_u200 : string) -> (String.concat "" ["\""; (v_jsonEscape dtb_u_u200); "\""]))

# 330 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonPos = (fun (dtb_u_u201 : int) (dtb_u_u202 : int) -> (String.concat "" ["{\"line\":"; (string_of_int dtb_u_u201); ",\"column\":"; (string_of_int dtb_u_u202); "}"]))

# 333 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSpan = (fun (dtb_u_u203 : Base_dSource.t_Span) -> (String.concat "" ["{\"file\":"; (v_jsonStr (dtb_u_u203).Base_dSource.f_Span_spanFile); ",\"start\":"; ((v_jsonPos (dtb_u_u203).Base_dSource.f_Span_spanStartLine) (dtb_u_u203).Base_dSource.f_Span_spanStartCol); ",\"end\":"; ((v_jsonPos (dtb_u_u203).Base_dSource.f_Span_spanEndLine) (dtb_u_u203).Base_dSource.f_Span_spanEndCol); "}"]))

# 341 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_styleName = (fun (dtb_u_u204 : Base_dDiag.t_LabelStyle) -> (match dtb_u_u204 with
  | Base_dDiag.C_LabelStyle_LabelContext -> "context"
  | Base_dDiag.C_LabelStyle_LabelSecondary -> "secondary"
  | Base_dDiag.C_LabelStyle_LabelPrimary -> "primary"
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonSpan = (fun (dtb_u_u205 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u205 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u206) -> (v_jsonSpan dtb_u_u206)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonLabel = (fun (dtb_u_u207 : Base_dDiag.t_Label) -> (match dtb_u_u207 with
  | { Base_dDiag.f_Label_labelSpan = dtb_u_u208; Base_dDiag.f_Label_labelText = dtb_u_u209; Base_dDiag.f_Label_labelStyle = dtb_u_u210; Base_dDiag.f_Label_labelProvenance = dtb_u_u211 } -> (String.concat "" ["{\"span\":"; (v_maybeJsonSpan dtb_u_u208); ",\"style\":"; (v_jsonStr (v_styleName dtb_u_u210)); ",\"text\":"; (v_jsonStr dtb_u_u209); ",\"provenance\":"; (v_maybeJsonSpan dtb_u_u211); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonString = (fun (dtb_u_u212 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u212 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u213) -> (v_jsonStr dtb_u_u213)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonCandidate = (fun (dtb_u_u214 : Base_dDiag.t_Candidate) -> (String.concat "" ["{\"text\":"; (v_jsonStr (dtb_u_u214).Base_dDiag.f_Candidate_candidateText); ",\"span\":"; (v_maybeJsonSpan (dtb_u_u214).Base_dDiag.f_Candidate_candidateSpan); ",\"reason\":"; (v_maybeJsonString (dtb_u_u214).Base_dDiag.f_Candidate_candidateReason); "}"]))

# 358 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonField = (fun (dtb_u_u215 : Base_dDiag.t_DiagField) -> (match dtb_u_u215 with
  | Base_dDiag.C_DiagField_FieldNote (dtb_u_u216) -> (String.concat "" ["{\"kind\":\"note\",\"value\":"; (v_jsonStr dtb_u_u216); "}"])
  | Base_dDiag.C_DiagField_FieldSpan (dtb_u_u217, dtb_u_u218) -> (String.concat "" ["{\"kind\":\"span\",\"name\":"; (v_jsonStr dtb_u_u217); ",\"value\":"; (v_jsonSpan dtb_u_u218); "}"])
  | Base_dDiag.C_DiagField_FieldModule (dtb_u_u219) -> (String.concat "" ["{\"kind\":\"module\",\"value\":"; (v_jsonStr dtb_u_u219); "}"])
  | Base_dDiag.C_DiagField_FieldEffect (dtb_u_u220) -> (String.concat "" ["{\"kind\":\"effect\",\"value\":"; (v_jsonStr dtb_u_u220); "}"])
  | Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u221, dtb_u_u222, dtb_u_u223) -> (String.concat "" ["{\"kind\":\"quantity\",\"value\":{\"name\":"; (v_jsonStr dtb_u_u221); ",\"declared\":"; (string_of_int dtb_u_u222); ",\"observed\":"; (string_of_int dtb_u_u223); "}}"])
  | Base_dDiag.C_DiagField_FieldCall (dtb_u_u224) -> (String.concat "" ["{\"kind\":\"call\",\"value\":{\"callee\":"; (v_jsonStr (dtb_u_u224).Base_dDiag.f_CallInfo_callCallee); ",\"arg\":"; (v_jsonStr (dtb_u_u224).Base_dDiag.f_CallInfo_callArg); ",\"relation\":"; (v_jsonStr (dtb_u_u224).Base_dDiag.f_CallInfo_callRelation); ",\"span\":"; (v_maybeJsonSpan (dtb_u_u224).Base_dDiag.f_CallInfo_callSpan); "}}"])
  | Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u225) -> (String.concat "" ["{\"kind\":\"candidates\",\"value\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonCandidate) dtb_u_u225)); "]}"])
  | Base_dDiag.C_DiagField_FieldName (dtb_u_u226) -> (String.concat "" ["{\"kind\":\"name\",\"value\":"; (v_jsonStr dtb_u_u226); "}"])
  | Base_dDiag.C_DiagField_FieldFound (dtb_u_u227) -> (String.concat "" ["{\"kind\":\"found\",\"value\":"; (v_jsonStr dtb_u_u227); "}"])
  | Base_dDiag.C_DiagField_FieldExpected (dtb_u_u228) -> (String.concat "" ["{\"kind\":\"expected\",\"value\":"; (v_jsonStr dtb_u_u228); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonDiagEdit = (fun (dtb_u_u229 : Base_dDiag.t_DiagEdit) -> (String.concat "" ["{\"span\":"; (v_jsonSpan (dtb_u_u229).Base_dDiag.f_DiagEdit_editSpan); ",\"newText\":"; (v_jsonStr (dtb_u_u229).Base_dDiag.f_DiagEdit_editNewText); "}"]))

# 377 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSuggestion = (fun (dtb_u_u230 : Base_dDiag.t_Suggestion) -> (String.concat "" ["{\"title\":"; (v_jsonStr (dtb_u_u230).Base_dDiag.f_Suggestion_suggestionTitle); ",\"applicability\":"; (v_jsonStr (v_applicabilityName (dtb_u_u230).Base_dDiag.f_Suggestion_suggestionApplicability)); ",\"edits\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonDiagEdit) (dtb_u_u230).Base_dDiag.f_Suggestion_suggestionEdits)); "]}"]))

# 384 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_jsonTraceFuel = (fun (dtb_u_u231 : int) (dtb_u_u232 : Base_dDiag.t_TraceFrame) -> (if (dtb_u_u231 <= 0) then "{\"phase\":\"truncated\"}" else (String.concat "" ["{\"phase\":"; (v_jsonStr (v_phaseName (dtb_u_u232).Base_dDiag.f_TraceFrame_tracePhase)); ",\"text\":"; (v_jsonStr (dtb_u_u232).Base_dDiag.f_TraceFrame_traceText); ",\"span\":"; (v_maybeJsonSpan (dtb_u_u232).Base_dDiag.f_TraceFrame_traceSpan); ",\"children\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonTraceFuel (dtb_u_u231 - 1))) (dtb_u_u232).Base_dDiag.f_TraceFrame_traceChildren)); "]}"])))

# 381 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonTrace = (fun (dtb_u_u233 : Base_dDiag.t_TraceFrame) -> ((v_jsonTraceFuel 64) dtb_u_u233))

# 391 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonIce = (fun (dtb_u_u234 : Base_dDiag.t_IceInfo) -> (String.concat "" ["{\"phase\":"; (v_jsonStr (v_phaseName (dtb_u_u234).Base_dDiag.f_IceInfo_icePhase)); ",\"function\":"; (v_jsonStr (dtb_u_u234).Base_dDiag.f_IceInfo_iceFunction); ",\"invariant\":"; (v_jsonStr (dtb_u_u234).Base_dDiag.f_IceInfo_iceInvariant); ",\"fingerprint\":"; (v_jsonStr (dtb_u_u234).Base_dDiag.f_IceInfo_iceFingerprint); ",\"hint\":"; (v_jsonStr (dtb_u_u234).Base_dDiag.f_IceInfo_iceHint); "}"]))

# 395 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonIce = (fun (dtb_u_u235 : Base_dDiag.t_IceInfo B_dData_dMaybe.t_Maybe) -> (match dtb_u_u235 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u236) -> (v_jsonIce dtb_u_u236)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeParent = (fun (dtb_u_u237 : int B_dData_dMaybe.t_Maybe) -> (match dtb_u_u237 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> (string_of_int dtb_u_u238)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_originJson = (fun (dtb_u_u239 : Base_dDiag.t_Origin) -> (match dtb_u_u239 with
  | Base_dDiag.C_Origin_OriginCascade (dtb_u_u240) -> (String.concat "" ["{\"kind\":\"cascade\",\"parent\":"; (v_maybeParent dtb_u_u240); "}"])
  | Base_dDiag.C_Origin_OriginDirect -> "{\"kind\":\"direct\"}"
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_absentName = (fun (dtb_u_u241 : Base_dDiag.t_NoSourceReason) -> (match dtb_u_u241 with
  | Base_dDiag.C_NoSourceReason_NsInternal -> "internal"
  | Base_dDiag.C_NoSourceReason_NsPackageGraph -> "package-graph"
  | Base_dDiag.C_NoSourceReason_NsToolUsage -> "tool-usage"
  | Base_dDiag.C_NoSourceReason_NsSynthetic -> "synthetic"
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonAbsent = (fun (dtb_u_u242 : Base_dDiag.t_NoSourceReason B_dData_dMaybe.t_Maybe) -> (match dtb_u_u242 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u243) -> (",\"absent\":" ^ (v_jsonStr (v_absentName dtb_u_u243)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSource = (fun (dtb_u_u244 : t_SourceRef) -> (String.concat "" ["{\"file\":"; (v_jsonStr (dtb_u_u244).f_SourceRef_srcFile); ",\"package\":"; (v_jsonStr (dtb_u_u244).f_SourceRef_srcPackage); ",\"module\":"; (v_jsonStr (dtb_u_u244).f_SourceRef_srcModule); ",\"relPath\":"; (v_jsonStr (dtb_u_u244).f_SourceRef_srcRelPath); ",\"digest\":"; (v_jsonStr (dtb_u_u244).f_SourceRef_srcDigest); "}"]))

# 450 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLevel = (fun (dtb_u_u245 : Base_dDiag.t_Severity) -> (match dtb_u_u245 with
  | Base_dDiag.C_Severity_SevHelp -> "note"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRuleId = (fun (dtb_u_u246 : Base_dDiag.t_Diagnostic) -> (if ((dtb_u_u246).Base_dDiag.f_Diagnostic_diagCode = "") then "vuna" else (dtb_u_u246).Base_dDiag.f_Diagnostic_diagCode))

# 459 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRegion = (fun (dtb_u_u247 : Base_dSource.t_Span) -> (String.concat "" ["{\"startLine\":"; (string_of_int (Base_dSource.v_spanStartLine dtb_u_u247)); ",\"startColumn\":"; (string_of_int (Base_dSource.v_spanStartCol dtb_u_u247)); ",\"endLine\":"; (string_of_int (Base_dSource.v_spanEndLine dtb_u_u247)); ",\"endColumn\":"; (string_of_int (Base_dSource.v_spanEndCol dtb_u_u247)); "}"]))

# 463 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLocation = (fun (dtb_u_u248 : string) (dtb_u_u249 : Base_dSource.t_Span) -> (String.concat "" ["{\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_jsonStr dtb_u_u248); "},\"region\":"; (v_sarifRegion dtb_u_u249); "}}"]))

# 467 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRelated = (fun (dtb_u_u250 : string) (dtb_u_u251 : Base_dDiag.t_Label) -> (match (dtb_u_u251).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> (String.concat "" ["{\"message\":{\"text\":"; (v_jsonStr (dtb_u_u251).Base_dDiag.f_Label_labelText); "}}"])
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u252) -> (String.concat "" ["{\"message\":{\"text\":"; (v_jsonStr (dtb_u_u251).Base_dDiag.f_Label_labelText); "},\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_jsonStr (Base_dSource.v_spanFile dtb_u_u252)); "},\"region\":"; (v_sarifRegion dtb_u_u252); "}}"])
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isPrimaryLabel = (fun (dtb_u_u253 : Base_dDiag.t_Label) -> (match (dtb_u_u253).Base_dDiag.f_Label_labelStyle with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> true
  | _ -> false
))

# 474 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifResult = (fun (dtb_u_u254 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u255 = (match (v_primarySpan (dtb_u_u254).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u262) -> (String.concat "" [",\"locations\":["; ((v_sarifLocation (Base_dSource.v_spanFile dtb_u_u262)) dtb_u_u262); "]"])
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u256 = ((B_dData_dList.v_filter (fun (dtb_u_u261 : Base_dDiag.t_Label) -> (B_dData_dBool.v_not (v_isPrimaryLabel dtb_u_u261)))) (dtb_u_u254).Base_dDiag.f_Diagnostic_diagLabels) in (let dtb_u_u257 = (if ((B_dData_dList.v_length dtb_u_u256) = 0) then "" else (String.concat "" [",\"relatedLocations\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_sarifRelated (Base_dDiag.v_diagFileOf dtb_u_u254))) dtb_u_u256)); "]"])) in (let dtb_u_u258 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map (fun (dtb_u_u260 : string) -> ("note: " ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u260)))) (dtb_u_u254).Base_dDiag.f_Diagnostic_diagNotes)) in (let dtb_u_u259 = (if (dtb_u_u258 = "") then (dtb_u_u254).Base_dDiag.f_Diagnostic_diagMessage else (String.concat "" [(dtb_u_u254).Base_dDiag.f_Diagnostic_diagMessage; "\n"; dtb_u_u258])) in (String.concat "" ["{\"ruleId\":"; (v_jsonStr (v_sarifRuleId dtb_u_u254)); ",\"level\":"; (v_jsonStr (v_sarifLevel (dtb_u_u254).Base_dDiag.f_Diagnostic_diagSeverity)); ",\"message\":{\"text\":"; (v_jsonStr dtb_u_u259); "}"; dtb_u_u255; dtb_u_u257; ",\"properties\":{\"vuna.origin\":"; (v_jsonStr (v_originName (dtb_u_u254).Base_dDiag.f_Diagnostic_diagOrigin)); "}}"])))))))

# 508 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_memCode = (fun (dtb_u_u263 : string) (dtb_u_u264 : string B_dData_dList.t_List) -> (match dtb_u_u264 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u265, dtb_u_u266) -> (if (dtb_u_u263 = dtb_u_u265) then true else ((v_memCode dtb_u_u263) dtb_u_u266))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_uniqueCodes = (fun (dtb_u_u267 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (dtb_u_u268 : string B_dData_dList.t_List) (dtb_u_u269 : Base_dDiag.t_Diagnostic) -> (if ((v_memCode (v_sarifRuleId dtb_u_u269)) dtb_u_u268) then dtb_u_u268 else ((B_dData_dList.v_append dtb_u_u268) (B_dData_dList.C_List__x58__x58_ ((v_sarifRuleId dtb_u_u269), B_dData_dList.C_List_Nil)))))) B_dData_dList.C_List_Nil) dtb_u_u267))

# 527 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLevelName = (fun (dtb_u_u270 : string) -> (if (dtb_u_u270 = "error") then "error" else (if (dtb_u_u270 = "warning") then "warning" else "note")))

# 512 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_ruleJson = (fun (dtb_u_u271 : string) -> (let dtb_u_u272 = (match (Base_dDiagnostics.v_diagDescOf dtb_u_u271) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u276) -> dtb_u_u276
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u271
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u273 = (Base_dDiagnostics.v_diagSeverityOf (Base_dDiagnostics.v_codeDomain dtb_u_u271)) in (let dtb_u_u274 = (Base_dDiagnostics.v_diagPhaseOf (Base_dDiagnostics.v_codeDomain dtb_u_u271)) in (let dtb_u_u275 = (Base_dDiagnostics.v_diagCategoryOf (Base_dDiagnostics.v_codeDomain dtb_u_u271)) in (String.concat "" ["{\"id\":"; (v_jsonStr dtb_u_u271); ",\"shortDescription\":{\"text\":"; (v_jsonStr dtb_u_u272); "},\"help\":{\"text\":"; (v_jsonStr dtb_u_u272); "},\"defaultConfiguration\":{\"level\":"; (v_jsonStr (v_sarifLevelName dtb_u_u273)); "},\"properties\":{\"tags\":["; (v_jsonStr dtb_u_u274); ","; (v_jsonStr dtb_u_u275); "]}}"]))))))

# 498 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRules = (fun (dtb_u_u277 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_ruleJson) (v_uniqueCodes dtb_u_u277))))

# 533 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderSarif = (fun (dtb_u_u278 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (String.concat "" ["{\"$schema\":\"https://json.schemastore.org/sarif-2.1.0.json\",\"version\":\"2.1.0\",\"runs\":[{\"tool\":{\"driver\":{\"name\":\"vuna\",\"version\":"; (v_jsonStr Base_dVersion.v_vunaVersion); ",\"rules\":["; (v_sarifRules dtb_u_u278); "]}},\"results\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_sarifResult) dtb_u_u278)); "]}]}"]))

# 541 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_diagDescLine = (fun (dtb_u_u279 : Base_dDiag.t_Diagnostic) -> "")

# 573 "Vuna/Compiler/Base/Diag/Format.vuna"
let[@tail_mod_cons] rec v_callFieldsOf = (fun (dtb_u_u280 : Base_dDiag.t_DiagField B_dData_dList.t_List) -> (match dtb_u_u280 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u281, dtb_u_u282) -> (match dtb_u_u281 with
  | Base_dDiag.C_DiagField_FieldCall (dtb_u_u283) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u281, (v_callFieldsOf dtb_u_u282)))
  | _ -> (v_callFieldsOf dtb_u_u282)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_traceLines = (fun (dtb_u_u284 : int) (dtb_u_u285 : Base_dDiag.t_TraceFrame B_dData_dList.t_List) -> (match dtb_u_u285 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u286, dtb_u_u287) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["  = trace["; (v_phaseName (dtb_u_u286).Base_dDiag.f_TraceFrame_tracePhase); "]: "; (dtb_u_u286).Base_dDiag.f_TraceFrame_traceText]), B_dData_dList.C_List_Nil))) ((v_traceLines dtb_u_u284) dtb_u_u287))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_indent = (fun (dtb_u_u288 : int) -> (if (dtb_u_u288 <= 0) then "" else ("  " ^ (v_indent (dtb_u_u288 - 1)))))

# 588 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_suggestionLine = (fun (dtb_u_u289 : Base_dDiag.t_Suggestion) -> (String.concat "" ["  = help: "; (dtb_u_u289).Base_dDiag.f_Suggestion_suggestionTitle; " ("; (v_applicabilityName (dtb_u_u289).Base_dDiag.f_Suggestion_suggestionApplicability); ")"]))

# 591 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_showInt = (fun (dtb_u_u290 : int) -> (string_of_int dtb_u_u290))

# 594 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_candidateTextOf = (fun (dtb_u_u291 : Base_dDiag.t_Candidate) -> (dtb_u_u291).Base_dDiag.f_Candidate_candidateText)

# 598 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callSpanSuffix = (fun (dtb_u_u292 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match dtb_u_u292 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u293) -> (String.concat "" [" at "; (dtb_u_u293).Base_dSource.f_Span_spanFile; ":"; (string_of_int (dtb_u_u293).Base_dSource.f_Span_spanStartLine)])
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_fieldLine = (fun (dtb_u_u294 : Base_dDiag.t_DiagField) -> (match dtb_u_u294 with
  | Base_dDiag.C_DiagField_FieldNote (dtb_u_u295) -> ("  = note: " ^ dtb_u_u295)
  | Base_dDiag.C_DiagField_FieldSpan (dtb_u_u296, dtb_u_u297) -> (String.concat "" ["  = span: "; dtb_u_u296; " at "; (Base_dSource.v_showSpanLoc dtb_u_u297)])
  | Base_dDiag.C_DiagField_FieldModule (dtb_u_u298) -> ("  = module: " ^ dtb_u_u298)
  | Base_dDiag.C_DiagField_FieldEffect (dtb_u_u299) -> ("  = effect: " ^ dtb_u_u299)
  | Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u300, dtb_u_u301, dtb_u_u302) -> (String.concat "" ["  = quantity: "; dtb_u_u300; " (declared "; (v_showInt dtb_u_u301); ", observed "; (v_showInt dtb_u_u302); ")"])
  | Base_dDiag.C_DiagField_FieldCall (dtb_u_u303) -> (String.concat "" ["  = call: "; (dtb_u_u303).Base_dDiag.f_CallInfo_callCallee; " <- "; (dtb_u_u303).Base_dDiag.f_CallInfo_callArg; " ("; (dtb_u_u303).Base_dDiag.f_CallInfo_callRelation; ")"; (v_callSpanSuffix (dtb_u_u303).Base_dDiag.f_CallInfo_callSpan)])
  | Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u304) -> ("  = candidates: " ^ ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map v_candidateTextOf) ((B_dData_dList.v_take 8) dtb_u_u304))))
  | Base_dDiag.C_DiagField_FieldName (dtb_u_u305) -> ("  = name: " ^ dtb_u_u305)
  | Base_dDiag.C_DiagField_FieldFound (dtb_u_u306) -> ("  = found: " ^ dtb_u_u306)
  | Base_dDiag.C_DiagField_FieldExpected (dtb_u_u307) -> ("  = expected: " ^ dtb_u_u307)
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderHuman = (fun (dtb_u_u308 : string) (dtb_u_u311 : string) (dtb_u_u312 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u313 = (v_primarySpan (dtb_u_u312).Base_dDiag.f_Diagnostic_diagLabels) in (let dtb_u_u314 = (v_primaryText (dtb_u_u312).Base_dDiag.f_Diagnostic_diagLabels) in (Obj.repr ((fun (dtb_u_u319 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u320 = Obj.obj ((match dtb_u_u313 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u322) -> ((v_renderSnippet dtb_u_u308) dtb_u_u322)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u324 = "" in (Obj.repr ((fun (dtb_u_u325 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u324))))
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u326 = (dtb_u_u320 dtb_u_u319) in (let dtb_u_u334 = ((((v_renderRelated_u_udirect dtb_u_u308) dtb_u_u313) (dtb_u_u312).Base_dDiag.f_Diagnostic_diagLabels) dtb_u_u319) in (let dtb_u_u335 = (if (dtb_u_u314 = "") then "" else ("  = note: " ^ dtb_u_u314)) in (let dtb_u_u336 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map (fun (dtb_u_u346 : string) -> ("  = note: " ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u346)))) (dtb_u_u312).Base_dDiag.f_Diagnostic_diagNotes)) in (let dtb_u_u337 = (v_diagDescLine dtb_u_u312) in (let dtb_u_u338 = (if (((v_localizedMessage dtb_u_u311) dtb_u_u312) = (dtb_u_u312).Base_dDiag.f_Diagnostic_diagMessage) then "" else ("  = message: " ^ (dtb_u_u312).Base_dDiag.f_Diagnostic_diagMessage)) in (let dtb_u_u339 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_fieldLine) (dtb_u_u312).Base_dDiag.f_Diagnostic_diagFields)) in (let dtb_u_u340 = ((B_dData_dString.v_join "\n") ((v_traceLines 0) (dtb_u_u312).Base_dDiag.f_Diagnostic_diagTrace)) in (let dtb_u_u341 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_suggestionLine) (dtb_u_u312).Base_dDiag.f_Diagnostic_diagSuggestions)) in (let dtb_u_u342 = ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (((v_headerOf dtb_u_u311) dtb_u_u312), (B_dData_dList.C_List__x58__x58_ (dtb_u_u326, (B_dData_dList.C_List__x58__x58_ (dtb_u_u334, (B_dData_dList.C_List__x58__x58_ (dtb_u_u335, (B_dData_dList.C_List__x58__x58_ (dtb_u_u338, (B_dData_dList.C_List__x58__x58_ (dtb_u_u336, (B_dData_dList.C_List__x58__x58_ (dtb_u_u339, (B_dData_dList.C_List__x58__x58_ (dtb_u_u340, (B_dData_dList.C_List__x58__x58_ (dtb_u_u341, (B_dData_dList.C_List__x58__x58_ (dtb_u_u337, B_dData_dList.C_List_Nil))))))))))))))))))))) in (let dtb_u_u344 = (B_dData_dString.v_trim dtb_u_u342) in dtb_u_u344))))))))))))))))))

# 277 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderHuman_u_udirect = (fun (nFs : string) (lang : string) (d : Base_dDiag.t_Diagnostic) _u_ueffTok -> (let dtb_u_u313 = (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) in (let dtb_u_u314 = (v_primaryText (d).Base_dDiag.f_Diagnostic_diagLabels) in (let dtb_u_u320 = Obj.obj ((match dtb_u_u313 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u322) -> ((v_renderSnippet nFs) dtb_u_u322)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u324 = "" in (Obj.repr ((fun (dtb_u_u325 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u324))))
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u326 = (dtb_u_u320 _u_ueffTok) in (let dtb_u_u334 = ((((v_renderRelated_u_udirect nFs) dtb_u_u313) (d).Base_dDiag.f_Diagnostic_diagLabels) _u_ueffTok) in (let dtb_u_u335 = (if (dtb_u_u314 = "") then "" else ("  = note: " ^ dtb_u_u314)) in (let dtb_u_u336 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map (fun (dtb_u_u346 : string) -> ("  = note: " ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u346)))) (d).Base_dDiag.f_Diagnostic_diagNotes)) in (let dtb_u_u337 = (v_diagDescLine d) in (let dtb_u_u338 = (if (((v_localizedMessage lang) d) = (d).Base_dDiag.f_Diagnostic_diagMessage) then "" else ("  = message: " ^ (d).Base_dDiag.f_Diagnostic_diagMessage)) in (let dtb_u_u339 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_fieldLine) (d).Base_dDiag.f_Diagnostic_diagFields)) in (let dtb_u_u340 = ((B_dData_dString.v_join "\n") ((v_traceLines 0) (d).Base_dDiag.f_Diagnostic_diagTrace)) in (let dtb_u_u341 = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_suggestionLine) (d).Base_dDiag.f_Diagnostic_diagSuggestions)) in (let dtb_u_u342 = ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (((v_headerOf lang) d), (B_dData_dList.C_List__x58__x58_ (dtb_u_u326, (B_dData_dList.C_List__x58__x58_ (dtb_u_u334, (B_dData_dList.C_List__x58__x58_ (dtb_u_u335, (B_dData_dList.C_List__x58__x58_ (dtb_u_u338, (B_dData_dList.C_List__x58__x58_ (dtb_u_u336, (B_dData_dList.C_List__x58__x58_ (dtb_u_u339, (B_dData_dList.C_List__x58__x58_ (dtb_u_u340, (B_dData_dList.C_List__x58__x58_ (dtb_u_u341, (B_dData_dList.C_List__x58__x58_ (dtb_u_u337, B_dData_dList.C_List_Nil))))))))))))))))))))) in (let dtb_u_u344 = (B_dData_dString.v_trim dtb_u_u342) in dtb_u_u344)))))))))))))))

# 563 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callFieldBlock = (fun (dtb_u_u347 : Base_dDiag.t_DiagField B_dData_dList.t_List) -> ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_fieldLine) (v_callFieldsOf dtb_u_u347))))

# 567 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callFieldSuffix = (fun (dtb_u_u348 : Base_dDiag.t_DiagField B_dData_dList.t_List) -> (match (v_callFieldsOf dtb_u_u348) with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> ("\n" ^ (v_callFieldBlock dtb_u_u348))
))

# 602 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_localizedJsonField = (fun (dtb_u_u349 : string) (dtb_u_u350 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u351 = ((v_localizedMessage dtb_u_u349) dtb_u_u350) in (if (dtb_u_u351 = (dtb_u_u350).Base_dDiag.f_Diagnostic_diagMessage) then "" else (",\"localizedMessage\":" ^ (v_jsonStr dtb_u_u351)))))

# 418 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonDiag = (fun (dtb_u_u352 : string) (dtb_u_u353 : Base_dDiag.t_Diagnostic) -> ((B_dData_dString.v_join "") (B_dData_dList.C_List__x58__x58_ (("{\"code\":" ^ (v_jsonStr (dtb_u_u353).Base_dDiag.f_Diagnostic_diagCode)), (B_dData_dList.C_List__x58__x58_ ((",\"severity\":" ^ (v_jsonStr (v_severityName (dtb_u_u353).Base_dDiag.f_Diagnostic_diagSeverity))), (B_dData_dList.C_List__x58__x58_ ((",\"phase\":" ^ (v_jsonStr (v_phaseName (dtb_u_u353).Base_dDiag.f_Diagnostic_diagPhase))), (B_dData_dList.C_List__x58__x58_ ((",\"category\":" ^ (v_jsonStr (v_categoryName (dtb_u_u353).Base_dDiag.f_Diagnostic_diagCategory))), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"message\":"; (v_jsonStr (dtb_u_u353).Base_dDiag.f_Diagnostic_diagMessage); ((v_localizedJsonField dtb_u_u352) dtb_u_u353)]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"labels\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonLabel) (dtb_u_u353).Base_dDiag.f_Diagnostic_diagLabels)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"fields\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonField) (dtb_u_u353).Base_dDiag.f_Diagnostic_diagFields)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"trace\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonTrace) (dtb_u_u353).Base_dDiag.f_Diagnostic_diagTrace)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"notes\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonStr) (dtb_u_u353).Base_dDiag.f_Diagnostic_diagNotes)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"suggestions\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonSuggestion) (dtb_u_u353).Base_dDiag.f_Diagnostic_diagSuggestions)); "]"]), (B_dData_dList.C_List__x58__x58_ ((",\"origin\":" ^ (v_originJson (dtb_u_u353).Base_dDiag.f_Diagnostic_diagOrigin)), (B_dData_dList.C_List__x58__x58_ ((",\"internal\":" ^ (if (dtb_u_u353).Base_dDiag.f_Diagnostic_diagInternal then "true" else "false")), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"ice\":"; (v_maybeJsonIce (dtb_u_u353).Base_dDiag.f_Diagnostic_diagIce); (v_jsonAbsent (dtb_u_u353).Base_dDiag.f_Diagnostic_diagAbsent); "}"]), B_dData_dList.C_List_Nil))))))))))))))))))))))))))))

# 424 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJson = (fun (dtb_u_u354 : string) (dtb_u_u355 : Base_dDiag.t_Diagnostic) -> ((v_jsonDiag dtb_u_u354) dtb_u_u355))

# 427 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJsonList = (fun (dtb_u_u356 : string) (dtb_u_u357 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"diagnostics\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonDiag dtb_u_u356)) dtb_u_u357)); "]}"]))

# 443 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJsonListWithSources = (fun (dtb_u_u358 : string) (dtb_u_u359 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u360 : t_SourceRef B_dData_dList.t_List) -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"sources\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonSource) dtb_u_u360)); "],\"diagnostics\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonDiag dtb_u_u358)) dtb_u_u359)); "]}"]))

# 432 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcFile = (fun (dtb_u_u361 : t_SourceRef) -> (match dtb_u_u361 with
  | { f_SourceRef_srcFile = dtb_u_u362; f_SourceRef_srcDigest = dtb_u_u363; f_SourceRef_srcPackage = dtb_u_u364; f_SourceRef_srcModule = dtb_u_u365; f_SourceRef_srcRelPath = dtb_u_u366 } -> dtb_u_u362
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcDigest = (fun (dtb_u_u367 : t_SourceRef) -> (match dtb_u_u367 with
  | { f_SourceRef_srcFile = dtb_u_u368; f_SourceRef_srcDigest = dtb_u_u369; f_SourceRef_srcPackage = dtb_u_u370; f_SourceRef_srcModule = dtb_u_u371; f_SourceRef_srcRelPath = dtb_u_u372 } -> dtb_u_u369
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcPackage = (fun (dtb_u_u373 : t_SourceRef) -> (match dtb_u_u373 with
  | { f_SourceRef_srcFile = dtb_u_u374; f_SourceRef_srcDigest = dtb_u_u375; f_SourceRef_srcPackage = dtb_u_u376; f_SourceRef_srcModule = dtb_u_u377; f_SourceRef_srcRelPath = dtb_u_u378 } -> dtb_u_u376
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcModule = (fun (dtb_u_u379 : t_SourceRef) -> (match dtb_u_u379 with
  | { f_SourceRef_srcFile = dtb_u_u380; f_SourceRef_srcDigest = dtb_u_u381; f_SourceRef_srcPackage = dtb_u_u382; f_SourceRef_srcModule = dtb_u_u383; f_SourceRef_srcRelPath = dtb_u_u384 } -> dtb_u_u383
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcRelPath = (fun (dtb_u_u385 : t_SourceRef) -> (match dtb_u_u385 with
  | { f_SourceRef_srcFile = dtb_u_u386; f_SourceRef_srcDigest = dtb_u_u387; f_SourceRef_srcPackage = dtb_u_u388; f_SourceRef_srcModule = dtb_u_u389; f_SourceRef_srcRelPath = dtb_u_u390 } -> dtb_u_u390
  | _ -> failwith "DT: impossible branch"
))
