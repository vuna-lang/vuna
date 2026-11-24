open Vuna_runtime
type t_TriviaKind = C_TriviaKind_TrivSpace | C_TriviaKind_TrivLineComment | C_TriviaKind_TrivBlockComment
and t_Trivia = { f_Trivia_triviaKind : t_TriviaKind; f_Trivia_triviaText : string; f_Trivia_triviaSpan : Base_dSource.t_Span }
and t_CstToken = { f_CstToken_cstTag : string; f_CstToken_cstText : string; f_CstToken_cstSpan : Base_dSource.t_Span; f_CstToken_cstLeading : t_Trivia B_dData_dList.t_List }
and t_LineCur = { f_LineCur_lcOff : int; f_LineCur_lcLine : int; f_LineCur_lcCol : int; f_LineCur_lcOffset : int }
and t_TrivComment = { f_TrivComment_tcommKind : Frontend_dLexer.t_CKind; f_TrivComment_tcommSpan : Base_dSource.t_Span; f_TrivComment_tcommStart : int; f_TrivComment_tcommEnd : int }
and t_CstKind = C_CstKind_CstFileKind | C_CstKind_CstModHeadKind | C_CstKind_CstImportKind | C_CstKind_CstFixityKind | C_CstKind_CstExportItemKind | C_CstKind_CstDeclKind | C_CstKind_CstCtorKind | C_CstKind_CstFieldKind | C_CstKind_CstMethodKind | C_CstKind_CstBindingKind | C_CstKind_CstAltKind | C_CstKind_CstExprKind | C_CstKind_CstPatKind | C_CstKind_CstDoStmtKind
and t_CstSurface = { f_CstSurface_cstParenDepth : int; f_CstSurface_cstBacktick : bool; f_CstSurface_cstSection : t_SectionShape B_dData_dMaybe.t_Maybe; f_CstSurface_cstInterpMulti : bool B_dData_dMaybe.t_Maybe }
and t_CstNode = C_CstNode_CstLeaf of (t_CstToken) | C_CstNode_CstBranch of (t_CstKind) * (int) * (Base_dSource.t_Span) * (t_CstSurface) * (t_CstNode B_dData_dList.t_List)
and t_NodeEvent = C_NodeEvent_EvOpen of (t_CstKind) * (int) * (int) | C_NodeEvent_EvClose of (int)
and t_NestFrame = { f_NestFrame_nfKind : t_CstKind; f_NestFrame_nfId : int; f_NestFrame_nfStart : Base_dSource.t_Span; f_NestFrame_nfKids : t_CstNode B_dData_dList.t_List }
and t_SurfaceEntries = { f_SurfaceEntries_seParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceEntries_seBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceEntries_seSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceEntries_seInterps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_AnchorFrame = { f_AnchorFrame_afKeep : bool; f_AnchorFrame_afId : int; f_AnchorFrame_afStart : Base_dSource.t_Span }
and t_SectionShape = C_SectionShape_SectionOp of (string) | C_SectionShape_SectionLeft of (string) | C_SectionShape_SectionRight of (string)
and t_Surface = { f_Surface_surfaceParens : (int, int) B_dContainer_dHashMap.t_HashMap; f_Surface_surfaceBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Surface_surfaceSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Surface_surfaceInterps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List }
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

# 315 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCst = (fun (source : string) -> (let nd_uscrut1 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__29) -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.cst") "vuna.phase") (fun (_u : int) -> (((v_lexTokensOf source) dtb__30) dtb__31)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__32) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 323 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaTextOf = (fun (tr : t_Trivia) -> (tr).f_Trivia_triviaText)

# 327 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderParts = (fun (t : t_CstToken) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_triviaTextOf) (t).f_CstToken_cstLeading)) (B_dData_dList.C_List__x58__x58_ ((t).f_CstToken_cstText, B_dData_dList.C_List_Nil))))

# 331 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderCst = (fun (toks : t_CstToken B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_concatMap v_renderParts) toks)))

# 335 "Vuna/Compiler/Frontend/Cst.vuna"
let v_roundtripOk = (fun (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ((v_renderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyCstSurface = { f_CstSurface_cstParenDepth = 0; f_CstSurface_cstBacktick = false; f_CstSurface_cstSection = B_dData_dMaybe.C_Maybe_Nothing; f_CstSurface_cstInterpMulti = B_dData_dMaybe.C_Maybe_Nothing }

# 403 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__36
  | C_CstNode_CstLeaf (dtb__39) -> (dtb__39).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSurface = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__43
  | C_CstNode_CstLeaf (dtb__45) -> v_emptyCstSurface
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeId = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (B_dData_dMaybe.C_Maybe_Just (dtb__47))
  | C_CstNode_CstLeaf (dtb__51) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> (B_dData_dMaybe.C_Maybe_Just (dtb__52))
  | C_CstNode_CstLeaf (dtb__57) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__62
  | C_CstNode_CstLeaf (dtb__63) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__69) -> (B_dData_dMaybe.C_Maybe_Just (dtb__69))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 434 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (v_cstKindTag dtb__70)
  | C_CstNode_CstLeaf (dtb__75) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine a); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol a); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine b); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol b); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset a); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset b) })

