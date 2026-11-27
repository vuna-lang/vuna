open Vuna_runtime
type t_TriviaKind = C_TriviaKind_TrivSpace | C_TriviaKind_TrivLineComment | C_TriviaKind_TrivBlockComment
and t_Trivia = { f_Trivia_triviaKind : t_TriviaKind; f_Trivia_triviaText : string; f_Trivia_triviaSpan : Base_dSource.t_Span }
and t_CstToken = { f_CstToken_cstTag : string; f_CstToken_cstText : string; f_CstToken_cstSpan : Base_dSource.t_Span; f_CstToken_cstLeading : t_Trivia B_dData_dList.t_List }
and t_LineCur = { f_LineCur_lcOff : int; f_LineCur_lcLine : int; f_LineCur_lcCol : int; f_LineCur_lcOffset : int }
and t_TrivComment = { f_TrivComment_tcommKind : Frontend_dLexer.t_CKind; f_TrivComment_tcommSpan : Base_dSource.t_Span; f_TrivComment_tcommStart : int; f_TrivComment_tcommEnd : int }
and t_CstKind = C_CstKind_CstFileKind | C_CstKind_CstModHeadKind | C_CstKind_CstImportKind | C_CstKind_CstFixityKind | C_CstKind_CstExportItemKind | C_CstKind_CstDeclKind | C_CstKind_CstCtorKind | C_CstKind_CstFieldKind | C_CstKind_CstMethodKind | C_CstKind_CstBindingKind | C_CstKind_CstAltKind | C_CstKind_CstExprKind | C_CstKind_CstPatKind | C_CstKind_CstDoStmtKind | C_CstKind_CstMacroKind
and t_CstSurface = { f_CstSurface_cstParenDepth : int; f_CstSurface_cstBacktick : bool; f_CstSurface_cstSection : t_SectionShape B_dData_dMaybe.t_Maybe; f_CstSurface_cstInterpMulti : bool B_dData_dMaybe.t_Maybe; f_CstSurface_cstHoleTrees : t_CstNode B_dData_dList.t_List }
and t_CstNode = C_CstNode_CstLeaf of (t_CstToken) | C_CstNode_CstBranch of (t_CstKind) * (int) * (Base_dSource.t_Span) * (t_CstSurface) * (t_CstSem B_dData_dMaybe.t_Maybe) * (t_CstNode B_dData_dList.t_List)
and t_CstSem = C_CstSem_SemModHead of (Frontend_dAst.t_ModDecl) | C_CstSem_SemImport of (Frontend_dAst.t_Import) | C_CstSem_SemReexportImport of (Frontend_dAst.t_Import) * (Frontend_dAst.t_ExportItem B_dData_dList.t_List) | C_CstSem_SemExportNamespace of (Frontend_dAst.t_ExportItem) | C_CstSem_SemExportItem of (Frontend_dAst.t_ExportItem) | C_CstSem_SemFixity of (Frontend_dAst.t_FixityDecl) | C_CstSem_SemDecl of (Frontend_dAst.t_Decl) * (Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe) * (Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe) | C_CstSem_SemCtor of (Frontend_dAst.t_Ctor) | C_CstSem_SemField of (Frontend_dAst.t_Field) | C_CstSem_SemMethod of (Frontend_dAst.t_TraitMethod) | C_CstSem_SemBinding of (Frontend_dAst.t_Binding) | C_CstSem_SemBindingSig of (string) * (Frontend_dAst.t_Expr) * (Frontend_dAst.t_NodeRef) | C_CstSem_SemAlt of (Frontend_dAst.t_Alt) | C_CstSem_SemExpr of (Frontend_dAst.t_Expr) | C_CstSem_SemPat of (Frontend_dAst.t_Pat) | C_CstSem_SemDoStmt of (Frontend_dAst.t_DoStmt) | C_CstSem_SemMacro of (string) * (int)
and t_NodeEvent = C_NodeEvent_EvOpen of (t_CstKind) * (int) * (int) | C_NodeEvent_EvSem of (int) * (t_CstSem) | C_NodeEvent_EvClose of (int)
and t_NestFrame = { f_NestFrame_nfKind : t_CstKind; f_NestFrame_nfId : int; f_NestFrame_nfStart : Base_dSource.t_Span; f_NestFrame_nfKids : t_CstNode B_dData_dList.t_List; f_NestFrame_nfSem : t_CstSem B_dData_dMaybe.t_Maybe }
and t_FixityFacts = { f_FixityFacts_ffParens : (int, int) B_dContainer_dHashMap.t_HashMap; f_FixityFacts_ffBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FixityFacts_ffSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_FactEntries = { f_FactEntries_feParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FactEntries_feBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FactEntries_feSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_CstIndex = { f_CstIndex_ciById : (int, t_CstNode) B_dContainer_dHashMap.t_HashMap; f_CstIndex_ciBySpan : (int, t_CstNode) B_dContainer_dHashMap.t_HashMap }
and t_IndexAcc = { f_IndexAcc_iaById : (int, t_CstNode) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IndexAcc_iaBySpan : (int, t_CstNode) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_SectionShape = C_SectionShape_SectionOp of (string) | C_SectionShape_SectionLeft of (string) | C_SectionShape_SectionRight of (string)
and t_ParenFrame = { f_ParenFrame_pfKind : t_CstKind; f_ParenFrame_pfId : int; f_ParenFrame_pfOpen : int; f_ParenFrame_pfFirst : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe; f_ParenFrame_pfPrev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe; f_ParenFrame_pfKids : int; f_ParenFrame_pfKidKind : t_CstKind B_dData_dMaybe.t_Maybe; f_ParenFrame_pfKidOpen : int; f_ParenFrame_pfKidEnd : int; f_ParenFrame_pfKidStructDepth : int }

# 92 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurStart = { f_LineCur_lcOff = 0; f_LineCur_lcLine = 1; f_LineCur_lcCol = 1; f_LineCur_lcOffset = 0 }

# 95 "Vuna/Compiler/Frontend/Cst.vuna"
let v_curPos = (fun (dtb_u_u1 : t_LineCur) -> { Base_dSource.f_Pos_posLine = (dtb_u_u1).f_LineCur_lcLine; Base_dSource.f_Pos_posCol = (dtb_u_u1).f_LineCur_lcCol; Base_dSource.f_Pos_posOffset = (dtb_u_u1).f_LineCur_lcOffset; Base_dSource.f_Pos_posEndOffset = (dtb_u_u1).f_LineCur_lcOffset })

# 99 "Vuna/Compiler/Frontend/Cst.vuna"
let v_stepCur = (fun (dtb_u_u2 : string) (dtb_u_u3 : t_LineCur) -> (if ((let b = dtb_u_u2 in let k = (dtb_u_u3).f_LineCur_lcOff in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 10) then { f_LineCur_lcOff = ((dtb_u_u3).f_LineCur_lcOff + 1); f_LineCur_lcLine = ((dtb_u_u3).f_LineCur_lcLine + 1); f_LineCur_lcCol = 1; f_LineCur_lcOffset = ((dtb_u_u3).f_LineCur_lcOffset + 1) } else { f_LineCur_lcOff = ((dtb_u_u3).f_LineCur_lcOff + 1); f_LineCur_lcLine = (dtb_u_u3).f_LineCur_lcLine; f_LineCur_lcCol = ((dtb_u_u3).f_LineCur_lcCol + 1); f_LineCur_lcOffset = ((dtb_u_u3).f_LineCur_lcOffset + 1) }))

# 108 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceTo = (fun (dtb_u_u4 : int) (dtb_u_u5 : string) (dtb_u_u6 : t_LineCur) (dtb_u_u7 : Base_dSource.t_Pos) -> (if (dtb_u_u4 <= 0) then dtb_u_u6 else (if (if ((dtb_u_u6).f_LineCur_lcLine > (Base_dSource.v_posLine dtb_u_u7)) then true else (if ((dtb_u_u6).f_LineCur_lcLine = (Base_dSource.v_posLine dtb_u_u7)) then ((dtb_u_u6).f_LineCur_lcCol >= (Base_dSource.v_posCol dtb_u_u7)) else false)) then dtb_u_u6 else (if ((dtb_u_u6).f_LineCur_lcOff >= (String.length dtb_u_u5)) then dtb_u_u6 else ((((v_advanceTo (dtb_u_u4 - 1)) dtb_u_u5) ((v_stepCur dtb_u_u5) dtb_u_u6)) dtb_u_u7)))))

# 117 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceBy = (fun (dtb_u_u8 : int) (dtb_u_u9 : string) (dtb_u_u10 : t_LineCur) (dtb_u_u11 : int) -> (if (dtb_u_u8 <= 0) then dtb_u_u10 else (if (dtb_u_u11 <= 0) then dtb_u_u10 else (if ((dtb_u_u10).f_LineCur_lcOff >= (String.length dtb_u_u9)) then dtb_u_u10 else ((((v_advanceBy (dtb_u_u8 - 1)) dtb_u_u9) ((v_stepCur dtb_u_u9) dtb_u_u10)) (dtb_u_u11 - 1))))))

# 126 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sliceText = (fun (dtb_u_u12 : string) (dtb_u_u13 : int) (dtb_u_u14 : int) -> (if (dtb_u_u14 <= dtb_u_u13) then "" else (((dtp_substring dtb_u_u13) (dtb_u_u14 - dtb_u_u13)) dtb_u_u12)))

# 133 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanDigitsEnd = (fun (dtb_u_u15 : int) (dtb_u_u16 : string) (dtb_u_u17 : int) -> (if (dtb_u_u15 <= 0) then dtb_u_u17 else (if (Frontend_dLexer.v_isDigit (let b = dtb_u_u16 in let k = dtb_u_u17 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((v_scanDigitsEnd (dtb_u_u15 - 1)) dtb_u_u16) (dtb_u_u17 + 1)) else dtb_u_u17)))

# 139 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanStringEnd = (fun (dtb_u_u18 : int) (dtb_u_u19 : string) (dtb_u_u20 : int) -> (if (dtb_u_u18 <= 0) then dtb_u_u20 else (if ((let b = dtb_u_u19 in let k = dtb_u_u20 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 92) then (((v_scanStringEnd (dtb_u_u18 - 2)) dtb_u_u19) (dtb_u_u20 + 2)) else (if ((let b = dtb_u_u19 in let k = dtb_u_u20 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 34) then (dtb_u_u20 + 1) else (((v_scanStringEnd (dtb_u_u18 - 1)) dtb_u_u19) (dtb_u_u20 + 1))))))

# 148 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokTag = (fun (dtb_u_u21 : Frontend_dLexer.t_Tok) -> (match dtb_u_u21 with
  | Frontend_dLexer.C_Tok_TEof -> "eof"
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u22) -> "sym"
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u23, dtb_u_u24, dtb_u_u25) -> "tmpl"
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u26) -> "str"
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u27) -> "float"
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u28) -> "int"
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u29) -> "kw"
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u30) -> "ident"
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokText = (fun (dtb_u_u31 : string) (dtb_u_u32 : t_LineCur) (dtb_u_u33 : Frontend_dLexer.t_Tok) -> (match dtb_u_u33 with
  | Frontend_dLexer.C_Tok_TEof -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (dtb_u_u32).f_LineCur_lcOff }
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u34, dtb_u_u35, dtb_u_u36) -> (let dtb_u_u37 = ((((v_advanceTo (String.length dtb_u_u31)) dtb_u_u31) dtb_u_u32) dtb_u_u36) in (let dtb_u_u38 = ((dtb_u_u37).f_LineCur_lcOff + 1) in { B_dData_dPair.f_Pair_first = (((v_sliceText dtb_u_u31) (dtb_u_u32).f_LineCur_lcOff) dtb_u_u38); B_dData_dPair.f_Pair_second = dtb_u_u38 }))
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u39) -> (let dtb_u_u40 = (((v_scanStringEnd (String.length dtb_u_u31)) dtb_u_u31) ((dtb_u_u32).f_LineCur_lcOff + 1)) in { B_dData_dPair.f_Pair_first = (((v_sliceText dtb_u_u31) (dtb_u_u32).f_LineCur_lcOff) dtb_u_u40); B_dData_dPair.f_Pair_second = dtb_u_u40 })
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u41) -> (let dtb_u_u42 = (((v_scanDigitsEnd (String.length dtb_u_u31)) dtb_u_u31) (dtb_u_u32).f_LineCur_lcOff) in { B_dData_dPair.f_Pair_first = (((v_sliceText dtb_u_u31) (dtb_u_u32).f_LineCur_lcOff) dtb_u_u42); B_dData_dPair.f_Pair_second = dtb_u_u42 })
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u43) -> { B_dData_dPair.f_Pair_first = dtb_u_u43; B_dData_dPair.f_Pair_second = ((dtb_u_u32).f_LineCur_lcOff + (String.length dtb_u_u43)) }
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u44) -> { B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = ((dtb_u_u32).f_LineCur_lcOff + (String.length dtb_u_u44)) }
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u45) -> { B_dData_dPair.f_Pair_first = dtb_u_u45; B_dData_dPair.f_Pair_second = ((dtb_u_u32).f_LineCur_lcOff + (String.length dtb_u_u45)) }
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u46) -> { B_dData_dPair.f_Pair_first = dtb_u_u46; B_dData_dPair.f_Pair_second = ((dtb_u_u32).f_LineCur_lcOff + (String.length dtb_u_u46)) }
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanStartOf = (fun (dtb_u_u47 : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine dtb_u_u47); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol dtb_u_u47); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset dtb_u_u47); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset dtb_u_u47) })

