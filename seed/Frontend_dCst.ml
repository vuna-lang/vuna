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
let v_stepCur = (fun (src : string) (c : t_LineCur) -> (if ((let b = src in let k = (c).f_LineCur_lcOff in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 10) then { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = ((c).f_LineCur_lcLine + 1); f_LineCur_lcCol = 1; f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) } else { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = (c).f_LineCur_lcLine; f_LineCur_lcCol = ((c).f_LineCur_lcCol + 1); f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) }))

# 108 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceTo = (fun (fuel : int) (src : string) (c : t_LineCur) (target : Base_dSource.t_Pos) -> (if (fuel <= 0) then c else (if (if ((c).f_LineCur_lcLine > (Base_dSource.v_posLine target)) then true else (if ((c).f_LineCur_lcLine = (Base_dSource.v_posLine target)) then ((c).f_LineCur_lcCol >= (Base_dSource.v_posCol target)) else false)) then c else (if ((c).f_LineCur_lcOff >= (String.length src)) then c else ((((v_advanceTo (fuel - 1)) src) ((v_stepCur src) c)) target)))))

# 117 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceBy = (fun (fuel : int) (src : string) (c : t_LineCur) (n : int) -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_LineCur_lcOff >= (String.length src)) then c else ((((v_advanceBy (fuel - 1)) src) ((v_stepCur src) c)) (n - 1))))))

# 126 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sliceText = (fun (src : string) (from : int) (to_ : int) -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 133 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanDigitsEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (Frontend_dLexer.v_isDigit (let b = src in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((v_scanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 139 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanStringEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if ((let b = src in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 92) then (((v_scanStringEnd (fuel - 2)) src) (i + 2)) else (if ((let b = src in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 34) then (i + 1) else (((v_scanStringEnd (fuel - 1)) src) (i + 1))))))

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
  | Frontend_dLexer.C_Tok_TTmpl (dtb__9, dtb__10, dtb__11) -> (let endCur = ((((v_advanceTo (String.length mc0)) mc0) mc1) dtb__11) in (let end_ = ((endCur).f_LineCur_lcOff + 1) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ }))
  | Frontend_dLexer.C_Tok_TStr (dtb__12) -> (let end_ = (((v_scanStringEnd (String.length mc0)) mc0) ((mc1).f_LineCur_lcOff + 1)) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ })
  | Frontend_dLexer.C_Tok_TInt (dtb__13) -> (let end_ = (((v_scanDigitsEnd (String.length mc0)) mc0) (mc1).f_LineCur_lcOff) in { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ })
  | Frontend_dLexer.C_Tok_TFloat (dtb__14) -> { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (String.length dtb__14)) }
  | Frontend_dLexer.C_Tok_TSym (dtb__15) -> { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (String.length dtb__15)) }
  | Frontend_dLexer.C_Tok_TKw (dtb__16) -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (String.length dtb__16)) }
  | Frontend_dLexer.C_Tok_TIdent (dtb__17) -> { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (String.length dtb__17)) }
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
let v_tokenNode = (fun (src : string) (curStart : t_LineCur) (prevEnd : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (comments : t_TrivComment B_dData_dList.t_List) (tok : Frontend_dLexer.t_Tok) -> (let textEnd = (((v_tokText src) curStart) tok) in (let text = (B_dData_dPair.v_firstOf textEnd) in (let end_ = (B_dData_dPair.v_secondOf textEnd) in (let curEnd = ((((v_advanceBy (String.length src)) src) curStart) (end_ - (curStart).f_LineCur_lcOff)) in (let startPos = (v_curPos curStart) in (let sp = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_curPos curEnd)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_curPos curEnd)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_curPos curEnd)) } in { B_dData_dPair.f_Pair_first = { f_CstToken_cstTag = (v_tokTag tok); f_CstToken_cstText = text; f_CstToken_cstSpan = sp; f_CstToken_cstLeading = ((((v_gapTrivia src) prevEnd) { B_dData_dPair.f_Pair_first = (curStart).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = startPos }) comments) }; B_dData_dPair.f_Pair_second = curEnd })))))))

# 293 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildTokens = (fun (mc0 : string) (mc1 : t_TrivComment B_dData_dList.t_List) (mc2 : t_LineCur) (mc3 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (let curStart = ((((v_advanceTo (String.length mc0)) mc0) mc2) (dtb__27).Frontend_dLexer.f_PTok_ptokPos) in (let start = (curStart).f_LineCur_lcOff in (let before = ((v_takeCommentsBefore start) mc1) in (let live = ((B_dData_dList.v_filter (v_commentStartsAtOrAfter (B_dData_dPair.v_firstOf mc3))) (B_dData_dPair.v_firstOf before)) in (let node = (((((v_tokenNode mc0) curStart) mc3) live) (dtb__27).Frontend_dLexer.f_PTok_ptokTok) in (let curEnd = (B_dData_dPair.v_secondOf node) in (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf node), (((((v_buildTokens mc0) (B_dData_dPair.v_secondOf before)) curEnd) { B_dData_dPair.f_Pair_first = (curEnd).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = (v_curPos curEnd) }) dtb__28)))))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOf = (fun (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (comments : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (let fuel = ((String.length source) + 1) in (let tcs = ((((v_toTrivComments fuel) source) v_lineCurStart) comments) in (((((v_buildTokens source) (B_dData_dPair.v_firstOf tcs)) v_lineCurStart) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }) toks))))

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

