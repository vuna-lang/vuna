open Vuna_runtime
type t_SourceRef = { f_SourceRef_srcFile : string; f_SourceRef_srcDigest : string; f_SourceRef_srcPackage : string; f_SourceRef_srcModule : string; f_SourceRef_srcRelPath : string }

# 28 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_severityName = (fun (mc0 : Base_dDiag.t_Severity) -> (match mc0 with
  | Base_dDiag.C_Severity_SevHelp -> "help"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_phaseName = (fun (mc0 : Base_dDiag.t_Phase) -> (match mc0 with
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
let v_categoryName = (fun (mc0 : Base_dDiag.t_Category) -> (match mc0 with
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
let v_originName = (fun (mc0 : Base_dDiag.t_Origin) -> (match mc0 with
  | Base_dDiag.C_Origin_OriginCascade (dtb__0) -> "cascade"
  | Base_dDiag.C_Origin_OriginDirect -> "direct"
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_applicabilityName = (fun (mc0 : Base_dDiag.t_Applicability) -> (match mc0 with
  | Base_dDiag.C_Applicability_HasPlaceholder -> "has-placeholder"
  | Base_dDiag.C_Applicability_MaybeIncorrect -> "maybe-incorrect"
  | Base_dDiag.C_Applicability_MachineApplicable -> "machine-applicable"
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderShort = Base_dDiag.v_diagText

# 85 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_primarySpan = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (match dtb__1 with
  | { Base_dDiag.f_Label_labelSpan = dtb__3; Base_dDiag.f_Label_labelText = dtb__4; Base_dDiag.f_Label_labelStyle = dtb__5; Base_dDiag.f_Label_labelProvenance = dtb__6 } -> (match dtb__5 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> dtb__3
  | _ -> (v_primarySpan dtb__2)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_primaryText = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { Base_dDiag.f_Label_labelSpan = dtb__9; Base_dDiag.f_Label_labelText = dtb__10; Base_dDiag.f_Label_labelStyle = dtb__11; Base_dDiag.f_Label_labelProvenance = dtb__12 } -> (match dtb__11 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> dtb__10
  | _ -> (v_primaryText dtb__8)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_lineAt = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (mc1 <= 1) then dtb__13 else ((v_lineAt dtb__14) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_tabToSpace = (fun (mc0 : int) -> (if (mc0 = 9) then 32 else mc0))

# 102 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_displayLine = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_tabToSpace) (B_dData_dList.dtp_unpack s))))

# 109 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_repeatSpace = (fun (n : int) -> (if (n <= 0) then "" else (" " ^ (v_repeatSpace (n - 1)))))

# 112 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_padLeft = (fun (n : int) (s : string) -> (if ((String.length s) >= n) then s else ((v_repeatSpace (n - (String.length s))) ^ s)))

# 117 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isUtf8Cont = (fun (c : int) -> (if (c >= 128) then (c < 192) else false))

# 121 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_displayColGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (if (mc1 <= 0) then mc2 else (((v_displayColGo dtb__16) (mc1 - 1)) (if (v_isUtf8Cont dtb__15) then mc2 else (mc2 + 1))))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_displayColOf = (fun (line : string) (byteCol : int) -> ((((v_displayColGo (B_dData_dList.dtp_unpack line)) (if (byteCol <= 1) then 0 else (byteCol - 1))) 0) + 1))

# 132 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_caretWidthIn = (fun (line : string) (sp : Base_dSource.t_Span) -> (if ((Base_dSource.v_spanEndLine sp) <> (Base_dSource.v_spanStartLine sp)) then 1 else (let w = (((v_displayColOf line) (if ((Base_dSource.v_spanEndCol sp) <= 0) then 1 else (Base_dSource.v_spanEndCol sp))) - ((v_displayColOf line) (if ((Base_dSource.v_spanStartCol sp) <= 0) then 1 else (Base_dSource.v_spanStartCol sp)))) in (if (w > 0) then w else 1))))

# 142 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_snippetOf = (fun (sp : Base_dSource.t_Span) (text : string) -> (let lines = (B_dData_dString.v_lines text) in (let src = ((v_lineAt lines) (Base_dSource.v_spanStartLine sp)) in (let display = (v_displayLine src) in (let lineNumber = (string_of_int (Base_dSource.v_spanStartLine sp)) in (let width = (String.length lineNumber) in (let start = (if ((Base_dSource.v_spanStartCol sp) <= 0) then 0 else (((v_displayColOf src) (Base_dSource.v_spanStartCol sp)) - 1)) in (let carets = ((v_caretWidthIn src) sp) in (let gutter = ((v_repeatSpace (width + 1)) ^ "|") in (let numberRow = (String.concat "" [((v_padLeft width) lineNumber); " | "; display]) in (let caretRow = (String.concat "" [(v_repeatSpace (width + 1)); "|"; (v_repeatSpace (start + 1)); ((B_dData_dString.v_repeat (bi_natFromInt carets)) "^")]) in ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("  --> " ^ (Base_dSource.v_showSpanLoc sp)), (B_dData_dList.C_List__x58__x58_ (gutter, (B_dData_dList.C_List__x58__x58_ (numberRow, (B_dData_dList.C_List__x58__x58_ (caretRow, B_dData_dList.C_List_Nil))))))))))))))))))))

# 159 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderSnippet = (fun (nFs : string) (sp : Base_dSource.t_Span) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__17 = Obj.obj (e) in (let dtb__18 = Obj.obj ((k (dtb__17 u))) in (dtb__18 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (Base_dSource.v_spanFile sp))) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__19 = Obj.obj (e) in (let dtb__20 = Obj.obj ((k (dtb__19 u))) in (dtb__20 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) (Base_dSource.v_spanFile sp))) (fun isDir -> (if isDir then (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) (Base_dSource.v_spanFile sp))) (fun text -> (let x = ((v_snippetOf sp) text) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 177 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderShortSnippetEff = (fun (nFs : string) (d : Base_dDiag.t_Diagnostic) -> (match (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__24 = Obj.obj (e) in (let dtb__25 = Obj.obj ((k (dtb__24 u))) in (dtb__25 u)))))) ((v_renderSnippet nFs) dtb__23)) (fun block -> (let x = (if (block = "") then "" else ("\n" ^ block)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sameSpan = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> (if (if (if (if ((a).Base_dSource.f_Span_spanFile = (b).Base_dSource.f_Span_spanFile) then ((a).Base_dSource.f_Span_spanStartLine = (b).Base_dSource.f_Span_spanStartLine) else false) then ((a).Base_dSource.f_Span_spanStartCol = (b).Base_dSource.f_Span_spanStartCol) else false) then ((a).Base_dSource.f_Span_spanEndLine = (b).Base_dSource.f_Span_spanEndLine) else false) then ((a).Base_dSource.f_Span_spanEndCol = (b).Base_dSource.f_Span_spanEndCol) else false))

# 196 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sameAsPrimary = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> ((v_sameSpan dtb__26) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isPrimaryStyle = (fun (mc0 : Base_dDiag.t_LabelStyle) -> (match mc0 with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> true
  | _ -> false
))

# 204 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isContextStyle = (fun (mc0 : Base_dDiag.t_LabelStyle) -> (match mc0 with
  | Base_dDiag.C_LabelStyle_LabelContext -> true
  | _ -> false
))

# 208 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_relatedBlocks = (fun (nFs : string) (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dDiag.f_Label_labelSpan = dtb__29; Base_dDiag.f_Label_labelText = dtb__30; Base_dDiag.f_Label_labelStyle = dtb__31; Base_dDiag.f_Label_labelProvenance = dtb__32 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__33 = Obj.obj (e) in (let dtb__34 = Obj.obj ((k (dtb__33 u))) in (dtb__34 u)))))) (((v_relatedBlocks nFs) mc0) dtb__28)) (fun restBlocks -> (if (v_isPrimaryStyle dtb__31) then (let x = restBlocks in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (match dtb__29 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = restBlocks in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> (let note = (if (dtb__30 = "") then "" else (if (v_isContextStyle dtb__31) then ("  = " ^ dtb__30) else ("  = note: " ^ dtb__30))) in (if ((v_sameAsPrimary mc0) dtb__35) then (if (note = "") then (let x = restBlocks in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = (B_dData_dList.C_List__x58__x58_ (note, restBlocks)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__36 = Obj.obj (e) in (let dtb__37 = Obj.obj ((k (dtb__36 u))) in (dtb__37 u)))))) ((v_renderSnippet nFs) dtb__35)) (fun sn -> (let block = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (x : string) -> (x <> ""))) (B_dData_dList.C_List__x58__x58_ (sn, (B_dData_dList.C_List__x58__x58_ (note, B_dData_dList.C_List_Nil)))))) in (let x = (B_dData_dList.C_List__x58__x58_ (block, restBlocks)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderRelated = (fun (nFs : string) (primary : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (labels : Base_dDiag.t_Label B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__38 = Obj.obj (e) in (let dtb__39 = Obj.obj ((k (dtb__38 u))) in (dtb__39 u)))))) (((v_relatedBlocks nFs) primary) labels)) (fun blocks -> (let x = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_filter (fun (x : string) -> (x <> ""))) blocks)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 241 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_ghChar = (fun (mc0 : int) -> (if (mc0 = 37) then "%25" else (if (mc0 = 13) then "%0D" else (if (mc0 = 10) then "%0A" else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)))))))

# 238 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_githubEscape = (fun (s : string) -> ((B_dData_dString.v_join "") ((B_dData_dList.v_map v_ghChar) (B_dData_dList.dtp_unpack s))))

# 247 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderGithub = (fun (d : Base_dDiag.t_Diagnostic) -> (let msg = (v_githubEscape (d).Base_dDiag.f_Diagnostic_diagMessage) in (let code = (if ((d).Base_dDiag.f_Diagnostic_diagCode = "") then "" else (String.concat "" ["["; (d).Base_dDiag.f_Diagnostic_diagCode; "] "])) in (match (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (String.concat "" ["::error file="; (dtb__40).Base_dSource.f_Span_spanFile; ",line="; (string_of_int (dtb__40).Base_dSource.f_Span_spanStartLine); ",col="; (string_of_int (dtb__40).Base_dSource.f_Span_spanStartCol); ",endLine="; (string_of_int (dtb__40).Base_dSource.f_Span_spanEndLine); ",endColumn="; (string_of_int (dtb__40).Base_dSource.f_Span_spanEndCol); "::"; code; msg])
  | B_dData_dMaybe.C_Maybe_Nothing -> (String.concat "" ["::error::"; code; msg])
  | _ -> failwith "DT: impossible branch"
))))

# 258 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_localizedMessage = (fun (lang : string) (d : Base_dDiag.t_Diagnostic) -> (if (lang = "zh") then (match (Base_dDiagnostics.v_diagDescOf (d).Base_dDiag.f_Diagnostic_diagCode) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> dtb__41
  | B_dData_dMaybe.C_Maybe_Nothing -> (d).Base_dDiag.f_Diagnostic_diagMessage
  | _ -> failwith "DT: impossible branch"
) else (d).Base_dDiag.f_Diagnostic_diagMessage))

