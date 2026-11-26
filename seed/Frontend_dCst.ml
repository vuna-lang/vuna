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
let v_curPos = (fun (c : t_LineCur) -> { Base_dSource.f_Pos_posLine = (c).f_LineCur_lcLine; Base_dSource.f_Pos_posCol = (c).f_LineCur_lcCol; Base_dSource.f_Pos_posOffset = (c).f_LineCur_lcOffset; Base_dSource.f_Pos_posEndOffset = (c).f_LineCur_lcOffset })

# 99 "Vuna/Compiler/Frontend/Cst.vuna"
let v_stepCur = (fun (src : string) (c : t_LineCur) -> (if (((dtp_strAt src) (c).f_LineCur_lcOff) = 10) then { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = ((c).f_LineCur_lcLine + 1); f_LineCur_lcCol = 1; f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) } else { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = (c).f_LineCur_lcLine; f_LineCur_lcCol = ((c).f_LineCur_lcCol + 1); f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) }))

# 108 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceTo = (fun (fuel : int) (src : string) (c : t_LineCur) (target : Base_dSource.t_Pos) -> (if (fuel <= 0) then c else (if (if ((c).f_LineCur_lcLine > (Base_dSource.v_posLine target)) then true else (if ((c).f_LineCur_lcLine = (Base_dSource.v_posLine target)) then ((c).f_LineCur_lcCol >= (Base_dSource.v_posCol target)) else false)) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceTo (fuel - 1)) src) ((v_stepCur src) c)) target)))))

# 117 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceBy = (fun (fuel : int) (src : string) (c : t_LineCur) (n : int) -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceBy (fuel - 1)) src) ((v_stepCur src) c)) (n - 1))))))

# 126 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sliceText = (fun (src : string) (from : int) (to_ : int) -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 133 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanDigitsEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (Frontend_dLexer.v_isDigit ((dtp_strAt src) i)) then (((v_scanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 139 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanStringEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (((dtp_strAt src) i) = 92) then (((v_scanStringEnd (fuel - 2)) src) (i + 2)) else (if (((dtp_strAt src) i) = 34) then (i + 1) else (((v_scanStringEnd (fuel - 1)) src) (i + 1))))))

# 148 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokTag = (fun (mc0 : Frontend_dLexer.t_Tok) -> (match mc0 with
  | Frontend_dLexer.C_Tok_TEof -> "eof"
  | Frontend_dLexer.C_Tok_TSym (dtb__0) -> "sym"
  | Frontend_dLexer.C_Tok_TTmpl (dtb__1, dtb__2, dtb__3) -> "tmpl"
  | Frontend_dLexer.C_Tok_TStr (dtb__4) -> "str"
  | Frontend_dLexer.C_Tok_TFloat (dtb__5) -> "float"
  | Frontend_dLexer.C_Tok_TInt (dtb__6) -> "int"
  | Frontend_dLexer.C_Tok_TKw (dtb__7) -> "kw"
  | Frontend_dLexer.C_Tok_TIdent (dtb__8) -> "ident"
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokText = (fun (mc0 : string) (mc1 : t_LineCur) (mc2 : Frontend_dLexer.t_Tok) -> (match mc2 with
  | Frontend_dLexer.C_Tok_TEof -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (mc1).f_LineCur_lcOff }
  | Frontend_dLexer.C_Tok_TTmpl (dtb__9, dtb__10, dtb__11) -> (let endCur = ((((v_advanceTo (bi_strLength mc0)) mc0) mc1) dtb__11) in (let end_ = ((endCur).f_LineCur_lcOff + 1) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ }))
  | Frontend_dLexer.C_Tok_TStr (dtb__12) -> (let end_ = (((v_scanStringEnd (bi_strLength mc0)) mc0) ((mc1).f_LineCur_lcOff + 1)) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ })
  | Frontend_dLexer.C_Tok_TInt (dtb__13) -> (let end_ = (((v_scanDigitsEnd (bi_strLength mc0)) mc0) (mc1).f_LineCur_lcOff) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ })
  | Frontend_dLexer.C_Tok_TFloat (dtb__14) -> { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__14)) }
  | Frontend_dLexer.C_Tok_TSym (dtb__15) -> { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__15)) }
  | Frontend_dLexer.C_Tok_TKw (dtb__16) -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__16)) }
  | Frontend_dLexer.C_Tok_TIdent (dtb__17) -> { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__17)) }
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanStartOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset sp) })

# 205 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanEndOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset sp) })

# 191 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_toTrivComments = (fun (mc0 : int) (mc1 : string) (mc2 : t_LineCur) (mc3 : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Frontend_dLexer.f_Comment_commentKind = dtb__20; Frontend_dLexer.f_Comment_commentText = dtb__21; Frontend_dLexer.f_Comment_commentSpan = dtb__22 } -> (let c1 = ((((v_advanceTo mc0) mc1) mc2) (v_spanStartOf dtb__22)) in (let c2 = ((((v_advanceTo mc0) mc1) c1) (v_spanEndOf dtb__22)) in (let c3 = ((((v_advanceBy mc0) mc1) c2) 1) in (let tailRes = ((((v_toTrivComments mc0) mc1) c3) dtb__19) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_TrivComment_tcommKind = dtb__20; f_TrivComment_tcommSpan = dtb__22; f_TrivComment_tcommStart = (c1).f_LineCur_lcOff; f_TrivComment_tcommEnd = (c3).f_LineCur_lcOff }, (B_dData_dPair.v_firstOf tailRes))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tailRes) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spaceTrivia = (fun (src : string) (from : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (to_ : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) -> (let fo = (B_dData_dPair.v_firstOf from) in (let to2 = (B_dData_dPair.v_firstOf to_) in (if (to2 <= fo) then B_dData_dList.C_List_Nil else (let fp = (B_dData_dPair.v_secondOf from) in (let tp = (B_dData_dPair.v_secondOf to_) in (B_dData_dList.C_List__x58__x58_ ({ f_Trivia_triviaKind = C_TriviaKind_TrivSpace; f_Trivia_triviaText = (((v_sliceText src) fo) to2); f_Trivia_triviaSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine fp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol fp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine tp); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol tp); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset fp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset tp) } }, B_dData_dList.C_List_Nil))))))))

