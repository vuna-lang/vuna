open Vuna_runtime
type t_TriviaKind = C_TriviaKind_TrivSpace | C_TriviaKind_TrivLineComment | C_TriviaKind_TrivBlockComment
and t_Trivia = { f_Trivia_triviaKind : t_TriviaKind; f_Trivia_triviaText : string; f_Trivia_triviaSpan : Base_dSource.t_Span }
and t_CstToken = { f_CstToken_cstTag : string; f_CstToken_cstText : string; f_CstToken_cstSpan : Base_dSource.t_Span; f_CstToken_cstLeading : t_Trivia B_dData_dList.t_List }
and t_LineCur = { f_LineCur_lcOff : int; f_LineCur_lcLine : int; f_LineCur_lcCol : int; f_LineCur_lcOffset : int }
and t_TrivComment = { f_TrivComment_tcommKind : Frontend_dLexer.t_CKind; f_TrivComment_tcommSpan : Base_dSource.t_Span; f_TrivComment_tcommStart : int; f_TrivComment_tcommEnd : int }
and t_CstKind = C_CstKind_CstFileKind | C_CstKind_CstBlockKind | C_CstKind_CstDeclKind | C_CstKind_CstGroupKind
and t_CstNode = C_CstNode_CstLeaf of (t_CstToken) | C_CstNode_CstBranch of (t_CstKind) * (Base_dSource.t_Span) * (t_CstNode B_dData_dList.t_List)
and t_Frame = { f_Frame_frameKind : t_CstKind; f_Frame_frameCol : int; f_Frame_frameStart : Base_dSource.t_Pos; f_Frame_frameEnd : Base_dSource.t_Pos; f_Frame_frameKids : t_CstNode B_dData_dList.t_List; f_Frame_frameStarted : bool; f_Frame_frameClose : string }

# 86 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lineCurStart = { f_LineCur_lcOff = 0; f_LineCur_lcLine = 1; f_LineCur_lcCol = 1; f_LineCur_lcOffset = 0 }

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_curPos = (fun (c : t_LineCur) -> { Base_dSource.f_Pos_posLine = (c).f_LineCur_lcLine; Base_dSource.f_Pos_posCol = (c).f_LineCur_lcCol; Base_dSource.f_Pos_posOffset = (c).f_LineCur_lcOffset; Base_dSource.f_Pos_posEndOffset = (c).f_LineCur_lcOffset })

# 93 "Vuna/Compiler/Frontend/Cst.vuna"
let v_stepCur = (fun (src : string) (c : t_LineCur) -> (if (((dtp_strAt src) (c).f_LineCur_lcOff) = 10) then { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = ((c).f_LineCur_lcLine + 1); f_LineCur_lcCol = 1; f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) } else { f_LineCur_lcOff = ((c).f_LineCur_lcOff + 1); f_LineCur_lcLine = (c).f_LineCur_lcLine; f_LineCur_lcCol = ((c).f_LineCur_lcCol + 1); f_LineCur_lcOffset = ((c).f_LineCur_lcOffset + 1) }))

# 102 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceTo = (fun (fuel : int) (src : string) (c : t_LineCur) (target : Base_dSource.t_Pos) -> (if (fuel <= 0) then c else (if (if ((c).f_LineCur_lcLine > (Base_dSource.v_posLine target)) then true else (if ((c).f_LineCur_lcLine = (Base_dSource.v_posLine target)) then ((c).f_LineCur_lcCol >= (Base_dSource.v_posCol target)) else false)) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceTo (fuel - 1)) src) ((v_stepCur src) c)) target)))))

# 111 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_advanceBy = (fun (fuel : int) (src : string) (c : t_LineCur) (n : int) -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_LineCur_lcOff >= (bi_strLength src)) then c else ((((v_advanceBy (fuel - 1)) src) ((v_stepCur src) c)) (n - 1))))))