# 205 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanEndOf = (fun (dtb_u_u48 : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine dtb_u_u48); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol dtb_u_u48); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset dtb_u_u48); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset dtb_u_u48) })

# 191 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_toTrivComments = (fun (dtb_u_u49 : int) (dtb_u_u50 : string) (dtb_u_u51 : t_LineCur) (dtb_u_u52 : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u53, dtb_u_u54) -> (match dtb_u_u53 with
  | { Frontend_dLexer.f_Comment_commentKind = dtb_u_u55; Frontend_dLexer.f_Comment_commentText = dtb_u_u56; Frontend_dLexer.f_Comment_commentSpan = dtb_u_u57 } -> (let dtb_u_u58 = ((((v_advanceTo dtb_u_u49) dtb_u_u50) dtb_u_u51) (v_spanStartOf dtb_u_u57)) in (let dtb_u_u59 = ((((v_advanceTo dtb_u_u49) dtb_u_u50) dtb_u_u58) (v_spanEndOf dtb_u_u57)) in (let dtb_u_u60 = ((((v_advanceBy dtb_u_u49) dtb_u_u50) dtb_u_u59) 1) in (let dtb_u_u61 = ((((v_toTrivComments dtb_u_u49) dtb_u_u50) dtb_u_u60) dtb_u_u54) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_TrivComment_tcommKind = dtb_u_u55; f_TrivComment_tcommSpan = dtb_u_u57; f_TrivComment_tcommStart = (dtb_u_u58).f_LineCur_lcOff; f_TrivComment_tcommEnd = (dtb_u_u60).f_LineCur_lcOff }, (B_dData_dPair.v_firstOf dtb_u_u61))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u61) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u51 }
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spaceTrivia = (fun (dtb_u_u62 : string) (dtb_u_u63 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (dtb_u_u64 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) -> (let dtb_u_u65 = (B_dData_dPair.v_firstOf dtb_u_u63) in (let dtb_u_u66 = (B_dData_dPair.v_firstOf dtb_u_u64) in (if (dtb_u_u66 <= dtb_u_u65) then B_dData_dList.C_List_Nil else (let dtb_u_u67 = (B_dData_dPair.v_secondOf dtb_u_u63) in (let dtb_u_u68 = (B_dData_dPair.v_secondOf dtb_u_u64) in (B_dData_dList.C_List__x58__x58_ ({ f_Trivia_triviaKind = C_TriviaKind_TrivSpace; f_Trivia_triviaText = (((v_sliceText dtb_u_u62) dtb_u_u65) dtb_u_u66); f_Trivia_triviaSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u67); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u67); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u68); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb_u_u68); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u67); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb_u_u68) } }, B_dData_dList.C_List_Nil))))))))

# 223 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTriviaKind = (fun (dtb_u_u69 : Frontend_dLexer.t_CKind) -> (match dtb_u_u69 with
  | Frontend_dLexer.C_CKind_CBlock -> C_TriviaKind_TrivBlockComment
  | Frontend_dLexer.C_CKind_CLine -> C_TriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTrivia = (fun (dtb_u_u70 : string) (dtb_u_u71 : t_TrivComment) -> (let dtb_u_u72 = (dtb_u_u71).f_TrivComment_tcommStart in { f_Trivia_triviaKind = (v_commentTriviaKind (dtb_u_u71).f_TrivComment_tcommKind); f_Trivia_triviaText = (((v_sliceText dtb_u_u70) dtb_u_u72) (dtb_u_u71).f_TrivComment_tcommEnd); f_Trivia_triviaSpan = (dtb_u_u71).f_TrivComment_tcommSpan }))

# 236 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentEndPos = (fun (dtb_u_u73 : t_TrivComment) -> (let dtb_u_u74 = (dtb_u_u73).f_TrivComment_tcommSpan in { B_dData_dPair.f_Pair_first = (dtb_u_u73).f_TrivComment_tcommEnd; B_dData_dPair.f_Pair_second = ((Frontend_dLexer.v_advanceChar 0) (v_spanEndOf dtb_u_u74)) }))

# 243 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_gapTrivia = (fun (dtb_u_u75 : string) (dtb_u_u76 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (dtb_u_u77 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (dtb_u_u78 : t_TrivComment B_dData_dList.t_List) -> (match dtb_u_u78 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u79, dtb_u_u80) -> (let dtb_u_u81 = { B_dData_dPair.f_Pair_first = (dtb_u_u79).f_TrivComment_tcommStart; B_dData_dPair.f_Pair_second = (v_spanStartOf (dtb_u_u79).f_TrivComment_tcommSpan) } in ((B_dData_dList.v_append (((v_spaceTrivia dtb_u_u75) dtb_u_u76) dtb_u_u81)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_commentTrivia dtb_u_u75) dtb_u_u79), B_dData_dList.C_List_Nil))) ((((v_gapTrivia dtb_u_u75) (v_commentEndPos dtb_u_u79)) dtb_u_u77) dtb_u_u80))))
  | B_dData_dList.C_List_Nil -> (((v_spaceTrivia dtb_u_u75) dtb_u_u76) dtb_u_u77)
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_takeCommentsBefore = (fun (dtb_u_u82 : int) (dtb_u_u83 : t_TrivComment B_dData_dList.t_List) -> (match dtb_u_u83 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85) -> (if ((dtb_u_u84).f_TrivComment_tcommStart < dtb_u_u82) then (let dtb_u_u86 = ((v_takeCommentsBefore dtb_u_u82) dtb_u_u85) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u84, (B_dData_dPair.v_firstOf dtb_u_u86))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u86) }) else { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85)) })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentStartsAtOrAfter = (fun (dtb_u_u87 : int) (dtb_u_u88 : t_TrivComment) -> ((dtb_u_u88).f_TrivComment_tcommStart >= dtb_u_u87))

# 272 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenNode = (fun (dtb_u_u89 : string) (dtb_u_u90 : t_LineCur) (dtb_u_u91 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (dtb_u_u92 : t_TrivComment B_dData_dList.t_List) (dtb_u_u93 : Frontend_dLexer.t_Tok) -> (let dtb_u_u94 = (((v_tokText dtb_u_u89) dtb_u_u90) dtb_u_u93) in (let dtb_u_u95 = (B_dData_dPair.v_firstOf dtb_u_u94) in (let dtb_u_u96 = (B_dData_dPair.v_secondOf dtb_u_u94) in (let dtb_u_u97 = ((((v_advanceBy (String.length dtb_u_u89)) dtb_u_u89) dtb_u_u90) (dtb_u_u96 - (dtb_u_u90).f_LineCur_lcOff)) in (let dtb_u_u98 = (v_curPos dtb_u_u90) in (let dtb_u_u99 = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u98); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u98); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_curPos dtb_u_u97)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_curPos dtb_u_u97)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u98); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_curPos dtb_u_u97)) } in { B_dData_dPair.f_Pair_first = { f_CstToken_cstTag = (v_tokTag dtb_u_u93); f_CstToken_cstText = dtb_u_u95; f_CstToken_cstSpan = dtb_u_u99; f_CstToken_cstLeading = ((((v_gapTrivia dtb_u_u89) dtb_u_u91) { B_dData_dPair.f_Pair_first = (dtb_u_u90).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = dtb_u_u98 }) dtb_u_u92) }; B_dData_dPair.f_Pair_second = dtb_u_u97 })))))))