# 267 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_headerOf = (fun (lang : string) (d : Base_dDiag.t_Diagnostic) -> (let msg = ((v_localizedMessage lang) d) in (if ((d).Base_dDiag.f_Diagnostic_diagCode = "") then (String.concat "" [(v_severityName (d).Base_dDiag.f_Diagnostic_diagSeverity); ": "; msg]) else (String.concat "" [(v_severityName (d).Base_dDiag.f_Diagnostic_diagSeverity); "["; (d).Base_dDiag.f_Diagnostic_diagCode; "]: "; msg]))))

# 317 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_hexDigit = (fun (n : int) -> (if (n < 10) then (((B_dData_dString.v_substring (bi_natFromInt n)) 1) "0123456789abcdef") else (((B_dData_dString.v_substring (bi_natFromInt n)) 1) "0123456789abcdef")))

# 310 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_hex2 = (fun (n : int) -> (let hi = (if 16 = 0 then failwith "division by zero" else n / 16) in (let lo = (n - (hi * 16)) in ((v_hexDigit hi) ^ (v_hexDigit lo)))))

# 302 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonEscapeChar = (fun (mc0 : int) -> (if (mc0 = 34) then "\\\"" else (if (mc0 = 92) then "\\\\" else (if (mc0 = 10) then "\\n" else (if (mc0 = 13) then "\\r" else (if (mc0 = 9) then "\\t" else (if (mc0 < 32) then ("\\u00" ^ (v_hex2 mc0)) else (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))))))))))

