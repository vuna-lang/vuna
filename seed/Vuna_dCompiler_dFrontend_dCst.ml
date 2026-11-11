open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
and t_Vuna_dCompiler_dFrontend_dCst_dTrivia = { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind : t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText : string; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dCst_dCstToken = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading : t_Vuna_dCompiler_dFrontend_dCst_dTrivia Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dCst_dTrivComment = { f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart : int; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd : int }

let v_Vuna_dCompiler_dFrontend_dCst_drowList = (fun source -> ((Base_dString.v_Base_dString_dsplit "\n") source))

let rec v_Vuna_dCompiler_dFrontend_dCst_dbyteOffsetGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc1 >= mc2) then mc3 else ((((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffsetGo dtb__1) (mc1 + 1)) mc2) ((mc3 + (bi_strLength dtb__0)) + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset = (fun rows line col -> (((((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffsetGo rows) 1) line) 0) + (col - 1)))

let rec v_Vuna_dCompiler_dFrontend_dCst_dposAtGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((fun w -> (if (mc1 <= (mc3 + w)) then { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = mc2; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = ((mc1 - mc3) + 1) } else ((((v_Vuna_dCompiler_dFrontend_dCst_dposAtGo dtb__3) mc1) (mc2 + 1)) ((mc3 + w) + 1)))) (bi_strLength dtb__2))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dposAtOffset = (fun rows off -> ((((v_Vuna_dCompiler_dFrontend_dCst_dposAtGo rows) off) 1) 0))

let v_Vuna_dCompiler_dFrontend_dCst_dspanOfRange = (fun rows from to_ -> ((fun p -> ((fun q -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine p); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol p); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine q); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol q) }) ((v_Vuna_dCompiler_dFrontend_dCst_dposAtOffset rows) to_))) ((v_Vuna_dCompiler_dFrontend_dCst_dposAtOffset rows) from)))

let v_Vuna_dCompiler_dFrontend_dCst_dspanOfToken = (fun rows startPos endOff -> ((fun end_ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine startPos); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol startPos); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine end_); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol end_) }) ((v_Vuna_dCompiler_dFrontend_dCst_dposAtOffset rows) endOff)))

let v_Vuna_dCompiler_dFrontend_dCst_dsegmentChars = (fun source start limit -> (if (limit <= start) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.dtp_unpack (((dtp_substring start) (limit - start)) source))))

let rec v_Vuna_dCompiler_dFrontend_dCst_dgreedyDigits = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__4) then (Base_dList.C_Base_dList_dList_Cons (dtb__4, (v_Vuna_dCompiler_dFrontend_dCst_dgreedyDigits dtb__5))) else Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dCst_drawStringBody = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (dtb__6 = 92) then (Base_dList.C_Base_dList_dList_Cons (92, (v_Vuna_dCompiler_dFrontend_dCst_drawStringEscape dtb__7))) else (if (dtb__6 = 34) then (Base_dList.C_Base_dList_dList_Cons (34, Base_dList.C_Base_dList_dList_Nil)) else (Base_dList.C_Base_dList_dList_Cons (dtb__6, (v_Vuna_dCompiler_dFrontend_dCst_drawStringBody dtb__7)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dFrontend_dCst_drawStringEscape = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons (dtb__8, (v_Vuna_dCompiler_dFrontend_dCst_drawStringBody dtb__9)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_drawStringText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Cons (dtb__10, (v_Vuna_dCompiler_dFrontend_dCst_drawStringBody dtb__11)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dtemplateText = (fun source rows start endPos -> ((fun afterEnd -> (if (afterEnd <= start) then "" else (((dtp_substring start) (afterEnd - start)) source))) ((((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset rows) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine endPos)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol endPos)) + 1)))

let v_Vuna_dCompiler_dFrontend_dCst_dtokTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> "eof"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__12) -> "sym"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__13, dtb__14, dtb__15) -> "tmpl"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__16) -> "str"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__17) -> "float"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__18) -> "int"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__19) -> "kw"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__20) -> "ident"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dtokSourceText = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> ""
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__21, dtb__22, dtb__23) -> ((((v_Vuna_dCompiler_dFrontend_dCst_dtemplateText mc0) mc1) mc2) dtb__23)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__24) -> (Base_dList.dtp_pack (v_Vuna_dCompiler_dFrontend_dCst_drawStringText (((v_Vuna_dCompiler_dFrontend_dCst_dsegmentChars mc0) mc2) mc3)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__25) -> (Base_dList.dtp_pack (v_Vuna_dCompiler_dFrontend_dCst_dgreedyDigits (((v_Vuna_dCompiler_dFrontend_dCst_dsegmentChars mc0) mc2) mc3)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__26) -> dtb__26
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__27) -> dtb__27
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__28) -> dtb__28
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__29) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComment = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__30; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__31; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__32 } -> { f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind = dtb__30; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan = dtb__32; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart = (((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset mc0) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__32)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartCol dtb__32)); f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd = ((((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset mc0) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine dtb__32)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndCol dtb__32)) + 1) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia = (fun rows source from to_ -> (if (to_ <= from) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((dtp_substring from) (to_ - from)) source); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = (((v_Vuna_dCompiler_dFrontend_dCst_dspanOfRange rows) from) to_) }, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia = (fun source tc -> ((fun start -> { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = (v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((dtp_substring start) ((tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd - start)) source); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan }) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart))

let rec v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> ((Base_dList.v_Base_dList_dappend ((((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc1) mc0) mc2) (dtb__33).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia mc0) dtb__33), Base_dList.C_Base_dList_dList_Nil))) (((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia mc0) mc1) (dtb__33).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd) mc3) dtb__34)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc1) mc0) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if ((dtb__35).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart < mc0) then ((fun taken -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__35, (Base_dPair.v_Base_dPair_dfirstOf taken))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf taken) }) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore mc0) dtb__36)) else { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36)) })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter = (fun bound c -> ((c).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart >= bound))