# 490 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_CstNode_CstLeaf (dtb__75) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildrenAll = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((B_dData_dList.v_append dtb__81) (dtb__79).f_CstSurface_cstHoleTrees)
  | C_CstNode_CstLeaf (dtb__82) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__89) -> (B_dData_dMaybe.C_Maybe_Just (dtb__89))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 507 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (v_cstKindTag dtb__90)
  | C_CstNode_CstLeaf (dtb__96) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine a); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol a); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine b); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol b); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset a); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset b) })

# 567 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 571 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (mc0 : Base_dSource.t_Span) (mc1 : Base_dSource.t_Span B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> ((v_lastSpanOfList dtb__97) dtb__98)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (d : Base_dSource.t_Span) (kids : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList d) ((B_dData_dList.v_map v_nodeSpan) kids)))

# 580 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_CstToken B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (dtb__99).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (f : t_NestFrame) -> (let kids = (B_dData_dList.v_reverse (f).f_NestFrame_nfKids) in (let endSp = ((v_lastSpanOf (f).f_NestFrame_nfStart) kids) in (C_CstNode_CstBranch ((f).f_NestFrame_nfKind, (f).f_NestFrame_nfId, ((v_spanFrom (f).f_NestFrame_nfStart) endSp), v_emptyCstSurface, (f).f_NestFrame_nfSem, kids)))))

# 593 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__101).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__101).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__101).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse mc0)) (dtb__101).f_NestFrame_nfKids); f_NestFrame_nfSem = (dtb__101).f_NestFrame_nfSem }, dtb__102))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 599 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (node : t_CstNode) (f : t_NestFrame) -> { f_NestFrame_nfKind = (f).f_NestFrame_nfKind; f_NestFrame_nfId = (f).f_NestFrame_nfId; f_NestFrame_nfStart = (f).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_NestFrame_nfKids)); f_NestFrame_nfSem = (f).f_NestFrame_nfSem })

# 603 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (mc0 : t_CstNode) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto mc0) dtb__103), dtb__104))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachSem = (fun (mc0 : t_CstSem) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__105).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__105).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__105).f_NestFrame_nfStart; f_NestFrame_nfKids = (dtb__105).f_NestFrame_nfKids; f_NestFrame_nfSem = (B_dData_dMaybe.C_Maybe_Just (mc0)) }, dtb__106))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__108 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb__107)) dtb__109), dtb__110))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__107, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (1 + (v_nestFrameCount dtb__112))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (fuel : int) (frames : t_NestFrame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (let nd_uscrut2 = frames in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (match dtb__114 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> ((v_closeAllFrames (fuel - 1)) (v_closeTopFrame frames))
  | _ -> frames
)
  | _ -> frames
))))

# 634 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (mc0 : t_NodeEvent) -> (match mc0 with
  | C_NodeEvent_EvClose (dtb__117) -> dtb__117
  | C_NodeEvent_EvSem (dtb__118, dtb__119) -> 0
  | C_NodeEvent_EvOpen (dtb__120, dtb__121, dtb__122) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (mc0 : t_CstToken B_dData_dList.t_List) (mc1 : int) (mc2 : t_NestFrame B_dData_dList.t_List) (mc3 : t_NodeEvent B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | C_NodeEvent_EvSem (dtb__125, dtb__126) -> ((((v_nestEvents mc0) mc1) ((v_attachSem dtb__126) mc2)) dtb__124)
  | _ -> (let at = (v_eventIndex dtb__123) in (let n = (at - mc1) in (let live2 = ((B_dData_dList.v_drop n) mc0) in (let frames1 = ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) ((B_dData_dList.v_take n) mc0))) mc2) in (match dtb__123 with
  | C_NodeEvent_EvSem (dtb__127, dtb__128) -> ((((v_nestEvents live2) at) ((v_attachSem dtb__128) frames1)) dtb__124)
  | C_NodeEvent_EvOpen (dtb__129, dtb__130, dtb__131) -> ((((v_nestEvents live2) at) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb__129; f_NestFrame_nfId = dtb__131; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) live2); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing }, frames1))) dtb__124)
  | C_NodeEvent_EvClose (dtb__132) -> ((((v_nestEvents live2) at) (v_closeTopFrame frames1)) dtb__124)
  | _ -> failwith "DT: impossible branch"
)))))
)
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount mc2) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) mc0)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, mc0, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb__133).f_NestFrame_nfId, mc0, v_emptyCstSurface, (dtb__133).f_NestFrame_nfSem, (B_dData_dList.v_reverse (dtb__133).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (t : t_CstToken) -> (t).f_CstToken_cstSpan)

