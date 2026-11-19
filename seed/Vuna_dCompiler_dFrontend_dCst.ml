open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment | C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
and t_Vuna_dCompiler_dFrontend_dCst_dTrivia = { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind : t_Vuna_dCompiler_dFrontend_dCst_dTriviaKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText : string; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dCst_dCstToken = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText : string; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading : t_Vuna_dCompiler_dFrontend_dCst_dTrivia Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dFrontend_dCst_dLineCur = { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff : int; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine : int; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol : int; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset : int }
and t_Vuna_dCompiler_dFrontend_dCst_dTrivComment = { f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart : int; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd : int }
and t_Vuna_dCompiler_dFrontend_dCst_dCstKind = C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstFileKind | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstBlockKind | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstDeclKind | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstGroupKind
and t_Vuna_dCompiler_dFrontend_dCst_dCstNode = C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf of (t_Vuna_dCompiler_dFrontend_dCst_dCstToken) | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch of (t_Vuna_dCompiler_dFrontend_dCst_dCstKind) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (t_Vuna_dCompiler_dFrontend_dCst_dCstNode Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dFrontend_dCst_dFrame = { f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind : t_Vuna_dCompiler_dFrontend_dCst_dCstKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol : int; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids : t_Vuna_dCompiler_dFrontend_dCst_dCstNode Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted : bool; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose : string }

# 86 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart = { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = 0; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = 1; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = 1; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset = 0 }

# 89 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcurPos = (fun (c : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset })

# 93 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dstepCur = (fun (src : string) (c : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) -> (if (((dtp_strAt src) (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) = 10) then { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = 1; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset + 1) } else { f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = (c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine; f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol + 1); f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset = ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOffset + 1) }))

# 102 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo = (fun (fuel : int) (src : string) (c : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (target : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) -> (if (fuel <= 0) then c else (if (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine > (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine target)) then true else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine target)) then ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcCol >= (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol target)) else false)) then c else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff >= (bi_strLength src)) then c else ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (fuel - 1)) src) ((v_Vuna_dCompiler_dFrontend_dCst_dstepCur src) c)) target)))))

# 111 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy = (fun (fuel : int) (src : string) (c : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (n : int) -> (if (fuel <= 0) then c else (if (n <= 0) then c else (if ((c).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff >= (bi_strLength src)) then c else ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy (fuel - 1)) src) ((v_Vuna_dCompiler_dFrontend_dCst_dstepCur src) c)) (n - 1))))))

# 120 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dsliceText = (fun (src : string) (from : int) (to_ : int) -> (if (to_ <= from) then "" else (((dtp_substring from) (to_ - from)) src)))

# 127 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disDigit ((dtp_strAt src) i)) then (((v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd (fuel - 1)) src) (i + 1)) else i)))

# 133 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd = (fun (fuel : int) (src : string) (i : int) -> (if (fuel <= 0) then i else (if (((dtp_strAt src) i) = 92) then (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (fuel - 2)) src) (i + 2)) else (if (((dtp_strAt src) i) = 34) then (i + 1) else (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (fuel - 1)) src) (i + 1))))))

# 142 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokTag = (fun (mc0 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dTok) -> (match mc0 with
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

# 154 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokText = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (mc2 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dTok) -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ""; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__9, dtb__10, dtb__11) -> ((fun endCur -> ((fun end_ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dData_dPair.f_Base_dData_dPair_dPair_second = end_ }) ((endCur).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (bi_strLength mc0)) mc0) mc1) dtb__11))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__12) -> ((fun end_ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dData_dPair.f_Base_dData_dPair_dPair_second = end_ }) (((v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd (bi_strLength mc0)) mc0) ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + 1)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__13) -> ((fun end_ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff) end_); Base_dData_dPair.f_Base_dData_dPair_dPair_second = end_ }) (((v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd (bi_strLength mc0)) mc0) (mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__14) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__14; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__14)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__15) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__15)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__16) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__16)) }
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__17) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((mc1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff + (bi_strLength dtb__17)) }
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) })

# 199 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp) })

# 185 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments = (fun (mc0 : int) (mc1 : string) (mc2 : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (mc3 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dComment Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__20; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__21; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__22 } -> ((fun c1 -> ((fun c2 -> ((fun c3 -> ((fun tailRes -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind = dtb__20; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan = dtb__22; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart = (c1).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd = (c3).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf tailRes))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf tailRes) }) ((((v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments mc0) mc1) c3) dtb__19))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy mc0) mc1) c2) 1))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo mc0) mc1) c1) (v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf dtb__22)))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo mc0) mc1) mc2) (v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf dtb__22)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia = (fun (src : string) (from : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) (to_ : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun fo -> ((fun to2 -> (if (to2 <= fo) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((fun fp -> ((fun tp -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivSpace; f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText src) fo) to2); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine fp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol fp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine tp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol tp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset fp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset tp) } }, Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf to_))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf from)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf to_))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf from)))