# 324 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonEscape = (fun (s : string) -> ((B_dData_dString.v_join "") ((B_dData_dList.v_map v_jsonEscapeChar) (B_dData_dList.dtp_unpack s))))

# 327 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonStr = (fun (s : string) -> (String.concat "" ["\""; (v_jsonEscape s); "\""]))

# 330 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonPos = (fun (line : int) (col : int) -> (String.concat "" ["{\"line\":"; (string_of_int line); ",\"column\":"; (string_of_int col); "}"]))

# 333 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSpan = (fun (sp : Base_dSource.t_Span) -> (String.concat "" ["{\"file\":"; (v_jsonStr (sp).Base_dSource.f_Span_spanFile); ",\"start\":"; ((v_jsonPos (sp).Base_dSource.f_Span_spanStartLine) (sp).Base_dSource.f_Span_spanStartCol); ",\"end\":"; ((v_jsonPos (sp).Base_dSource.f_Span_spanEndLine) (sp).Base_dSource.f_Span_spanEndCol); "}"]))

# 341 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_styleName = (fun (mc0 : Base_dDiag.t_LabelStyle) -> (match mc0 with
  | Base_dDiag.C_LabelStyle_LabelContext -> "context"
  | Base_dDiag.C_LabelStyle_LabelSecondary -> "secondary"
  | Base_dDiag.C_LabelStyle_LabelPrimary -> "primary"
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonSpan = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (v_jsonSpan dtb__42)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonLabel = (fun (mc0 : Base_dDiag.t_Label) -> (match mc0 with
  | { Base_dDiag.f_Label_labelSpan = dtb__43; Base_dDiag.f_Label_labelText = dtb__44; Base_dDiag.f_Label_labelStyle = dtb__45; Base_dDiag.f_Label_labelProvenance = dtb__46 } -> (String.concat "" ["{\"span\":"; (v_maybeJsonSpan dtb__43); ",\"style\":"; (v_jsonStr (v_styleName dtb__45)); ",\"text\":"; (v_jsonStr dtb__44); ",\"provenance\":"; (v_maybeJsonSpan dtb__46); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonString = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__47) -> (v_jsonStr dtb__47)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonCandidate = (fun (c : Base_dDiag.t_Candidate) -> (String.concat "" ["{\"text\":"; (v_jsonStr (c).Base_dDiag.f_Candidate_candidateText); ",\"span\":"; (v_maybeJsonSpan (c).Base_dDiag.f_Candidate_candidateSpan); ",\"reason\":"; (v_maybeJsonString (c).Base_dDiag.f_Candidate_candidateReason); "}"]))

# 358 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonField = (fun (mc0 : Base_dDiag.t_DiagField) -> (match mc0 with
  | Base_dDiag.C_DiagField_FieldNote (dtb__48) -> (String.concat "" ["{\"kind\":\"note\",\"value\":"; (v_jsonStr dtb__48); "}"])
  | Base_dDiag.C_DiagField_FieldSpan (dtb__49, dtb__50) -> (String.concat "" ["{\"kind\":\"span\",\"name\":"; (v_jsonStr dtb__49); ",\"value\":"; (v_jsonSpan dtb__50); "}"])
  | Base_dDiag.C_DiagField_FieldModule (dtb__51) -> (String.concat "" ["{\"kind\":\"module\",\"value\":"; (v_jsonStr dtb__51); "}"])
  | Base_dDiag.C_DiagField_FieldEffect (dtb__52) -> (String.concat "" ["{\"kind\":\"effect\",\"value\":"; (v_jsonStr dtb__52); "}"])
  | Base_dDiag.C_DiagField_FieldQuantity (dtb__53, dtb__54, dtb__55) -> (String.concat "" ["{\"kind\":\"quantity\",\"value\":{\"name\":"; (v_jsonStr dtb__53); ",\"declared\":"; (string_of_int dtb__54); ",\"observed\":"; (string_of_int dtb__55); "}}"])
  | Base_dDiag.C_DiagField_FieldCall (dtb__56) -> (String.concat "" ["{\"kind\":\"call\",\"value\":{\"callee\":"; (v_jsonStr (dtb__56).Base_dDiag.f_CallInfo_callCallee); ",\"arg\":"; (v_jsonStr (dtb__56).Base_dDiag.f_CallInfo_callArg); ",\"relation\":"; (v_jsonStr (dtb__56).Base_dDiag.f_CallInfo_callRelation); ",\"span\":"; (v_maybeJsonSpan (dtb__56).Base_dDiag.f_CallInfo_callSpan); "}}"])
  | Base_dDiag.C_DiagField_FieldCandidates (dtb__57) -> (String.concat "" ["{\"kind\":\"candidates\",\"value\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonCandidate) dtb__57)); "]}"])
  | Base_dDiag.C_DiagField_FieldName (dtb__58) -> (String.concat "" ["{\"kind\":\"name\",\"value\":"; (v_jsonStr dtb__58); "}"])
  | Base_dDiag.C_DiagField_FieldFound (dtb__59) -> (String.concat "" ["{\"kind\":\"found\",\"value\":"; (v_jsonStr dtb__59); "}"])
  | Base_dDiag.C_DiagField_FieldExpected (dtb__60) -> (String.concat "" ["{\"kind\":\"expected\",\"value\":"; (v_jsonStr dtb__60); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonDiagEdit = (fun (e : Base_dDiag.t_DiagEdit) -> (String.concat "" ["{\"span\":"; (v_jsonSpan (e).Base_dDiag.f_DiagEdit_editSpan); ",\"newText\":"; (v_jsonStr (e).Base_dDiag.f_DiagEdit_editNewText); "}"]))

# 377 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSuggestion = (fun (s : Base_dDiag.t_Suggestion) -> (String.concat "" ["{\"title\":"; (v_jsonStr (s).Base_dDiag.f_Suggestion_suggestionTitle); ",\"applicability\":"; (v_jsonStr (v_applicabilityName (s).Base_dDiag.f_Suggestion_suggestionApplicability)); ",\"edits\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonDiagEdit) (s).Base_dDiag.f_Suggestion_suggestionEdits)); "]}"]))

# 384 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_jsonTraceFuel = (fun (fuel : int) (t : Base_dDiag.t_TraceFrame) -> (if (fuel <= 0) then "{\"phase\":\"truncated\"}" else (String.concat "" ["{\"phase\":"; (v_jsonStr (v_phaseName (t).Base_dDiag.f_TraceFrame_tracePhase)); ",\"text\":"; (v_jsonStr (t).Base_dDiag.f_TraceFrame_traceText); ",\"span\":"; (v_maybeJsonSpan (t).Base_dDiag.f_TraceFrame_traceSpan); ",\"children\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonTraceFuel (fuel - 1))) (t).Base_dDiag.f_TraceFrame_traceChildren)); "]}"])))

# 381 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonTrace = (fun (t : Base_dDiag.t_TraceFrame) -> ((v_jsonTraceFuel 64) t))

# 391 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonIce = (fun (i : Base_dDiag.t_IceInfo) -> (String.concat "" ["{\"phase\":"; (v_jsonStr (v_phaseName (i).Base_dDiag.f_IceInfo_icePhase)); ",\"function\":"; (v_jsonStr (i).Base_dDiag.f_IceInfo_iceFunction); ",\"invariant\":"; (v_jsonStr (i).Base_dDiag.f_IceInfo_iceInvariant); ",\"fingerprint\":"; (v_jsonStr (i).Base_dDiag.f_IceInfo_iceFingerprint); ",\"hint\":"; (v_jsonStr (i).Base_dDiag.f_IceInfo_iceHint); "}"]))

# 395 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeJsonIce = (fun (mc0 : Base_dDiag.t_IceInfo B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (v_jsonIce dtb__61)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_maybeParent = (fun (mc0 : int B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (string_of_int dtb__62)
  | B_dData_dMaybe.C_Maybe_Nothing -> "null"
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_originJson = (fun (mc0 : Base_dDiag.t_Origin) -> (match mc0 with
  | Base_dDiag.C_Origin_OriginCascade (dtb__63) -> (String.concat "" ["{\"kind\":\"cascade\",\"parent\":"; (v_maybeParent dtb__63); "}"])
  | Base_dDiag.C_Origin_OriginDirect -> "{\"kind\":\"direct\"}"
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_absentName = (fun (mc0 : Base_dDiag.t_NoSourceReason) -> (match mc0 with
  | Base_dDiag.C_NoSourceReason_NsInternal -> "internal"
  | Base_dDiag.C_NoSourceReason_NsPackageGraph -> "package-graph"
  | Base_dDiag.C_NoSourceReason_NsToolUsage -> "tool-usage"
  | Base_dDiag.C_NoSourceReason_NsSynthetic -> "synthetic"
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonAbsent = (fun (mc0 : Base_dDiag.t_NoSourceReason B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (",\"absent\":" ^ (v_jsonStr (v_absentName dtb__64)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonSource = (fun (s : t_SourceRef) -> (String.concat "" ["{\"file\":"; (v_jsonStr (s).f_SourceRef_srcFile); ",\"package\":"; (v_jsonStr (s).f_SourceRef_srcPackage); ",\"module\":"; (v_jsonStr (s).f_SourceRef_srcModule); ",\"relPath\":"; (v_jsonStr (s).f_SourceRef_srcRelPath); ",\"digest\":"; (v_jsonStr (s).f_SourceRef_srcDigest); "}"]))

# 450 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLevel = (fun (mc0 : Base_dDiag.t_Severity) -> (match mc0 with
  | Base_dDiag.C_Severity_SevHelp -> "note"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevError -> "error"
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRuleId = (fun (d : Base_dDiag.t_Diagnostic) -> (if ((d).Base_dDiag.f_Diagnostic_diagCode = "") then "vuna" else (d).Base_dDiag.f_Diagnostic_diagCode))

# 459 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRegion = (fun (sp : Base_dSource.t_Span) -> (String.concat "" ["{\"startLine\":"; (string_of_int (Base_dSource.v_spanStartLine sp)); ",\"startColumn\":"; (string_of_int (Base_dSource.v_spanStartCol sp)); ",\"endLine\":"; (string_of_int (Base_dSource.v_spanEndLine sp)); ",\"endColumn\":"; (string_of_int (Base_dSource.v_spanEndCol sp)); "}"]))

# 463 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLocation = (fun (file : string) (sp : Base_dSource.t_Span) -> (String.concat "" ["{\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_jsonStr file); "},\"region\":"; (v_sarifRegion sp); "}}"]))

# 467 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRelated = (fun (file : string) (l : Base_dDiag.t_Label) -> (match (l).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> (String.concat "" ["{\"message\":{\"text\":"; (v_jsonStr (l).Base_dDiag.f_Label_labelText); "}}"])
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (String.concat "" ["{\"message\":{\"text\":"; (v_jsonStr (l).Base_dDiag.f_Label_labelText); "},\"physicalLocation\":{\"artifactLocation\":{\"uri\":"; (v_jsonStr (Base_dSource.v_spanFile dtb__65)); "},\"region\":"; (v_sarifRegion dtb__65); "}}"])
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_isPrimaryLabel = (fun (l : Base_dDiag.t_Label) -> (match (l).Base_dDiag.f_Label_labelStyle with
  | Base_dDiag.C_LabelStyle_LabelPrimary -> true
  | _ -> false
))

# 474 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifResult = (fun (d : Base_dDiag.t_Diagnostic) -> (let primary = (match (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (String.concat "" [",\"locations\":["; ((v_sarifLocation (Base_dSource.v_spanFile dtb__66)) dtb__66); "]"])
  | _ -> failwith "DT: impossible branch"
) in (let related = ((B_dData_dList.v_filter (fun (l : Base_dDiag.t_Label) -> (B_dData_dBool.v_not (v_isPrimaryLabel l)))) (d).Base_dDiag.f_Diagnostic_diagLabels) in (let relJson = (if ((B_dData_dList.v_length related) = 0) then "" else (String.concat "" [",\"relatedLocations\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_sarifRelated (Base_dDiag.v_diagFileOf d))) related)); "]"])) in (let notesText = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map (fun (n : string) -> ("note: " ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)))) (d).Base_dDiag.f_Diagnostic_diagNotes)) in (let msg = (if (notesText = "") then (d).Base_dDiag.f_Diagnostic_diagMessage else (String.concat "" [(d).Base_dDiag.f_Diagnostic_diagMessage; "\n"; notesText])) in (String.concat "" ["{\"ruleId\":"; (v_jsonStr (v_sarifRuleId d)); ",\"level\":"; (v_jsonStr (v_sarifLevel (d).Base_dDiag.f_Diagnostic_diagSeverity)); ",\"message\":{\"text\":"; (v_jsonStr msg); "}"; primary; relJson; ",\"properties\":{\"vuna.origin\":"; (v_jsonStr (v_originName (d).Base_dDiag.f_Diagnostic_diagOrigin)); "}}"])))))))

# 508 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_memCode = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if (mc0 = dtb__67) then true else ((v_memCode mc0) dtb__68))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_uniqueCodes = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (acc : string B_dData_dList.t_List) (d : Base_dDiag.t_Diagnostic) -> (if ((v_memCode (v_sarifRuleId d)) acc) then acc else ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ ((v_sarifRuleId d), B_dData_dList.C_List_Nil)))))) B_dData_dList.C_List_Nil) ds))

# 527 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifLevelName = (fun (mc0 : string) -> (if (mc0 = "error") then "error" else (if (mc0 = "warning") then "warning" else "note")))

# 512 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_ruleJson = (fun (code : string) -> (let desc = (match (Base_dDiagnostics.v_diagDescOf code) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> dtb__69
  | B_dData_dMaybe.C_Maybe_Nothing -> code
  | _ -> failwith "DT: impossible branch"
) in (let sev = (Base_dDiagnostics.v_diagSeverityOf (Base_dDiagnostics.v_codeDomain code)) in (let phase = (Base_dDiagnostics.v_diagPhaseOf (Base_dDiagnostics.v_codeDomain code)) in (let cat = (Base_dDiagnostics.v_diagCategoryOf (Base_dDiagnostics.v_codeDomain code)) in (String.concat "" ["{\"id\":"; (v_jsonStr code); ",\"shortDescription\":{\"text\":"; (v_jsonStr desc); "},\"help\":{\"text\":"; (v_jsonStr desc); "},\"defaultConfiguration\":{\"level\":"; (v_jsonStr (v_sarifLevelName sev)); "},\"properties\":{\"tags\":["; (v_jsonStr phase); ","; (v_jsonStr cat); "]}}"]))))))

# 498 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_sarifRules = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_ruleJson) (v_uniqueCodes ds))))

# 533 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderSarif = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (String.concat "" ["{\"$schema\":\"https://json.schemastore.org/sarif-2.1.0.json\",\"version\":\"2.1.0\",\"runs\":[{\"tool\":{\"driver\":{\"name\":\"vuna\",\"version\":"; (v_jsonStr Base_dVersion.v_vunaVersion); ",\"rules\":["; (v_sarifRules ds); "]}},\"results\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_sarifResult) ds)); "]}]}"]))

# 541 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_diagDescLine = (fun (d : Base_dDiag.t_Diagnostic) -> "")

# 573 "Vuna/Compiler/Base/Diag/Format.vuna"
let[@tail_mod_cons] rec v_callFieldsOf = (fun (mc0 : Base_dDiag.t_DiagField B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | Base_dDiag.C_DiagField_FieldCall (dtb__72) -> (B_dData_dList.C_List__x58__x58_ (dtb__70, (v_callFieldsOf dtb__71)))
  | _ -> (v_callFieldsOf dtb__71)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_traceLines = (fun (mc0 : int) (mc1 : Base_dDiag.t_TraceFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["  = trace["; (v_phaseName (dtb__73).Base_dDiag.f_TraceFrame_tracePhase); "]: "; (dtb__73).Base_dDiag.f_TraceFrame_traceText]), B_dData_dList.C_List_Nil))) ((v_traceLines mc0) dtb__74))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Base/Diag/Format.vuna"
let rec v_indent = (fun (n : int) -> (if (n <= 0) then "" else ("  " ^ (v_indent (n - 1)))))

# 588 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_suggestionLine = (fun (s : Base_dDiag.t_Suggestion) -> (String.concat "" ["  = help: "; (s).Base_dDiag.f_Suggestion_suggestionTitle; " ("; (v_applicabilityName (s).Base_dDiag.f_Suggestion_suggestionApplicability); ")"]))

# 591 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_showInt = (fun (n : int) -> (string_of_int n))

# 594 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_candidateTextOf = (fun (c : Base_dDiag.t_Candidate) -> (c).Base_dDiag.f_Candidate_candidateText)

# 598 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callSpanSuffix = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (String.concat "" [" at "; (dtb__75).Base_dSource.f_Span_spanFile; ":"; (string_of_int (dtb__75).Base_dSource.f_Span_spanStartLine)])
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_fieldLine = (fun (mc0 : Base_dDiag.t_DiagField) -> (match mc0 with
  | Base_dDiag.C_DiagField_FieldNote (dtb__76) -> ("  = note: " ^ dtb__76)
  | Base_dDiag.C_DiagField_FieldSpan (dtb__77, dtb__78) -> (String.concat "" ["  = span: "; dtb__77; " at "; (Base_dSource.v_showSpanLoc dtb__78)])
  | Base_dDiag.C_DiagField_FieldModule (dtb__79) -> ("  = module: " ^ dtb__79)
  | Base_dDiag.C_DiagField_FieldEffect (dtb__80) -> ("  = effect: " ^ dtb__80)
  | Base_dDiag.C_DiagField_FieldQuantity (dtb__81, dtb__82, dtb__83) -> (String.concat "" ["  = quantity: "; dtb__81; " (declared "; (v_showInt dtb__82); ", observed "; (v_showInt dtb__83); ")"])
  | Base_dDiag.C_DiagField_FieldCall (dtb__84) -> (String.concat "" ["  = call: "; (dtb__84).Base_dDiag.f_CallInfo_callCallee; " <- "; (dtb__84).Base_dDiag.f_CallInfo_callArg; " ("; (dtb__84).Base_dDiag.f_CallInfo_callRelation; ")"; (v_callSpanSuffix (dtb__84).Base_dDiag.f_CallInfo_callSpan)])
  | Base_dDiag.C_DiagField_FieldCandidates (dtb__85) -> ("  = candidates: " ^ ((B_dData_dString.v_join ", ") ((B_dData_dList.v_map v_candidateTextOf) ((B_dData_dList.v_take 8) dtb__85))))
  | Base_dDiag.C_DiagField_FieldName (dtb__86) -> ("  = name: " ^ dtb__86)
  | Base_dDiag.C_DiagField_FieldFound (dtb__87) -> ("  = found: " ^ dtb__87)
  | Base_dDiag.C_DiagField_FieldExpected (dtb__88) -> ("  = expected: " ^ dtb__88)
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderHuman = (fun (nFs : string) (lang : string) (d : Base_dDiag.t_Diagnostic) -> (let primary = (v_primarySpan (d).Base_dDiag.f_Diagnostic_diagLabels) in (let ptext = (v_primaryText (d).Base_dDiag.f_Diagnostic_diagLabels) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__89 = Obj.obj (e) in (let dtb__90 = Obj.obj ((k (dtb__89 u))) in (dtb__90 u)))))) (match primary with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> ((v_renderSnippet nFs) dtb__91)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)) (fun snippet -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__92 = Obj.obj (e) in (let dtb__93 = Obj.obj ((k (dtb__92 u))) in (dtb__93 u)))))) (((v_renderRelated nFs) primary) (d).Base_dDiag.f_Diagnostic_diagLabels)) (fun related -> (let labelNote = (if (ptext = "") then "" else ("  = note: " ^ ptext)) in (let notes = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map (fun (n : string) -> ("  = note: " ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)))) (d).Base_dDiag.f_Diagnostic_diagNotes)) in (let descLine = (v_diagDescLine d) in (let origLine = (if (((v_localizedMessage lang) d) = (d).Base_dDiag.f_Diagnostic_diagMessage) then "" else ("  = message: " ^ (d).Base_dDiag.f_Diagnostic_diagMessage)) in (let fieldBlock = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_fieldLine) (d).Base_dDiag.f_Diagnostic_diagFields)) in (let traceBlock = ((B_dData_dString.v_join "\n") ((v_traceLines 0) (d).Base_dDiag.f_Diagnostic_diagTrace)) in (let helpBlock = ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_suggestionLine) (d).Base_dDiag.f_Diagnostic_diagSuggestions)) in (let block = ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (((v_headerOf lang) d), (B_dData_dList.C_List__x58__x58_ (snippet, (B_dData_dList.C_List__x58__x58_ (related, (B_dData_dList.C_List__x58__x58_ (labelNote, (B_dData_dList.C_List__x58__x58_ (origLine, (B_dData_dList.C_List__x58__x58_ (notes, (B_dData_dList.C_List__x58__x58_ (fieldBlock, (B_dData_dList.C_List__x58__x58_ (traceBlock, (B_dData_dList.C_List__x58__x58_ (helpBlock, (B_dData_dList.C_List__x58__x58_ (descLine, B_dData_dList.C_List_Nil))))))))))))))))))))) in (let x = (B_dData_dString.v_trim block) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))))))))