# 675 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> ((v_spanFrom (dtb__135).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb__135).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb__136)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (let root = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) toks); f_NestFrame_nfKids = B_dData_dList.C_List_Nil; f_NestFrame_nfSem = B_dData_dMaybe.C_Maybe_Nothing } in (let frames = ((((v_nestEvents toks) 0) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) events) in (let sp = (v_tokensSpan toks) in ((v_finishRoot sp) frames)))))

# 693 "Vuna/Compiler/Frontend/Cst.vuna"
let v_holeRootOf = (fun (node : t_CstNode) -> (let nd_uscrut1 = (v_nodeChildren node) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match dtb__138 with
  | B_dData_dList.C_List_Nil -> dtb__137
  | _ -> node
)
  | _ -> node
)))

# 735 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupHoleTrees = (fun (mc0 : int) (mc1 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__141; B_dData_dPair.f_Pair_second = dtb__142 } -> (if (dtb__141 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__142)) else ((v_lookupHoleTrees mc0) dtb__140))
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
let v_parenDepthOfFacts = (fun (f : t_FixityFacts) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (f).f_FixityFacts_ffParens) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> dtb__143
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 779 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupBacktick = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (if ((B_dData_dPair.v_firstOf dtb__144) = mc0) then (B_dData_dPair.v_secondOf dtb__144) else ((v_lookupBacktick mc0) dtb__145))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 776 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfFacts = (fun (f : t_FixityFacts) (nid : int) -> ((v_lookupBacktick nid) (f).f_FixityFacts_ffBackticks))

# 787 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupSection = (fun (mc0 : int) (mc1 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (if ((B_dData_dPair.v_firstOf dtb__146) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__146))) else ((v_lookupSection mc0) dtb__147))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfFacts = (fun (f : t_FixityFacts) (sp : Base_dSource.t_Span) -> ((v_lookupSection (Base_dSource.v_spanStartOffset sp)) (f).f_FixityFacts_ffSections))

# 793 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupInterp = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (if ((B_dData_dPair.v_firstOf dtb__148) = mc0) then (B_dData_dPair.v_secondOf dtb__148) else ((v_lookupInterp mc0) dtb__149))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_applySurfaceTree = (fun (mc0 : (int, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : t_CstNode) -> (match mc5 with
  | C_CstNode_CstBranch (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (let parenDepth = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__151) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> dtb__157
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (let surface = { f_CstSurface_cstParenDepth = parenDepth; f_CstSurface_cstBacktick = ((v_lookupBacktick dtb__151) mc1); f_CstSurface_cstSection = ((v_lookupSection (Base_dSource.v_spanStartOffset dtb__152)) mc2); f_CstSurface_cstInterpMulti = (if ((v_lookupInterp (Base_dSource.v_spanStartOffset dtb__152)) mc3) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing); f_CstSurface_cstHoleTrees = (match ((v_lookupHoleTrees dtb__151) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> dtb__156
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) } in (C_CstNode_CstBranch (dtb__150, dtb__151, dtb__152, surface, dtb__154, ((B_dData_dList.v_map (((((v_applySurfaceTree mc0) mc1) mc2) mc3) mc4)) dtb__155)))))
  | C_CstNode_CstLeaf (dtb__158) -> (C_CstNode_CstLeaf (dtb__158))
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTreeWithSurface = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) (parenEntries : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (interps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeTrees : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let parens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries) in ((((((v_applySurfaceTree parens) backticks) sections) interps) holeTrees) ((v_nestToTree toks) events))))

# 802 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFactEntries = { f_FactEntries_feParens = B_dData_dList.C_List_Nil; f_FactEntries_feBackticks = B_dData_dList.C_List_Nil; f_FactEntries_feSections = B_dData_dList.C_List_Nil }

# 805 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_factsGo = (fun (mc0 : t_CstNode) (mc1 : t_FactEntries) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (let acc1 = (if ((dtb__162).f_CstSurface_cstParenDepth > 0) then { mc1 with f_FactEntries_feParens = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = (dtb__162).f_CstSurface_cstParenDepth }, (mc1).f_FactEntries_feParens)) } else mc1) in (let acc2 = (if (dtb__162).f_CstSurface_cstBacktick then { acc1 with f_FactEntries_feBackticks = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = true }, (acc1).f_FactEntries_feBackticks)) } else acc1) in (let acc3 = (match (dtb__162).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> { acc2 with f_FactEntries_feSections = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__161); B_dData_dPair.f_Pair_second = dtb__165 }, (acc2).f_FactEntries_feSections)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> acc2
  | _ -> failwith "DT: impossible branch"
) in ((v_factsGoList (dtb__162).f_CstSurface_cstHoleTrees) ((v_factsGoList dtb__164) acc3)))))
  | C_CstNode_CstLeaf (dtb__166) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 822 "Vuna/Compiler/Frontend/Cst.vuna"
