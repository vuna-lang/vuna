open Vuna_runtime
type t_TriviaKind = C_TriviaKind_TrivSpace | C_TriviaKind_TrivLineComment | C_TriviaKind_TrivBlockComment
and t_Trivia = { f_Trivia_triviaKind : t_TriviaKind; f_Trivia_triviaText : string; f_Trivia_triviaSpan : Base_dSource.t_Span }
and t_CstToken = { f_CstToken_cstTag : string; f_CstToken_cstText : string; f_CstToken_cstSpan : Base_dSource.t_Span; f_CstToken_cstLeading : t_Trivia B_dData_dList.t_List }
and t_LineCur = { f_LineCur_lcOff : int; f_LineCur_lcLine : int; f_LineCur_lcCol : int; f_LineCur_lcOffset : int }
and t_TrivComment = { f_TrivComment_tcommKind : Frontend_dLexer.t_CKind; f_TrivComment_tcommSpan : Base_dSource.t_Span; f_TrivComment_tcommStart : int; f_TrivComment_tcommEnd : int }
and t_CstKind = C_CstKind_CstFileKind | C_CstKind_CstModHeadKind | C_CstKind_CstImportKind | C_CstKind_CstFixityKind | C_CstKind_CstExportItemKind | C_CstKind_CstDeclKind | C_CstKind_CstCtorKind | C_CstKind_CstFieldKind | C_CstKind_CstMethodKind | C_CstKind_CstBindingKind | C_CstKind_CstAltKind | C_CstKind_CstExprKind | C_CstKind_CstPatKind | C_CstKind_CstDoStmtKind
and t_CstSurface = { f_CstSurface_cstParenDepth : int; f_CstSurface_cstBacktick : bool; f_CstSurface_cstSection : t_SectionShape B_dData_dMaybe.t_Maybe; f_CstSurface_cstInterpMulti : bool B_dData_dMaybe.t_Maybe; f_CstSurface_cstHoleTrees : t_CstNode B_dData_dList.t_List }
and t_CstNode = C_CstNode_CstLeaf of (t_CstToken) | C_CstNode_CstBranch of (t_CstKind) * (int) * (Base_dSource.t_Span) * (t_CstSurface) * (t_CstNode B_dData_dList.t_List)
and t_NodeEvent = C_NodeEvent_EvOpen of (t_CstKind) * (int) * (int) | C_NodeEvent_EvClose of (int)
and t_NestFrame = { f_NestFrame_nfKind : t_CstKind; f_NestFrame_nfId : int; f_NestFrame_nfStart : Base_dSource.t_Span; f_NestFrame_nfKids : t_CstNode B_dData_dList.t_List }
and t_FixityFacts = { f_FixityFacts_ffParens : (int, int) B_dContainer_dHashMap.t_HashMap; f_FixityFacts_ffBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FixityFacts_ffSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_FactEntries = { f_FactEntries_feParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FactEntries_feBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_FactEntries_feSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_CstIndex = { f_CstIndex_ciById : (int, t_CstNode) B_dContainer_dHashMap.t_HashMap; f_CstIndex_ciBySpan : (int, t_CstNode) B_dContainer_dHashMap.t_HashMap }
and t_IndexAcc = { f_IndexAcc_iaById : (int, t_CstNode) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IndexAcc_iaBySpan : (int, t_CstNode) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_SectionShape = C_SectionShape_SectionOp of (string) | C_SectionShape_SectionLeft of (string) | C_SectionShape_SectionRight of (string)
and t_ParenFrame = { f_ParenFrame_pfKind : t_CstKind; f_ParenFrame_pfId : int; f_ParenFrame_pfOpen : int; f_ParenFrame_pfFirst : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe; f_ParenFrame_pfPrev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe; f_ParenFrame_pfKids : int; f_ParenFrame_pfKidKind : t_CstKind B_dData_dMaybe.t_Maybe; f_ParenFrame_pfKidOpen : int; f_ParenFrame_pfKidEnd : int; f_ParenFrame_pfKidStructDepth : int }

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurStart = { f_LineCur_lcOff = 0; f_LineCur_lcLine = 1; f_LineCur_lcCol = 1; f_LineCur_lcOffset = 0 }

# 92 "Vuna/Compiler/Frontend/Cst.vuna"
let v_curPos = (fun (c : t_LineCur) -> { Base_dSource.f_Pos_posLine = (c).f_LineCur_lcLine; Base_dSource.f_Pos_posCol = (c).f_LineCur_lcCol; Base_dSource.f_Pos_posOffset = (c).f_LineCur_lcOffset; Base_dSource.f_Pos_posEndOffset = (c).f_LineCur_lcOffset })

# 96 "Vuna/Compiler/Frontend/Cst.vuna"
let v_stepCur = (fun (src : string) (c : t_LineCur) -> (if (((dtp_strAt src) (c).f_LineCur_lcOff) = 10) then { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = ((c).f_LineCur_lcLine + 1); f_LineCur_lcCol = 1; f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) } else { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = (c).f_LineCur_lcLine; f_LineCur_lcCol = ((c).f_LineCur_lcCol + 1); f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) }))

# 105 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceTo = (fun (fuel : int) (src : string) (c : t_LineCur) (target : Base_dSource.t_Pos) -> (if (fuel <= 0) then c else (if (if ((c).f_LineCur_lcLine > (Base_dSource.v_posLine target)) then true else (if ((c).f_LineCur_lcLine = (Base_dSource.v_posLine target)) then ((c).f_LineCur_lcCol >= (Base_dSource.v_posCol target)) else false)) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceTo (fuel - 1)) src) ((v_stepCur src) c)) target)))))

# 114 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceBy = (fun (fuel : int) (src : string) (c : t_LineCur) (n : int) -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceBy (fuel - 1)) src) ((v_stepCur src) c)) (n - 1))))))

# 123 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sliceText = (fun (src : string) (from : int) (to_ : int) -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 130 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanDigitsEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (Frontend_dLexer.v_isDigit ((dtp_strAt src) i)) then (((v_scanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 136 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanStringEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (((dtp_strAt src) i) = 92) then (((v_scanStringEnd (fuel - 2)) src) (i + 2)) else (if (((dtp_strAt src) i) = 34) then (i + 1) else (((v_scanStringEnd (fuel - 1)) src) (i + 1))))))

# 145 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 157 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 199 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanStartOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset sp) })

# 202 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanEndOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset sp) })

# 188 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_toTrivComments = (fun (mc0 : int) (mc1 : string) (mc2 : t_LineCur) (mc3 : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Frontend_dLexer.f_Comment_commentKind = dtb__20; Frontend_dLexer.f_Comment_commentText = dtb__21; Frontend_dLexer.f_Comment_commentSpan = dtb__22 } -> (let c1 = ((((v_advanceTo mc0) mc1) mc2) (v_spanStartOf dtb__22)) in (let c2 = ((((v_advanceTo mc0) mc1) c1) (v_spanEndOf dtb__22)) in (let c3 = ((((v_advanceBy mc0) mc1) c2) 1) in (let tailRes = ((((v_toTrivComments mc0) mc1) c3) dtb__19) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_TrivComment_tcommKind = dtb__20; f_TrivComment_tcommSpan = dtb__22; f_TrivComment_tcommStart = (c1).f_LineCur_lcOff; f_TrivComment_tcommEnd = (c3).f_LineCur_lcOff }, (B_dData_dPair.v_firstOf tailRes))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tailRes) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spaceTrivia = (fun (src : string) (from : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (to_ : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) -> (let fo = (B_dData_dPair.v_firstOf from) in (let to2 = (B_dData_dPair.v_firstOf to_) in (if (to2 <= fo) then B_dData_dList.C_List_Nil else (let fp = (B_dData_dPair.v_secondOf from) in (let tp = (B_dData_dPair.v_secondOf to_) in (B_dData_dList.C_List__x58__x58_ ({ f_Trivia_triviaKind = C_TriviaKind_TrivSpace; f_Trivia_triviaText = (((v_sliceText src) fo) to2); f_Trivia_triviaSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine fp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol fp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine tp); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol tp); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset fp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset tp) } }, B_dData_dList.C_List_Nil))))))))

# 220 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTriviaKind = (fun (mc0 : Frontend_dLexer.t_CKind) -> (match mc0 with
  | Frontend_dLexer.C_CKind_CBlock -> C_TriviaKind_TrivBlockComment
  | Frontend_dLexer.C_CKind_CLine -> C_TriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTrivia = (fun (src : string) (tc : t_TrivComment) -> (let start = (tc).f_TrivComment_tcommStart in { f_Trivia_triviaKind = (v_commentTriviaKind (tc).f_TrivComment_tcommKind); f_Trivia_triviaText = (((v_sliceText src) start) (tc).f_TrivComment_tcommEnd); f_Trivia_triviaSpan = (tc).f_TrivComment_tcommSpan }))

# 233 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentEndPos = (fun (tc : t_TrivComment) -> (let endSp = (tc).f_TrivComment_tcommSpan in { B_dData_dPair.f_Pair_first = (tc).f_TrivComment_tcommEnd; B_dData_dPair.f_Pair_second = ((Frontend_dLexer.v_advanceChar 0) (v_spanEndOf endSp)) }))

# 240 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_gapTrivia = (fun (mc0 : string) (mc1 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc2 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc3 : t_TrivComment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (let cStart = { B_dData_dPair.f_Pair_first = (dtb__23).f_TrivComment_tcommStart; B_dData_dPair.f_Pair_second = (v_spanStartOf (dtb__23).f_TrivComment_tcommSpan) } in ((B_dData_dList.v_append (((v_spaceTrivia mc0) mc1) cStart)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_commentTrivia mc0) dtb__23), B_dData_dList.C_List_Nil))) ((((v_gapTrivia mc0) (v_commentEndPos dtb__23)) mc2) dtb__24))))
  | B_dData_dList.C_List_Nil -> (((v_spaceTrivia mc0) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_takeCommentsBefore = (fun (mc0 : int) (mc1 : t_TrivComment B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if ((dtb__25).f_TrivComment_tcommStart < mc0) then (let taken = ((v_takeCommentsBefore mc0) dtb__26) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__25, (B_dData_dPair.v_firstOf taken))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf taken) }) else { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26)) })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentStartsAtOrAfter = (fun (bound : int) (c : t_TrivComment) -> ((c).f_TrivComment_tcommStart >= bound))