# 563 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callFieldBlock = (fun (ds : Base_dDiag.t_DiagField B_dData_dList.t_List) -> ((B_dData_dString.v_join "\n") ((B_dData_dList.v_map v_fieldLine) (v_callFieldsOf ds))))

# 567 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_callFieldSuffix = (fun (ds : Base_dDiag.t_DiagField B_dData_dList.t_List) -> (match (v_callFieldsOf ds) with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> ("\n" ^ (v_callFieldBlock ds))
))

# 602 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_localizedJsonField = (fun (lang : string) (d : Base_dDiag.t_Diagnostic) -> (let lm = ((v_localizedMessage lang) d) in (if (lm = (d).Base_dDiag.f_Diagnostic_diagMessage) then "" else (",\"localizedMessage\":" ^ (v_jsonStr lm)))))

# 418 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_jsonDiag = (fun (lang : string) (d : Base_dDiag.t_Diagnostic) -> ((B_dData_dString.v_join "") (B_dData_dList.C_List__x58__x58_ (("{\"code\":" ^ (v_jsonStr (d).Base_dDiag.f_Diagnostic_diagCode)), (B_dData_dList.C_List__x58__x58_ ((",\"severity\":" ^ (v_jsonStr (v_severityName (d).Base_dDiag.f_Diagnostic_diagSeverity))), (B_dData_dList.C_List__x58__x58_ ((",\"phase\":" ^ (v_jsonStr (v_phaseName (d).Base_dDiag.f_Diagnostic_diagPhase))), (B_dData_dList.C_List__x58__x58_ ((",\"category\":" ^ (v_jsonStr (v_categoryName (d).Base_dDiag.f_Diagnostic_diagCategory))), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"message\":"; (v_jsonStr (d).Base_dDiag.f_Diagnostic_diagMessage); ((v_localizedJsonField lang) d)]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"labels\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonLabel) (d).Base_dDiag.f_Diagnostic_diagLabels)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"fields\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonField) (d).Base_dDiag.f_Diagnostic_diagFields)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"trace\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonTrace) (d).Base_dDiag.f_Diagnostic_diagTrace)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"notes\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonStr) (d).Base_dDiag.f_Diagnostic_diagNotes)); "]"]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"suggestions\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonSuggestion) (d).Base_dDiag.f_Diagnostic_diagSuggestions)); "]"]), (B_dData_dList.C_List__x58__x58_ ((",\"origin\":" ^ (v_originJson (d).Base_dDiag.f_Diagnostic_diagOrigin)), (B_dData_dList.C_List__x58__x58_ ((",\"internal\":" ^ (if (d).Base_dDiag.f_Diagnostic_diagInternal then "true" else "false")), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [",\"ice\":"; (v_maybeJsonIce (d).Base_dDiag.f_Diagnostic_diagIce); (v_jsonAbsent (d).Base_dDiag.f_Diagnostic_diagAbsent); "}"]), B_dData_dList.C_List_Nil))))))))))))))))))))))))))))