and v_factsGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_FactEntries) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> ((v_factsGoList dtb__168) ((v_factsGo dtb__167) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOf = (fun (root : t_CstNode) -> (let entries = ((v_factsGo root) v_emptyFactEntries) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (entries).f_FactEntries_feParens); f_FixityFacts_ffBackticks = (entries).f_FactEntries_feBackticks; f_FixityFacts_ffSections = (entries).f_FactEntries_feSections }))

# 831 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOfParts = (fun (parens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeRoots : t_CstNode B_dData_dList.t_List) -> (let holes = ((v_factsGoList holeRoots) v_emptyFactEntries) in (let liveParens = ((B_dData_dList.v_filter (fun (p : (int, int) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf p) > 0))) parens) in (let liveBackticks = ((B_dData_dList.v_filter (fun (p : (int, bool) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) backticks) in (let parenEntries = ((B_dData_dList.v_append liveParens) (holes).f_FactEntries_feParens) in (let backtickEntries = ((B_dData_dList.v_append liveBackticks) (holes).f_FactEntries_feBackticks) in (let sectionEntries = ((B_dData_dList.v_append sections) (holes).f_FactEntries_feSections) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries); f_FixityFacts_ffBackticks = backtickEntries; f_FixityFacts_ffSections = sectionEntries })))))))

# 843 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb__174)
  | C_CstNode_CstLeaf (dtb__175) -> (B_dData_dList.C_List__x58__x58_ (dtb__175, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 854 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTableAt = (fun (fuel : int) (node : t_CstNode) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match node with
  | C_CstNode_CstLeaf (dtb__176) -> B_dData_dList.C_List_Nil
  | C_CstNode_CstBranch (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = node }, ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (v_nodeTableAt (fuel - 1))) dtb__182)) ((B_dData_dList.v_concatMap (v_nodeTableAt (fuel - 1))) (dtb__180).f_CstSurface_cstHoleTrees))))
  | _ -> failwith "DT: impossible branch"
)))

# 849 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeTable = (fun (n : t_CstNode) -> ((v_nodeTableAt 1000000) n))

# 865 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (tree : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable tree)))

# 881 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyIndexAcc = { f_IndexAcc_iaById = B_dData_dList.C_List_Nil; f_IndexAcc_iaBySpan = B_dData_dList.C_List_Nil }

# 890 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_indexGo = (fun (mc0 : t_CstNode) (mc1 : t_IndexAcc) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> (let hasIdFact = (if ((dtb__186).f_CstSurface_cstParenDepth > 0) then true else (dtb__186).f_CstSurface_cstBacktick) in (let hasSpanFact = (match (dtb__186).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb__186).f_CstSurface_cstInterpMulti with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (let acc1 = (if hasIdFact then { mc1 with f_IndexAcc_iaById = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = mc0 }, (mc1).f_IndexAcc_iaById)) } else mc1) in (let acc2 = (if hasSpanFact then { acc1 with f_IndexAcc_iaBySpan = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__185); B_dData_dPair.f_Pair_second = mc0 }, (acc1).f_IndexAcc_iaBySpan)) } else acc1) in ((v_indexGoList (dtb__186).f_CstSurface_cstHoleTrees) ((v_indexGoList dtb__188) acc2))))))
  | C_CstNode_CstLeaf (dtb__191) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 907 "Vuna/Compiler/Frontend/Cst.vuna"
and v_indexGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_IndexAcc) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> ((v_indexGoList dtb__193) ((v_indexGo dtb__192) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstIndexOf = (fun (root : t_CstNode) -> (let acc = ((v_indexGo root) v_emptyIndexAcc) in { f_CstIndex_ciById = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaById); f_CstIndex_ciBySpan = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaBySpan) }))

# 917 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyNodeTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = (C_CstNode_CstBranch (C_CstKind_CstFileKind, v_emptyKey, Base_dSource.v_spanEmpty, v_emptyCstSurface, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))))

# 912 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstIndex = { f_CstIndex_ciById = v_emptyNodeTable; f_CstIndex_ciBySpan = v_emptyNodeTable }

# 924 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (let s = (v_nodeSurface dtb__194) in (s).f_CstSurface_cstParenDepth)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (let s = (v_nodeSurface dtb__195) in (s).f_CstSurface_cstBacktick)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (let s = (v_nodeSurface dtb__196) in (s).f_CstSurface_cstSection)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 954 "Vuna/Compiler/Frontend/Cst.vuna"
let v_interpMultiOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (let s = (v_nodeSurface dtb__197) in (let nd_uscrut5 = (s).f_CstSurface_cstInterpMulti in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (if dtb__198 then true else false)
  | _ -> false
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 966 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__204))
  | C_CstNode_CstLeaf (dtb__205) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__205))
  | _ -> failwith "DT: impossible branch"
))