# 269 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenNode = (fun (src : string) (curStart : t_LineCur) (prevEnd : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (comments : t_TrivComment B_dData_dList.t_List) (tok : Frontend_dLexer.t_Tok) -> (let textEnd = (((v_tokText src) curStart) tok) in (let text = (B_dData_dPair.v_firstOf textEnd) in (let end_ = (B_dData_dPair.v_secondOf textEnd) in (let curEnd = ((((v_advanceBy (bi_strLength src)) src) curStart) (end_ - (curStart).f_LineCur_lcOff)) in (let startPos = (v_curPos curStart) in (let sp = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_curPos curEnd)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_curPos curEnd)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_curPos curEnd)) } in { B_dData_dPair.f_Pair_first = { f_CstToken_cstTag = (v_tokTag tok); f_CstToken_cstText = text; f_CstToken_cstSpan = sp; f_CstToken_cstLeading = ((((v_gapTrivia src) prevEnd) { B_dData_dPair.f_Pair_first = (curStart).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = startPos }) comments) }; B_dData_dPair.f_Pair_second = curEnd })))))))

# 290 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildTokens = (fun (mc0 : string) (mc1 : t_TrivComment B_dData_dList.t_List) (mc2 : t_LineCur) (mc3 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (let curStart = ((((v_advanceTo (bi_strLength mc0)) mc0) mc2) (dtb__27).Frontend_dLexer.f_PTok_ptokPos) in (let start = (curStart).f_LineCur_lcOff in (let before = ((v_takeCommentsBefore start) mc1) in (let live = ((B_dData_dList.v_filter (v_commentStartsAtOrAfter (B_dData_dPair.v_firstOf mc3))) (B_dData_dPair.v_firstOf before)) in (let node = (((((v_tokenNode mc0) curStart) mc3) live) (dtb__27).Frontend_dLexer.f_PTok_ptokTok) in (let curEnd = (B_dData_dPair.v_secondOf node) in (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf node), (((((v_buildTokens mc0) (B_dData_dPair.v_secondOf before)) curEnd) { B_dData_dPair.f_Pair_first = (curEnd).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = (v_curPos curEnd) }) dtb__28)))))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOf = (fun (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (comments : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (let fuel = ((bi_strLength source) + 1) in (let tcs = ((((v_toTrivComments fuel) source) v_lineCurStart) comments) in (((((v_buildTokens source) (B_dData_dPair.v_firstOf tcs)) v_lineCurStart) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }) toks))))