# 120 "Vuna/Compiler/Frontend/Cst.vuna"
let v_sliceText = (fun (src : string) (from : int) (to_ : int) -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 127 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanDigitsEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (Frontend_dLexer.v_isDigit ((dtp_strAt src) i)) then (((v_scanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 133 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_scanStringEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (((dtp_strAt src) i) = 92) then (((v_scanStringEnd (fuel - 2)) src) (i + 2)) else (if (((dtp_strAt src) i) = 34) then (i + 1) else (((v_scanStringEnd (fuel - 1)) src) (i + 1))))))

# 142 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 154 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokText = (fun (mc0 : string) (mc1 : t_LineCur) (mc2 : Frontend_dLexer.t_Tok) -> (match mc2 with
  | Frontend_dLexer.C_Tok_TEof -> { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (mc1).f_LineCur_lcOff }
  | Frontend_dLexer.C_Tok_TTmpl (dtb__9, dtb__10, dtb__11) -> ((fun endCur -> ((fun end_ -> { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ }) ((endCur).f_LineCur_lcOff + 1))) ((((v_advanceTo (bi_strLength mc0)) mc0) mc1) dtb__11))
  | Frontend_dLexer.C_Tok_TStr (dtb__12) -> ((fun end_ -> { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ }) (((v_scanStringEnd (bi_strLength mc0)) mc0) ((mc1).f_LineCur_lcOff + 1)))
  | Frontend_dLexer.C_Tok_TInt (dtb__13) -> ((fun end_ -> { B_dData_dPair.f_Pair_first = (((v_sliceText mc0) (mc1).f_LineCur_lcOff) end_); B_dData_dPair.f_Pair_second = end_ }) (((v_scanDigitsEnd (bi_strLength mc0)) mc0) (mc1).f_LineCur_lcOff))
  | Frontend_dLexer.C_Tok_TFloat (dtb__14) -> { B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__14)) }
  | Frontend_dLexer.C_Tok_TSym (dtb__15) -> { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__15)) }
  | Frontend_dLexer.C_Tok_TKw (dtb__16) -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__16)) }
  | Frontend_dLexer.C_Tok_TIdent (dtb__17) -> { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = ((mc1).f_LineCur_lcOff + (bi_strLength dtb__17)) }
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanStartOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset sp) })

# 199 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanEndOf = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset sp) })

# 185 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_toTrivComments = (fun (mc0 : int) (mc1 : string) (mc2 : t_LineCur) (mc3 : Frontend_dLexer.t_Comment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Frontend_dLexer.f_Comment_commentKind = dtb__20; Frontend_dLexer.f_Comment_commentText = dtb__21; Frontend_dLexer.f_Comment_commentSpan = dtb__22 } -> ((fun c1 -> ((fun c2 -> ((fun c3 -> ((fun tailRes -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_TrivComment_tcommKind = dtb__20; f_TrivComment_tcommSpan = dtb__22; f_TrivComment_tcommStart = (c1).f_LineCur_lcOff; f_TrivComment_tcommEnd = (c3).f_LineCur_lcOff }, (B_dData_dPair.v_firstOf tailRes))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tailRes) }) ((((v_toTrivComments mc0) mc1) c3) dtb__19))) ((((v_advanceBy mc0) mc1) c2) 1))) ((((v_advanceTo mc0) mc1) c1) (v_spanEndOf dtb__22)))) ((((v_advanceTo mc0) mc1) mc2) (v_spanStartOf dtb__22)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spaceTrivia = (fun (src : string) (from : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (to_ : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) -> ((fun fo -> ((fun to2 -> (if (to2 <= fo) then B_dData_dList.C_List_Nil else ((fun fp -> ((fun tp -> (B_dData_dList.C_List__x58__x58_ ({ f_Trivia_triviaKind = C_TriviaKind_TrivSpace; f_Trivia_triviaText = (((v_sliceText src) fo) to2); f_Trivia_triviaSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine fp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol fp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine tp); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol tp); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset fp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset tp) } }, B_dData_dList.C_List_Nil))) (B_dData_dPair.v_secondOf to_))) (B_dData_dPair.v_secondOf from)))) (B_dData_dPair.v_firstOf to_))) (B_dData_dPair.v_firstOf from)))