# 978 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_anchorRefsOfTree = (fun (mc0 : (t_CstKind) -> bool) (mc1 : t_CstNode) -> (match mc1 with
  | C_CstNode_CstBranch (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> ((B_dData_dList.v_append (if (mc0 dtb__206) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((B_dData_dList.v_concatMap (v_anchorRefsOfTree mc0)) dtb__211))
  | C_CstNode_CstLeaf (dtb__212) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOpOf = (fun (mc0 : t_SectionShape) -> (match mc0 with
  | C_SectionShape_SectionRight (dtb__213) -> dtb__213
  | C_SectionShape_SectionLeft (dtb__214) -> dtb__214
  | C_SectionShape_SectionOp (dtb__215) -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Frontend/Cst.vuna"
let v_openFrame = (fun (kind : t_CstKind) (nid : int) (at : int) (first : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> { f_ParenFrame_pfKind = kind; f_ParenFrame_pfId = nid; f_ParenFrame_pfOpen = at; f_ParenFrame_pfFirst = first; f_ParenFrame_pfPrev = prev; f_ParenFrame_pfKids = 0; f_ParenFrame_pfKidKind = B_dData_dMaybe.C_Maybe_Nothing; f_ParenFrame_pfKidOpen = 0; f_ParenFrame_pfKidEnd = 0; f_ParenFrame_pfKidStructDepth = 0 })

# 1029 "Vuna/Compiler/Frontend/Cst.vuna"
let v_addKid = (fun (kind : t_CstKind) (open_ : int) (end_ : int) (structD : int) (f : t_ParenFrame) -> { f_ParenFrame_pfKind = (f).f_ParenFrame_pfKind; f_ParenFrame_pfId = (f).f_ParenFrame_pfId; f_ParenFrame_pfOpen = (f).f_ParenFrame_pfOpen; f_ParenFrame_pfFirst = (f).f_ParenFrame_pfFirst; f_ParenFrame_pfPrev = (f).f_ParenFrame_pfPrev; f_ParenFrame_pfKids = ((f).f_ParenFrame_pfKids + 1); f_ParenFrame_pfKidKind = (B_dData_dMaybe.C_Maybe_Just (kind)); f_ParenFrame_pfKidOpen = open_; f_ParenFrame_pfKidEnd = end_; f_ParenFrame_pfKidStructDepth = structD })

# 1049 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isOpenParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> (match dtb__216 with
  | Frontend_dLexer.C_Tok_TSym (dtb__217) -> (if (dtb__217 = "(") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1053 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isCloseParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (match dtb__218 with
  | Frontend_dLexer.C_Tok_TSym (dtb__219) -> (if (dtb__219 = ")") then true else false)
  | _ -> false
)
  | _ -> false
))

# 1035 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isParenFrame = (fun (endIdx : int) (lastTok : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (f : t_ParenFrame) -> (match (f).f_ParenFrame_pfKind with
  | C_CstKind_CstExprKind -> (if ((f).f_ParenFrame_pfKids = 1) then (let nd_uscrut3 = (f).f_ParenFrame_pfKidKind in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (match dtb__220 with
  | C_CstKind_CstExprKind -> (if (if (if (v_isOpenParen (f).f_ParenFrame_pfFirst) then (v_isCloseParen lastTok) else false) then ((f).f_ParenFrame_pfKidOpen = ((f).f_ParenFrame_pfOpen + 1)) else false) then ((f).f_ParenFrame_pfKidEnd = (endIdx - 1)) else false)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
))

# 1057 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isExprFrame = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstExprKind -> true
  | _ -> false
))

# 1062 "Vuna/Compiler/Frontend/Cst.vuna"
let v_adjacentParenDepth = (fun (kind : t_CstKind) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (next : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (if (if (if (v_isExprFrame kind) then (v_isOpenParen prev) else false) then (v_isCloseParen next) else false) then 1 else 0))

# 1067 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeParen = (fun (n : int) (last : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (n <= 0) then { B_dData_dPair.f_Pair_first = toks; B_dData_dPair.f_Pair_second = last } else (match toks with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = last }
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (((v_consumeParen (n - 1)) (B_dData_dMaybe.C_Maybe_Just ((dtb__221).Frontend_dLexer.f_PTok_ptokTok))) dtb__222)
  | _ -> failwith "DT: impossible branch"
)))

# 1076 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headTokOf = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__223).Frontend_dLexer.f_PTok_ptokTok))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1081 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_parenWalk = (fun (mc0 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : t_ParenFrame B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc5 : t_NodeEvent B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match dtb__225 with
  | C_NodeEvent_EvClose (dtb__227) -> (let step = (((v_consumeParen (dtb__227 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in (match mc1 with
  | B_dData_dList.C_List_Nil -> ((((((v_parenWalk mc0) B_dData_dList.C_List_Nil) dtb__227) last2) live) dtb__226)
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (let structD = (if (((v_isParenFrame dtb__227) last2) dtb__228) then ((dtb__228).f_ParenFrame_pfKidStructDepth + 1) else 0) in (let total = (structD + (((v_adjacentParenDepth (dtb__228).f_ParenFrame_pfKind) (dtb__228).f_ParenFrame_pfPrev) (v_headTokOf live))) in (let acc2 = (if (total > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__228).f_ParenFrame_pfId; B_dData_dPair.f_Pair_second = total }, mc0)) else mc0) in (let outer2 = (match dtb__229 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ ((((((v_addKid (dtb__228).f_ParenFrame_pfKind) (dtb__228).f_ParenFrame_pfOpen) dtb__227) structD) dtb__230), dtb__231))
  | _ -> failwith "DT: impossible branch"
) in ((((((v_parenWalk acc2) outer2) dtb__227) last2) live) dtb__226)))))
  | _ -> failwith "DT: impossible branch"
))))
  | C_NodeEvent_EvOpen (dtb__232, dtb__233, dtb__234) -> (let step = (((v_consumeParen (dtb__233 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in ((((((v_parenWalk mc0) (B_dData_dList.C_List__x58__x58_ ((((((v_openFrame dtb__232) dtb__234) dtb__233) (v_headTokOf live)) last2), mc1))) dtb__233) last2) live) dtb__226))))
  | C_NodeEvent_EvSem (dtb__235, dtb__236) -> ((((((v_parenWalk mc0) mc1) mc2) mc3) mc4) dtb__226)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1110 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenEntriesOf = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> ((((((v_parenWalk B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) 0) B_dData_dMaybe.C_Maybe_Nothing) toks) events))

# 63 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaKind = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__237; f_Trivia_triviaText = dtb__238; f_Trivia_triviaSpan = dtb__239 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaText = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__240; f_Trivia_triviaText = dtb__241; f_Trivia_triviaSpan = dtb__242 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaSpan = (fun (p : t_Trivia) -> (match p with
  | { f_Trivia_triviaKind = dtb__243; f_Trivia_triviaText = dtb__244; f_Trivia_triviaSpan = dtb__245 } -> dtb__245
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstTag = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__246; f_CstToken_cstText = dtb__247; f_CstToken_cstSpan = dtb__248; f_CstToken_cstLeading = dtb__249 } -> dtb__246
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstText = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__250; f_CstToken_cstText = dtb__251; f_CstToken_cstSpan = dtb__252; f_CstToken_cstLeading = dtb__253 } -> dtb__251
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSpan = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__254; f_CstToken_cstText = dtb__255; f_CstToken_cstSpan = dtb__256; f_CstToken_cstLeading = dtb__257 } -> dtb__256
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstLeading = (fun (p : t_CstToken) -> (match p with
  | { f_CstToken_cstTag = dtb__258; f_CstToken_cstText = dtb__259; f_CstToken_cstSpan = dtb__260; f_CstToken_cstLeading = dtb__261 } -> dtb__261
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOff = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__262; f_LineCur_lcLine = dtb__263; f_LineCur_lcCol = dtb__264; f_LineCur_lcOffset = dtb__265 } -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcLine = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__266; f_LineCur_lcLine = dtb__267; f_LineCur_lcCol = dtb__268; f_LineCur_lcOffset = dtb__269 } -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcCol = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__270; f_LineCur_lcLine = dtb__271; f_LineCur_lcCol = dtb__272; f_LineCur_lcOffset = dtb__273 } -> dtb__272
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lcOffset = (fun (p : t_LineCur) -> (match p with
  | { f_LineCur_lcOff = dtb__274; f_LineCur_lcLine = dtb__275; f_LineCur_lcCol = dtb__276; f_LineCur_lcOffset = dtb__277 } -> dtb__277
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommKind = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__278; f_TrivComment_tcommSpan = dtb__279; f_TrivComment_tcommStart = dtb__280; f_TrivComment_tcommEnd = dtb__281 } -> dtb__278
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommSpan = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__282; f_TrivComment_tcommSpan = dtb__283; f_TrivComment_tcommStart = dtb__284; f_TrivComment_tcommEnd = dtb__285 } -> dtb__283
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommStart = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__286; f_TrivComment_tcommSpan = dtb__287; f_TrivComment_tcommStart = dtb__288; f_TrivComment_tcommEnd = dtb__289 } -> dtb__288
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tcommEnd = (fun (p : t_TrivComment) -> (match p with
  | { f_TrivComment_tcommKind = dtb__290; f_TrivComment_tcommSpan = dtb__291; f_TrivComment_tcommStart = dtb__292; f_TrivComment_tcommEnd = dtb__293 } -> dtb__293
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstParenDepth = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__294; f_CstSurface_cstBacktick = dtb__295; f_CstSurface_cstSection = dtb__296; f_CstSurface_cstInterpMulti = dtb__297; f_CstSurface_cstHoleTrees = dtb__298 } -> dtb__294
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstBacktick = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__299; f_CstSurface_cstBacktick = dtb__300; f_CstSurface_cstSection = dtb__301; f_CstSurface_cstInterpMulti = dtb__302; f_CstSurface_cstHoleTrees = dtb__303 } -> dtb__300
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstSection = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__304; f_CstSurface_cstBacktick = dtb__305; f_CstSurface_cstSection = dtb__306; f_CstSurface_cstInterpMulti = dtb__307; f_CstSurface_cstHoleTrees = dtb__308 } -> dtb__306
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstInterpMulti = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__309; f_CstSurface_cstBacktick = dtb__310; f_CstSurface_cstSection = dtb__311; f_CstSurface_cstInterpMulti = dtb__312; f_CstSurface_cstHoleTrees = dtb__313 } -> dtb__312
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstHoleTrees = (fun (p : t_CstSurface) -> (match p with
  | { f_CstSurface_cstParenDepth = dtb__314; f_CstSurface_cstBacktick = dtb__315; f_CstSurface_cstSection = dtb__316; f_CstSurface_cstInterpMulti = dtb__317; f_CstSurface_cstHoleTrees = dtb__318 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKind = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__319; f_NestFrame_nfId = dtb__320; f_NestFrame_nfStart = dtb__321; f_NestFrame_nfKids = dtb__322; f_NestFrame_nfSem = dtb__323 } -> dtb__319
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfId = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__324; f_NestFrame_nfId = dtb__325; f_NestFrame_nfStart = dtb__326; f_NestFrame_nfKids = dtb__327; f_NestFrame_nfSem = dtb__328 } -> dtb__325
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfStart = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__329; f_NestFrame_nfId = dtb__330; f_NestFrame_nfStart = dtb__331; f_NestFrame_nfKids = dtb__332; f_NestFrame_nfSem = dtb__333 } -> dtb__331
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfKids = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__334; f_NestFrame_nfId = dtb__335; f_NestFrame_nfStart = dtb__336; f_NestFrame_nfKids = dtb__337; f_NestFrame_nfSem = dtb__338 } -> dtb__337
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nfSem = (fun (p : t_NestFrame) -> (match p with
  | { f_NestFrame_nfKind = dtb__339; f_NestFrame_nfId = dtb__340; f_NestFrame_nfStart = dtb__341; f_NestFrame_nfKids = dtb__342; f_NestFrame_nfSem = dtb__343 } -> dtb__343
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffParens = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__344; f_FixityFacts_ffBackticks = dtb__345; f_FixityFacts_ffSections = dtb__346 } -> dtb__344
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffBackticks = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__347; f_FixityFacts_ffBackticks = dtb__348; f_FixityFacts_ffSections = dtb__349 } -> dtb__348
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ffSections = (fun (p : t_FixityFacts) -> (match p with
  | { f_FixityFacts_ffParens = dtb__350; f_FixityFacts_ffBackticks = dtb__351; f_FixityFacts_ffSections = dtb__352 } -> dtb__352
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feParens = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__353; f_FactEntries_feBackticks = dtb__354; f_FactEntries_feSections = dtb__355 } -> dtb__353
  | _ -> failwith "DT: impossible branch"
))