# 320 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurAt = (fun (p : Base_dSource.t_Pos) -> { f_LineCur_lcOff = (Base_dSource.v_posOffset p); f_LineCur_lcLine = (Base_dSource.v_posLine p); f_LineCur_lcCol = (Base_dSource.v_posCol p); f_LineCur_lcOffset = (Base_dSource.v_posOffset p) })

# 315 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexTokensOfFrom = (fun (source : string) (start : Base_dSource.t_Pos) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (((((v_buildTokens source) B_dData_dList.C_List_Nil) (v_lineCurAt start)) { B_dData_dPair.f_Pair_first = (Base_dSource.v_posOffset start); B_dData_dPair.f_Pair_second = start }) toks))

# 325 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCst = (fun (source : string) -> (let nd_uscrut1 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__29) -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.cst") "vuna.phase") (fun (_u : int) -> (((v_lexTokensOf source) dtb__30) dtb__31)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__32) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 333 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaTextOf = (fun (tr : t_Trivia) -> (tr).f_Trivia_triviaText)

# 337 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderParts = (fun (t : t_CstToken) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_triviaTextOf) (t).f_CstToken_cstLeading)) (B_dData_dList.C_List__x58__x58_ ((t).f_CstToken_cstText, B_dData_dList.C_List_Nil))))