# 293 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildTokens = (fun (dtb_u_u100 : string) (dtb_u_u101 : t_TrivComment B_dData_dList.t_List) (dtb_u_u102 : t_LineCur) (dtb_u_u103 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (dtb_u_u104 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (let dtb_u_u107 = ((((v_advanceTo (String.length dtb_u_u100)) dtb_u_u100) dtb_u_u102) (dtb_u_u105).Frontend_dLexer.f_PTok_ptokPos) in (let dtb_u_u108 = (dtb_u_u107).f_LineCur_lcOff in (let dtb_u_u109 = ((v_takeCommentsBefore dtb_u_u108) dtb_u_u101) in (let dtb_u_u110 = ((B_dData_dList.v_filter (v_commentStartsAtOrAfter (B_dData_dPair.v_firstOf dtb_u_u103))) (B_dData_dPair.v_firstOf dtb_u_u109)) in (let dtb_u_u111 = (((((v_tokenNode dtb_u_u100) dtb_u_u107) dtb_u_u103) dtb_u_u110) (dtb_u_u105).Frontend_dLexer.f_PTok_ptokTok) in (let dtb_u_u112 = (B_dData_dPair.v_secondOf dtb_u_u111) in (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u111), (((((v_buildTokens dtb_u_u100) (B_dData_dPair.v_secondOf dtb_u_u109)) dtb_u_u112) { B_dData_dPair.f_Pair_first = (dtb_u_u112).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = (v_curPos dtb_u_u112) }) dtb_u_u106)))))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOf = (fun (dtb_u_u113 : string) (dtb_u_u114 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u115 : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (let dtb_u_u116 = ((String.length dtb_u_u113) + 1) in (let dtb_u_u117 = ((((v_toTrivComments dtb_u_u116) dtb_u_u113) v_lineCurStart) dtb_u_u115) in (((((v_buildTokens dtb_u_u113) (B_dData_dPair.v_firstOf dtb_u_u117)) v_lineCurStart) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }) dtb_u_u114))))

# 323 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurAt = (fun (dtb_u_u118 : Base_dSource.t_Pos) -> { f_LineCur_lcOff = (Base_dSource.v_posOffset dtb_u_u118); f_LineCur_lcLine = (Base_dSource.v_posLine dtb_u_u118); f_LineCur_lcCol = (Base_dSource.v_posCol dtb_u_u118); f_LineCur_lcOffset = (Base_dSource.v_posOffset dtb_u_u118) })

# 318 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOfFrom = (fun (dtb_u_u119 : string) (dtb_u_u120 : Base_dSource.t_Pos) (dtb_u_u121 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((((v_buildTokens dtb_u_u119) B_dData_dList.C_List_Nil) (v_lineCurAt dtb_u_u120)) { B_dData_dPair.f_Pair_first = (Base_dSource.v_posOffset dtb_u_u120); B_dData_dPair.f_Pair_second = dtb_u_u120 }) dtb_u_u121))

# 328 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCst = (fun (dtb_u_u122 : string) -> (let dtb_u_u123 = (Frontend_dLexer.v_lexSourceWithComments dtb_u_u122) in (match dtb_u_u123 with
  | Base_dDiag.C_Check_OkC (dtb_u_u124) -> (match dtb_u_u124 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u125; B_dData_dPair.f_Pair_second = dtb_u_u126 } -> (B_dData_dMaybe.C_Maybe_Just (((Base_dObs.v_obsPure "vuna.parse.cst") (fun (dtb_u_u127 : int) -> (((v_lexTokensOf dtb_u_u122) dtb_u_u125) dtb_u_u126)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u128) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 335 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaTextOf = (fun (dtb_u_u129 : t_Trivia) -> (dtb_u_u129).f_Trivia_triviaText)

# 339 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderParts = (fun (dtb_u_u130 : t_CstToken) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_triviaTextOf) (dtb_u_u130).f_CstToken_cstLeading)) (B_dData_dList.C_List__x58__x58_ ((dtb_u_u130).f_CstToken_cstText, B_dData_dList.C_List_Nil))))

# 343 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderCst = (fun (dtb_u_u131 : t_CstToken B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_concatMap v_renderParts) dtb_u_u131)))

# 347 "Vuna/Compiler/Frontend/Cst.vuna"
let v_roundtripOk = (fun (dtb_u_u132 : string) -> (match (v_lexCst dtb_u_u132) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u133) -> ((v_renderCst dtb_u_u133) = dtb_u_u132)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstSurface = { f_CstSurface_cstParenDepth = 0; f_CstSurface_cstBacktick = false; f_CstSurface_cstSection = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstInterpMulti = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstHoleTrees = B_dData_dList.C_List_Nil }

# 464 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSem = (fun (dtb_u_u134 : t_CstNode) -> (match dtb_u_u134 with
  | C_CstNode_CstBranch (dtb_u_u135, dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140) -> dtb_u_u139
  | C_CstNode_CstLeaf (dtb_u_u141) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (dtb_u_u142 : t_CstNode) -> (match dtb_u_u142 with
  | C_CstNode_CstBranch (dtb_u_u143, dtb_u_u144, dtb_u_u145, dtb_u_u146, dtb_u_u147, dtb_u_u148) -> dtb_u_u145
  | C_CstNode_CstLeaf (dtb_u_u149) -> (dtb_u_u149).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSurface = (fun (dtb_u_u150 : t_CstNode) -> (match dtb_u_u150 with
  | C_CstNode_CstBranch (dtb_u_u151, dtb_u_u152, dtb_u_u153, dtb_u_u154, dtb_u_u155, dtb_u_u156) -> dtb_u_u154
  | C_CstNode_CstLeaf (dtb_u_u157) -> v_emptyCstSurface
  | _ -> failwith "DT: impossible branch"
))

# 479 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeId = (fun (dtb_u_u158 : t_CstNode) -> (match dtb_u_u158 with
  | C_CstNode_CstBranch (dtb_u_u159, dtb_u_u160, dtb_u_u161, dtb_u_u162, dtb_u_u163, dtb_u_u164) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u160))
  | C_CstNode_CstLeaf (dtb_u_u165) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (dtb_u_u166 : t_CstNode) -> (match dtb_u_u166 with
  | C_CstNode_CstBranch (dtb_u_u167, dtb_u_u168, dtb_u_u169, dtb_u_u170, dtb_u_u171, dtb_u_u172) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u167))
  | C_CstNode_CstLeaf (dtb_u_u173) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (dtb_u_u174 : t_CstNode) -> (match dtb_u_u174 with
  | C_CstNode_CstBranch (dtb_u_u175, dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179, dtb_u_u180) -> dtb_u_u180
  | C_CstNode_CstLeaf (dtb_u_u181) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildrenAll = (fun (dtb_u_u182 : t_CstNode) -> (match dtb_u_u182 with
  | C_CstNode_CstBranch (dtb_u_u183, dtb_u_u184, dtb_u_u185, dtb_u_u186, dtb_u_u187, dtb_u_u188) -> ((B_dData_dList.v_append dtb_u_u188) (dtb_u_u186).f_CstSurface_cstHoleTrees)
  | C_CstNode_CstLeaf (dtb_u_u189) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (dtb_u_u190 : t_CstNode) -> (match dtb_u_u190 with
  | C_CstNode_CstBranch (dtb_u_u191, dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb_u_u197) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u197))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstKindTag = (fun (dtb_u_u198 : t_CstKind) -> (match dtb_u_u198 with
  | C_CstKind_CstMacroKind -> "macro"
  | C_CstKind_CstDoStmtKind -> "doStmt"
  | C_CstKind_CstPatKind -> "pat"
  | C_CstKind_CstExprKind -> "expr"
  | C_CstKind_CstAltKind -> "alt"
  | C_CstKind_CstBindingKind -> "binding"
  | C_CstKind_CstMethodKind -> "method"
  | C_CstKind_CstFieldKind -> "field"
  | C_CstKind_CstCtorKind -> "ctor"
  | C_CstKind_CstDeclKind -> "decl"
  | C_CstKind_CstExportItemKind -> "exportItem"
  | C_CstKind_CstFixityKind -> "fixity"
  | C_CstKind_CstImportKind -> "import"
  | C_CstKind_CstModHeadKind -> "modhead"
  | C_CstKind_CstFileKind -> "file"
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (dtb_u_u199 : t_CstNode) -> (match dtb_u_u199 with
  | C_CstNode_CstBranch (dtb_u_u200, dtb_u_u201, dtb_u_u202, dtb_u_u203, dtb_u_u204, dtb_u_u205) -> (v_cstKindTag dtb_u_u200)
  | C_CstNode_CstLeaf (dtb_u_u206) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (dtb_u_u207 : Base_dSource.t_Span) (dtb_u_u208 : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine dtb_u_u207); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol dtb_u_u207); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine dtb_u_u208); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol dtb_u_u208); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset dtb_u_u207); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset dtb_u_u208) })

# 567 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 571 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (dtb_u_u209 : Base_dSource.t_Span) (dtb_u_u210 : Base_dSource.t_Span B_dData_dList.t_List) -> (match dtb_u_u210 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u211, dtb_u_u212) -> ((v_lastSpanOfList dtb_u_u211) dtb_u_u212)
  | B_dData_dList.C_List_Nil -> dtb_u_u209
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (dtb_u_u213 : Base_dSource.t_Span) (dtb_u_u214 : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList dtb_u_u213) ((B_dData_dList.v_map v_nodeSpan) dtb_u_u214)))

# 580 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (dtb_u_u215 : Base_dSource.t_Span) (dtb_u_u216 : t_CstToken B_dData_dList.t_List) -> (match dtb_u_u216 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u217, dtb_u_u218) -> (dtb_u_u217).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> dtb_u_u215
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (dtb_u_u219 : t_NestFrame) -> (let dtb_u_u220 = (B_dData_dList.v_reverse (dtb_u_u219).f_NestFrame_nfKids) in (let dtb_u_u221 = ((v_lastSpanOf (dtb_u_u219).f_NestFrame_nfStart) dtb_u_u220) in (C_CstNode_CstBranch ((dtb_u_u219).f_NestFrame_nfKind, (dtb_u_u219).f_NestFrame_nfId, ((v_spanFrom (dtb_u_u219).f_NestFrame_nfStart) dtb_u_u221), v_emptyCstSurface, (dtb_u_u219).f_NestFrame_nfSem, dtb_u_u220)))))