# 490 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 494 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (mc0 : Base_dSource.t_Span) (mc1 : Base_dSource.t_Span B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((v_lastSpanOfList dtb__76) dtb__77)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (d : Base_dSource.t_Span) (kids : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList d) ((B_dData_dList.v_map v_nodeSpan) kids)))

# 503 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_CstToken B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (dtb__78).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (f : t_NestFrame) -> (let kids = (B_dData_dList.v_reverse (f).f_NestFrame_nfKids) in (let endSp = ((v_lastSpanOf (f).f_NestFrame_nfStart) kids) in (C_CstNode_CstBranch ((f).f_NestFrame_nfKind, (f).f_NestFrame_nfId, ((v_spanFrom (f).f_NestFrame_nfStart) endSp), v_emptyCstSurface, kids)))))

# 516 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__80).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__80).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__80).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse mc0)) (dtb__80).f_NestFrame_nfKids) }, dtb__81))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (node : t_CstNode) (f : t_NestFrame) -> { f_NestFrame_nfKind = (f).f_NestFrame_nfKind; f_NestFrame_nfId = (f).f_NestFrame_nfId; f_NestFrame_nfStart = (f).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_NestFrame_nfKids)) })

# 526 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (mc0 : t_CstNode) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto mc0) dtb__82), dtb__83))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb__84)) dtb__86), dtb__87))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__84, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (1 + (v_nestFrameCount dtb__89))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (fuel : int) (frames : t_NestFrame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (let nd_uscrut2 = frames in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__91 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> ((v_closeAllFrames (fuel - 1)) (v_closeTopFrame frames))
  | _ -> frames
)
  | _ -> frames
))))

# 552 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (mc0 : t_NodeEvent) -> (match mc0 with
  | C_NodeEvent_EvClose (dtb__94) -> dtb__94
  | C_NodeEvent_EvOpen (dtb__95, dtb__96, dtb__97) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (mc0 : t_CstToken B_dData_dList.t_List) (mc1 : int) (mc2 : t_NestFrame B_dData_dList.t_List) (mc3 : t_NodeEvent B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (let at = (v_eventIndex dtb__98) in (let n = (at - mc1) in (let live2 = ((B_dData_dList.v_drop n) mc0) in (let frames1 = ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) ((B_dData_dList.v_take n) mc0))) mc2) in (match dtb__98 with
  | C_NodeEvent_EvOpen (dtb__100, dtb__101, dtb__102) -> ((((v_nestEvents live2) at) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb__100; f_NestFrame_nfId = dtb__102; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) live2); f_NestFrame_nfKids = B_dData_dList.C_List_Nil }, frames1))) dtb__99)
  | C_NodeEvent_EvClose (dtb__103) -> ((((v_nestEvents live2) at) (v_closeTopFrame frames1)) dtb__99)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount mc2) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) mc0)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, mc0, v_emptyCstSurface, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb__104).f_NestFrame_nfId, mc0, v_emptyCstSurface, (B_dData_dList.v_reverse (dtb__104).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (t : t_CstToken) -> (t).f_CstToken_cstSpan)