# 217 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind = (fun (mc0 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dCKind) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivBlockComment
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine -> C_Vuna_dCompiler_dFrontend_dCst_dTriviaKind_TrivLineComment
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia = (fun (src : string) (tc : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment) -> ((fun start -> { f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaKind = (v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommKind); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText = (((v_Vuna_dCompiler_dFrontend_dCst_dsliceText src) start) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd); f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaSpan = (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan }) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart))

# 230 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentEndPos = (fun (tc : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment) -> ((fun endSp -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommEnd; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 0) (v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf endSp)) }) (tc).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan))

# 237 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia = (fun (mc0 : string) (mc1 : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc2 : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc3 : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> ((fun cStart -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc0) mc1) cStart)) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia mc0) dtb__23), Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia mc0) (v_Vuna_dCompiler_dFrontend_dCst_dcommentEndPos dtb__23)) mc2) dtb__24)))) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__23).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf (dtb__23).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommSpan) })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia mc0) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (if ((dtb__25).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart < mc0) then ((fun taken -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf taken))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf taken) }) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore mc0) dtb__26)) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26)) })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter = (fun (bound : int) (c : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment) -> ((c).f_Vuna_dCompiler_dFrontend_dCst_dTrivComment_tcommStart >= bound))

# 266 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtokenNode = (fun (src : string) (curStart : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (prevEnd : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) (comments : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment Base_dData_dList.t_Base_dData_dList_dList) (tok : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dTok) -> ((fun textEnd -> ((fun text -> ((fun end_ -> ((fun curEnd -> ((fun startPos -> ((fun sp -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag = (v_Vuna_dCompiler_dFrontend_dCst_dtokTag tok); f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText = text; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan = sp; f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading = ((((v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia src) prevEnd) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; Base_dData_dPair.f_Base_dData_dPair_dPair_second = startPos }) comments) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = curEnd }) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine startPos); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol startPos); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset startPos); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd)) })) (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curStart))) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy (bi_strLength src)) src) curStart) (end_ - (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf textEnd))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf textEnd))) (((v_Vuna_dCompiler_dFrontend_dCst_dtokText src) curStart) tok)))

# 288 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dCst_dTrivComment Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dCst_dLineCur) (mc3 : (int, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc4 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> ((fun curStart -> ((fun start -> ((fun before -> ((fun live -> ((fun node -> ((fun curEnd -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf node), (((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf before)) curEnd) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (curEnd).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dCst_dcurPos curEnd) }) dtb__28)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf node))) (((((v_Vuna_dCompiler_dFrontend_dCst_dtokenNode mc0) curStart) mc3) live) (dtb__27).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok))) ((Base_dData_dList.v_Base_dData_dList_dfilter (v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter (Base_dData_dPair.v_Base_dData_dPair_dfirstOf mc3))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf before)))) ((v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore start) mc1))) (curStart).f_Vuna_dCompiler_dFrontend_dCst_dLineCur_lcOff)) ((((v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo (bi_strLength mc0)) mc0) mc2) (dtb__27).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlexCstGo = (fun (source : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__29) -> (match dtb__29 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__30; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__31 } -> ((fun fuel -> ((fun tcs -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens source) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf tcs)) v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 } }) dtb__30)))) ((((v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments fuel) source) v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart) dtb__31))) ((bi_strLength source) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__32) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments source)))

# 303 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlexCst = (fun (source : string) -> (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpan "vuna.parse.cst") "vuna.phase") (fun (_u : int) -> (v_Vuna_dCompiler_dFrontend_dCst_dlexCstGo source))))

# 317 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf = (fun (tr : t_Vuna_dCompiler_dFrontend_dCst_dTrivia) -> (tr).f_Vuna_dCompiler_dFrontend_dCst_dTrivia_triviaText)

# 321 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_drenderParts = (fun (t : t_Vuna_dCompiler_dFrontend_dCst_dCstToken) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf) (t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstLeading)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 325 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_drenderCst = (fun (toks : t_Vuna_dCompiler_dFrontend_dCst_dCstToken Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dCst_drenderParts) toks)))

# 329 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_droundtripOk = (fun (s : string) -> (match (v_Vuna_dCompiler_dFrontend_dCst_dlexCst s) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__33) -> ((v_Vuna_dCompiler_dFrontend_dCst_drenderCst dtb__33) = s)
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dnodeSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__34, dtb__35, dtb__36) -> dtb__35
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__37) -> (dtb__37).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dnodeKind = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__38, dtb__39, dtb__40) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__38))
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__41) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dnodeChildren = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__45) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dnodeToken = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__46, dtb__47, dtb__48) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__49) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__49))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcstKindTag = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstGroupKind -> "group"
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstBlockKind -> "block"
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstDeclKind -> "decl"
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstFileKind -> "file"
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dnodeKindTag = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__50, dtb__51, dtb__52) -> (v_Vuna_dCompiler_dFrontend_dCst_dcstKindTag dtb__50)
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__53) -> "leaf"
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dattachLeaf = (fun (t : t_Vuna_dCompiler_dFrontend_dCst_dCstToken) (f : t_Vuna_dCompiler_dFrontend_dCst_dFrame) -> ((fun sp -> ((fun start -> ((fun end_ -> { f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = (if (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted then (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart else start); f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = end_; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (t)), (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids)); f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = true; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose }) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp) })) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) })) (t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan))