# 217 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTriviaKind = (fun (mc0 : Frontend_dLexer.t_CKind) -> (match mc0 with
  | Frontend_dLexer.C_CKind_CBlock -> C_TriviaKind_TrivBlockComment
  | Frontend_dLexer.C_CKind_CLine -> C_TriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentTrivia = (fun (src : string) (tc : t_TrivComment) -> ((fun start -> { f_Trivia_triviaKind = (v_commentTriviaKind (tc).f_TrivComment_tcommKind); f_Trivia_triviaText = (((v_sliceText src) start) (tc).f_TrivComment_tcommEnd); f_Trivia_triviaSpan = (tc).f_TrivComment_tcommSpan }) (tc).f_TrivComment_tcommStart))

# 230 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentEndPos = (fun (tc : t_TrivComment) -> ((fun endSp -> { B_dData_dPair.f_Pair_first = (tc).f_TrivComment_tcommEnd; B_dData_dPair.f_Pair_second = ((Frontend_dLexer.v_advanceChar 0) (v_spanEndOf endSp)) }) (tc).f_TrivComment_tcommSpan))

# 237 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_gapTrivia = (fun (mc0 : string) (mc1 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc2 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc3 : t_TrivComment B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> ((fun cStart -> ((B_dData_dList.v_append (((v_spaceTrivia mc0) mc1) cStart)) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (((v_commentTrivia mc0) dtb__23), B_dData_dList.C_List_Nil))) ((((v_gapTrivia mc0) (v_commentEndPos dtb__23)) mc2) dtb__24)))) { B_dData_dPair.f_Pair_first = (dtb__23).f_TrivComment_tcommStart; B_dData_dPair.f_Pair_second = (v_spanStartOf (dtb__23).f_TrivComment_tcommSpan) })
  | B_dData_dList.C_List_Nil -> (((v_spaceTrivia mc0) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_takeCommentsBefore = (fun (mc0 : int) (mc1 : t_TrivComment B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if ((dtb__25).f_TrivComment_tcommStart < mc0) then ((fun taken -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__25, (B_dData_dPair.v_firstOf taken))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf taken) }) ((v_takeCommentsBefore mc0) dtb__26)) else { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26)) })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Frontend/Cst.vuna"
let v_commentStartsAtOrAfter = (fun (bound : int) (c : t_TrivComment) -> ((c).f_TrivComment_tcommStart >= bound))

# 266 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenNode = (fun (src : string) (curStart : t_LineCur) (prevEnd : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (comments : t_TrivComment B_dData_dList.t_List) (tok : Frontend_dLexer.t_Tok) -> ((fun textEnd -> ((fun text -> ((fun end_ -> ((fun curEnd -> ((fun startPos -> ((fun sp -> { B_dData_dPair.f_Pair_first = { f_CstToken_cstTag = (v_tokTag tok); f_CstToken_cstText = text; f_CstToken_cstSpan = sp; f_CstToken_cstLeading = ((((v_gapTrivia src) prevEnd) { B_dData_dPair.f_Pair_first = (curStart).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = startPos }) comments) }; B_dData_dPair.f_Pair_second = curEnd }) { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startPos); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startPos); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_curPos curEnd)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_curPos curEnd)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startPos); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_curPos curEnd)) })) (v_curPos curStart))) ((((v_advanceBy (bi_strLength src)) src) curStart) (end_ - (curStart).f_LineCur_lcOff)))) (B_dData_dPair.v_secondOf textEnd))) (B_dData_dPair.v_firstOf textEnd))) (((v_tokText src) curStart) tok)))

# 288 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildTokens = (fun (mc0 : string) (mc1 : t_TrivComment B_dData_dList.t_List) (mc2 : t_LineCur) (mc3 : (int, Base_dSource.t_Pos) B_dData_dPair.t_Pair) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> ((fun curStart -> ((fun start -> ((fun before -> ((fun live -> ((fun node -> ((fun curEnd -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf node), (((((v_buildTokens mc0) (B_dData_dPair.v_secondOf before)) curEnd) { B_dData_dPair.f_Pair_first = (curEnd).f_LineCur_lcOff; B_dData_dPair.f_Pair_second = (v_curPos curEnd) }) dtb__28)))) (B_dData_dPair.v_secondOf node))) (((((v_tokenNode mc0) curStart) mc3) live) (dtb__27).Frontend_dLexer.f_PTok_ptokTok))) ((B_dData_dList.v_filter (v_commentStartsAtOrAfter (B_dData_dPair.v_firstOf mc3))) (B_dData_dPair.v_firstOf before)))) ((v_takeCommentsBefore start) mc1))) (curStart).f_LineCur_lcOff)) ((((v_advanceTo (bi_strLength mc0)) mc0) mc2) (dtb__27).Frontend_dLexer.f_PTok_ptokPos))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCstGo = (fun (source : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__29) -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> ((fun fuel -> ((fun tcs -> (B_dData_dMaybe.C_Maybe_Just ((((((v_buildTokens source) (B_dData_dPair.v_firstOf tcs)) v_lineCurStart) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }) dtb__30)))) ((((v_toTrivComments fuel) source) v_lineCurStart) dtb__31))) ((bi_strLength source) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__32) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dLexer.v_lexSourceWithComments source)))