# 585 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> ((v_spanFrom (dtb__106).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb__106).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb__107)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (let root = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) toks); f_NestFrame_nfKids = B_dData_dList.C_List_Nil } in (let frames = ((((v_nestEvents toks) 0) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) events) in (let sp = (v_tokensSpan toks) in ((v_finishRoot sp) frames)))))

# 634 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptySurfaceEntries = { f_SurfaceEntries_seParens = B_dData_dList.C_List_Nil; f_SurfaceEntries_seBackticks = B_dData_dList.C_List_Nil; f_SurfaceEntries_seSections = B_dData_dList.C_List_Nil; f_SurfaceEntries_seInterps = B_dData_dList.C_List_Nil }

# 652 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_surfaceEntriesGo = (fun (mc0 : t_CstNode) (mc1 : t_SurfaceEntries) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> (let acc1 = (if ((dtb__111).f_CstSurface_cstParenDepth > 0) then { mc1 with f_SurfaceEntries_seParens = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = (dtb__111).f_CstSurface_cstParenDepth }, (mc1).f_SurfaceEntries_seParens)) } else mc1) in (let acc2 = (if (dtb__111).f_CstSurface_cstBacktick then { acc1 with f_SurfaceEntries_seBackticks = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = true }, (acc1).f_SurfaceEntries_seBackticks)) } else acc1) in (let acc3 = (match (dtb__111).f_CstSurface_cstSection with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> { acc2 with f_SurfaceEntries_seSections = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__110); B_dData_dPair.f_Pair_second = dtb__114 }, (acc2).f_SurfaceEntries_seSections)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> acc2
  | _ -> failwith "DT: impossible branch"
) in (let acc4 = (match (dtb__111).f_CstSurface_cstInterpMulti with
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> { acc3 with f_SurfaceEntries_seInterps = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_spanStartOffset dtb__110); B_dData_dPair.f_Pair_second = dtb__113 }, (acc3).f_SurfaceEntries_seInterps)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> acc3
  | _ -> failwith "DT: impossible branch"
) in ((v_surfaceEntriesGoList dtb__112) acc4)))))
  | C_CstNode_CstLeaf (dtb__115) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 673 "Vuna/Compiler/Frontend/Cst.vuna"
and v_surfaceEntriesGoList = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_SurfaceEntries) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((v_surfaceEntriesGoList dtb__117) ((v_surfaceEntriesGo dtb__116) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Frontend/Cst.vuna"
let v_surfaceOfCstWith = (fun (holeParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeSections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (holeInterps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (root : t_CstNode) -> (let entries = ((v_surfaceEntriesGo root) v_emptySurfaceEntries) in { f_Surface_surfaceParens = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) holeParens) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (entries).f_SurfaceEntries_seParens)); f_Surface_surfaceBackticks = ((B_dData_dList.v_append holeBackticks) (entries).f_SurfaceEntries_seBackticks); f_Surface_surfaceSections = ((B_dData_dList.v_append holeSections) (entries).f_SurfaceEntries_seSections); f_Surface_surfaceInterps = ((B_dData_dList.v_append holeInterps) (entries).f_SurfaceEntries_seInterps) }))

# 637 "Vuna/Compiler/Frontend/Cst.vuna"
let v_surfaceOfCst = (fun (root : t_CstNode) -> (((((v_surfaceOfCstWith B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) root))

# 678 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb__122)
  | C_CstNode_CstLeaf (dtb__123) -> (B_dData_dList.C_List__x58__x58_ (dtb__123, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 683 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTable = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = mc0 }, ((B_dData_dList.v_concatMap v_nodeTable) dtb__128)))
  | C_CstNode_CstLeaf (dtb__129) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 689 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (tree : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable tree)))

# 693 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__134))
  | C_CstNode_CstLeaf (dtb__135) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__135))
  | _ -> failwith "DT: impossible branch"
))

# 713 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeTokens = (fun (mc0 : Base_dSource.t_Span) (mc1 : int) (mc2 : t_CstToken B_dData_dList.t_List) -> (if (mc1 = 0) then { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc2 } else (match mc2 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (((v_consumeTokens (dtb__136).f_CstToken_cstSpan) (mc1 - 1)) dtb__137)
  | _ -> failwith "DT: impossible branch"
)))