# 418 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dattachLeafTop = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstToken) (mc1 : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dattachLeaf mc0) dtb__54), dtb__55))
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcloseFrame = (fun (f : t_Vuna_dCompiler_dFrontend_dCst_dFrame) -> (C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch ((f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd) }, (Base_dData_dList.v_Base_dData_dList_dreverse (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids))))

# 431 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dattachNode = (fun (node : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) (f : t_Vuna_dCompiler_dFrontend_dCst_dFrame) -> ((fun sp -> ((fun start -> ((fun end_ -> { f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = (if (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted then (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart else start); f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = end_; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (node, (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids)); f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = true; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = (f).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose }) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset sp) })) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) })) (v_Vuna_dCompiler_dFrontend_dCst_dnodeSpan node)))

# 447 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dcloseTop = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dattachNode (v_Vuna_dCompiler_dFrontend_dCst_dcloseFrame dtb__56)) dtb__58), dtb__59))
  | _ -> mc0
)
  | _ -> mc0
))

# 471 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dkindIsBlock = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstBlockKind -> true
  | _ -> false
))

# 452 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dcloseBlocks = (fun (fuel : int) (col : int) (frames : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then frames else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (if (if (v_Vuna_dCompiler_dFrontend_dCst_dkindIsBlock (dtb__60).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind) then (col < (dtb__60).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol) else false) then (((v_Vuna_dCompiler_dFrontend_dCst_dcloseBlocks (fuel - 1)) col) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dattachNode (v_Vuna_dCompiler_dFrontend_dCst_dcloseFrame dtb__60)) dtb__62), dtb__63))) else frames)
  | _ -> frames
)
  | _ -> frames
)) frames)))

# 475 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dkindIsDecl = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstDeclKind -> true
  | _ -> false
))

# 462 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dcloseDecls = (fun (fuel : int) (col : int) (frames : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then frames else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (if (if (v_Vuna_dCompiler_dFrontend_dCst_dkindIsDecl (dtb__64).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind) then (col <= (dtb__64).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol) else false) then (((v_Vuna_dCompiler_dFrontend_dCst_dcloseDecls (fuel - 1)) col) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dCst_dattachNode (v_Vuna_dCompiler_dFrontend_dCst_dcloseFrame dtb__64)) dtb__66), dtb__67))) else frames)
  | _ -> frames
)
  | _ -> frames
)) frames)))

# 479 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dkindIsGroup = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstGroupKind -> true
  | _ -> false
))

# 483 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dkindIsFile = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstFileKind -> true
  | _ -> false
))

# 488 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dframeCount = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (1 + (v_Vuna_dCompiler_dFrontend_dCst_dframeCount dtb__69))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dlayoutStep = (fun (col : int) (frames : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> ((fun f1 -> ((fun f2 -> (match f2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (if (v_Vuna_dCompiler_dFrontend_dCst_dkindIsGroup (dtb__70).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind) then f2 else (if (v_Vuna_dCompiler_dFrontend_dCst_dkindIsFile (dtb__70).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstDeclKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = col; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = false; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = "" }, f2)) else (if (col > (dtb__70).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstBlockKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = col; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = false; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = "" }, f2)) else f2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> f2
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dCst_dcloseDecls (v_Vuna_dCompiler_dFrontend_dCst_dframeCount f1)) col) f1))) (((v_Vuna_dCompiler_dFrontend_dCst_dcloseBlocks (v_Vuna_dCompiler_dFrontend_dCst_dframeCount frames)) col) frames)))