# 223 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTriviaKind = (fun (mc0 : Frontend_dLexer.t_CKind) -> (match mc0 with
  | Frontend_dLexer.C_CKind_CBlock -> C_TriviaKind_TrivBlockComment
  | Frontend_dLexer.C_CKind_CLine -> C_TriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTrivia = (fun (src : string) (tc : t_TrivComment) -> (let start = (tc).f_TrivComment_tcommStart in { f_Trivia_triviaKind = (v_commentTriviaKind (tc).f_TrivComment_tcommKind); f_Trivia_triviaText = (((v_sliceText src) start) (tc).f_TrivComment_tcommEnd); f_Trivia_triviaSpan = (tc).f_TrivComment_tcommSpan }))

# 236 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentEndPos = (fun (tc : t_TrivComment) -> (let endSp = (tc).f_TrivComment_tcommSpan in { B_dData_dPair.f_Pair_first = (tc).f_TrivComment_tcommEnd; B_dData_dPair.f_Pair_second = ((Frontend_dLexer.v_advanceChar 0) (v_spanEndOf endSp)) }))

# 243 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_gapTrivia = (fun (mc0 : string) (mc1 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc2 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc3 : t_TrivComment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (let cStart = { B_dData_dPair.f_Pair_first = (dtb__23).f_TrivComment_tcommStart; B_dData_dPair.f_Pair_second = (v_spanStartOf (dtb__23).f_TrivComment_tcommSpan) } in ((B_dData_dList.v_append (((v_spaceTrivia mc0) mc1) cStart)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_commentTrivia mc0) dtb__23), B_dData_dList.C_List_Nil))) ((((v_gapTrivia mc0) (v_commentEndPos dtb__23)) mc2) dtb__24))))
  | B_dData_dList.C_List_Nil -> (((v_spaceTrivia mc0) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_takeCommentsBefore = (fun (mc0 : int) (mc1 : t_TrivComment B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if ((dtb__25).f_TrivComment_tcommStart < mc0) then (let taken = ((v_takeCommentsBefore mc0) dtb__26) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__25, (B_dData_dPair.v_firstOf taken))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf taken) }) else { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26)) })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentStartsAtOrAfter = (fun (bound : int) (c : t_TrivComment) -> ((c).f_TrivComment_tcommStart >= bound))

# 272 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenNode = (fun (src : string) (curStart : t_LineCur) (prevEnd : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (comments : t_TrivComment B_dData_dList.t_List) (tok : Frontend_dLexer.t_Tok) -> (let textEnd = (((v_tokText src) curStart) tok) in (let text = (B_dData_dPair.v_firstOf textEnd) in (let end_ = (B_dData_dPair.v_secondOf textEnd) in (let curEnd = ((((v_advanceBy (bi_strLength src)) src) curStart) (end_ - (curStart).f_LineCur_lcOff)) in (let startPos = (v_curPos curStart) in (let sp = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_curPos curEnd)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_curPos curEnd)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_curPos curEnd)) } in { B_dData_dPair.f_Pair_first = { f_CstToken_cstTag = (v_tokTag tok); f_CstToken_cstText = text; f_CstToken_cstSpan = sp; f_CstToken_cstLeading = ((((v_gapTrivia src) prevEnd) { B_dData_dPair.f_Pair_first = (curStart).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = startPos }) comments) }; B_dData_dPair.f_Pair_second = curEnd })))))))

# 293 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildTokens = (fun (mc0 : string) (mc1 : t_TrivComment B_dData_dList.t_List) (mc2 : t_LineCur) (mc3 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (let curStart = ((((v_advanceTo (bi_strLength mc0)) mc0) mc2) (dtb__27).Frontend_dLexer.f_PTok_ptokPos) in (let start = (curStart).f_LineCur_lcOff in (let before = ((v_takeCommentsBefore start) mc1) in (let live = ((B_dData_dList.v_filter (v_commentStartsAtOrAfter (B_dData_dPair.v_firstOf mc3))) (B_dData_dPair.v_firstOf before)) in (let node = (((((v_tokenNode mc0) curStart) mc3) live) (dtb__27).Frontend_dLexer.f_PTok_ptokTok) in (let curEnd = (B_dData_dPair.v_secondOf node) in (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf node), (((((v_buildTokens mc0) (B_dData_dPair.v_secondOf before)) curEnd) { B_dData_dPair.f_Pair_first = (curEnd).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = (v_curPos curEnd) }) dtb__28)))))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOf = (fun (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (comments : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (let fuel = ((bi_strLength source) + 1) in (let tcs = ((((v_toTrivComments fuel) source) v_lineCurStart) comments) in (((((v_buildTokens source) (B_dData_dPair.v_firstOf tcs)) v_lineCurStart) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }) toks))))

# 323 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurAt = (fun (p : Base_dSource.t_Pos) -> { f_LineCur_lcOff = (Base_dSource.v_posOffset p); f_LineCur_lcLine = (Base_dSource.v_posLine p); f_LineCur_lcCol = (Base_dSource.v_posCol p); f_LineCur_lcOffset = (Base_dSource.v_posOffset p) })

# 318 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOfFrom = (fun (source : string) (start : Base_dSource.t_Pos) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((((v_buildTokens source) B_dData_dList.C_List_Nil) (v_lineCurAt start)) { B_dData_dPair.f_Pair_first = (Base_dSource.v_posOffset start); B_dData_dPair.f_Pair_second = start }) toks))