# 720 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_anchorWalk = (fun (mc0 : (t_CstKind) -> bool) (mc1 : t_CstToken B_dData_dList.t_List) (mc2 : int) (mc3 : Base_dSource.t_Span) (mc4 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : t_AnchorFrame B_dData_dList.t_List) (mc6 : t_NodeEvent B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (let at = (v_eventIndex dtb__138) in (let consumed = (((v_consumeTokens mc3) (at - mc2)) mc1) in (let lastEnd2 = (B_dData_dPair.v_firstOf consumed) in (let live = (B_dData_dPair.v_secondOf consumed) in (match dtb__138 with
  | C_NodeEvent_EvOpen (dtb__140, dtb__141, dtb__142) -> (((((((v_anchorWalk mc0) live) at) lastEnd2) mc4) (B_dData_dList.C_List__x58__x58_ ({ f_AnchorFrame_afKeep = (mc0 dtb__140); f_AnchorFrame_afId = dtb__142; f_AnchorFrame_afStart = ((v_headSpan v_degenerateSpan) live) }, mc5))) dtb__139)
  | C_NodeEvent_EvClose (dtb__143) -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (((((((v_anchorWalk mc0) live) at) lastEnd2) mc4) B_dData_dList.C_List_Nil) dtb__139)
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (let acc2 = (if (dtb__144).f_AnchorFrame_afKeep then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__144).f_AnchorFrame_afId; B_dData_dPair.f_Pair_second = ((v_spanFrom (dtb__144).f_AnchorFrame_afStart) lastEnd2) }, mc4)) else mc4) in (((((((v_anchorWalk mc0) live) at) lastEnd2) acc2) dtb__145) dtb__139))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Frontend/Cst.vuna"
let v_anchorRefsOf = (fun (keep : (t_CstKind) -> bool) (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (B_dData_dList.v_reverse (((((((v_anchorWalk keep) toks) 0) v_degenerateSpan) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) events)))

# 747 "Vuna/Compiler/Frontend/Cst.vuna"
let v_treeRoundtripOk = (fun (events : t_NodeEvent B_dData_dList.t_List) (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> ((v_renderCstTree ((v_nestToTree dtb__146) events)) = s)
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionOpOf = (fun (mc0 : t_SectionShape) -> (match mc0 with
  | C_SectionShape_SectionRight (dtb__147) -> dtb__147
  | C_SectionShape_SectionLeft (dtb__148) -> dtb__148
  | C_SectionShape_SectionOp (dtb__149) -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

# 795 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyKey = (0 - 1)

# 792 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptyParenTable = ((((B_dContainer_dHashMap.v_remove B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) v_emptyKey) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = v_emptyKey; B_dData_dPair.f_Pair_second = 0 }, B_dData_dList.C_List_Nil))))

# 787 "Vuna/Compiler/Frontend/Cst.vuna"
let v_emptySurface = { f_Surface_surfaceParens = v_emptyParenTable; f_Surface_surfaceBackticks = B_dData_dList.C_List_Nil; f_Surface_surfaceSections = B_dData_dList.C_List_Nil; f_Surface_surfaceInterps = B_dData_dList.C_List_Nil }

# 799 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenDepthOf = (fun (s : t_Surface) (nid : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) nid) (s).f_Surface_surfaceParens) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> dtb__150
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 809 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupBacktick = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if ((B_dData_dPair.v_firstOf dtb__151) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__151))) else ((v_lookupBacktick mc0) dtb__152))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Frontend/Cst.vuna"
let v_backtickShapeOf = (fun (s : t_Surface) (nid : int) -> ((v_lookupBacktick nid) (s).f_Surface_surfaceBackticks))

# 818 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupSection = (fun (mc0 : int) (mc1 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (if ((B_dData_dPair.v_firstOf dtb__153) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__153))) else ((v_lookupSection mc0) dtb__154))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 815 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionShapeOfOffset = (fun (s : t_Surface) (off : int) -> ((v_lookupSection off) (s).f_Surface_surfaceSections))

# 824 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sectionShapeOfSpan = (fun (s : t_Surface) (sp : Base_dSource.t_Span) -> ((v_sectionShapeOfOffset s) (Base_dSource.v_spanStartOffset sp)))

# 831 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lookupInterp = (fun (mc0 : int) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (if ((B_dData_dPair.v_firstOf dtb__155) = mc0) then (B_dData_dPair.v_secondOf dtb__155) else ((v_lookupInterp mc0) dtb__156))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_applySurfaceTree = (fun (mc0 : (int, int) B_dContainer_dHashMap.t_HashMap) (mc1 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : t_CstNode) -> (match mc4 with
  | C_CstNode_CstBranch (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> (let parenDepth = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__158) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> dtb__162
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (let surface = { f_CstSurface_cstParenDepth = parenDepth; f_CstSurface_cstBacktick = (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool)) ((v_lookupBacktick dtb__158) mc1)) (B_dData_dMaybe.C_Maybe_Just (true))); f_CstSurface_cstSection = ((v_lookupSection (Base_dSource.v_spanStartOffset dtb__159)) mc2); f_CstSurface_cstInterpMulti = (if ((v_lookupInterp (Base_dSource.v_spanStartOffset dtb__159)) mc3) then (B_dData_dMaybe.C_Maybe_Just (true)) else B_dData_dMaybe.C_Maybe_Nothing) } in (C_CstNode_CstBranch (dtb__157, dtb__158, dtb__159, surface, ((B_dData_dList.v_map ((((v_applySurfaceTree mc0) mc1) mc2) mc3)) dtb__161)))))
  | C_CstNode_CstLeaf (dtb__163) -> (C_CstNode_CstLeaf (dtb__163))
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTreeWithSurface = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) (parenEntries : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (interps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let parens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) parenEntries) in (((((v_applySurfaceTree parens) backticks) sections) interps) ((v_nestToTree toks) events))))