# 303 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lexCst = (fun (source : string) -> (((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.cst") "vuna.phase") (fun (_u : int) -> (v_lexCstGo source))))

# 317 "Vuna/Compiler/Frontend/Cst.vuna"
let v_triviaTextOf = (fun (tr : t_Trivia) -> (tr).f_Trivia_triviaText)

# 321 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderParts = (fun (t : t_CstToken) -> ((B_dData_dList.v_append ((B_dData_dList.v_map v_triviaTextOf) (t).f_CstToken_cstLeading)) (B_dData_dList.C_List__x58__x58_ ((t).f_CstToken_cstText, B_dData_dList.C_List_Nil))))

# 325 "Vuna/Compiler/Frontend/Cst.vuna"
let v_renderCst = (fun (toks : t_CstToken B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_concatMap v_renderParts) toks)))

# 329 "Vuna/Compiler/Frontend/Cst.vuna"
let v_roundtripOk = (fun (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ((v_renderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__34, dtb__35, dtb__36) -> dtb__35
  | C_CstNode_CstLeaf (dtb__37) -> (dtb__37).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__38, dtb__39, dtb__40) -> (B_dData_dMaybe.C_Maybe_Just (dtb__38))
  | C_CstNode_CstLeaf (dtb__41) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_CstNode_CstLeaf (dtb__45) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__46, dtb__47, dtb__48) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__49) -> (B_dData_dMaybe.C_Maybe_Just (dtb__49))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Cst.vuna"
let v_cstKindTag = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstGroupKind -> "group"
  | C_CstKind_CstBlockKind -> "block"
  | C_CstKind_CstDeclKind -> "decl"
  | C_CstKind_CstFileKind -> "file"
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__50, dtb__51, dtb__52) -> (v_cstKindTag dtb__50)
  | C_CstNode_CstLeaf (dtb__53) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachLeaf = (fun (t : t_CstToken) (f : t_Frame) -> ((fun sp -> ((fun start -> ((fun end_ -> { f_Frame_frameKind = (f).f_Frame_frameKind; f_Frame_frameCol = (f).f_Frame_frameCol; f_Frame_frameStart = (if (f).f_Frame_frameStarted then (f).f_Frame_frameStart else start); f_Frame_frameEnd = end_; f_Frame_frameKids = (B_dData_dList.C_List__x58__x58_ ((C_CstNode_CstLeaf (t)), (f).f_Frame_frameKids)); f_Frame_frameStarted = true; f_Frame_frameClose = (f).f_Frame_frameClose }) { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset sp) })) { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset sp) })) (t).f_CstToken_cstSpan))

# 418 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachLeafTop = (fun (mc0 : t_CstToken) (mc1 : t_Frame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (B_dData_dList.C_List__x58__x58_ (((v_attachLeaf mc0) dtb__54), dtb__55))
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeFrame = (fun (f : t_Frame) -> (C_CstNode_CstBranch ((f).f_Frame_frameKind, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (f).f_Frame_frameStart); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (f).f_Frame_frameStart); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (f).f_Frame_frameEnd); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (f).f_Frame_frameEnd); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (f).f_Frame_frameStart); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (f).f_Frame_frameEnd) }, (B_dData_dList.v_reverse (f).f_Frame_frameKids))))