# 341 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderCst = (fun (toks : t_CstToken B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_concatMap v_renderParts) toks)))

# 345 "Vuna/Compiler/Frontend/Cst.vuna"
let v_roundtripOk = (fun (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ((v_renderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstSurface = { f_CstSurface_cstParenDepth = 0; f_CstSurface_cstBacktick = false; f_CstSurface_cstSection = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstInterpMulti = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstHoleTrees = B_dData_dList.C_List_Nil }

# 419 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__36
  | C_CstNode_CstLeaf (dtb__39) -> (dtb__39).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSurface = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__43
  | C_CstNode_CstLeaf (dtb__45) -> v_emptyCstSurface
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeId = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (B_dData_dMaybe.C_Maybe_Just (dtb__47))
  | C_CstNode_CstLeaf (dtb__51) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> (B_dData_dMaybe.C_Maybe_Just (dtb__52))
  | C_CstNode_CstLeaf (dtb__57) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__62
  | C_CstNode_CstLeaf (dtb__63) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__69) -> (B_dData_dMaybe.C_Maybe_Just (dtb__69))
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstKindTag = (fun (mc0 : t_CstKind) -> (match mc0 with
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

# 450 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (v_cstKindTag dtb__70)
  | C_CstNode_CstLeaf (dtb__75) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine a); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol a); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine b); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol b); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset a); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset b) })

# 506 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 510 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (mc0 : Base_dSource.t_Span) (mc1 : Base_dSource.t_Span B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((v_lastSpanOfList dtb__76) dtb__77)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (d : Base_dSource.t_Span) (kids : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList d) ((B_dData_dList.v_map v_nodeSpan) kids)))

# 519 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_CstToken B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (dtb__78).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (f : t_NestFrame) -> (let kids = (B_dData_dList.v_reverse (f).f_NestFrame_nfKids) in (let endSp = ((v_lastSpanOf (f).f_NestFrame_nfStart) kids) in (C_CstNode_CstBranch ((f).f_NestFrame_nfKind, (f).f_NestFrame_nfId, ((v_spanFrom (f).f_NestFrame_nfStart) endSp), v_emptyCstSurface, kids)))))

# 532 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__80).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__80).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__80).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse mc0)) (dtb__80).f_NestFrame_nfKids) }, dtb__81))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (node : t_CstNode) (f : t_NestFrame) -> { f_NestFrame_nfKind = (f).f_NestFrame_nfKind; f_NestFrame_nfId = (f).f_NestFrame_nfId; f_NestFrame_nfStart = (f).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_NestFrame_nfKids)) })

# 542 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (mc0 : t_CstNode) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto mc0) dtb__82), dtb__83))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb__84)) dtb__86), dtb__87))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__84, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (1 + (v_nestFrameCount dtb__89))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (fuel : int) (frames : t_NestFrame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (let nd_uscrut2 = frames in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__91 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> ((v_closeAllFrames (fuel - 1)) (v_closeTopFrame frames))
  | _ -> frames
)
  | _ -> frames
))))