# 828 "Vuna/Compiler/Frontend/Cst.vuna"
let v_interpMultiOfSpan = (fun (s : t_Surface) (sp : Base_dSource.t_Span) -> ((v_lookupInterp (Base_dSource.v_spanStartOffset sp)) (s).f_Surface_surfaceInterps))

# 861 "Vuna/Compiler/Frontend/Cst.vuna"
let v_openFrame = (fun (kind : t_CstKind) (nid : int) (at : int) (first : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> { f_ParenFrame_pfKind = kind; f_ParenFrame_pfId = nid; f_ParenFrame_pfOpen = at; f_ParenFrame_pfFirst = first; f_ParenFrame_pfPrev = prev; f_ParenFrame_pfKids = 0; f_ParenFrame_pfKidKind = B_dData_dMaybe.C_Maybe_Nothing; f_ParenFrame_pfKidOpen = 0; f_ParenFrame_pfKidEnd = 0; f_ParenFrame_pfKidStructDepth = 0 })

# 865 "Vuna/Compiler/Frontend/Cst.vuna"
let v_addKid = (fun (kind : t_CstKind) (open_ : int) (end_ : int) (structD : int) (f : t_ParenFrame) -> { f_ParenFrame_pfKind = (f).f_ParenFrame_pfKind; f_ParenFrame_pfId = (f).f_ParenFrame_pfId; f_ParenFrame_pfOpen = (f).f_ParenFrame_pfOpen; f_ParenFrame_pfFirst = (f).f_ParenFrame_pfFirst; f_ParenFrame_pfPrev = (f).f_ParenFrame_pfPrev; f_ParenFrame_pfKids = ((f).f_ParenFrame_pfKids + 1); f_ParenFrame_pfKidKind = (B_dData_dMaybe.C_Maybe_Just (kind)); f_ParenFrame_pfKidOpen = open_; f_ParenFrame_pfKidEnd = end_; f_ParenFrame_pfKidStructDepth = structD })

# 885 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isOpenParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (match dtb__164 with
  | Frontend_dLexer.C_Tok_TSym (dtb__165) -> (if (dtb__165 = "(") then true else false)
  | _ -> false
)
  | _ -> false
))

# 889 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isCloseParen = (fun (mc0 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (match dtb__166 with
  | Frontend_dLexer.C_Tok_TSym (dtb__167) -> (if (dtb__167 = ")") then true else false)
  | _ -> false
)
  | _ -> false
))