# 512 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dgroupCloseOf = (fun (mc0 : string) -> (if (mc0 = "(") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (")")) else (if (mc0 = "[") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("]")) else (if (mc0 = "{") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("}")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))

# 519 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_disSymText = (fun (s : string) (t : t_Vuna_dCompiler_dFrontend_dCst_dCstToken) -> ((t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText = s))

# 523 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_disLineStart = (fun (prevLine : int) (t : t_Vuna_dCompiler_dFrontend_dCst_dCstToken) -> ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine (t).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan) > prevLine))

# 527 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames = (fun (fuel : int) (frames : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) (prevLine : int) (toks : t_Vuna_dCompiler_dFrontend_dCst_dCstToken Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then frames else (match toks with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> frames
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (match frames with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames (fuel - 1)) frames) prevLine) dtb__73)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if (if (v_Vuna_dCompiler_dFrontend_dCst_dkindIsGroup (dtb__74).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind) then ((v_Vuna_dCompiler_dFrontend_dCst_disSymText (dtb__74).f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose) dtb__72) else false) then ((((v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dCst_dcloseTop ((v_Vuna_dCompiler_dFrontend_dCst_dattachLeafTop dtb__72) frames))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine (dtb__72).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan)) dtb__73) else ((fun line -> ((fun frames1 -> (match (v_Vuna_dCompiler_dFrontend_dCst_dgroupCloseOf (dtb__72).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstText) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__76) -> ((((v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dCst_dattachLeafTop dtb__72) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstGroupKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = 0; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = false; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = dtb__76 }, frames1)))) line) dtb__73)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dCst_dattachLeafTop dtb__72) frames1)) line) dtb__73)
  | _ -> failwith "DT: impossible branch"
)) (if (if ((v_Vuna_dCompiler_dFrontend_dCst_disLineStart prevLine) dtb__72) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((dtb__72).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstTag = "eof")) else false) then ((v_Vuna_dCompiler_dFrontend_dCst_dlayoutStep (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol (dtb__72).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan)) frames) else frames))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine (dtb__72).f_Vuna_dCompiler_dFrontend_dCst_dCstToken_cstSpan)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 549 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dcloseAll = (fun (fuel : int) (frames : t_Vuna_dCompiler_dFrontend_dCst_dFrame Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then frames else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (match dtb__78 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dCst_dcloseAll (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dCst_dcloseTop frames))
)
  | _ -> ((v_Vuna_dCompiler_dFrontend_dCst_dcloseAll (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dCst_dcloseTop frames))
)) frames)))

# 571 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_dcstTokCount = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstToken Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (1 + (v_Vuna_dCompiler_dFrontend_dCst_dcstTokCount dtb__80))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dbuildCst = (fun (toks : t_Vuna_dCompiler_dFrontend_dCst_dCstToken Base_dData_dList.t_Base_dData_dList_dList) -> ((fun root -> ((fun frames0 -> ((fun frames -> (match frames with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (v_Vuna_dCompiler_dFrontend_dCst_dcloseFrame dtb__81)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstFileKind, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dCst_dcloseAll (v_Vuna_dCompiler_dFrontend_dCst_dframeCount frames0)) frames0))) ((((v_Vuna_dCompiler_dFrontend_dCst_dbuildFrames ((v_Vuna_dCompiler_dFrontend_dCst_dcstTokCount toks) + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (root, Base_dData_dList.C_Base_dData_dList_dList_Nil))) 0) toks))) { f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKind = C_Vuna_dCompiler_dFrontend_dCst_dCstKind_CstFileKind; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameCol = 1; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStart = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameEnd = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameKids = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameStarted = false; f_Vuna_dCompiler_dFrontend_dCst_dFrame_frameClose = "" }))

# 576 "Vuna/Compiler/Frontend/Cst.vuna"
let rec v_Vuna_dCompiler_dFrontend_dCst_drenderCstTree = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dCst_dCstNode) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstBranch (dtb__83, dtb__84, dtb__85) -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dCst_drenderCstTree) dtb__85))
  | C_Vuna_dCompiler_dFrontend_dCst_dCstNode_CstLeaf (dtb__86) -> (Base_dData_dList.dtp_concatMany (v_Vuna_dCompiler_dFrontend_dCst_drenderParts dtb__86))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Frontend/Cst.vuna"
let v_Vuna_dCompiler_dFrontend_dCst_dtreeRoundtripOk = (fun (s : string) -> (match (v_Vuna_dCompiler_dFrontend_dCst_dlexCst s) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> ((v_Vuna_dCompiler_dFrontend_dCst_drenderCstTree (v_Vuna_dCompiler_dFrontend_dCst_dbuildCst dtb__87)) = s)
  | _ -> failwith "DT: impossible branch"
))