# 568 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (mc0 : t_NodeEvent) -> (match mc0 with
  | C_NodeEvent_EvClose (dtb__94) -> dtb__94
  | C_NodeEvent_EvOpen (dtb__95, dtb__96, dtb__97) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (mc0 : t_CstToken B_dData_dList.t_List) (mc1 : int) (mc2 : t_NestFrame B_dData_dList.t_List) (mc3 : t_NodeEvent B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (let at = (v_eventIndex dtb__98) in (let n = (at - mc1) in (let live2 = ((B_dData_dList.v_drop n) mc0) in (let frames1 = ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) ((B_dData_dList.v_take n) mc0))) mc2) in (match dtb__98 with
  | C_NodeEvent_EvOpen (dtb__100, dtb__101, dtb__102) -> ((((v_nestEvents live2) at) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb__100; f_NestFrame_nfId = dtb__102; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) live2); f_NestFrame_nfKids = B_dData_dList.C_List_Nil }, frames1))) dtb__99)
  | C_NodeEvent_EvClose (dtb__103) -> ((((v_nestEvents live2) at) (v_closeTopFrame frames1)) dtb__99)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount mc2) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) mc0)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, mc0, v_emptyCstSurface, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb__104).f_NestFrame_nfId, mc0, v_emptyCstSurface, (B_dData_dList.v_reverse (dtb__104).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (t : t_CstToken) -> (t).f_CstToken_cstSpan)

# 601 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> ((v_spanFrom (dtb__106).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb__106).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb__107)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (let root = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) toks); f_NestFrame_nfKids = B_dData_dList.C_List_Nil } in (let frames = ((((v_nestEvents toks) 0) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) events) in (let sp = (v_tokensSpan toks) in ((v_finishRoot sp) frames)))))

# 619 "Vuna/Compiler/Frontend/Cst.vuna"
let v_holeRootOf = (fun (node : t_CstNode) -> (let nd_uscrut1 = (v_nodeChildren node) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (match dtb__109 with
  | B_dData_dList.C_List_Nil -> dtb__108
  | _ -> node
)
  | _ -> node
)))

# 660 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupHoleTrees = (fun (mc0 : int) (mc1 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (if (dtb__112 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__113)) else ((v_lookupHoleTrees mc0) dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyKey = (0 - 1)

# 676 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyParenTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = 0 }, B_dData_dList.C_List_Nil))))

# 682 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFixityFacts = { f_FixityFacts_ffParens = v_emptyParenTable; f_FixityFacts_ffBackticks = B_dData_dList.C_List_Nil; f_FixityFacts_ffSections = B_dData_dList.C_List_Nil }

# 693 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfFacts = (fun (f : t_FixityFacts) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (f).f_FixityFacts_ffParens) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> dtb__114
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupBacktick = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (if ((B_dData_dPair.v_firstOf dtb__115) = mc0) then (B_dData_dPair.v_secondOf dtb__115) else ((v_lookupBacktick mc0) dtb__116))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfFacts = (fun (f : t_FixityFacts) (nid : int) -> ((v_lookupBacktick nid) (f).f_FixityFacts_ffBackticks))

# 711 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupSection = (fun (mc0 : int) (mc1 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (if ((B_dData_dPair.v_firstOf dtb__117) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__117))) else ((v_lookupSection mc0) dtb__118))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfFacts = (fun (f : t_FixityFacts) (sp : Base_dSource.t_Span) -> ((v_lookupSection (Base_dSource.v_spanStartOffset sp)) (f).f_FixityFacts_ffSections))