# 871 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isParenFrame = (fun (endIdx : int) (lastTok : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (f : t_ParenFrame) -> (match (f).f_ParenFrame_pfKind with
  | C_CstKind_CstExprKind -> (if ((f).f_ParenFrame_pfKids = 1) then (let nd_uscrut3 = (f).f_ParenFrame_pfKidKind in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (match dtb__168 with
  | C_CstKind_CstExprKind -> (if (if (if (v_isOpenParen (f).f_ParenFrame_pfFirst) then (v_isCloseParen lastTok) else false) then ((f).f_ParenFrame_pfKidOpen = ((f).f_ParenFrame_pfOpen + 1)) else false) then ((f).f_ParenFrame_pfKidEnd = (endIdx - 1)) else false)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
))

# 893 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isExprFrame = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstExprKind -> true
  | _ -> false
))

# 898 "Vuna/Compiler/Frontend/Cst.vuna"
let v_adjacentParenDepth = (fun (kind : t_CstKind) (prev : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (next : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) -> (if (if (if (v_isExprFrame kind) then (v_isOpenParen prev) else false) then (v_isCloseParen next) else false) then 1 else 0))

# 903 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_consumeParen = (fun (n : int) (last : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (n <= 0) then { B_dData_dPair.f_Pair_first = toks; B_dData_dPair.f_Pair_second = last } else (match toks with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = last }
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (((v_consumeParen (n - 1)) (B_dData_dMaybe.C_Maybe_Just ((dtb__169).Frontend_dLexer.f_PTok_ptokTok))) dtb__170)
  | _ -> failwith "DT: impossible branch"
)))

# 912 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headTokOf = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__171).Frontend_dLexer.f_PTok_ptokTok))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 917 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_parenWalk = (fun (mc0 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : t_ParenFrame B_dData_dList.t_List) (mc2 : int) (mc3 : Frontend_dLexer.t_Tok B_dData_dMaybe.t_Maybe) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc5 : t_NodeEvent B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | C_NodeEvent_EvClose (dtb__175) -> (let step = (((v_consumeParen (dtb__175 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in (match mc1 with
  | B_dData_dList.C_List_Nil -> ((((((v_parenWalk mc0) B_dData_dList.C_List_Nil) dtb__175) last2) live) dtb__174)
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (let structD = (if (((v_isParenFrame dtb__175) last2) dtb__176) then ((dtb__176).f_ParenFrame_pfKidStructDepth + 1) else 0) in (let total = (structD + (((v_adjacentParenDepth (dtb__176).f_ParenFrame_pfKind) (dtb__176).f_ParenFrame_pfPrev) (v_headTokOf live))) in (let acc2 = (if (total > 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__176).f_ParenFrame_pfId; B_dData_dPair.f_Pair_second = total }, mc0)) else mc0) in (let outer2 = (match dtb__177 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (B_dData_dList.C_List__x58__x58_ ((((((v_addKid (dtb__176).f_ParenFrame_pfKind) (dtb__176).f_ParenFrame_pfOpen) dtb__175) structD) dtb__178), dtb__179))
  | _ -> failwith "DT: impossible branch"
) in ((((((v_parenWalk acc2) outer2) dtb__175) last2) live) dtb__174)))))
  | _ -> failwith "DT: impossible branch"
))))
  | C_NodeEvent_EvOpen (dtb__180, dtb__181, dtb__182) -> (let step = (((v_consumeParen (dtb__181 - mc2)) mc3) mc4) in (let live = (B_dData_dPair.v_firstOf step) in (let last2 = (B_dData_dPair.v_secondOf step) in ((((((v_parenWalk mc0) (B_dData_dList.C_List__x58__x58_ ((((((v_openFrame dtb__180) dtb__182) dtb__181) (v_headTokOf live)) last2), mc1))) dtb__181) last2) live) dtb__174))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 954 "Vuna/Compiler/Frontend/Cst.vuna"
let v_parenEntriesOf = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> ((((((v_parenWalk B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) 0) B_dData_dMaybe.C_Maybe_Nothing) toks) events))

# 945 "Vuna/Compiler/Frontend/Cst.vuna"
let v_surfaceOf = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) (extraParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (backticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (sections : (int, t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (interps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Surface_surfaceParens = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dList.v_append ((v_parenEntriesOf toks) events)) extraParens)); f_Surface_surfaceBackticks = backticks; f_Surface_surfaceSections = sections; f_Surface_surfaceInterps = interps })