# 798 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feBackticks = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__356; f_FactEntries_feBackticks = dtb__357; f_FactEntries_feSections = dtb__358 } -> dtb__357
  | _ -> failwith "DT: impossible branch"
))

# 799 "Vuna/Compiler/Frontend/Cst.vuna"
let v_feSections = (fun (p : t_FactEntries) -> (match p with
  | { f_FactEntries_feParens = dtb__359; f_FactEntries_feBackticks = dtb__360; f_FactEntries_feSections = dtb__361 } -> dtb__361
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciById = (fun (p : t_CstIndex) -> (match p with
  | { f_CstIndex_ciById = dtb__362; f_CstIndex_ciBySpan = dtb__363 } -> dtb__362
  | _ -> failwith "DT: impossible branch"
))

# 874 "Vuna/Compiler/Frontend/Cst.vuna"
let v_ciBySpan = (fun (p : t_CstIndex) -> (match p with
  | { f_CstIndex_ciById = dtb__364; f_CstIndex_ciBySpan = dtb__365 } -> dtb__365
  | _ -> failwith "DT: impossible branch"
))

# 877 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaById = (fun (p : t_IndexAcc) -> (match p with
  | { f_IndexAcc_iaById = dtb__366; f_IndexAcc_iaBySpan = dtb__367 } -> dtb__366
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Frontend/Cst.vuna"
let v_iaBySpan = (fun (p : t_IndexAcc) -> (match p with
  | { f_IndexAcc_iaById = dtb__368; f_IndexAcc_iaBySpan = dtb__369 } -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

# 1013 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKind = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__370; f_ParenFrame_pfId = dtb__371; f_ParenFrame_pfOpen = dtb__372; f_ParenFrame_pfFirst = dtb__373; f_ParenFrame_pfPrev = dtb__374; f_ParenFrame_pfKids = dtb__375; f_ParenFrame_pfKidKind = dtb__376; f_ParenFrame_pfKidOpen = dtb__377; f_ParenFrame_pfKidEnd = dtb__378; f_ParenFrame_pfKidStructDepth = dtb__379 } -> dtb__370
  | _ -> failwith "DT: impossible branch"
))

# 1014 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfId = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__380; f_ParenFrame_pfId = dtb__381; f_ParenFrame_pfOpen = dtb__382; f_ParenFrame_pfFirst = dtb__383; f_ParenFrame_pfPrev = dtb__384; f_ParenFrame_pfKids = dtb__385; f_ParenFrame_pfKidKind = dtb__386; f_ParenFrame_pfKidOpen = dtb__387; f_ParenFrame_pfKidEnd = dtb__388; f_ParenFrame_pfKidStructDepth = dtb__389 } -> dtb__381
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfOpen = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__390; f_ParenFrame_pfId = dtb__391; f_ParenFrame_pfOpen = dtb__392; f_ParenFrame_pfFirst = dtb__393; f_ParenFrame_pfPrev = dtb__394; f_ParenFrame_pfKids = dtb__395; f_ParenFrame_pfKidKind = dtb__396; f_ParenFrame_pfKidOpen = dtb__397; f_ParenFrame_pfKidEnd = dtb__398; f_ParenFrame_pfKidStructDepth = dtb__399 } -> dtb__392
  | _ -> failwith "DT: impossible branch"
))