# 328 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCst = (fun (source : string) -> (let nd_uscrut1 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__29) -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> (B_dData_dMaybe.C_Maybe_Just (((Base_dObs.v_obsPure "vuna.parse.cst") (fun (_u : int) -> (((v_lexTokensOf source) dtb__30) dtb__31)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__32) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 335 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaTextOf = (fun (tr : t_Trivia) -> (tr).f_Trivia_triviaText)

# 339 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderParts = (fun (t : t_CstToken) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_triviaTextOf) (t).f_CstToken_cstLeading)) (B_dData_dList.C_List__x58__x58_ ((t).f_CstToken_cstText, B_dData_dList.C_List_Nil))))

# 343 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderCst = (fun (toks : t_CstToken B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_concatMap v_renderParts) toks)))

# 347 "Vuna/Compiler/Frontend/Cst.vuna"
let v_roundtripOk = (fun (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ((v_renderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstSurface = { f_CstSurface_cstParenDepth = 0; f_CstSurface_cstBacktick = false; f_CstSurface_cstSection = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstInterpMulti = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstHoleTrees = B_dData_dList.C_List_Nil }

# 464 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSem = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__38
  | C_CstNode_CstLeaf (dtb__40) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__43
  | C_CstNode_CstLeaf (dtb__47) -> (dtb__47).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSurface = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> dtb__51
  | C_CstNode_CstLeaf (dtb__54) -> v_emptyCstSurface
  | _ -> failwith "DT: impossible branch"
))

# 479 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeId = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (B_dData_dMaybe.C_Maybe_Just (dtb__56))
  | C_CstNode_CstLeaf (dtb__61) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (B_dData_dMaybe.C_Maybe_Just (dtb__62))
  | C_CstNode_CstLeaf (dtb__68) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_CstNode_CstLeaf (dtb__75) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__82) -> (B_dData_dMaybe.C_Maybe_Just (dtb__82))
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstKindTag = (fun (mc0 : t_CstKind) -> (match mc0 with
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

# 500 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> (v_cstKindTag dtb__83)
  | C_CstNode_CstLeaf (dtb__89) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine a); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol a); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine b); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol b); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset a); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset b) })

# 560 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 564 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (mc0 : Base_dSource.t_Span) (mc1 : Base_dSource.t_Span B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> ((v_lastSpanOfList dtb__90) dtb__91)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (d : Base_dSource.t_Span) (kids : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList d) ((B_dData_dList.v_map v_nodeSpan) kids)))

# 573 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_CstToken B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (dtb__92).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (f : t_NestFrame) -> (let kids = (B_dData_dList.v_reverse (f).f_NestFrame_nfKids) in (let endSp = ((v_lastSpanOf (f).f_NestFrame_nfStart) kids) in (C_CstNode_CstBranch ((f).f_NestFrame_nfKind, (f).f_NestFrame_nfId, ((v_spanFrom (f).f_NestFrame_nfStart) endSp), v_emptyCstSurface, (f).f_NestFrame_nfSem, kids)))))

# 586 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__94).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__94).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__94).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse mc0)) (dtb__94).f_NestFrame_nfKids); f_NestFrame_nfSem = (dtb__94).f_NestFrame_nfSem }, dtb__95))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (node : t_CstNode) (f : t_NestFrame) -> { f_NestFrame_nfKind = (f).f_NestFrame_nfKind; f_NestFrame_nfId = (f).f_NestFrame_nfId; f_NestFrame_nfStart = (f).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_NestFrame_nfKids)); f_NestFrame_nfSem = (f).f_NestFrame_nfSem })

# 596 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (mc0 : t_CstNode) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto mc0) dtb__96), dtb__97))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachSem = (fun (mc0 : t_CstSem) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__98).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__98).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__98).f_NestFrame_nfStart; f_NestFrame_nfKids = (dtb__98).f_NestFrame_nfKids; f_NestFrame_nfSem = (B_dData_dMaybe.C_Maybe_Just (mc0)) }, dtb__99))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb__100)) dtb__102), dtb__103))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__100, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (1 + (v_nestFrameCount dtb__105))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 617 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (fuel : int) (frames : t_NestFrame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (let nd_uscrut2 = frames in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match dtb__107 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> ((v_closeAllFrames (fuel - 1)) (v_closeTopFrame frames))
  | _ -> frames
)
  | _ -> frames
))))

# 627 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (mc0 : t_NodeEvent) -> (match mc0 with
  | C_NodeEvent_EvClose (dtb__110) -> dtb__110
  | C_NodeEvent_EvSem (dtb__111, dtb__112) -> 0
  | C_NodeEvent_EvOpen (dtb__113, dtb__114, dtb__115) -> dtb__114
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (mc0 : t_CstToken B_dData_dList.t_List) (mc1 : int) (mc2 : t_NestFrame B_dData_dList.t_List) (mc3 : t_NodeEvent B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | C_NodeEvent_EvSem (dtb__118, dtb__119) -> ((((v_nestEvents mc0) mc1) ((v_attachSem dtb__119) mc2)) dtb__117)
  | _ -> (let at = (v_eventIndex dtb__116) in (let n = (at - mc1) in (let live2 = ((B_dData_dList.v_drop n) mc0) in (let frames1 = ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) ((B_dData_dList.v_take n) mc0))) mc2) in (match dtb__116 with
  | C_NodeEvent_EvSem (dtb__120, dtb__121) -> ((((v_nestEvents live2) at) ((v_attachSem dtb__121) frames1)) dtb__117)
  | C_NodeEvent_EvOpen (dtb__122, dtb__123, dtb__124) -> ((((v_nestEvents live2) at) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb__122; f_NestFrame_nfId = dtb__124; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) live2); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing }, frames1))) dtb__117)
  | C_NodeEvent_EvClose (dtb__125) -> ((((v_nestEvents live2) at) (v_closeTopFrame frames1)) dtb__117)
  | _ -> failwith "DT: impossible branch"
)))))
)
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount mc2) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) mc0)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 659 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, mc0, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb__126).f_NestFrame_nfId, mc0, v_emptyCstSurface, (dtb__126).f_NestFrame_nfSem, (B_dData_dList.v_reverse (dtb__126).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (t : t_CstToken) -> (t).f_CstToken_cstSpan)