# 593 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (dtb_u_u222 : t_CstNode B_dData_dList.t_List) (dtb_u_u223 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u223 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u224, dtb_u_u225) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb_u_u224).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb_u_u224).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb_u_u224).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u222)) (dtb_u_u224).f_NestFrame_nfKids); f_NestFrame_nfSem = (dtb_u_u224).f_NestFrame_nfSem }, dtb_u_u225))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 599 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (dtb_u_u226 : t_CstNode) (dtb_u_u227 : t_NestFrame) -> { f_NestFrame_nfKind = (dtb_u_u227).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb_u_u227).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb_u_u227).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (dtb_u_u226, (dtb_u_u227).f_NestFrame_nfKids)); f_NestFrame_nfSem = (dtb_u_u227).f_NestFrame_nfSem })

# 603 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (dtb_u_u228 : t_CstNode) (dtb_u_u229 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u229 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u231) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto dtb_u_u228) dtb_u_u230), dtb_u_u231))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachSem = (fun (dtb_u_u232 : t_CstSem) (dtb_u_u233 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u233 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb_u_u234).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb_u_u234).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb_u_u234).f_NestFrame_nfStart; f_NestFrame_nfKids = (dtb_u_u234).f_NestFrame_nfKids; f_NestFrame_nfSem = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u232)) }, dtb_u_u235))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (dtb_u_u236 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u236 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> (match dtb_u_u238 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u239, dtb_u_u240) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb_u_u237)) dtb_u_u239), dtb_u_u240))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u237, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (dtb_u_u241 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u241 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u242, dtb_u_u243) -> (1 + (v_nestFrameCount dtb_u_u243))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (dtb_u_u244 : int) (dtb_u_u245 : t_NestFrame B_dData_dList.t_List) -> (if (dtb_u_u244 <= 0) then dtb_u_u245 else (let dtb_u_u246 = dtb_u_u245 in (match dtb_u_u246 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> (match dtb_u_u248 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u249, dtb_u_u250) -> ((v_closeAllFrames (dtb_u_u244 - 1)) (v_closeTopFrame dtb_u_u245))
  | _ -> dtb_u_u245
)
  | _ -> dtb_u_u245
))))

# 634 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (dtb_u_u251 : t_NodeEvent) -> (match dtb_u_u251 with
  | C_NodeEvent_EvClose (dtb_u_u252) -> dtb_u_u252
  | C_NodeEvent_EvSem (dtb_u_u253, dtb_u_u254) -> 0
  | C_NodeEvent_EvOpen (dtb_u_u255, dtb_u_u256, dtb_u_u257) -> dtb_u_u256
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (dtb_u_u258 : t_CstToken B_dData_dList.t_List) (dtb_u_u259 : int) (dtb_u_u260 : t_NestFrame B_dData_dList.t_List) (dtb_u_u261 : t_NodeEvent B_dData_dList.t_List) -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (match dtb_u_u262 with
  | C_NodeEvent_EvSem (dtb_u_u264, dtb_u_u265) -> ((((v_nestEvents dtb_u_u258) dtb_u_u259) ((v_attachSem dtb_u_u265) dtb_u_u260)) dtb_u_u263)
  | _ -> (let dtb_u_u266 = (v_eventIndex dtb_u_u262) in (let dtb_u_u267 = (dtb_u_u266 - dtb_u_u259) in (let dtb_u_u268 = ((B_dData_dList.v_drop dtb_u_u267) dtb_u_u258) in (let dtb_u_u269 = ((v_pushLeaves ((B_dData_dList.v_map (fun (dtb_u_u276 : t_CstToken) -> (C_CstNode_CstLeaf (dtb_u_u276)))) ((B_dData_dList.v_take dtb_u_u267) dtb_u_u258))) dtb_u_u260) in (match dtb_u_u262 with
  | C_NodeEvent_EvSem (dtb_u_u270, dtb_u_u271) -> ((((v_nestEvents dtb_u_u268) dtb_u_u266) ((v_attachSem dtb_u_u271) dtb_u_u269)) dtb_u_u263)
  | C_NodeEvent_EvOpen (dtb_u_u272, dtb_u_u273, dtb_u_u274) -> ((((v_nestEvents dtb_u_u268) dtb_u_u266) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb_u_u272; f_NestFrame_nfId = dtb_u_u274; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) dtb_u_u268); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing }, dtb_u_u269))) dtb_u_u263)
  | C_NodeEvent_EvClose (dtb_u_u275) -> ((((v_nestEvents dtb_u_u268) dtb_u_u266) (v_closeTopFrame dtb_u_u269)) dtb_u_u263)
  | _ -> failwith "DT: impossible branch"
)))))
)
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount dtb_u_u260) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (dtb_u_u277 : t_CstToken) -> (C_CstNode_CstLeaf (dtb_u_u277)))) dtb_u_u258)) dtb_u_u260))
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (dtb_u_u278 : Base_dSource.t_Span) (dtb_u_u279 : t_NestFrame B_dData_dList.t_List) -> (match dtb_u_u279 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, dtb_u_u278, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u280, dtb_u_u281) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb_u_u280).f_NestFrame_nfId, dtb_u_u278, v_emptyCstSurface, (dtb_u_u280).f_NestFrame_nfSem, (B_dData_dList.v_reverse (dtb_u_u280).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (dtb_u_u282 : t_CstToken) -> (dtb_u_u282).f_CstToken_cstSpan)

# 675 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (dtb_u_u283 : t_CstToken B_dData_dList.t_List) -> (match dtb_u_u283 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u284, dtb_u_u285) -> ((v_spanFrom (dtb_u_u284).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb_u_u284).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb_u_u285)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (dtb_u_u286 : t_CstToken B_dData_dList.t_List) (dtb_u_u287 : t_NodeEvent B_dData_dList.t_List) -> (let dtb_u_u288 = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) dtb_u_u286); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing } in (let dtb_u_u289 = ((((v_nestEvents dtb_u_u286) 0) (B_dData_dList.C_List__x58__x58_ (dtb_u_u288, B_dData_dList.C_List_Nil))) dtb_u_u287) in (let dtb_u_u290 = (v_tokensSpan dtb_u_u286) in ((v_finishRoot dtb_u_u290) dtb_u_u289)))))

# 693 "Vuna/Compiler/Frontend/Cst.vuna"
let v_holeRootOf = (fun (dtb_u_u291 : t_CstNode) -> (let dtb_u_u292 = (v_nodeChildren dtb_u_u291) in (match dtb_u_u292 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u293, dtb_u_u294) -> (match dtb_u_u294 with
  | B_dData_dList.C_List_Nil -> dtb_u_u293
  | _ -> dtb_u_u291
)
  | _ -> dtb_u_u291
)))

# 735 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupHoleTrees = (fun (dtb_u_u295 : int) (dtb_u_u296 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u296 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u297, dtb_u_u298) -> (match dtb_u_u297 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u299; B_dData_dPair.f_Pair_second = dtb_u_u300 } -> (if (dtb_u_u299 = dtb_u_u295) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u300)) else ((v_lookupHoleTrees dtb_u_u295) dtb_u_u298))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyKey = (0 - 1)

# 752 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyParenTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = 0 }, B_dData_dList.C_List_Nil))))

# 758 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFixityFacts = { f_FixityFacts_ffParens = v_emptyParenTable; f_FixityFacts_ffBackticks = B_dData_dList.C_List_Nil; f_FixityFacts_ffSections = B_dData_dList.C_List_Nil }

# 769 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfFacts = (fun (dtb_u_u301 : t_FixityFacts) (dtb_u_u302 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u302) (dtb_u_u301).f_FixityFacts_ffParens) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u303) -> dtb_u_u303
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 779 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupBacktick = (fun (dtb_u_u304 : int) (dtb_u_u305 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u305 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u306, dtb_u_u307) -> (if ((B_dData_dPair.v_firstOf dtb_u_u306) = dtb_u_u304) then (B_dData_dPair.v_secondOf dtb_u_u306) else ((v_lookupBacktick dtb_u_u304) dtb_u_u307))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 776 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfFacts = (fun (dtb_u_u308 : t_FixityFacts) (dtb_u_u309 : int) -> ((v_lookupBacktick dtb_u_u309) (dtb_u_u308).f_FixityFacts_ffBackticks))

# 787 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupSection = (fun (dtb_u_u310 : int) (dtb_u_u311 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u311 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u312, dtb_u_u313) -> (if ((B_dData_dPair.v_firstOf dtb_u_u312) = dtb_u_u310) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u312))) else ((v_lookupSection dtb_u_u310) dtb_u_u313))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfFacts = (fun (dtb_u_u314 : t_FixityFacts) (dtb_u_u315 : Base_dSource.t_Span) -> ((v_lookupSection (Base_dSource.v_spanStartOffset dtb_u_u315)) (dtb_u_u314).f_FixityFacts_ffSections))

# 793 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupInterp = (fun (dtb_u_u316 : int) (dtb_u_u317 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u317 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u318, dtb_u_u319) -> (if ((B_dData_dPair.v_firstOf dtb_u_u318) = dtb_u_u316) then (B_dData_dPair.v_secondOf dtb_u_u318) else ((v_lookupInterp dtb_u_u316) dtb_u_u319))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_applySurfaceTree = (fun (dtb_u_u320 : (int, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u321 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u322 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u323 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u324 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u325 : t_CstNode) -> (match dtb_u_u325 with
  | C_CstNode_CstBranch (dtb_u_u326, dtb_u_u327, dtb_u_u328, dtb_u_u329, dtb_u_u330, dtb_u_u331) -> (let dtb_u_u332 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u327) dtb_u_u320) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u335) -> dtb_u_u335
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u333 = { f_CstSurface_cstParenDepth = dtb_u_u332; f_CstSurface_cstBacktick = ((v_lookupBacktick dtb_u_u327) dtb_u_u321); f_CstSurface_cstSection = ((v_lookupSection (Base_dSource.v_spanStartOffset dtb_u_u328)) dtb_u_u322); f_CstSurface_cstInterpMulti = (if ((v_lookupInterp (Base_dSource.v_spanStartOffset dtb_u_u328)) dtb_u_u323) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing); f_CstSurface_cstHoleTrees = (match ((v_lookupHoleTrees dtb_u_u327) dtb_u_u324) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u334) -> dtb_u_u334
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) } in (C_CstNode_CstBranch (dtb_u_u326, dtb_u_u327, dtb_u_u328, dtb_u_u333, dtb_u_u330, ((B_dData_dList.v_map (((((v_applySurfaceTree dtb_u_u320) dtb_u_u321) dtb_u_u322) dtb_u_u323) dtb_u_u324)) dtb_u_u331)))))
  | C_CstNode_CstLeaf (dtb_u_u336) -> (C_CstNode_CstLeaf (dtb_u_u336))
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTreeWithSurface = (fun (dtb_u_u337 : t_CstToken B_dData_dList.t_List) (dtb_u_u338 : t_NodeEvent B_dData_dList.t_List) (dtb_u_u339 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u340 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u341 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u342 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u343 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u344 = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u339) in ((((((v_applySurfaceTree dtb_u_u344) dtb_u_u340) dtb_u_u341) dtb_u_u342) dtb_u_u343) ((v_nestToTree dtb_u_u337) dtb_u_u338))))