# 1016 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfFirst = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__400; f_ParenFrame_pfId = dtb__401; f_ParenFrame_pfOpen = dtb__402; f_ParenFrame_pfFirst = dtb__403; f_ParenFrame_pfPrev = dtb__404; f_ParenFrame_pfKids = dtb__405; f_ParenFrame_pfKidKind = dtb__406; f_ParenFrame_pfKidOpen = dtb__407; f_ParenFrame_pfKidEnd = dtb__408; f_ParenFrame_pfKidStructDepth = dtb__409 } -> dtb__403
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfPrev = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__410; f_ParenFrame_pfId = dtb__411; f_ParenFrame_pfOpen = dtb__412; f_ParenFrame_pfFirst = dtb__413; f_ParenFrame_pfPrev = dtb__414; f_ParenFrame_pfKids = dtb__415; f_ParenFrame_pfKidKind = dtb__416; f_ParenFrame_pfKidOpen = dtb__417; f_ParenFrame_pfKidEnd = dtb__418; f_ParenFrame_pfKidStructDepth = dtb__419 } -> dtb__414
  | _ -> failwith "DT: impossible branch"
))

# 1018 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKids = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__420; f_ParenFrame_pfId = dtb__421; f_ParenFrame_pfOpen = dtb__422; f_ParenFrame_pfFirst = dtb__423; f_ParenFrame_pfPrev = dtb__424; f_ParenFrame_pfKids = dtb__425; f_ParenFrame_pfKidKind = dtb__426; f_ParenFrame_pfKidOpen = dtb__427; f_ParenFrame_pfKidEnd = dtb__428; f_ParenFrame_pfKidStructDepth = dtb__429 } -> dtb__425
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidKind = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__430; f_ParenFrame_pfId = dtb__431; f_ParenFrame_pfOpen = dtb__432; f_ParenFrame_pfFirst = dtb__433; f_ParenFrame_pfPrev = dtb__434; f_ParenFrame_pfKids = dtb__435; f_ParenFrame_pfKidKind = dtb__436; f_ParenFrame_pfKidOpen = dtb__437; f_ParenFrame_pfKidEnd = dtb__438; f_ParenFrame_pfKidStructDepth = dtb__439 } -> dtb__436
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidOpen = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__440; f_ParenFrame_pfId = dtb__441; f_ParenFrame_pfOpen = dtb__442; f_ParenFrame_pfFirst = dtb__443; f_ParenFrame_pfPrev = dtb__444; f_ParenFrame_pfKids = dtb__445; f_ParenFrame_pfKidKind = dtb__446; f_ParenFrame_pfKidOpen = dtb__447; f_ParenFrame_pfKidEnd = dtb__448; f_ParenFrame_pfKidStructDepth = dtb__449 } -> dtb__447
  | _ -> failwith "DT: impossible branch"
))

# 1021 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidEnd = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__450; f_ParenFrame_pfId = dtb__451; f_ParenFrame_pfOpen = dtb__452; f_ParenFrame_pfFirst = dtb__453; f_ParenFrame_pfPrev = dtb__454; f_ParenFrame_pfKids = dtb__455; f_ParenFrame_pfKidKind = dtb__456; f_ParenFrame_pfKidOpen = dtb__457; f_ParenFrame_pfKidEnd = dtb__458; f_ParenFrame_pfKidStructDepth = dtb__459 } -> dtb__458
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pfKidStructDepth = (fun (p : t_ParenFrame) -> (match p with
  | { f_ParenFrame_pfKind = dtb__460; f_ParenFrame_pfId = dtb__461; f_ParenFrame_pfOpen = dtb__462; f_ParenFrame_pfFirst = dtb__463; f_ParenFrame_pfPrev = dtb__464; f_ParenFrame_pfKids = dtb__465; f_ParenFrame_pfKidKind = dtb__466; f_ParenFrame_pfKidOpen = dtb__467; f_ParenFrame_pfKidEnd = dtb__468; f_ParenFrame_pfKidStructDepth = dtb__469 } -> dtb__469
  | _ -> failwith "DT: impossible branch"
))