# 668 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> ((v_spanFrom (dtb__128).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb__128).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb__129)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (let root = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) toks); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing } in (let frames = ((((v_nestEvents toks) 0) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) events) in (let sp = (v_tokensSpan toks) in ((v_finishRoot sp) frames)))))

# 686 "Vuna/Compiler/Frontend/Cst.vuna"
let v_holeRootOf = (fun (node : t_CstNode) -> (let nd_uscrut1 = (v_nodeChildren node) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__131 with
  | B_dData_dList.C_List_Nil -> dtb__130
  | _ -> node
)
  | _ -> node
)))

# 728 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupHoleTrees = (fun (mc0 : int) (mc1 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (match dtb__132 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (if (dtb__134 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__135)) else ((v_lookupHoleTrees mc0) dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyKey = (0 - 1)

# 745 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyParenTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = 0 }, B_dData_dList.C_List_Nil))))

# 751 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFixityFacts = { f_FixityFacts_ffParens = v_emptyParenTable; f_FixityFacts_ffBackticks = B_dData_dList.C_List_Nil; f_FixityFacts_ffSections = B_dData_dList.C_List_Nil }

# 762 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfFacts = (fun (f : t_FixityFacts) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (f).f_FixityFacts_ffParens) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> dtb__136
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 772 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupBacktick = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (if ((B_dData_dPair.v_firstOf dtb__137) = mc0) then (B_dData_dPair.v_secondOf dtb__137) else ((v_lookupBacktick mc0) dtb__138))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 769 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfFacts = (fun (f : t_FixityFacts) (nid : int) -> ((v_lookupBacktick nid) (f).f_FixityFacts_ffBackticks))

# 780 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupSection = (fun (mc0 : int) (mc1 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if ((B_dData_dPair.v_firstOf dtb__139) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__139))) else ((v_lookupSection mc0) dtb__140))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfFacts = (fun (f : t_FixityFacts) (sp : Base_dSource.t_Span) -> ((v_lookupSection (Base_dSource.v_spanStartOffset sp)) (f).f_FixityFacts_ffSections))

# 786 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupInterp = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if ((B_dData_dPair.v_firstOf dtb__141) = mc0) then (B_dData_dPair.v_secondOf dtb__141) else ((v_lookupInterp mc0) dtb__142))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_applySurfaceTree = (fun (mc0 : (int, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : t_CstNode) -> (match mc5 with
  | C_CstNode_CstBranch (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (let parenDepth = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__144) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> dtb__150
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (let surface = { f_CstSurface_cstParenDepth = parenDepth; f_CstSurface_cstBacktick = ((v_lookupBacktick dtb__144) mc1); f_CstSurface_cstSection = ((v_lookupSection (Base_dSource.v_spanStartOffset dtb__145)) mc2); f_CstSurface_cstInterpMulti = (if ((v_lookupInterp (Base_dSource.v_spanStartOffset dtb__145)) mc3) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing); f_CstSurface_cstHoleTrees = (match ((v_lookupHoleTrees dtb__144) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> dtb__149
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) } in (C_CstNode_CstBranch (dtb__143, dtb__144, dtb__145, surface, dtb__147, ((B_dData_dList.v_map (((((v_applySurfaceTree mc0) mc1) mc2) mc3) mc4)) dtb__148)))))
  | C_CstNode_CstLeaf (dtb__151) -> (C_CstNode_CstLeaf (dtb__151))
  | _ -> failwith "DT: impossible branch"
))

# 695 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTreeWithSurface = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) (parenEntries : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (interps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeTrees : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let parens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries) in ((((((v_applySurfaceTree parens) backticks) sections) interps) holeTrees) ((v_nestToTree toks) events))))

# 795 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFactEntries = { f_FactEntries_feParens = B_dData_dList.C_List_Nil; f_FactEntries_feBackticks = B_dData_dList.C_List_Nil; f_FactEntries_feSections = B_dData_dList.C_List_Nil }

# 798 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_factsGo = (fun (mc0 : t_CstNode) (mc1 : t_FactEntries) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> (let acc1 = (if ((dtb__155).f_CstSurface_cstParenDepth > 0) then { mc1 with f_FactEntries_feParens = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = (dtb__155).f_CstSurface_cstParenDepth }, (mc1).f_FactEntries_feParens)) } else mc1) in (let acc2 = (if (dtb__155).f_CstSurface_cstBacktick then { acc1 with f_FactEntries_feBackticks = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = true }, (acc1).f_FactEntries_feBackticks)) } else acc1) in (let acc3 = (match (dtb__155).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> { acc2 with f_FactEntries_feSections = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__154); B_dData_dPair.f_Pair_second = dtb__158 }, (acc2).f_FactEntries_feSections)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> acc2
  | _ -> failwith "DT: impossible branch"
) in ((v_factsGoList (dtb__155).f_CstSurface_cstHoleTrees) ((v_factsGoList dtb__157) acc3)))))
  | C_CstNode_CstLeaf (dtb__159) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 815 "Vuna/Compiler/Frontend/Cst.vuna"
and v_factsGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_FactEntries) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> ((v_factsGoList dtb__161) ((v_factsGo dtb__160) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOf = (fun (root : t_CstNode) -> (let entries = ((v_factsGo root) v_emptyFactEntries) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (entries).f_FactEntries_feParens); f_FixityFacts_ffBackticks = (entries).f_FactEntries_feBackticks; f_FixityFacts_ffSections = (entries).f_FactEntries_feSections }))