# 802 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFactEntries = { f_FactEntries_feParens = B_dData_dList.C_List_Nil; f_FactEntries_feBackticks = B_dData_dList.C_List_Nil; f_FactEntries_feSections = B_dData_dList.C_List_Nil }

# 805 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_factsGo = (fun (dtb_u_u345 : t_CstNode) (dtb_u_u346 : t_FactEntries) -> (match dtb_u_u345 with
  | C_CstNode_CstBranch (dtb_u_u347, dtb_u_u348, dtb_u_u349, dtb_u_u350, dtb_u_u351, dtb_u_u352) -> (let dtb_u_u353 = (if ((dtb_u_u350).f_CstSurface_cstParenDepth > 0) then { dtb_u_u346 with f_FactEntries_feParens = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = (dtb_u_u350).f_CstSurface_cstParenDepth }, (dtb_u_u346).f_FactEntries_feParens)) } else dtb_u_u346) in (let dtb_u_u354 = (if (dtb_u_u350).f_CstSurface_cstBacktick then { dtb_u_u353 with f_FactEntries_feBackticks = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = true }, (dtb_u_u353).f_FactEntries_feBackticks)) } else dtb_u_u353) in (let dtb_u_u355 = (match (dtb_u_u350).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u356) -> { dtb_u_u354 with f_FactEntries_feSections = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb_u_u349); B_dData_dPair.f_Pair_second = dtb_u_u356 }, (dtb_u_u354).f_FactEntries_feSections)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u354
  | _ -> failwith "DT: impossible branch"
) in ((v_factsGoList (dtb_u_u350).f_CstSurface_cstHoleTrees) ((v_factsGoList dtb_u_u352) dtb_u_u355)))))
  | C_CstNode_CstLeaf (dtb_u_u357) -> dtb_u_u346
  | _ -> failwith "DT: impossible branch"
))
# 822 "Vuna/Compiler/Frontend/Cst.vuna"
and v_factsGoList = (fun (dtb_u_u358 : t_CstNode B_dData_dList.t_List) (dtb_u_u359 : t_FactEntries) -> (match dtb_u_u358 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u360, dtb_u_u361) -> ((v_factsGoList dtb_u_u361) ((v_factsGo dtb_u_u360) dtb_u_u359))
  | B_dData_dList.C_List_Nil -> dtb_u_u359
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOf = (fun (dtb_u_u362 : t_CstNode) -> (let dtb_u_u363 = ((v_factsGo dtb_u_u362) v_emptyFactEntries) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (dtb_u_u363).f_FactEntries_feParens); f_FixityFacts_ffBackticks = (dtb_u_u363).f_FactEntries_feBackticks; f_FixityFacts_ffSections = (dtb_u_u363).f_FactEntries_feSections }))

# 831 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOfParts = (fun (dtb_u_u364 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u365 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u366 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u367 : t_CstNode B_dData_dList.t_List) -> (let dtb_u_u368 = ((v_factsGoList dtb_u_u367) v_emptyFactEntries) in (let dtb_u_u369 = ((B_dData_dList.v_filter (fun (dtb_u_u375 : (int, int) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf dtb_u_u375) > 0))) dtb_u_u364) in (let dtb_u_u370 = ((B_dData_dList.v_filter (fun (dtb_u_u374 : (int, bool) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u374))) dtb_u_u365) in (let dtb_u_u371 = ((B_dData_dList.v_append dtb_u_u369) (dtb_u_u368).f_FactEntries_feParens) in (let dtb_u_u372 = ((B_dData_dList.v_append dtb_u_u370) (dtb_u_u368).f_FactEntries_feBackticks) in (let dtb_u_u373 = ((B_dData_dList.v_append dtb_u_u366) (dtb_u_u368).f_FactEntries_feSections) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u371); f_FixityFacts_ffBackticks = dtb_u_u372; f_FixityFacts_ffSections = dtb_u_u373 })))))))

# 843 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (dtb_u_u376 : t_CstNode) -> (match dtb_u_u376 with
  | C_CstNode_CstBranch (dtb_u_u377, dtb_u_u378, dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb_u_u382)
  | C_CstNode_CstLeaf (dtb_u_u383) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u383, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 854 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTableAt = (fun (dtb_u_u384 : int) (dtb_u_u385 : t_CstNode) -> (if (dtb_u_u384 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u385 with
  | C_CstNode_CstLeaf (dtb_u_u386) -> B_dData_dList.C_List_Nil
  | C_CstNode_CstBranch (dtb_u_u387, dtb_u_u388, dtb_u_u389, dtb_u_u390, dtb_u_u391, dtb_u_u392) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u388; B_dData_dPair.f_Pair_second = dtb_u_u385 }, ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_nodeTableAt (dtb_u_u384 - 1))) dtb_u_u392)) ((B_dData_dList.v_concatMap (v_nodeTableAt (dtb_u_u384 - 1))) (dtb_u_u390).f_CstSurface_cstHoleTrees))))
  | _ -> failwith "DT: impossible branch"
)))

# 849 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeTable = (fun (dtb_u_u393 : t_CstNode) -> ((v_nodeTableAt 1000000) dtb_u_u393))

# 865 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (dtb_u_u394 : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable dtb_u_u394)))

# 881 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyIndexAcc = { f_IndexAcc_iaById = B_dData_dList.C_List_Nil; f_IndexAcc_iaBySpan = B_dData_dList.C_List_Nil }

# 890 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_indexGo = (fun (dtb_u_u395 : t_CstNode) (dtb_u_u396 : t_IndexAcc) -> (match dtb_u_u395 with
  | C_CstNode_CstBranch (dtb_u_u397, dtb_u_u398, dtb_u_u399, dtb_u_u400, dtb_u_u401, dtb_u_u402) -> (let dtb_u_u403 = (if ((dtb_u_u400).f_CstSurface_cstParenDepth > 0) then true else (dtb_u_u400).f_CstSurface_cstBacktick) in (let dtb_u_u404 = (match (dtb_u_u400).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u407) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb_u_u400).f_CstSurface_cstInterpMulti with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u408) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u405 = (if dtb_u_u403 then { dtb_u_u396 with f_IndexAcc_iaById = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u398; B_dData_dPair.f_Pair_second = dtb_u_u395 }, (dtb_u_u396).f_IndexAcc_iaById)) } else dtb_u_u396) in (let dtb_u_u406 = (if dtb_u_u404 then { dtb_u_u405 with f_IndexAcc_iaBySpan = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb_u_u399); B_dData_dPair.f_Pair_second = dtb_u_u395 }, (dtb_u_u405).f_IndexAcc_iaBySpan)) } else dtb_u_u405) in ((v_indexGoList (dtb_u_u400).f_CstSurface_cstHoleTrees) ((v_indexGoList dtb_u_u402) dtb_u_u406))))))
  | C_CstNode_CstLeaf (dtb_u_u409) -> dtb_u_u396
  | _ -> failwith "DT: impossible branch"
))
# 907 "Vuna/Compiler/Frontend/Cst.vuna"
and v_indexGoList = (fun (dtb_u_u410 : t_CstNode B_dData_dList.t_List) (dtb_u_u411 : t_IndexAcc) -> (match dtb_u_u410 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u412, dtb_u_u413) -> ((v_indexGoList dtb_u_u413) ((v_indexGo dtb_u_u412) dtb_u_u411))
  | B_dData_dList.C_List_Nil -> dtb_u_u411
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstIndexOf = (fun (dtb_u_u414 : t_CstNode) -> (let dtb_u_u415 = ((v_indexGo dtb_u_u414) v_emptyIndexAcc) in { f_CstIndex_ciById = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (dtb_u_u415).f_IndexAcc_iaById); f_CstIndex_ciBySpan = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (dtb_u_u415).f_IndexAcc_iaBySpan) }))

# 917 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyNodeTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = (C_CstNode_CstBranch (C_CstKind_CstFileKind, v_emptyKey, Base_dSource.v_spanEmpty, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))))

# 912 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstIndex = { f_CstIndex_ciById = v_emptyNodeTable; f_CstIndex_ciBySpan = v_emptyNodeTable }

