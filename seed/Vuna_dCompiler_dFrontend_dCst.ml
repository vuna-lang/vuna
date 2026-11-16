open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
and t_Vuna_dCompiler_dFrontend_dCst_dTrivia = { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind : t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText : string; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dCst_dCstToken = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading : t_Vuna_dCompiler_dFrontend_dCst_dTrivia Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dCst_dLineCur = { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff : int; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine : int; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol : int }
and t_Vuna_dCompiler_dFrontend_dCst_dTrivComment = { f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart : int; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd : int }

# 78 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart = { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = 0; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = 1; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = 1 }

# 81 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcurPos = (fun c -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol })

# 85 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dstepCur = (fun src c -> (if (((dtp_strAt src) (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) = 10) then { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = 1 } else { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol + 1) }))

# 92 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo = (fun fuel src c target -> (if (fuel <= 0) then c else (if (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine > (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine target)) then true else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine target)) then ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol >= (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol target)) else false)) then c else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff >= (bi_strLength src)) then c else ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (fuel - 1)) src) ((v_Vuna_dCompiler_dFrontend_dCst_dstepCur src) c)) target)))))

# 99 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy = (fun fuel src c n -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff >= (bi_strLength src)) then c else ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy (fuel - 1)) src) ((v_Vuna_dCompiler_dFrontend_dCst_dstepCur src) c)) (n - 1))))))

# 106 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dsliceText = (fun src from to_ -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 113 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd = (fun fuel src i -> (if (fuel <= 0) then i else (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit ((dtp_strAt src) i)) then (((v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 119 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd = (fun fuel src i -> (if (fuel <= 0) then i else (if (((dtp_strAt src) i) = 92) then (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (fuel - 2)) src) (i + 2)) else (if (((dtp_strAt src) i) = 34) then (i + 1) else (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (fuel - 1)) src) (i + 1))))))

# 126 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokTag = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> "eof"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__0) -> "sym"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__1, dtb__2, dtb__3) -> "tmpl"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__4) -> "str"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__5) -> "float"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__6) -> "int"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__7) -> "kw"
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__8) -> "ident"
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__9, dtb__10, dtb__11) -> ((fun endCur -> ((fun end_ -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dPair.f_Base_dPair_dPair_second = end_ }) ((endCur).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (bi_strLength mc0)) mc0) mc1) dtb__11))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__12) -> ((fun end_ -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dPair.f_Base_dPair_dPair_second = end_ }) (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (bi_strLength mc0)) mc0) ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__13) -> ((fun end_ -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dPair.f_Base_dPair_dPair_second = end_ }) (((v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd (bi_strLength mc0)) mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__14) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__14)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__15) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__15; Base_dPair.f_Base_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__15)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__16) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__16)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__17) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__17; Base_dPair.f_Base_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__17)) }
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf = (fun sp -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) })

# 183 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf = (fun sp -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndCol sp) })

# 169 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__20; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__21; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__22 } -> ((fun c1 -> ((fun c2 -> ((fun c3 -> ((fun tailRes -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind = dtb__20; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan = dtb__22; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart = (c1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd = (c3).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff }, (Base_dPair.v_Base_dPair_dfirstOf tailRes))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf tailRes) }) ((((v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments mc0) mc1) c3) dtb__19))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy mc0) mc1) c2) 1))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo mc0) mc1) c1) (v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf dtb__22)))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo mc0) mc1) mc2) (v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf dtb__22)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia = (fun src from to_ -> ((fun fo -> ((fun to2 -> (if (to2 <= fo) then Base_dList.C_Base_dList_dList_Nil else ((fun fp -> ((fun tp -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText src) fo) to2); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine fp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol fp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine tp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol tp) } }, Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dsecondOf to_))) (Base_dPair.v_Base_dPair_dsecondOf from)))) (Base_dPair.v_Base_dPair_dfirstOf to_))) (Base_dPair.v_Base_dPair_dfirstOf from)))

# 201 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia = (fun src tc -> ((fun start -> { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = (v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText src) start) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan }) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart))