let v_Vuna_dCompiler_dFrontend_dCst_dtokStartOffset = (fun rows t -> (((v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset rows) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine (t).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol (t).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)))

let v_Vuna_dCompiler_dFrontend_dCst_dtokLimit = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (bi_strLength mc0)
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> ((v_Vuna_dCompiler_dFrontend_dCst_dtokStartOffset mc1) dtb__37)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dtokenNode = (fun source rows prevEnd start comments t rest -> ((fun text -> ((fun endOff -> { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag = (v_Vuna_dCompiler_dFrontend_dCst_dtokTag (t).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok); f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText = text; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan = (((v_Vuna_dCompiler_dFrontend_dCst_dspanOfToken rows) (t).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos) endOff); f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading = (((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia source) rows) prevEnd) start) comments) }; Base_dPair.f_Base_dPair_dPair_second = endOff }) (start + (bi_strLength text)))) (((((v_Vuna_dCompiler_dFrontend_dCst_dtokSourceText source) rows) start) (((v_Vuna_dCompiler_dFrontend_dCst_dtokLimit source) rows) rest)) (t).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)))

let rec v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> ((fun start -> ((fun before -> ((fun live -> ((fun node -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf node), (((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens mc0) mc1) (Base_dPair.v_Base_dPair_dsecondOf before)) (Base_dPair.v_Base_dPair_dsecondOf node)) dtb__40)))) (((((((v_Vuna_dCompiler_dFrontend_dCst_dtokenNode mc0) mc1) mc3) start) live) dtb__39) dtb__40))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter mc3)) (Base_dPair.v_Base_dPair_dfirstOf before)))) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore start) mc2))) ((v_Vuna_dCompiler_dFrontend_dCst_dtokStartOffset mc1) dtb__39))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dlexCst = (fun source -> (match (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexSource source) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__41) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__42) -> ((fun rows -> (match (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexComments source) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__43) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__44) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens source) rows) ((Base_dList.v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComment rows) c))) dtb__44)) 0) dtb__42)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dCst_drowList source))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf = (fun tr -> (tr).f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText)

let v_Vuna_dCompiler_dFrontend_dCst_drenderParts = (fun t -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf) (t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading)) (Base_dList.C_Base_dList_dList_Cons ((t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dFrontend_dCst_drenderCst = (fun toks -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dCst_drenderParts) toks)))

let v_Vuna_dCompiler_dFrontend_dCst_droundtripOk = (fun s -> (match (v_Vuna_dCompiler_dFrontend_dCst_dlexCst s) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> ((v_Vuna_dCompiler_dFrontend_dCst_drenderCst dtb__45) = s)
  | _ -> failwith "DT: impossible branch"
))