# 924 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfIndex = (fun (dtb_u_u416 : t_CstIndex) (dtb_u_u417 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u417) (dtb_u_u416).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u418) -> (let dtb_u_u419 = (v_nodeSurface dtb_u_u418) in (dtb_u_u419).f_CstSurface_cstParenDepth)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfIndex = (fun (dtb_u_u420 : t_CstIndex) (dtb_u_u421 : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u421) (dtb_u_u420).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u422) -> (let dtb_u_u423 = (v_nodeSurface dtb_u_u422) in (dtb_u_u423).f_CstSurface_cstBacktick)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfIndex = (fun (dtb_u_u424 : t_CstIndex) (dtb_u_u425 : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset dtb_u_u425)) (dtb_u_u424).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u426) -> (let dtb_u_u427 = (v_nodeSurface dtb_u_u426) in (dtb_u_u427).f_CstSurface_cstSection)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 954 "Vuna/Compiler/Frontend/Cst.vuna"
let v_interpMultiOfIndex = (fun (dtb_u_u428 : t_CstIndex) (dtb_u_u429 : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset dtb_u_u429)) (dtb_u_u428).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u430) -> (let dtb_u_u431 = (v_nodeSurface dtb_u_u430) in (let dtb_u_u432 = (dtb_u_u431).f_CstSurface_cstInterpMulti in (match dtb_u_u432 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u433) -> (if dtb_u_u433 then true else false)
  | _ -> false
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 966 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (dtb_u_u434 : t_CstNode) -> (match dtb_u_u434 with
  | C_CstNode_CstBranch (dtb_u_u435, dtb_u_u436, dtb_u_u437, dtb_u_u438, dtb_u_u439, dtb_u_u440) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb_u_u440))
  | C_CstNode_CstLeaf (dtb_u_u441) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb_u_u441))
  | _ -> failwith "DT: impossible branch"
))

# 978 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_anchorRefsOfTree = (fun (dtb_u_u442 : (t_CstKind) -> bool) (dtb_u_u443 : t_CstNode) -> (match dtb_u_u443 with
  | C_CstNode_CstBranch (dtb_u_u444, dtb_u_u445, dtb_u_u446, dtb_u_u447, dtb_u_u448, dtb_u_u449) -> ((B_dData_dList.v_append (if (dtb_u_u442 dtb_u_u444) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u445; B_dData_dPair.f_Pair_second = dtb_u_u446 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((B_dData_dList.v_concatMap (v_anchorRefsOfTree dtb_u_u442)) dtb_u_u449))
  | C_CstNode_CstLeaf (dtb_u_u450) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOpOf = (fun (dtb_u_u451 : t_SectionShape) -> (match dtb_u_u451 with
  | C_SectionShape_SectionRight (dtb_u_u452) -> dtb_u_u452
  | C_SectionShape_SectionLeft (dtb_u_u453) -> dtb_u_u453
  | C_SectionShape_SectionOp (dtb_u_u454) -> dtb_u_u454
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Frontend/Cst.vuna"
let v_openFrame = (fun (dtb_u_u455 : t_CstKind) (dtb_u_u456 : int) (dtb_u_u457 : int) (dtb_u_u458 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (dtb_u_u459 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> { f_ParenFrame_pfKind = dtb_u_u455; f_ParenFrame_pfId = dtb_u_u456; f_ParenFrame_pfOpen = dtb_u_u457; f_ParenFrame_pfFirst = dtb_u_u458; f_ParenFrame_pfPrev = dtb_u_u459; f_ParenFrame_pfKids = 0; f_ParenFrame_pfKidKind = B_dData_dMaybe.C_Maybe_Nothing; f_ParenFrame_pfKidOpen = 0; f_ParenFrame_pfKidEnd = 0; f_ParenFrame_pfKidStructDepth = 0 })

# 1029 "Vuna/Compiler/Frontend/Cst.vuna"
let v_addKid = (fun (dtb_u_u460 : t_CstKind) (dtb_u_u461 : int) (dtb_u_u462 : int) (dtb_u_u463 : int) (dtb_u_u464 : t_ParenFrame) -> { f_ParenFrame_pfKind = (dtb_u_u464).f_ParenFrame_pfKind; f_ParenFrame_pfId = (dtb_u_u464).f_ParenFrame_pfId; f_ParenFrame_pfOpen = (dtb_u_u464).f_ParenFrame_pfOpen; f_ParenFrame_pfFirst = (dtb_u_u464).f_ParenFrame_pfFirst; f_ParenFrame_pfPrev = (dtb_u_u464).f_ParenFrame_pfPrev; f_ParenFrame_pfKids = ((dtb_u_u464).f_ParenFrame_pfKids + 1); f_ParenFrame_pfKidKind = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u460)); f_ParenFrame_pfKidOpen = dtb_u_u461; f_ParenFrame_pfKidEnd = dtb_u_u462; f_ParenFrame_pfKidStructDepth = dtb_u_u463 })

# 1049 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isOpenParen = (fun (dtb_u_u465 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match dtb_u_u465 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u466) -> (match dtb_u_u466 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u467) -> (if (dtb_u_u467 = "(") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1053 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isCloseParen = (fun (dtb_u_u468 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match dtb_u_u468 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u469) -> (match dtb_u_u469 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u470) -> (if (dtb_u_u470 = ")") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1035 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isParenFrame = (fun (dtb_u_u471 : int) (dtb_u_u472 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (dtb_u_u473 : t_ParenFrame) -> (match (dtb_u_u473).f_ParenFrame_pfKind with
  | C_CstKind_CstExprKind -> (if ((dtb_u_u473).f_ParenFrame_pfKids = 1) then (let dtb_u_u474 = (dtb_u_u473).f_ParenFrame_pfKidKind in (match dtb_u_u474 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u475) -> (match dtb_u_u475 with
  | C_CstKind_CstExprKind -> (if (if (if (v_isOpenParen (dtb_u_u473).f_ParenFrame_pfFirst) then (v_isCloseParen dtb_u_u472) else false) then ((dtb_u_u473).f_ParenFrame_pfKidOpen = ((dtb_u_u473).f_ParenFrame_pfOpen + 1)) else false) then ((dtb_u_u473).f_ParenFrame_pfKidEnd = (dtb_u_u471 - 1)) else false)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
))

# 1057 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isExprFrame = (fun (dtb_u_u476 : t_CstKind) -> (match dtb_u_u476 with
  | C_CstKind_CstExprKind -> true
  | _ -> false
))

# 1062 "Vuna/Compiler/Frontend/Cst.vuna"
let v_adjacentParenDepth = (fun (dtb_u_u477 : t_CstKind) (dtb_u_u478 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (dtb_u_u479 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (if (if (if (v_isExprFrame dtb_u_u477) then (v_isOpenParen dtb_u_u478) else false) then (v_isCloseParen dtb_u_u479) else false) then 1 else 0))

# 1067 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeParen = (fun (dtb_u_u480 : int) (dtb_u_u481 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (dtb_u_u482 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (dtb_u_u480 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u482; B_dData_dPair.f_Pair_second = dtb_u_u481 } else (match dtb_u_u482 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u481 }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u483, dtb_u_u484) -> (((v_consumeParen (dtb_u_u480 - 1)) (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u483).Frontend_dLexer.f_PTok_ptokTok))) dtb_u_u484)
  | _ -> failwith "DT: impossible branch"
)))

# 1076 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headTokOf = (fun (dtb_u_u485 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u485 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u486, dtb_u_u487) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u486).Frontend_dLexer.f_PTok_ptokTok))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1081 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_parenWalk = (fun (dtb_u_u488 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u489 : t_ParenFrame B_dData_dList.t_List) (dtb_u_u490 : int) (dtb_u_u491 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (dtb_u_u492 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u493 : t_NodeEvent B_dData_dList.t_List) -> (match dtb_u_u493 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u494, dtb_u_u495) -> (match dtb_u_u494 with
  | C_NodeEvent_EvClose (dtb_u_u496) -> (let dtb_u_u497 = (((v_consumeParen (dtb_u_u496 - dtb_u_u490)) dtb_u_u491) dtb_u_u492) in (let dtb_u_u498 = (B_dData_dPair.v_firstOf dtb_u_u497) in (let dtb_u_u499 = (B_dData_dPair.v_secondOf dtb_u_u497) in (match dtb_u_u489 with
  | B_dData_dList.C_List_Nil -> ((((((v_parenWalk dtb_u_u488) B_dData_dList.C_List_Nil) dtb_u_u496) dtb_u_u499) dtb_u_u498) dtb_u_u495)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u500, dtb_u_u501) -> (let dtb_u_u502 = (if (((v_isParenFrame dtb_u_u496) dtb_u_u499) dtb_u_u500) then ((dtb_u_u500).f_ParenFrame_pfKidStructDepth + 1) else 0) in (let dtb_u_u503 = (dtb_u_u502 + (((v_adjacentParenDepth (dtb_u_u500).f_ParenFrame_pfKind) (dtb_u_u500).f_ParenFrame_pfPrev) (v_headTokOf dtb_u_u498))) in (let dtb_u_u504 = (if (dtb_u_u503 > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u500).f_ParenFrame_pfId; B_dData_dPair.f_Pair_second = dtb_u_u503 }, dtb_u_u488)) else dtb_u_u488) in (let dtb_u_u505 = (match dtb_u_u501 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u506, dtb_u_u507) -> (B_dData_dList.C_List__x58__x58_ ((((((v_addKid (dtb_u_u500).f_ParenFrame_pfKind) (dtb_u_u500).f_ParenFrame_pfOpen) dtb_u_u496) dtb_u_u502) dtb_u_u506), dtb_u_u507))
  | _ -> failwith "DT: impossible branch"
) in ((((((v_parenWalk dtb_u_u504) dtb_u_u505) dtb_u_u496) dtb_u_u499) dtb_u_u498) dtb_u_u495)))))
  | _ -> failwith "DT: impossible branch"
))))
  | C_NodeEvent_EvOpen (dtb_u_u508, dtb_u_u509, dtb_u_u510) -> (let dtb_u_u511 = (((v_consumeParen (dtb_u_u509 - dtb_u_u490)) dtb_u_u491) dtb_u_u492) in (let dtb_u_u512 = (B_dData_dPair.v_firstOf dtb_u_u511) in (let dtb_u_u513 = (B_dData_dPair.v_secondOf dtb_u_u511) in ((((((v_parenWalk dtb_u_u488) (B_dData_dList.C_List__x58__x58_ ((((((v_openFrame dtb_u_u508) dtb_u_u510) dtb_u_u509) (v_headTokOf dtb_u_u512)) dtb_u_u513), dtb_u_u489))) dtb_u_u509) dtb_u_u513) dtb_u_u512) dtb_u_u495))))
  | C_NodeEvent_EvSem (dtb_u_u514, dtb_u_u515) -> ((((((v_parenWalk dtb_u_u488) dtb_u_u489) dtb_u_u490) dtb_u_u491) dtb_u_u492) dtb_u_u495)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u488
  | _ -> failwith "DT: impossible branch"
))

# 1110 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenEntriesOf = (fun (dtb_u_u516 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u517 : t_NodeEvent B_dData_dList.t_List) -> ((((((v_parenWalk B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) 0) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u516) dtb_u_u517))