# 431 "Vuna/Compiler/Frontend/Cst.vuna"
let v_attachNode = (fun (node : t_CstNode) (f : t_Frame) -> ((fun sp -> ((fun start -> ((fun end_ -> { f_Frame_frameKind = (f).f_Frame_frameKind; f_Frame_frameCol = (f).f_Frame_frameCol; f_Frame_frameStart = (if (f).f_Frame_frameStarted then (f).f_Frame_frameStart else start); f_Frame_frameEnd = end_; f_Frame_frameKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_Frame_frameKids)); f_Frame_frameStarted = true; f_Frame_frameClose = (f).f_Frame_frameClose }) { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanEndLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanEndCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanEndOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanEndOffset sp) })) { Base_dSource.f_Pos_posLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Pos_posCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Pos_posOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Pos_posEndOffset = (Base_dSource.v_spanStartOffset sp) })) (v_nodeSpan node)))

# 447 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTop = (fun (mc0 : t_Frame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (B_dData_dList.C_List__x58__x58_ (((v_attachNode (v_closeFrame dtb__56)) dtb__58), dtb__59))
  | _ -> mc0
)
  | _ -> mc0
))

# 471 "Vuna/Compiler/Frontend/Cst.vuna"
let v_kindIsBlock = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstBlockKind -> true
  | _ -> false
))

# 452 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeBlocks = (fun (fuel : int) (col : int) (frames : t_Frame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (if (if (v_kindIsBlock (dtb__60).f_Frame_frameKind) then (col < (dtb__60).f_Frame_frameCol) else false) then (((v_closeBlocks (fuel - 1)) col) (B_dData_dList.C_List__x58__x58_ (((v_attachNode (v_closeFrame dtb__60)) dtb__62), dtb__63))) else frames)
  | _ -> frames
)
  | _ -> frames
)) frames)))

# 475 "Vuna/Compiler/Frontend/Cst.vuna"
let v_kindIsDecl = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstDeclKind -> true
  | _ -> false
))

# 462 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeDecls = (fun (fuel : int) (col : int) (frames : t_Frame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if (if (v_kindIsDecl (dtb__64).f_Frame_frameKind) then (col <= (dtb__64).f_Frame_frameCol) else false) then (((v_closeDecls (fuel - 1)) col) (B_dData_dList.C_List__x58__x58_ (((v_attachNode (v_closeFrame dtb__64)) dtb__66), dtb__67))) else frames)
  | _ -> frames
)
  | _ -> frames
)) frames)))

# 479 "Vuna/Compiler/Frontend/Cst.vuna"
let v_kindIsGroup = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstGroupKind -> true
  | _ -> false
))

# 483 "Vuna/Compiler/Frontend/Cst.vuna"
let v_kindIsFile = (fun (mc0 : t_CstKind) -> (match mc0 with
  | C_CstKind_CstFileKind -> true
  | _ -> false
))

# 488 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_frameCount = (fun (mc0 : t_Frame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (1 + (v_frameCount dtb__69))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Cst.vuna"
let v_layoutStep = (fun (col : int) (frames : t_Frame B_dData_dList.t_List) -> ((fun f1 -> ((fun f2 -> (match f2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (if (v_kindIsGroup (dtb__70).f_Frame_frameKind) then f2 else (if (v_kindIsFile (dtb__70).f_Frame_frameKind) then (B_dData_dList.C_List__x58__x58_ ({ f_Frame_frameKind = C_CstKind_CstDeclKind; f_Frame_frameCol = col; f_Frame_frameStart = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameEnd = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameKids = B_dData_dList.C_List_Nil; f_Frame_frameStarted = false; f_Frame_frameClose = "" }, f2)) else (if (col > (dtb__70).f_Frame_frameCol) then (B_dData_dList.C_List__x58__x58_ ({ f_Frame_frameKind = C_CstKind_CstBlockKind; f_Frame_frameCol = col; f_Frame_frameStart = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameEnd = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameKids = B_dData_dList.C_List_Nil; f_Frame_frameStarted = false; f_Frame_frameClose = "" }, f2)) else f2)))
  | B_dData_dList.C_List_Nil -> f2
  | _ -> failwith "DT: impossible branch"
)) (((v_closeDecls (v_frameCount f1)) col) f1))) (((v_closeBlocks (v_frameCount frames)) col) frames)))