# 824 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOfParts = (fun (parens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeRoots : t_CstNode B_dData_dList.t_List) -> (let holes = ((v_factsGoList holeRoots) v_emptyFactEntries) in (let liveParens = ((B_dData_dList.v_filter (fun (p : (int, int) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf p) > 0))) parens) in (let liveBackticks = ((B_dData_dList.v_filter (fun (p : (int, bool) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) backticks) in (let parenEntries = ((B_dData_dList.v_append liveParens) (holes).f_FactEntries_feParens) in (let backtickEntries = ((B_dData_dList.v_append liveBackticks) (holes).f_FactEntries_feBackticks) in (let sectionEntries = ((B_dData_dList.v_append sections) (holes).f_FactEntries_feSections) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries); f_FixityFacts_ffBackticks = backtickEntries; f_FixityFacts_ffSections = sectionEntries })))))))

# 836 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb__167)
  | C_CstNode_CstLeaf (dtb__168) -> (B_dData_dList.C_List__x58__x58_ (dtb__168, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTable = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = mc0 }, ((B_dData_dList.v_concatMap v_nodeTable) dtb__174)))
  | C_CstNode_CstLeaf (dtb__175) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 847 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (tree : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable tree)))

# 863 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyIndexAcc = { f_IndexAcc_iaById = B_dData_dList.C_List_Nil; f_IndexAcc_iaBySpan = B_dData_dList.C_List_Nil }

# 872 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_indexGo = (fun (mc0 : t_CstNode) (mc1 : t_IndexAcc) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (let hasIdFact = (if ((dtb__179).f_CstSurface_cstParenDepth > 0) then true else (dtb__179).f_CstSurface_cstBacktick) in (let hasSpanFact = (match (dtb__179).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb__179).f_CstSurface_cstInterpMulti with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (let acc1 = (if hasIdFact then { mc1 with f_IndexAcc_iaById = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = mc0 }, (mc1).f_IndexAcc_iaById)) } else mc1) in (let acc2 = (if hasSpanFact then { acc1 with f_IndexAcc_iaBySpan = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__178); B_dData_dPair.f_Pair_second = mc0 }, (acc1).f_IndexAcc_iaBySpan)) } else acc1) in ((v_indexGoList (dtb__179).f_CstSurface_cstHoleTrees) ((v_indexGoList dtb__181) acc2))))))
  | C_CstNode_CstLeaf (dtb__184) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 889 "Vuna/Compiler/Frontend/Cst.vuna"
and v_indexGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_IndexAcc) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> ((v_indexGoList dtb__186) ((v_indexGo dtb__185) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstIndexOf = (fun (root : t_CstNode) -> (let acc = ((v_indexGo root) v_emptyIndexAcc) in { f_CstIndex_ciById = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaById); f_CstIndex_ciBySpan = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaBySpan) }))

# 899 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyNodeTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = (C_CstNode_CstBranch (C_CstKind_CstFileKind, v_emptyKey, Base_dSource.v_spanEmpty, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))))

# 894 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstIndex = { f_CstIndex_ciById = v_emptyNodeTable; f_CstIndex_ciBySpan = v_emptyNodeTable }