# 214 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentEndPos = (fun tc -> ((fun endSp -> { Base_dPair.f_Base_dPair_dPair_first = (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 0) (v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf endSp)) }) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan))

# 221 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__23, dtb__24) -> ((fun cStart -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc0) mc1) cStart)) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia mc0) dtb__23), Base_dList.C_Base_dList_dList_Nil))) ((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia mc0) (v_Vuna_dCompiler_dFrontend_dCst_dcommentEndPos dtb__23)) mc2) dtb__24)))) { Base_dPair.f_Base_dPair_dPair_first = (dtb__23).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf (dtb__23).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan) })
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc0) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (if ((dtb__25).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart < mc0) then ((fun taken -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, (Base_dPair.v_Base_dPair_dfirstOf taken))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf taken) }) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore mc0) dtb__26)) else { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, dtb__26)) })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter = (fun bound c -> ((c).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart >= bound))

# 247 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokenNode = (fun src curStart prevEnd comments tok -> ((fun textEnd -> ((fun text -> ((fun end_ -> ((fun curEnd -> ((fun startPos -> ((fun sp -> { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag = (v_Vuna_dCompiler_dFrontend_dCst_dtokTag tok); f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText = text; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan = sp; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading = ((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia src) prevEnd) { Base_dPair.f_Base_dPair_dPair_first = (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; Base_dPair.f_Base_dPair_dPair_second = startPos }) comments) }; Base_dPair.f_Base_dPair_dPair_second = curEnd }) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine startPos); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol startPos); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd)) })) (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curStart))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy (bi_strLength src)) src) curStart) (end_ - (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff)))) (Base_dPair.v_Base_dPair_dsecondOf textEnd))) (Base_dPair.v_Base_dPair_dfirstOf textEnd))) (((v_Vuna_dCompiler_dFrontend_dCst_dtokText src) curStart) tok)))

# 263 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__28) -> ((fun curStart -> ((fun start -> ((fun before -> ((fun live -> ((fun node -> ((fun curEnd -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dPair.v_Base_dPair_dfirstOf node), (((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens mc0) (Base_dPair.v_Base_dPair_dsecondOf before)) curEnd) { Base_dPair.f_Base_dPair_dPair_first = (curEnd).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd) }) dtb__28)))) (Base_dPair.v_Base_dPair_dsecondOf node))) (((((v_Vuna_dCompiler_dFrontend_dCst_dtokenNode mc0) curStart) mc3) live) (dtb__27).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter (Base_dPair.v_Base_dPair_dfirstOf mc3))) (Base_dPair.v_Base_dPair_dfirstOf before)))) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore start) mc1))) (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff)) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (bi_strLength mc0)) mc0) mc2) (dtb__27).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlexCstGo = (fun source -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__29) -> (match dtb__29 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__30; Base_dPair.f_Base_dPair_dPair_second = dtb__31 } -> ((fun fuel -> ((fun tcs -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens source) (Base_dPair.v_Base_dPair_dfirstOf tcs)) v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } }) dtb__30)))) ((((v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments fuel) source) v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart) dtb__31))) ((bi_strLength source) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__32) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments source)))

# 277 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlexCst = (fun source -> (((Base_dObs_dSpan.v_Base_dObs_dSpan_dobsSpan "vuna.parse.cst") "vuna.phase") (fun _u -> (v_Vuna_dCompiler_dFrontend_dCst_dlexCstGo source))))

# 290 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf = (fun tr -> (tr).f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText)

# 294 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_drenderParts = (fun t -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf) (t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading)) (Base_dList.C_Base_dList_dList__x58__x58_ ((t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText, Base_dList.C_Base_dList_dList_Nil))))

# 298 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_drenderCst = (fun toks -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dCst_drenderParts) toks)))

# 302 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_droundtripOk = (fun s -> (match (v_Vuna_dCompiler_dFrontend_dCst_dlexCst s) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> ((v_Vuna_dCompiler_dFrontend_dCst_drenderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))