# 512 "Vuna/Compiler/Frontend/Cst.vuna"
let v_groupCloseOf = (fun (mc0 : string) -> (if (mc0 = "(") then (B_dData_dMaybe.C_Maybe_Just (")")) else (if (mc0 = "[") then (B_dData_dMaybe.C_Maybe_Just ("]")) else (if (mc0 = "{") then (B_dData_dMaybe.C_Maybe_Just ("}")) else B_dData_dMaybe.C_Maybe_Nothing))))

# 519 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isSymText = (fun (s : string) (t : t_CstToken) -> ((t).f_CstToken_cstText = s))

# 523 "Vuna/Compiler/Frontend/Cst.vuna"
let v_isLineStart = (fun (prevLine : int) (t : t_CstToken) -> ((Base_dSource.v_spanStartLine (t).f_CstToken_cstSpan) > prevLine))

# 527 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_buildFrames = (fun (fuel : int) (frames : t_Frame B_dData_dList.t_List) (prevLine : int) (toks : t_CstToken B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (match toks with
  | B_dData_dList.C_List_Nil -> frames
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match frames with
  | B_dData_dList.C_List_Nil -> ((((v_buildFrames (fuel - 1)) frames) prevLine) dtb__73)
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if (if (v_kindIsGroup (dtb__74).f_Frame_frameKind) then ((v_isSymText (dtb__74).f_Frame_frameClose) dtb__72) else false) then ((((v_buildFrames (fuel - 1)) (v_closeTop ((v_attachLeafTop dtb__72) frames))) (Base_dSource.v_spanStartLine (dtb__72).f_CstToken_cstSpan)) dtb__73) else ((fun line -> ((fun frames1 -> (match (v_groupCloseOf (dtb__72).f_CstToken_cstText) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> ((((v_buildFrames (fuel - 1)) ((v_attachLeafTop dtb__72) (B_dData_dList.C_List__x58__x58_ ({ f_Frame_frameKind = C_CstKind_CstGroupKind; f_Frame_frameCol = 0; f_Frame_frameStart = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameEnd = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameKids = B_dData_dList.C_List_Nil; f_Frame_frameStarted = false; f_Frame_frameClose = dtb__76 }, frames1)))) line) dtb__73)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_buildFrames (fuel - 1)) ((v_attachLeafTop dtb__72) frames1)) line) dtb__73)
  | _ -> failwith "DT: impossible branch"
)) (if (if ((v_isLineStart prevLine) dtb__72) then (B_dData_dBool.v_not ((dtb__72).f_CstToken_cstTag = "eof")) else false) then ((v_layoutStep (Base_dSource.v_spanStartCol (dtb__72).f_CstToken_cstSpan)) frames) else frames))) (Base_dSource.v_spanStartLine (dtb__72).f_CstToken_cstSpan)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 549 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAll = (fun (fuel : int) (frames : t_Frame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (match dtb__78 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__77, B_dData_dList.C_List_Nil))
  | _ -> ((v_closeAll (fuel - 1)) (v_closeTop frames))
)
  | _ -> ((v_closeAll (fuel - 1)) (v_closeTop frames))
)) frames)))

# 571 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_cstTokCount = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (1 + (v_cstTokCount dtb__80))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Frontend/Cst.vuna"
let v_buildCst = (fun (toks : t_CstToken B_dData_dList.t_List) -> ((fun root -> ((fun frames0 -> ((fun frames -> (match frames with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (v_closeFrame dtb__81)
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_closeAll (v_frameCount frames0)) frames0))) ((((v_buildFrames ((v_cstTokCount toks) + 1)) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) 0) toks))) { f_Frame_frameKind = C_CstKind_CstFileKind; f_Frame_frameCol = 1; f_Frame_frameStart = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameEnd = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_Frame_frameKids = B_dData_dList.C_List_Nil; f_Frame_frameStarted = false; f_Frame_frameClose = "" }))

# 576 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__83, dtb__84, dtb__85) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__85))
  | C_CstNode_CstLeaf (dtb__86) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__86))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Frontend/Cst.vuna"
let v_treeRoundtripOk = (fun (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> ((v_renderCstTree (v_buildCst dtb__87)) = s)
  | _ -> failwith "DT: impossible branch"
))