# 906 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (let s = (v_nodeSurface dtb__187) in (s).f_CstSurface_cstParenDepth)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 916 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (let s = (v_nodeSurface dtb__188) in (s).f_CstSurface_cstBacktick)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (let s = (v_nodeSurface dtb__189) in (s).f_CstSurface_cstSection)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Frontend/Cst.vuna"
let v_interpMultiOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (let s = (v_nodeSurface dtb__190) in (let nd_uscrut5 = (s).f_CstSurface_cstInterpMulti in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (if dtb__191 then true else false)
  | _ -> false
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__197))
  | C_CstNode_CstLeaf (dtb__198) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__198))
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_anchorRefsOfTree = (fun (mc0 : (t_CstKind) -> bool) (mc1 : t_CstNode) -> (match mc1 with
  | C_CstNode_CstBranch (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> ((B_dData_dList.v_append (if (mc0 dtb__199) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((B_dData_dList.v_concatMap (v_anchorRefsOfTree mc0)) dtb__204))
  | C_CstNode_CstLeaf (dtb__205) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 974 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOpOf = (fun (mc0 : t_SectionShape) -> (match mc0 with
  | C_SectionShape_SectionRight (dtb__206) -> dtb__206
  | C_SectionShape_SectionLeft (dtb__207) -> dtb__207
  | C_SectionShape_SectionOp (dtb__208) -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Frontend/Cst.vuna"
let v_openFrame = (fun (kind : t_CstKind) (nid : int) (at : int) (first : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> { f_ParenFrame_pfKind = kind; f_ParenFrame_pfId = nid; f_ParenFrame_pfOpen = at; f_ParenFrame_pfFirst = first; f_ParenFrame_pfPrev = prev; f_ParenFrame_pfKids = 0; f_ParenFrame_pfKidKind = B_dData_dMaybe.C_Maybe_Nothing; f_ParenFrame_pfKidOpen = 0; f_ParenFrame_pfKidEnd = 0; f_ParenFrame_pfKidStructDepth = 0 })

# 1009 "Vuna/Compiler/Frontend/Cst.vuna"
let v_addKid = (fun (kind : t_CstKind) (open_ : int) (end_ : int) (structD : int) (f : t_ParenFrame) -> { f_ParenFrame_pfKind = (f).f_ParenFrame_pfKind; f_ParenFrame_pfId = (f).f_ParenFrame_pfId; f_ParenFrame_pfOpen = (f).f_ParenFrame_pfOpen; f_ParenFrame_pfFirst = (f).f_ParenFrame_pfFirst; f_ParenFrame_pfPrev = (f).f_ParenFrame_pfPrev; f_ParenFrame_pfKids = ((f).f_ParenFrame_pfKids + 1); f_ParenFrame_pfKidKind = (B_dData_dMaybe.C_Maybe_Just (kind)); f_ParenFrame_pfKidOpen = open_; f_ParenFrame_pfKidEnd = end_; f_ParenFrame_pfKidStructDepth = structD })

# 1029 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isOpenParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (match dtb__209 with
  | Frontend_dLexer.C_Tok_TSym (dtb__210) -> (if (dtb__210 = "(") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1033 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isCloseParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (match dtb__211 with
  | Frontend_dLexer.C_Tok_TSym (dtb__212) -> (if (dtb__212 = ")") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1015 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isParenFrame = (fun (endIdx : int) (lastTok : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (f : t_ParenFrame) -> (match (f).f_ParenFrame_pfKind with
  | C_CstKind_CstExprKind -> (if ((f).f_ParenFrame_pfKids = 1) then (let nd_uscrut3 = (f).f_ParenFrame_pfKidKind in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (match dtb__213 with
  | C_CstKind_CstExprKind -> (if (if (if (v_isOpenParen (f).f_ParenFrame_pfFirst) then (v_isCloseParen lastTok) else false) then ((f).f_ParenFrame_pfKidOpen = ((f).f_ParenFrame_pfOpen + 1)) else false) then ((f).f_ParenFrame_pfKidEnd = (endIdx - 1)) else false)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
))

# 1037 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isExprFrame = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstExprKind -> true
  | _ -> false
))

# 1042 "Vuna/Compiler/Frontend/Cst.vuna"
let v_adjacentParenDepth = (fun (kind : t_CstKind) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (next : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (if (if (if (v_isExprFrame kind) then (v_isOpenParen prev) else false) then (v_isCloseParen next) else false) then 1 else 0))

# 1047 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeParen = (fun (n : int) (last : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (n <= 0) then { B_dData_dPair.f_Pair_first = toks; B_dData_dPair.f_Pair_second = last } else (match toks with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = last }
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (((v_consumeParen (n - 1)) (B_dData_dMaybe.C_Maybe_Just ((dtb__214).Frontend_dLexer.f_PTok_ptokTok))) dtb__215)
  | _ -> failwith "DT: impossible branch"
)))

# 1056 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headTokOf = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__216).Frontend_dLexer.f_PTok_ptokTok))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_parenWalk = (fun (mc0 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : t_ParenFrame B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc5 : t_NodeEvent B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | C_NodeEvent_EvClose (dtb__220) -> (let step = (((v_consumeParen (dtb__220 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in (match mc1 with
  | B_dData_dList.C_List_Nil -> ((((((v_parenWalk mc0) B_dData_dList.C_List_Nil) dtb__220) last2) live) dtb__219)
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (let structD = (if (((v_isParenFrame dtb__220) last2) dtb__221) then ((dtb__221).f_ParenFrame_pfKidStructDepth + 1) else 0) in (let total = (structD + (((v_adjacentParenDepth (dtb__221).f_ParenFrame_pfKind) (dtb__221).f_ParenFrame_pfPrev) (v_headTokOf live))) in (let acc2 = (if (total > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__221).f_ParenFrame_pfId; B_dData_dPair.f_Pair_second = total }, mc0)) else mc0) in (let outer2 = (match dtb__222 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (B_dData_dList.C_List__x58__x58_ ((((((v_addKid (dtb__221).f_ParenFrame_pfKind) (dtb__221).f_ParenFrame_pfOpen) dtb__220) structD) dtb__223), dtb__224))
  | _ -> failwith "DT: impossible branch"
) in ((((((v_parenWalk acc2) outer2) dtb__220) last2) live) dtb__219)))))
  | _ -> failwith "DT: impossible branch"
))))
  | C_NodeEvent_EvOpen (dtb__225, dtb__226, dtb__227) -> (let step = (((v_consumeParen (dtb__226 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in ((((((v_parenWalk mc0) (B_dData_dList.C_List__x58__x58_ ((((((v_openFrame dtb__225) dtb__227) dtb__226) (v_headTokOf live)) last2), mc1))) dtb__226) last2) live) dtb__219))))
  | C_NodeEvent_EvSem (dtb__228, dtb__229) -> ((((((v_parenWalk mc0) mc1) mc2) mc3) mc4) dtb__219)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1090 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenEntriesOf = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> ((((((v_parenWalk B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) 0) B_dData_dMaybe.C_Maybe_Nothing) toks) events))

# 63 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaKind = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__230; f_Trivia_triviaText = dtb__231; f_Trivia_triviaSpan = dtb__232 } -> dtb__230
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaText = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__233; f_Trivia_triviaText = dtb__234; f_Trivia_triviaSpan = dtb__235 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaSpan = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__236; f_Trivia_triviaText = dtb__237; f_Trivia_triviaSpan = dtb__238 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstTag = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__239; f_CstToken_cstText = dtb__240; f_CstToken_cstSpan = dtb__241; f_CstToken_cstLeading = dtb__242 } -> dtb__239
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstText = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__243; f_CstToken_cstText = dtb__244; f_CstToken_cstSpan = dtb__245; f_CstToken_cstLeading = dtb__246 } -> dtb__244
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSpan = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__247; f_CstToken_cstText = dtb__248; f_CstToken_cstSpan = dtb__249; f_CstToken_cstLeading = dtb__250 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstLeading = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__251; f_CstToken_cstText = dtb__252; f_CstToken_cstSpan = dtb__253; f_CstToken_cstLeading = dtb__254 } -> dtb__254
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOff = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__255; f_LineCur_lcLine = dtb__256; f_LineCur_lcCol = dtb__257; f_LineCur_lcOffset = dtb__258 } -> dtb__255
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcLine = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__259; f_LineCur_lcLine = dtb__260; f_LineCur_lcCol = dtb__261; f_LineCur_lcOffset = dtb__262 } -> dtb__260
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcCol = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__263; f_LineCur_lcLine = dtb__264; f_LineCur_lcCol = dtb__265; f_LineCur_lcOffset = dtb__266 } -> dtb__265
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOffset = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__267; f_LineCur_lcLine = dtb__268; f_LineCur_lcCol = dtb__269; f_LineCur_lcOffset = dtb__270 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommKind = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__271; f_TrivComment_tcommSpan = dtb__272; f_TrivComment_tcommStart = dtb__273; f_TrivComment_tcommEnd = dtb__274 } -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommSpan = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__275; f_TrivComment_tcommSpan = dtb__276; f_TrivComment_tcommStart = dtb__277; f_TrivComment_tcommEnd = dtb__278 } -> dtb__276
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommStart = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__279; f_TrivComment_tcommSpan = dtb__280; f_TrivComment_tcommStart = dtb__281; f_TrivComment_tcommEnd = dtb__282 } -> dtb__281
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommEnd = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__283; f_TrivComment_tcommSpan = dtb__284; f_TrivComment_tcommStart = dtb__285; f_TrivComment_tcommEnd = dtb__286 } -> dtb__286
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstParenDepth = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__287; f_CstSurface_cstBacktick = dtb__288; f_CstSurface_cstSection = dtb__289; f_CstSurface_cstInterpMulti = dtb__290; f_CstSurface_cstHoleTrees = dtb__291 } -> dtb__287
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstBacktick = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__292; f_CstSurface_cstBacktick = dtb__293; f_CstSurface_cstSection = dtb__294; f_CstSurface_cstInterpMulti = dtb__295; f_CstSurface_cstHoleTrees = dtb__296 } -> dtb__293
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSection = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__297; f_CstSurface_cstBacktick = dtb__298; f_CstSurface_cstSection = dtb__299; f_CstSurface_cstInterpMulti = dtb__300; f_CstSurface_cstHoleTrees = dtb__301 } -> dtb__299
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstInterpMulti = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__302; f_CstSurface_cstBacktick = dtb__303; f_CstSurface_cstSection = dtb__304; f_CstSurface_cstInterpMulti = dtb__305; f_CstSurface_cstHoleTrees = dtb__306 } -> dtb__305
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstHoleTrees = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__307; f_CstSurface_cstBacktick = dtb__308; f_CstSurface_cstSection = dtb__309; f_CstSurface_cstInterpMulti = dtb__310; f_CstSurface_cstHoleTrees = dtb__311 } -> dtb__311
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKind = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__312; f_NestFrame_nfId = dtb__313; f_NestFrame_nfStart = dtb__314; f_NestFrame_nfKids = dtb__315; f_NestFrame_nfSem = dtb__316 } -> dtb__312
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfId = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__317; f_NestFrame_nfId = dtb__318; f_NestFrame_nfStart = dtb__319; f_NestFrame_nfKids = dtb__320; f_NestFrame_nfSem = dtb__321 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfStart = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__322; f_NestFrame_nfId = dtb__323; f_NestFrame_nfStart = dtb__324; f_NestFrame_nfKids = dtb__325; f_NestFrame_nfSem = dtb__326 } -> dtb__324
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKids = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__327; f_NestFrame_nfId = dtb__328; f_NestFrame_nfStart = dtb__329; f_NestFrame_nfKids = dtb__330; f_NestFrame_nfSem = dtb__331 } -> dtb__330
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfSem = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__332; f_NestFrame_nfId = dtb__333; f_NestFrame_nfStart = dtb__334; f_NestFrame_nfKids = dtb__335; f_NestFrame_nfSem = dtb__336 } -> dtb__336
  | _ -> failwith "DT: impossible branch"
))

