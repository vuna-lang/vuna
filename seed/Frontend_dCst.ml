open Vuna_runtime
type t_TriviaKind = C_TriviaKind_TrivSpace | C_TriviaKind_TrivLineComment | C_TriviaKind_TrivBlockComment
and t_Trivia = { f_Trivia_triviaKind : t_TriviaKind; f_Trivia_triviaText : string; f_Trivia_triviaSpan : Base_dSource.t_Span }
and t_CstToken = { f_CstToken_cstTag : string; f_CstToken_cstText : string; f_CstToken_cstSpan : Base_dSource.t_Span; f_CstToken_cstLeading : t_Trivia B_dData_dList.t_List }
and t_LineCur = { f_LineCur_lcOff : int; f_LineCur_lcLine : int; f_LineCur_lcCol : int; f_LineCur_lcOffset : int }
and t_TrivComment = { f_TrivComment_tcommKind : Frontend_dLexer.t_CKind; f_TrivComment_tcommSpan : Base_dSource.t_Span; f_TrivComment_tcommStart : int; f_TrivComment_tcommEnd : int }
and t_CstKind = C_CstKind_CstFileKind | C_CstKind_CstModHeadKind | C_CstKind_CstImportKind | C_CstKind_CstFixityKind | C_CstKind_CstExportItemKind | C_CstKind_CstDeclKind | C_CstKind_CstCtorKind | C_CstKind_CstFieldKind | C_CstKind_CstMethodKind | C_CstKind_CstBindingKind | C_CstKind_CstAltKind | C_CstKind_CstExprKind | C_CstKind_CstPatKind | C_CstKind_CstDoStmtKind
and t_CstNode = C_CstNode_CstLeaf of (t_CstToken) | C_CstNode_CstBranch of (t_CstKind) * (int) * (Base_dSource.t_Span) * (t_CstNode B_dData_dList.t_List)
and t_NodeEvent = C_NodeEvent_EvOpen of (t_CstKind) * (int) * (int) | C_NodeEvent_EvClose of (int)
and t_NestFrame = { f_NestFrame_nfKind : t_CstKind; f_NestFrame_nfId : int; f_NestFrame_nfStart : Base_dSource.t_Span; f_NestFrame_nfKids : t_CstNode B_dData_dList.t_List }

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

# 389 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeSpan = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__36
  | C_CstNode_CstLeaf (dtb__38) -> (dtb__38).f_CstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeId = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__39, dtb__40, dtb__41, dtb__42) -> (B_dData_dMaybe.C_Maybe_Just (dtb__40))
  | C_CstNode_CstLeaf (dtb__43) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKind = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__44, dtb__45, dtb__46, dtb__47) -> (B_dData_dMaybe.C_Maybe_Just (dtb__44))
  | C_CstNode_CstLeaf (dtb__48) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeChildren = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__49, dtb__50, dtb__51, dtb__52) -> dtb__52
  | C_CstNode_CstLeaf (dtb__53) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeToken = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__54, dtb__55, dtb__56, dtb__57) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_CstNode_CstLeaf (dtb__58) -> (B_dData_dMaybe.C_Maybe_Just (dtb__58))
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Frontend/Cst.vuna"
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

# 415 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeKindTag = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__59, dtb__60, dtb__61, dtb__62) -> (v_cstKindTag dtb__59)
  | C_CstNode_CstLeaf (dtb__63) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Frontend/Cst.vuna"
let v_spanFrom = (fun (a : Base_dSource.t_Span) (b : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine a); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol a); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_spanEndLine b); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_spanEndCol b); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset a); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_spanEndOffset b) })

# 471 "Vuna/Compiler/Frontend/Cst.vuna"
let v_degenerateSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 475 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_lastSpanOfList = (fun (mc0 : Base_dSource.t_Span) (mc1 : Base_dSource.t_Span B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> ((v_lastSpanOfList dtb__64) dtb__65)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Frontend/Cst.vuna"
let v_lastSpanOf = (fun (d : Base_dSource.t_Span) (kids : t_CstNode B_dData_dList.t_List) -> ((v_lastSpanOfList d) ((B_dData_dList.v_map v_nodeSpan) kids)))

# 484 "Vuna/Compiler/Frontend/Cst.vuna"
let v_headSpan = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_CstToken B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (dtb__66).f_CstToken_cstSpan
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishFrame = (fun (f : t_NestFrame) -> (let kids = (B_dData_dList.v_reverse (f).f_NestFrame_nfKids) in (let endSp = ((v_lastSpanOf (f).f_NestFrame_nfStart) kids) in (C_CstNode_CstBranch ((f).f_NestFrame_nfKind, (f).f_NestFrame_nfId, ((v_spanFrom (f).f_NestFrame_nfStart) endSp), kids)))))

# 497 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushLeaves = (fun (mc0 : t_CstNode B_dData_dList.t_List) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = (dtb__68).f_NestFrame_nfKind; f_NestFrame_nfId = (dtb__68).f_NestFrame_nfId; f_NestFrame_nfStart = (dtb__68).f_NestFrame_nfStart; f_NestFrame_nfKids = ((B_dData_dList.v_append (B_dData_dList.v_reverse mc0)) (dtb__68).f_NestFrame_nfKids) }, dtb__69))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushInto = (fun (node : t_CstNode) (f : t_NestFrame) -> { f_NestFrame_nfKind = (f).f_NestFrame_nfKind; f_NestFrame_nfId = (f).f_NestFrame_nfId; f_NestFrame_nfStart = (f).f_NestFrame_nfStart; f_NestFrame_nfKids = (B_dData_dList.C_List__x58__x58_ (node, (f).f_NestFrame_nfKids)) })

# 507 "Vuna/Compiler/Frontend/Cst.vuna"
let v_pushNode = (fun (mc0 : t_CstNode) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto mc0) dtb__70), dtb__71))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Cst.vuna"
let v_closeTopFrame = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (B_dData_dList.C_List__x58__x58_ (((v_pushInto (v_finishFrame dtb__72)) dtb__74), dtb__75))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__72, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestFrameCount = (fun (mc0 : t_NestFrame B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (1 + (v_nestFrameCount dtb__77))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_closeAllFrames = (fun (fuel : int) (frames : t_NestFrame B_dData_dList.t_List) -> (if (fuel <= 0) then frames else (let nd_uscrut2 = frames in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> ((v_closeAllFrames (fuel - 1)) (v_closeTopFrame frames))
  | _ -> frames
)
  | _ -> frames
))))