# 717 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupInterp = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (if ((B_dData_dPair.v_firstOf dtb__119) = mc0) then (B_dData_dPair.v_secondOf dtb__119) else ((v_lookupInterp mc0) dtb__120))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_applySurfaceTree = (fun (mc0 : (int, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : t_CstNode) -> (match mc5 with
  | C_CstNode_CstBranch (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (let parenDepth = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__122) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> dtb__127
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (let surface = { f_CstSurface_cstParenDepth = parenDepth; f_CstSurface_cstBacktick = ((v_lookupBacktick dtb__122) mc1); f_CstSurface_cstSection = ((v_lookupSection (Base_dSource.v_spanStartOffset dtb__123)) mc2); f_CstSurface_cstInterpMulti = (if ((v_lookupInterp (Base_dSource.v_spanStartOffset dtb__123)) mc3) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing); f_CstSurface_cstHoleTrees = (match ((v_lookupHoleTrees dtb__122) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> dtb__126
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) } in (C_CstNode_CstBranch (dtb__121, dtb__122, dtb__123, surface, ((B_dData_dList.v_map (((((v_applySurfaceTree mc0) mc1) mc2) mc3) mc4)) dtb__125)))))
  | C_CstNode_CstLeaf (dtb__128) -> (C_CstNode_CstLeaf (dtb__128))
  | _ -> failwith "DT: impossible branch"
))

# 628 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTreeWithSurface = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) (parenEntries : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (interps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeTrees : (int, t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let parens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries) in ((((((v_applySurfaceTree parens) backticks) sections) interps) holeTrees) ((v_nestToTree toks) events))))

# 726 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyFactEntries = { f_FactEntries_feParens = B_dData_dList.C_List_Nil; f_FactEntries_feBackticks = B_dData_dList.C_List_Nil; f_FactEntries_feSections = B_dData_dList.C_List_Nil }

# 729 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_factsGo = (fun (mc0 : t_CstNode) (mc1 : t_FactEntries) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (let acc1 = (if ((dtb__132).f_CstSurface_cstParenDepth > 0) then { mc1 with f_FactEntries_feParens = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = (dtb__132).f_CstSurface_cstParenDepth }, (mc1).f_FactEntries_feParens)) } else mc1) in (let acc2 = (if (dtb__132).f_CstSurface_cstBacktick then { acc1 with f_FactEntries_feBackticks = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = true }, (acc1).f_FactEntries_feBackticks)) } else acc1) in (let acc3 = (match (dtb__132).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> { acc2 with f_FactEntries_feSections = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__131); B_dData_dPair.f_Pair_second = dtb__134 }, (acc2).f_FactEntries_feSections)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> acc2
  | _ -> failwith "DT: impossible branch"
) in ((v_factsGoList (dtb__132).f_CstSurface_cstHoleTrees) ((v_factsGoList dtb__133) acc3)))))
  | C_CstNode_CstLeaf (dtb__135) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 746 "Vuna/Compiler/Frontend/Cst.vuna"
and v_factsGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_FactEntries) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> ((v_factsGoList dtb__137) ((v_factsGo dtb__136) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Frontend/Cst.vuna"
let v_fixityFactsOf = (fun (root : t_CstNode) -> (let entries = ((v_factsGo root) v_emptyFactEntries) in { f_FixityFacts_ffParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (entries).f_FactEntries_feParens); f_FixityFacts_ffBackticks = (entries).f_FactEntries_feBackticks; f_FixityFacts_ffSections = (entries).f_FactEntries_feSections }))

# 751 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb__142)
  | C_CstNode_CstLeaf (dtb__143) -> (B_dData_dList.C_List__x58__x58_ (dtb__143, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 756 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTable = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = mc0 }, ((B_dData_dList.v_concatMap v_nodeTable) dtb__148)))
  | C_CstNode_CstLeaf (dtb__149) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (tree : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable tree)))

# 778 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyIndexAcc = { f_IndexAcc_iaById = B_dData_dList.C_List_Nil; f_IndexAcc_iaBySpan = B_dData_dList.C_List_Nil }

# 787 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_indexGo = (fun (mc0 : t_CstNode) (mc1 : t_IndexAcc) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> (let hasIdFact = (if ((dtb__153).f_CstSurface_cstParenDepth > 0) then true else (dtb__153).f_CstSurface_cstBacktick) in (let hasSpanFact = (match (dtb__153).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb__153).f_CstSurface_cstInterpMulti with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (let acc1 = (if hasIdFact then { mc1 with f_IndexAcc_iaById = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = mc0 }, (mc1).f_IndexAcc_iaById)) } else mc1) in (let acc2 = (if hasSpanFact then { acc1 with f_IndexAcc_iaBySpan = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__152); B_dData_dPair.f_Pair_second = mc0 }, (acc1).f_IndexAcc_iaBySpan)) } else acc1) in ((v_indexGoList (dtb__153).f_CstSurface_cstHoleTrees) ((v_indexGoList dtb__154) acc2))))))
  | C_CstNode_CstLeaf (dtb__157) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 804 "Vuna/Compiler/Frontend/Cst.vuna"