# 738 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffParens = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__337; f_FixityFacts_ffBackticks = dtb__338; f_FixityFacts_ffSections = dtb__339 } -> dtb__337
  | _ -> failwith "DT: impossible branch"
))

# 739 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffBackticks = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__340; f_FixityFacts_ffBackticks = dtb__341; f_FixityFacts_ffSections = dtb__342 } -> dtb__341
  | _ -> failwith "DT: impossible branch"
))

# 740 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffSections = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__343; f_FixityFacts_ffBackticks = dtb__344; f_FixityFacts_ffSections = dtb__345 } -> dtb__345
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feParens = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__346; f_FactEntries_feBackticks = dtb__347; f_FactEntries_feSections = dtb__348 } -> dtb__346
  | _ -> failwith "DT: impossible branch"
))

# 791 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feBackticks = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__349; f_FactEntries_feBackticks = dtb__350; f_FactEntries_feSections = dtb__351 } -> dtb__350
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feSections = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__352; f_FactEntries_feBackticks = dtb__353; f_FactEntries_feSections = dtb__354 } -> dtb__354
  | _ -> failwith "DT: impossible branch"
))

# 855 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciById = (fun (p : t_CstIndex) -> (match p with
  | { f_CstIndex_ciById = dtb__355; f_CstIndex_ciBySpan = dtb__356 } -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciBySpan = (fun (p : t_CstIndex) -> (match p with
  | { f_CstIndex_ciById = dtb__357; f_CstIndex_ciBySpan = dtb__358 } -> dtb__358
  | _ -> failwith "DT: impossible branch"
))

# 859 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaById = (fun (p : t_IndexAcc) -> (match p with
  | { f_IndexAcc_iaById = dtb__359; f_IndexAcc_iaBySpan = dtb__360 } -> dtb__359
  | _ -> failwith "DT: impossible branch"
))