# 424 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJson = (fun (lang : string) (d : Base_dDiag.t_Diagnostic) -> ((v_jsonDiag lang) d))

# 427 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJsonList = (fun (lang : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"diagnostics\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonDiag lang)) ds)); "]}"]))

# 443 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_renderJsonListWithSources = (fun (lang : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (sources : t_SourceRef B_dData_dList.t_List) -> (String.concat "" ["{\"version\":1,\"tool\":\"vuna\",\"sources\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map v_jsonSource) sources)); "],\"diagnostics\":["; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (v_jsonDiag lang)) ds)); "]}"]))

# 432 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcFile = (fun (p : t_SourceRef) -> (match p with
  | { f_SourceRef_srcFile = dtb__94; f_SourceRef_srcDigest = dtb__95; f_SourceRef_srcPackage = dtb__96; f_SourceRef_srcModule = dtb__97; f_SourceRef_srcRelPath = dtb__98 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcDigest = (fun (p : t_SourceRef) -> (match p with
  | { f_SourceRef_srcFile = dtb__99; f_SourceRef_srcDigest = dtb__100; f_SourceRef_srcPackage = dtb__101; f_SourceRef_srcModule = dtb__102; f_SourceRef_srcRelPath = dtb__103 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcPackage = (fun (p : t_SourceRef) -> (match p with
  | { f_SourceRef_srcFile = dtb__104; f_SourceRef_srcDigest = dtb__105; f_SourceRef_srcPackage = dtb__106; f_SourceRef_srcModule = dtb__107; f_SourceRef_srcRelPath = dtb__108 } -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcModule = (fun (p : t_SourceRef) -> (match p with
  | { f_SourceRef_srcFile = dtb__109; f_SourceRef_srcDigest = dtb__110; f_SourceRef_srcPackage = dtb__111; f_SourceRef_srcModule = dtb__112; f_SourceRef_srcRelPath = dtb__113 } -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Base/Diag/Format.vuna"
let v_srcRelPath = (fun (p : t_SourceRef) -> (match p with
  | { f_SourceRef_srcFile = dtb__114; f_SourceRef_srcDigest = dtb__115; f_SourceRef_srcPackage = dtb__116; f_SourceRef_srcModule = dtb__117; f_SourceRef_srcRelPath = dtb__118 } -> dtb__118
  | _ -> failwith "DT: impossible branch"
))