and v_indexGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_IndexAcc) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> ((v_indexGoList dtb__159) ((v_indexGo dtb__158) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstIndexOf = (fun (root : t_CstNode) -> (let acc = ((v_indexGo root) v_emptyIndexAcc) in { f_CstIndex_ciById = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaById); f_CstIndex_ciBySpan = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (acc).f_IndexAcc_iaBySpan) }))

# 814 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyNodeTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = (C_CstNode_CstBranch (C_CstKind_CstFileKind, v_emptyKey, Base_dSource.v_spanEmpty, v_emptyCstSurface, B_dData_dList.C_List_Nil)) }, B_dData_dList.C_List_Nil))))

# 809 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstIndex = { f_CstIndex_ciById = v_emptyNodeTable; f_CstIndex_ciBySpan = v_emptyNodeTable }

# 821 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (let s = (v_nodeSurface dtb__160) in (s).f_CstSurface_cstParenDepth)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickOfIndex = (fun (ix : t_CstIndex) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (ix).f_CstIndex_ciById) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (let s = (v_nodeSurface dtb__161) in (s).f_CstSurface_cstBacktick)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (let s = (v_nodeSurface dtb__162) in (s).f_CstSurface_cstSection)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Frontend/Cst.vuna"
let v_interpMultiOfIndex = (fun (ix : t_CstIndex) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Base_dSource.v_spanStartOffset sp)) (ix).f_CstIndex_ciBySpan) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (let s = (v_nodeSurface dtb__163) in (let nd_uscrut5 = (s).f_CstSurface_cstInterpMulti in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (if dtb__164 then true else false)
  | _ -> false
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 863 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__169))
  | C_CstNode_CstLeaf (dtb__170) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__170))
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_anchorRefsOfTree = (fun (mc0 : (t_CstKind) -> bool) (mc1 : t_CstNode) -> (match mc1 with
  | C_CstNode_CstBranch (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> ((B_dData_dList.v_append (if (mc0 dtb__171) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((B_dData_dList.v_concatMap (v_anchorRefsOfTree mc0)) dtb__175))
  | C_CstNode_CstLeaf (dtb__176) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 889 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOpOf = (fun (mc0 : t_SectionShape) -> (match mc0 with
  | C_SectionShape_SectionRight (dtb__177) -> dtb__177
  | C_SectionShape_SectionLeft (dtb__178) -> dtb__178
  | C_SectionShape_SectionOp (dtb__179) -> dtb__179
  | _ -> failwith "DT: impossible branch"
))

# 920 "Vuna/Compiler/Frontend/Cst.vuna"
let v_openFrame = (fun (kind : t_CstKind) (nid : int) (at : int) (first : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> { f_ParenFrame_pfKind = kind; f_ParenFrame_pfId = nid; f_ParenFrame_pfOpen = at; f_ParenFrame_pfFirst = first; f_ParenFrame_pfPrev = prev; f_ParenFrame_pfKids = 0; f_ParenFrame_pfKidKind = B_dData_dMaybe.C_Maybe_Nothing; f_ParenFrame_pfKidOpen = 0; f_ParenFrame_pfKidEnd = 0; f_ParenFrame_pfKidStructDepth = 0 })

# 924 "Vuna/Compiler/Frontend/Cst.vuna"
let v_addKid = (fun (kind : t_CstKind) (open_ : int) (end_ : int) (structD : int) (f : t_ParenFrame) -> { f_ParenFrame_pfKind = (f).f_ParenFrame_pfKind; f_ParenFrame_pfId = (f).f_ParenFrame_pfId; f_ParenFrame_pfOpen = (f).f_ParenFrame_pfOpen; f_ParenFrame_pfFirst = (f).f_ParenFrame_pfFirst; f_ParenFrame_pfPrev = (f).f_ParenFrame_pfPrev; f_ParenFrame_pfKids = ((f).f_ParenFrame_pfKids + 1); f_ParenFrame_pfKidKind = (B_dData_dMaybe.C_Maybe_Just (kind)); f_ParenFrame_pfKidOpen = open_; f_ParenFrame_pfKidEnd = end_; f_ParenFrame_pfKidStructDepth = structD })

# 944 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isOpenParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (match dtb__180 with
  | Frontend_dLexer.C_Tok_TSym (dtb__181) -> (if (dtb__181 = "(") then true else false)
  | _ -> false
)
  | _ -> false
))

# 948 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isCloseParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (match dtb__182 with
  | Frontend_dLexer.C_Tok_TSym (dtb__183) -> (if (dtb__183 = ")") then true else false)
  | _ -> false
)
  | _ -> false
))