# 860 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaBySpan = (fun (p : t_IndexAcc) -> (match p with
  | { f_IndexAcc_iaById = dtb__361; f_IndexAcc_iaBySpan = dtb__362 } -> dtb__362
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKind = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__363; f_ParenFrame_pfId = dtb__364; f_ParenFrame_pfOpen = dtb__365; f_ParenFrame_pfFirst = dtb__366; f_ParenFrame_pfPrev = dtb__367; f_ParenFrame_pfKids = dtb__368; f_ParenFrame_pfKidKind = dtb__369; f_ParenFrame_pfKidOpen = dtb__370; f_ParenFrame_pfKidEnd = dtb__371; f_ParenFrame_pfKidStructDepth = dtb__372 } -> dtb__363
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfId = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__373; f_ParenFrame_pfId = dtb__374; f_ParenFrame_pfOpen = dtb__375; f_ParenFrame_pfFirst = dtb__376; f_ParenFrame_pfPrev = dtb__377; f_ParenFrame_pfKids = dtb__378; f_ParenFrame_pfKidKind = dtb__379; f_ParenFrame_pfKidOpen = dtb__380; f_ParenFrame_pfKidEnd = dtb__381; f_ParenFrame_pfKidStructDepth = dtb__382 } -> dtb__374
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfOpen = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__383; f_ParenFrame_pfId = dtb__384; f_ParenFrame_pfOpen = dtb__385; f_ParenFrame_pfFirst = dtb__386; f_ParenFrame_pfPrev = dtb__387; f_ParenFrame_pfKids = dtb__388; f_ParenFrame_pfKidKind = dtb__389; f_ParenFrame_pfKidOpen = dtb__390; f_ParenFrame_pfKidEnd = dtb__391; f_ParenFrame_pfKidStructDepth = dtb__392 } -> dtb__385
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfFirst = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__393; f_ParenFrame_pfId = dtb__394; f_ParenFrame_pfOpen = dtb__395; f_ParenFrame_pfFirst = dtb__396; f_ParenFrame_pfPrev = dtb__397; f_ParenFrame_pfKids = dtb__398; f_ParenFrame_pfKidKind = dtb__399; f_ParenFrame_pfKidOpen = dtb__400; f_ParenFrame_pfKidEnd = dtb__401; f_ParenFrame_pfKidStructDepth = dtb__402 } -> dtb__396
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfPrev = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__403; f_ParenFrame_pfId = dtb__404; f_ParenFrame_pfOpen = dtb__405; f_ParenFrame_pfFirst = dtb__406; f_ParenFrame_pfPrev = dtb__407; f_ParenFrame_pfKids = dtb__408; f_ParenFrame_pfKidKind = dtb__409; f_ParenFrame_pfKidOpen = dtb__410; f_ParenFrame_pfKidEnd = dtb__411; f_ParenFrame_pfKidStructDepth = dtb__412 } -> dtb__407
  | _ -> failwith "DT: impossible branch"
))

# 998 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKids = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__413; f_ParenFrame_pfId = dtb__414; f_ParenFrame_pfOpen = dtb__415; f_ParenFrame_pfFirst = dtb__416; f_ParenFrame_pfPrev = dtb__417; f_ParenFrame_pfKids = dtb__418; f_ParenFrame_pfKidKind = dtb__419; f_ParenFrame_pfKidOpen = dtb__420; f_ParenFrame_pfKidEnd = dtb__421; f_ParenFrame_pfKidStructDepth = dtb__422 } -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

# 999 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidKind = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__423; f_ParenFrame_pfId = dtb__424; f_ParenFrame_pfOpen = dtb__425; f_ParenFrame_pfFirst = dtb__426; f_ParenFrame_pfPrev = dtb__427; f_ParenFrame_pfKids = dtb__428; f_ParenFrame_pfKidKind = dtb__429; f_ParenFrame_pfKidOpen = dtb__430; f_ParenFrame_pfKidEnd = dtb__431; f_ParenFrame_pfKidStructDepth = dtb__432 } -> dtb__429
  | _ -> failwith "DT: impossible branch"
))

# 1000 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidOpen = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__433; f_ParenFrame_pfId = dtb__434; f_ParenFrame_pfOpen = dtb__435; f_ParenFrame_pfFirst = dtb__436; f_ParenFrame_pfPrev = dtb__437; f_ParenFrame_pfKids = dtb__438; f_ParenFrame_pfKidKind = dtb__439; f_ParenFrame_pfKidOpen = dtb__440; f_ParenFrame_pfKidEnd = dtb__441; f_ParenFrame_pfKidStructDepth = dtb__442 } -> dtb__440
  | _ -> failwith "DT: impossible branch"
))

# 1001 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidEnd = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__443; f_ParenFrame_pfId = dtb__444; f_ParenFrame_pfOpen = dtb__445; f_ParenFrame_pfFirst = dtb__446; f_ParenFrame_pfPrev = dtb__447; f_ParenFrame_pfKids = dtb__448; f_ParenFrame_pfKidKind = dtb__449; f_ParenFrame_pfKidOpen = dtb__450; f_ParenFrame_pfKidEnd = dtb__451; f_ParenFrame_pfKidStructDepth = dtb__452 } -> dtb__451
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidStructDepth = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__453; f_ParenFrame_pfId = dtb__454; f_ParenFrame_pfOpen = dtb__455; f_ParenFrame_pfFirst = dtb__456; f_ParenFrame_pfPrev = dtb__457; f_ParenFrame_pfKids = dtb__458; f_ParenFrame_pfKidKind = dtb__459; f_ParenFrame_pfKidOpen = dtb__460; f_ParenFrame_pfKidEnd = dtb__461; f_ParenFrame_pfKidStructDepth = dtb__462 } -> dtb__462
  | _ -> failwith "DT: impossible branch"
))