# 63 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaKind = (fun (dtb_u_u518 : t_Trivia) -> (match dtb_u_u518 with
  | { f_Trivia_triviaKind = dtb_u_u519; f_Trivia_triviaText = dtb_u_u520; f_Trivia_triviaSpan = dtb_u_u521 } -> dtb_u_u519
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaText = (fun (dtb_u_u522 : t_Trivia) -> (match dtb_u_u522 with
  | { f_Trivia_triviaKind = dtb_u_u523; f_Trivia_triviaText = dtb_u_u524; f_Trivia_triviaSpan = dtb_u_u525 } -> dtb_u_u524
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaSpan = (fun (dtb_u_u526 : t_Trivia) -> (match dtb_u_u526 with
  | { f_Trivia_triviaKind = dtb_u_u527; f_Trivia_triviaText = dtb_u_u528; f_Trivia_triviaSpan = dtb_u_u529 } -> dtb_u_u529
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstTag = (fun (dtb_u_u530 : t_CstToken) -> (match dtb_u_u530 with
  | { f_CstToken_cstTag = dtb_u_u531; f_CstToken_cstText = dtb_u_u532; f_CstToken_cstSpan = dtb_u_u533; f_CstToken_cstLeading = dtb_u_u534 } -> dtb_u_u531
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstText = (fun (dtb_u_u535 : t_CstToken) -> (match dtb_u_u535 with
  | { f_CstToken_cstTag = dtb_u_u536; f_CstToken_cstText = dtb_u_u537; f_CstToken_cstSpan = dtb_u_u538; f_CstToken_cstLeading = dtb_u_u539 } -> dtb_u_u537
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSpan = (fun (dtb_u_u540 : t_CstToken) -> (match dtb_u_u540 with
  | { f_CstToken_cstTag = dtb_u_u541; f_CstToken_cstText = dtb_u_u542; f_CstToken_cstSpan = dtb_u_u543; f_CstToken_cstLeading = dtb_u_u544 } -> dtb_u_u543
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstLeading = (fun (dtb_u_u545 : t_CstToken) -> (match dtb_u_u545 with
  | { f_CstToken_cstTag = dtb_u_u546; f_CstToken_cstText = dtb_u_u547; f_CstToken_cstSpan = dtb_u_u548; f_CstToken_cstLeading = dtb_u_u549 } -> dtb_u_u549
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOff = (fun (dtb_u_u550 : t_LineCur) -> (match dtb_u_u550 with
  | { f_LineCur_lcOff = dtb_u_u551; f_LineCur_lcLine = dtb_u_u552; f_LineCur_lcCol = dtb_u_u553; f_LineCur_lcOffset = dtb_u_u554 } -> dtb_u_u551
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcLine = (fun (dtb_u_u555 : t_LineCur) -> (match dtb_u_u555 with
  | { f_LineCur_lcOff = dtb_u_u556; f_LineCur_lcLine = dtb_u_u557; f_LineCur_lcCol = dtb_u_u558; f_LineCur_lcOffset = dtb_u_u559 } -> dtb_u_u557
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcCol = (fun (dtb_u_u560 : t_LineCur) -> (match dtb_u_u560 with
  | { f_LineCur_lcOff = dtb_u_u561; f_LineCur_lcLine = dtb_u_u562; f_LineCur_lcCol = dtb_u_u563; f_LineCur_lcOffset = dtb_u_u564 } -> dtb_u_u563
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOffset = (fun (dtb_u_u565 : t_LineCur) -> (match dtb_u_u565 with
  | { f_LineCur_lcOff = dtb_u_u566; f_LineCur_lcLine = dtb_u_u567; f_LineCur_lcCol = dtb_u_u568; f_LineCur_lcOffset = dtb_u_u569 } -> dtb_u_u569
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommKind = (fun (dtb_u_u570 : t_TrivComment) -> (match dtb_u_u570 with
  | { f_TrivComment_tcommKind = dtb_u_u571; f_TrivComment_tcommSpan = dtb_u_u572; f_TrivComment_tcommStart = dtb_u_u573; f_TrivComment_tcommEnd = dtb_u_u574 } -> dtb_u_u571
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommSpan = (fun (dtb_u_u575 : t_TrivComment) -> (match dtb_u_u575 with
  | { f_TrivComment_tcommKind = dtb_u_u576; f_TrivComment_tcommSpan = dtb_u_u577; f_TrivComment_tcommStart = dtb_u_u578; f_TrivComment_tcommEnd = dtb_u_u579 } -> dtb_u_u577
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommStart = (fun (dtb_u_u580 : t_TrivComment) -> (match dtb_u_u580 with
  | { f_TrivComment_tcommKind = dtb_u_u581; f_TrivComment_tcommSpan = dtb_u_u582; f_TrivComment_tcommStart = dtb_u_u583; f_TrivComment_tcommEnd = dtb_u_u584 } -> dtb_u_u583
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommEnd = (fun (dtb_u_u585 : t_TrivComment) -> (match dtb_u_u585 with
  | { f_TrivComment_tcommKind = dtb_u_u586; f_TrivComment_tcommSpan = dtb_u_u587; f_TrivComment_tcommStart = dtb_u_u588; f_TrivComment_tcommEnd = dtb_u_u589 } -> dtb_u_u589
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstParenDepth = (fun (dtb_u_u590 : t_CstSurface) -> (match dtb_u_u590 with
  | { f_CstSurface_cstParenDepth = dtb_u_u591; f_CstSurface_cstBacktick = dtb_u_u592; f_CstSurface_cstSection = dtb_u_u593; f_CstSurface_cstInterpMulti = dtb_u_u594; f_CstSurface_cstHoleTrees = dtb_u_u595 } -> dtb_u_u591
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstBacktick = (fun (dtb_u_u596 : t_CstSurface) -> (match dtb_u_u596 with
  | { f_CstSurface_cstParenDepth = dtb_u_u597; f_CstSurface_cstBacktick = dtb_u_u598; f_CstSurface_cstSection = dtb_u_u599; f_CstSurface_cstInterpMulti = dtb_u_u600; f_CstSurface_cstHoleTrees = dtb_u_u601 } -> dtb_u_u598
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSection = (fun (dtb_u_u602 : t_CstSurface) -> (match dtb_u_u602 with
  | { f_CstSurface_cstParenDepth = dtb_u_u603; f_CstSurface_cstBacktick = dtb_u_u604; f_CstSurface_cstSection = dtb_u_u605; f_CstSurface_cstInterpMulti = dtb_u_u606; f_CstSurface_cstHoleTrees = dtb_u_u607 } -> dtb_u_u605
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstInterpMulti = (fun (dtb_u_u608 : t_CstSurface) -> (match dtb_u_u608 with
  | { f_CstSurface_cstParenDepth = dtb_u_u609; f_CstSurface_cstBacktick = dtb_u_u610; f_CstSurface_cstSection = dtb_u_u611; f_CstSurface_cstInterpMulti = dtb_u_u612; f_CstSurface_cstHoleTrees = dtb_u_u613 } -> dtb_u_u612
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstHoleTrees = (fun (dtb_u_u614 : t_CstSurface) -> (match dtb_u_u614 with
  | { f_CstSurface_cstParenDepth = dtb_u_u615; f_CstSurface_cstBacktick = dtb_u_u616; f_CstSurface_cstSection = dtb_u_u617; f_CstSurface_cstInterpMulti = dtb_u_u618; f_CstSurface_cstHoleTrees = dtb_u_u619 } -> dtb_u_u619
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKind = (fun (dtb_u_u620 : t_NestFrame) -> (match dtb_u_u620 with
  | { f_NestFrame_nfKind = dtb_u_u621; f_NestFrame_nfId = dtb_u_u622; f_NestFrame_nfStart = dtb_u_u623; f_NestFrame_nfKids = dtb_u_u624; f_NestFrame_nfSem = dtb_u_u625 } -> dtb_u_u621
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfId = (fun (dtb_u_u626 : t_NestFrame) -> (match dtb_u_u626 with
  | { f_NestFrame_nfKind = dtb_u_u627; f_NestFrame_nfId = dtb_u_u628; f_NestFrame_nfStart = dtb_u_u629; f_NestFrame_nfKids = dtb_u_u630; f_NestFrame_nfSem = dtb_u_u631 } -> dtb_u_u628
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfStart = (fun (dtb_u_u632 : t_NestFrame) -> (match dtb_u_u632 with
  | { f_NestFrame_nfKind = dtb_u_u633; f_NestFrame_nfId = dtb_u_u634; f_NestFrame_nfStart = dtb_u_u635; f_NestFrame_nfKids = dtb_u_u636; f_NestFrame_nfSem = dtb_u_u637 } -> dtb_u_u635
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKids = (fun (dtb_u_u638 : t_NestFrame) -> (match dtb_u_u638 with
  | { f_NestFrame_nfKind = dtb_u_u639; f_NestFrame_nfId = dtb_u_u640; f_NestFrame_nfStart = dtb_u_u641; f_NestFrame_nfKids = dtb_u_u642; f_NestFrame_nfSem = dtb_u_u643 } -> dtb_u_u642
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfSem = (fun (dtb_u_u644 : t_NestFrame) -> (match dtb_u_u644 with
  | { f_NestFrame_nfKind = dtb_u_u645; f_NestFrame_nfId = dtb_u_u646; f_NestFrame_nfStart = dtb_u_u647; f_NestFrame_nfKids = dtb_u_u648; f_NestFrame_nfSem = dtb_u_u649 } -> dtb_u_u649
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffParens = (fun (dtb_u_u650 : t_FixityFacts) -> (match dtb_u_u650 with
  | { f_FixityFacts_ffParens = dtb_u_u651; f_FixityFacts_ffBackticks = dtb_u_u652; f_FixityFacts_ffSections = dtb_u_u653 } -> dtb_u_u651
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffBackticks = (fun (dtb_u_u654 : t_FixityFacts) -> (match dtb_u_u654 with
  | { f_FixityFacts_ffParens = dtb_u_u655; f_FixityFacts_ffBackticks = dtb_u_u656; f_FixityFacts_ffSections = dtb_u_u657 } -> dtb_u_u656
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffSections = (fun (dtb_u_u658 : t_FixityFacts) -> (match dtb_u_u658 with
  | { f_FixityFacts_ffParens = dtb_u_u659; f_FixityFacts_ffBackticks = dtb_u_u660; f_FixityFacts_ffSections = dtb_u_u661 } -> dtb_u_u661
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feParens = (fun (dtb_u_u662 : t_FactEntries) -> (match dtb_u_u662 with
  | { f_FactEntries_feParens = dtb_u_u663; f_FactEntries_feBackticks = dtb_u_u664; f_FactEntries_feSections = dtb_u_u665 } -> dtb_u_u663
  | _ -> failwith "DT: impossible branch"
))

# 798 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feBackticks = (fun (dtb_u_u666 : t_FactEntries) -> (match dtb_u_u666 with
  | { f_FactEntries_feParens = dtb_u_u667; f_FactEntries_feBackticks = dtb_u_u668; f_FactEntries_feSections = dtb_u_u669 } -> dtb_u_u668
  | _ -> failwith "DT: impossible branch"
))

# 799 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feSections = (fun (dtb_u_u670 : t_FactEntries) -> (match dtb_u_u670 with
  | { f_FactEntries_feParens = dtb_u_u671; f_FactEntries_feBackticks = dtb_u_u672; f_FactEntries_feSections = dtb_u_u673 } -> dtb_u_u673
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciById = (fun (dtb_u_u674 : t_CstIndex) -> (match dtb_u_u674 with
  | { f_CstIndex_ciById = dtb_u_u675; f_CstIndex_ciBySpan = dtb_u_u676 } -> dtb_u_u675
  | _ -> failwith "DT: impossible branch"
))

# 874 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciBySpan = (fun (dtb_u_u677 : t_CstIndex) -> (match dtb_u_u677 with
  | { f_CstIndex_ciById = dtb_u_u678; f_CstIndex_ciBySpan = dtb_u_u679 } -> dtb_u_u679
  | _ -> failwith "DT: impossible branch"
))

# 877 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaById = (fun (dtb_u_u680 : t_IndexAcc) -> (match dtb_u_u680 with
  | { f_IndexAcc_iaById = dtb_u_u681; f_IndexAcc_iaBySpan = dtb_u_u682 } -> dtb_u_u681
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaBySpan = (fun (dtb_u_u683 : t_IndexAcc) -> (match dtb_u_u683 with
  | { f_IndexAcc_iaById = dtb_u_u684; f_IndexAcc_iaBySpan = dtb_u_u685 } -> dtb_u_u685
  | _ -> failwith "DT: impossible branch"
))

# 1013 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKind = (fun (dtb_u_u686 : t_ParenFrame) -> (match dtb_u_u686 with
  | { f_ParenFrame_pfKind = dtb_u_u687; f_ParenFrame_pfId = dtb_u_u688; f_ParenFrame_pfOpen = dtb_u_u689; f_ParenFrame_pfFirst = dtb_u_u690; f_ParenFrame_pfPrev = dtb_u_u691; f_ParenFrame_pfKids = dtb_u_u692; f_ParenFrame_pfKidKind = dtb_u_u693; f_ParenFrame_pfKidOpen = dtb_u_u694; f_ParenFrame_pfKidEnd = dtb_u_u695; f_ParenFrame_pfKidStructDepth = dtb_u_u696 } -> dtb_u_u687
  | _ -> failwith "DT: impossible branch"
))

# 1014 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfId = (fun (dtb_u_u697 : t_ParenFrame) -> (match dtb_u_u697 with
  | { f_ParenFrame_pfKind = dtb_u_u698; f_ParenFrame_pfId = dtb_u_u699; f_ParenFrame_pfOpen = dtb_u_u700; f_ParenFrame_pfFirst = dtb_u_u701; f_ParenFrame_pfPrev = dtb_u_u702; f_ParenFrame_pfKids = dtb_u_u703; f_ParenFrame_pfKidKind = dtb_u_u704; f_ParenFrame_pfKidOpen = dtb_u_u705; f_ParenFrame_pfKidEnd = dtb_u_u706; f_ParenFrame_pfKidStructDepth = dtb_u_u707 } -> dtb_u_u699
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfOpen = (fun (dtb_u_u708 : t_ParenFrame) -> (match dtb_u_u708 with
  | { f_ParenFrame_pfKind = dtb_u_u709; f_ParenFrame_pfId = dtb_u_u710; f_ParenFrame_pfOpen = dtb_u_u711; f_ParenFrame_pfFirst = dtb_u_u712; f_ParenFrame_pfPrev = dtb_u_u713; f_ParenFrame_pfKids = dtb_u_u714; f_ParenFrame_pfKidKind = dtb_u_u715; f_ParenFrame_pfKidOpen = dtb_u_u716; f_ParenFrame_pfKidEnd = dtb_u_u717; f_ParenFrame_pfKidStructDepth = dtb_u_u718 } -> dtb_u_u711
  | _ -> failwith "DT: impossible branch"
))

# 1016 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfFirst = (fun (dtb_u_u719 : t_ParenFrame) -> (match dtb_u_u719 with
  | { f_ParenFrame_pfKind = dtb_u_u720; f_ParenFrame_pfId = dtb_u_u721; f_ParenFrame_pfOpen = dtb_u_u722; f_ParenFrame_pfFirst = dtb_u_u723; f_ParenFrame_pfPrev = dtb_u_u724; f_ParenFrame_pfKids = dtb_u_u725; f_ParenFrame_pfKidKind = dtb_u_u726; f_ParenFrame_pfKidOpen = dtb_u_u727; f_ParenFrame_pfKidEnd = dtb_u_u728; f_ParenFrame_pfKidStructDepth = dtb_u_u729 } -> dtb_u_u723
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfPrev = (fun (dtb_u_u730 : t_ParenFrame) -> (match dtb_u_u730 with
  | { f_ParenFrame_pfKind = dtb_u_u731; f_ParenFrame_pfId = dtb_u_u732; f_ParenFrame_pfOpen = dtb_u_u733; f_ParenFrame_pfFirst = dtb_u_u734; f_ParenFrame_pfPrev = dtb_u_u735; f_ParenFrame_pfKids = dtb_u_u736; f_ParenFrame_pfKidKind = dtb_u_u737; f_ParenFrame_pfKidOpen = dtb_u_u738; f_ParenFrame_pfKidEnd = dtb_u_u739; f_ParenFrame_pfKidStructDepth = dtb_u_u740 } -> dtb_u_u735
  | _ -> failwith "DT: impossible branch"
))

# 1018 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKids = (fun (dtb_u_u741 : t_ParenFrame) -> (match dtb_u_u741 with
  | { f_ParenFrame_pfKind = dtb_u_u742; f_ParenFrame_pfId = dtb_u_u743; f_ParenFrame_pfOpen = dtb_u_u744; f_ParenFrame_pfFirst = dtb_u_u745; f_ParenFrame_pfPrev = dtb_u_u746; f_ParenFrame_pfKids = dtb_u_u747; f_ParenFrame_pfKidKind = dtb_u_u748; f_ParenFrame_pfKidOpen = dtb_u_u749; f_ParenFrame_pfKidEnd = dtb_u_u750; f_ParenFrame_pfKidStructDepth = dtb_u_u751 } -> dtb_u_u747
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidKind = (fun (dtb_u_u752 : t_ParenFrame) -> (match dtb_u_u752 with
  | { f_ParenFrame_pfKind = dtb_u_u753; f_ParenFrame_pfId = dtb_u_u754; f_ParenFrame_pfOpen = dtb_u_u755; f_ParenFrame_pfFirst = dtb_u_u756; f_ParenFrame_pfPrev = dtb_u_u757; f_ParenFrame_pfKids = dtb_u_u758; f_ParenFrame_pfKidKind = dtb_u_u759; f_ParenFrame_pfKidOpen = dtb_u_u760; f_ParenFrame_pfKidEnd = dtb_u_u761; f_ParenFrame_pfKidStructDepth = dtb_u_u762 } -> dtb_u_u759
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidOpen = (fun (dtb_u_u763 : t_ParenFrame) -> (match dtb_u_u763 with
  | { f_ParenFrame_pfKind = dtb_u_u764; f_ParenFrame_pfId = dtb_u_u765; f_ParenFrame_pfOpen = dtb_u_u766; f_ParenFrame_pfFirst = dtb_u_u767; f_ParenFrame_pfPrev = dtb_u_u768; f_ParenFrame_pfKids = dtb_u_u769; f_ParenFrame_pfKidKind = dtb_u_u770; f_ParenFrame_pfKidOpen = dtb_u_u771; f_ParenFrame_pfKidEnd = dtb_u_u772; f_ParenFrame_pfKidStructDepth = dtb_u_u773 } -> dtb_u_u771
  | _ -> failwith "DT: impossible branch"
))

# 1021 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidEnd = (fun (dtb_u_u774 : t_ParenFrame) -> (match dtb_u_u774 with
  | { f_ParenFrame_pfKind = dtb_u_u775; f_ParenFrame_pfId = dtb_u_u776; f_ParenFrame_pfOpen = dtb_u_u777; f_ParenFrame_pfFirst = dtb_u_u778; f_ParenFrame_pfPrev = dtb_u_u779; f_ParenFrame_pfKids = dtb_u_u780; f_ParenFrame_pfKidKind = dtb_u_u781; f_ParenFrame_pfKidOpen = dtb_u_u782; f_ParenFrame_pfKidEnd = dtb_u_u783; f_ParenFrame_pfKidStructDepth = dtb_u_u784 } -> dtb_u_u783
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidStructDepth = (fun (dtb_u_u785 : t_ParenFrame) -> (match dtb_u_u785 with
  | { f_ParenFrame_pfKind = dtb_u_u786; f_ParenFrame_pfId = dtb_u_u787; f_ParenFrame_pfOpen = dtb_u_u788; f_ParenFrame_pfFirst = dtb_u_u789; f_ParenFrame_pfPrev = dtb_u_u790; f_ParenFrame_pfKids = dtb_u_u791; f_ParenFrame_pfKidKind = dtb_u_u792; f_ParenFrame_pfKidOpen = dtb_u_u793; f_ParenFrame_pfKidEnd = dtb_u_u794; f_ParenFrame_pfKidStructDepth = dtb_u_u795 } -> dtb_u_u795
  | _ -> failwith "DT: impossible branch"
))