# 930 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isParenFrame = (fun (endIdx : int) (lastTok : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (f : t_ParenFrame) -> (match (f).f_ParenFrame_pfKind with
  | C_CstKind_CstExprKind -> (if ((f).f_ParenFrame_pfKids = 1) then (let nd_uscrut3 = (f).f_ParenFrame_pfKidKind in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match dtb__184 with
  | C_CstKind_CstExprKind -> (if (if (if (v_isOpenParen (f).f_ParenFrame_pfFirst) then (v_isCloseParen lastTok) else false) then ((f).f_ParenFrame_pfKidOpen = ((f).f_ParenFrame_pfOpen + 1)) else false) then ((f).f_ParenFrame_pfKidEnd = (endIdx - 1)) else false)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
))

# 952 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isExprFrame = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstExprKind -> true
  | _ -> false
))

# 957 "Vuna/Compiler/Frontend/Cst.vuna"
let v_adjacentParenDepth = (fun (kind : t_CstKind) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (next : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (if (if (if (v_isExprFrame kind) then (v_isOpenParen prev) else false) then (v_isCloseParen next) else false) then 1 else 0))

# 962 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeParen = (fun (n : int) (last : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (n <= 0) then { B_dData_dPair.f_Pair_first = toks; B_dData_dPair.f_Pair_second = last } else (match toks with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = last }
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (((v_consumeParen (n - 1)) (B_dData_dMaybe.C_Maybe_Just ((dtb__185).Frontend_dLexer.f_PTok_ptokTok))) dtb__186)
  | _ -> failwith "DT: impossible branch"
)))

# 971 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headTokOf = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__187).Frontend_dLexer.f_PTok_ptokTok))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 976 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_parenWalk = (fun (mc0 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : t_ParenFrame B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc5 : t_NodeEvent B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match dtb__189 with
  | C_NodeEvent_EvClose (dtb__191) -> (let step = (((v_consumeParen (dtb__191 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in (match mc1 with
  | B_dData_dList.C_List_Nil -> ((((((v_parenWalk mc0) B_dData_dList.C_List_Nil) dtb__191) last2) live) dtb__190)
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (let structD = (if (((v_isParenFrame dtb__191) last2) dtb__192) then ((dtb__192).f_ParenFrame_pfKidStructDepth + 1) else 0) in (let total = (structD + (((v_adjacentParenDepth (dtb__192).f_ParenFrame_pfKind) (dtb__192).f_ParenFrame_pfPrev) (v_headTokOf live))) in (let acc2 = (if (total > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__192).f_ParenFrame_pfId; B_dData_dPair.f_Pair_second = total }, mc0)) else mc0) in (let outer2 = (match dtb__193 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (B_dData_dList.C_List__x58__x58_ ((((((v_addKid (dtb__192).f_ParenFrame_pfKind) (dtb__192).f_ParenFrame_pfOpen) dtb__191) structD) dtb__194), dtb__195))
  | _ -> failwith "DT: impossible branch"
) in ((((((v_parenWalk acc2) outer2) dtb__191) last2) live) dtb__190)))))
  | _ -> failwith "DT: impossible branch"
))))
  | C_NodeEvent_EvOpen (dtb__196, dtb__197, dtb__198) -> (let step = (((v_consumeParen (dtb__197 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in ((((((v_parenWalk mc0) (B_dData_dList.C_List__x58__x58_ ((((((v_openFrame dtb__196) dtb__198) dtb__197) (v_headTokOf live)) last2), mc1))) dtb__197) last2) live) dtb__190))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1003 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenEntriesOf = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> ((((((v_parenWalk B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) 0) B_dData_dMaybe.C_Maybe_Nothing) toks) events))