# 533 "Vuna/Compiler/Frontend/Cst.vuna"
let v_eventIndex = (fun (mc0 : t_NodeEvent) -> (match mc0 with
  | C_NodeEvent_EvClose (dtb__82) -> dtb__82
  | C_NodeEvent_EvOpen (dtb__83, dtb__84, dtb__85) -> dtb__84
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nestEvents = (fun (mc0 : t_CstToken B_dData_dList.t_List) (mc1 : int) (mc2 : t_NestFrame B_dData_dList.t_List) (mc3 : t_NodeEvent B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (let at = (v_eventIndex dtb__86) in (let n = (at - mc1) in (let live2 = ((B_dData_dList.v_drop n) mc0) in (let frames1 = ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) ((B_dData_dList.v_take n) mc0))) mc2) in (match dtb__86 with
  | C_NodeEvent_EvOpen (dtb__88, dtb__89, dtb__90) -> ((((v_nestEvents live2) at) (B_dData_dList.C_List__x58__x58_ ({ f_NestFrame_nfKind = dtb__88; f_NestFrame_nfId = dtb__90; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) live2); f_NestFrame_nfKids = B_dData_dList.C_List_Nil }, frames1))) dtb__87)
  | C_NodeEvent_EvClose (dtb__91) -> ((((v_nestEvents live2) at) (v_closeTopFrame frames1)) dtb__87)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((v_closeAllFrames ((v_nestFrameCount mc2) + 1)) ((v_pushLeaves ((B_dData_dList.v_map (fun (t : t_CstToken) -> (C_CstNode_CstLeaf (t)))) mc0)) mc2))
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Frontend/Cst.vuna"
let v_finishRoot = (fun (mc0 : Base_dSource.t_Span) (mc1 : t_NestFrame B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, 0, mc0, B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (C_CstNode_CstBranch (C_CstKind_CstFileKind, (dtb__92).f_NestFrame_nfId, mc0, (B_dData_dList.v_reverse (dtb__92).f_NestFrame_nfKids)))
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokenSpanOf = (fun (t : t_CstToken) -> (t).f_CstToken_cstSpan)

# 566 "Vuna/Compiler/Frontend/Cst.vuna"
let v_tokensSpan = (fun (mc0 : t_CstToken B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> ((v_spanFrom (dtb__94).f_CstToken_cstSpan) ((v_lastSpanOfList (dtb__94).f_CstToken_cstSpan) ((B_dData_dList.v_map v_tokenSpanOf) dtb__95)))
  | B_dData_dList.C_List_Nil -> v_degenerateSpan
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nestToTree = (fun (toks : t_CstToken B_dData_dList.t_List) (events : t_NodeEvent B_dData_dList.t_List) -> (let root = { f_NestFrame_nfKind = C_CstKind_CstFileKind; f_NestFrame_nfId = 0; f_NestFrame_nfStart = ((v_headSpan v_degenerateSpan) toks); f_NestFrame_nfKids = B_dData_dList.C_List_Nil } in (let frames = ((((v_nestEvents toks) 0) (B_dData_dList.C_List__x58__x58_ (root, B_dData_dList.C_List_Nil))) events) in (let sp = (v_tokensSpan toks) in ((v_finishRoot sp) frames)))))

# 583 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_collectLeaves = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__96, dtb__97, dtb__98, dtb__99) -> ((B_dData_dList.v_concatMap v_collectLeaves) dtb__99)
  | C_CstNode_CstLeaf (dtb__100) -> (B_dData_dList.C_List__x58__x58_ (dtb__100, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_nodeTable = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__101, dtb__102, dtb__103, dtb__104) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = mc0 }, ((B_dData_dList.v_concatMap v_nodeTable) dtb__104)))
  | C_CstNode_CstLeaf (dtb__105) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Frontend/Cst.vuna"
let v_nodeIndex = (fun (tree : t_CstNode) -> (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (v_nodeTable tree)))

# 598 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_renderCstTree = (fun (mc0 : t_CstNode) -> (match mc0 with
  | C_CstNode_CstBranch (dtb__106, dtb__107, dtb__108, dtb__109) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map v_renderCstTree) dtb__109))
  | C_CstNode_CstLeaf (dtb__110) -> (B_dData_dList.dtp_concatMany (v_renderParts dtb__110))
  | _ -> failwith "DT: impossible branch"
))

# 603 "Vuna/Compiler/Frontend/Cst.vuna"
let v_treeRoundtripOk = (fun (events : t_NodeEvent B_dData_dList.t_List) (s : string) -> (match (v_lexCst s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> ((v_renderCstTree ((v_nestToTree dtb__111) events)) = s)
  | _ -> failwith "DT: impossible branch"
))
