open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok : t_Vuna_dCompiler_dFrontend_dLexer_dTok; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind : t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText : string; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }

# 45 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__1 } -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = dtb__0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = dtb__1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = dtb__0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = dtb__1 }
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__3 } -> (if (mc0 = 10) then { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = (dtb__2 + 1); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } else { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = (dtb__3 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 54 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 57 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

# 63 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 60 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

# 66 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 69 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 97 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 129 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

# 132 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__4; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__5 } -> (match dtb__4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (dtb__6 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__5 } else (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__7; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__6) dtb__5) }))
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__5 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__8; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__9 } -> (match dtb__8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if (if (dtb__10 = 123) then (dtb__12 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 + 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__13; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__12) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) dtb__9)) }) else (if (if (dtb__10 = 45) then (dtb__12 = 125) else false) then (if (mc0 = 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__13; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__12) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) dtb__9)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__13; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__12) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) dtb__9)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) dtb__9) })))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) dtb__9) })
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__9)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__14; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__15 } -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__16) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__17; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__16) dtb__15) }) else (match dtb__17 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (if (dtb__16 = 45) then (dtb__18 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__17; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__16) dtb__15) })) else (if (if (dtb__16 = 123) then (dtb__18 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment 1) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__17; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__16) dtb__15) }) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__20) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__20))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__21) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__21)
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (cs))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (cs))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (cs))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

# 164 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt = (fun rest -> (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dInt.v_Eq_uInt)) ((Base_dList.v_Base_dList_dtake 5) rest)) (Base_dList.C_Base_dList_dList_Cons (118, (Base_dList.C_Base_dList_dList_Cons (117, (Base_dList.C_Base_dList_dList_Cons (110, (Base_dList.C_Base_dList_dList_Cons (97, (Base_dList.C_Base_dList_dList_Cons (64, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 167 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__22; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__23 } -> (match dtb__22 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__24) then true else (dtb__24 = 64)) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__25; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__24) dtb__23) }) (Base_dList.C_Base_dList_dList_Cons (dtb__24, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__23 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__23 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__26; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__28) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__29; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__28) dtb__27) }) (Base_dList.C_Base_dList_dList_Cons (dtb__28, mc1))) else (if (dtb__28 = 46) then (match dtb__29 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__30) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__29; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__28) dtb__27) }) (Base_dList.C_Base_dList_dList_Cons (dtb__28, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } }
  | _ -> failwith "DT: impossible branch"
) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

# 190 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__32; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__33 } -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__34) then ((fun d -> (if (mc1 > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__33)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_IntLiteralOutOfRange) else ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__35; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__34) dtb__33) }) ((mc1 * 10) + d)))) (dtb__34 - 48)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__33 } })))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__33 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__36; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__37 } -> (match dtb__36 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__38) then (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__39; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__38) dtb__37) }) else (if (dtb__38 = 46) then (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__40)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__42; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__43 } -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__44) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__45; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__44) dtb__43) }) (Base_dList.C_Base_dList_dList_Cons (dtb__44, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__43 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__43 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__46; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__47 } -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__48) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__49; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__48) dtb__47) }) (Base_dList.C_Base_dList_dList_Cons (dtb__48, mc1))) else (if (dtb__48 = 46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__49; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__48) dtb__47) }) (Base_dList.C_Base_dList_dList_Cons (dtb__48, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__47 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__47 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__50; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__51 } -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__52) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__53; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__52) dtb__51) }) (Base_dList.C_Base_dList_dList_Cons (dtb__52, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__51 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__51 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

# 257 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__54; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__55 } -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (dtb__56 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__57; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__56) dtb__55) } else mc0)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

# 323 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__58) -> (if (dtb__58 = "{") then (mc0 + 1) else (if (dtb__58 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 268 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__59; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__60 } -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if (dtb__61 = 36) then (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if (dtb__63 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__65) -> (match dtb__65 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = dtb__67 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__68; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__69 } -> (match dtb__68 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (if (dtb__70 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__71; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__69) }) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__66)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__67)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__64; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = holeStart }) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__63) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60) }) (Base_dList.C_Base_dList_dList_Cons (dtb__61, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60) }) (Base_dList.C_Base_dList_dList_Cons (dtb__61, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__61 = 92) then (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__73) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__74; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__73) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60)) }) (Base_dList.C_Base_dList_dList_Cons (dtb__75, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__61 = 34) else false) then (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if (if (dtb__76 = 34) then (dtb__78 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__79; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__78) pos3) }; Base_dPair.f_Base_dPair_dPair_second = pos3 } }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__78) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__76) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60) }) (Base_dList.C_Base_dList_dList_Cons (dtb__61, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__61 = 34) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60) }; Base_dPair.f_Base_dPair_dPair_second = dtb__60 } })) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__61 = 10) else false) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) dtb__60) }) (Base_dList.C_Base_dList_dList_Cons (dtb__61, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__60)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
# 311 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__80) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__80))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__81) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__82; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__83 } -> (match dtb__82 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (if (if (dtb__84 = 125) then (depth = 0) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = dtb__81 })) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__86) -> (match dtb__86 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__87; Base_dPair.f_Base_dPair_dPair_second = dtb__88 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__87).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__88) (Base_dList.C_Base_dList_dList_Cons (dtb__87, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__89) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__89))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__81)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__83)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__81)
  | _ -> failwith "DT: impossible branch"
)))
# 329 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__90; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__91 } -> (match dtb__90 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if (if (dtb__92 = 64) then (v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt dtb__93) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__94); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = dtb__95 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__92) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__96; Base_dPair.f_Base_dPair_dPair_second = dtb__97 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__96); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = dtb__97 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__92) then (if (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) then ((fun frac -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat ((Base_dPair.v_Base_dPair_dfirstOf frac))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf frac) }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__98) -> (match dtb__98 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__99)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = dtb__100 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__101) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__101))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (dtb__92 - 48)))) else (if (dtb__92 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__92) dtb__93) dtb__91) else (if (if (if (if (if (if (if (dtb__92 = 40) then true else (dtb__92 = 41)) then true else (dtb__92 = 91)) then true else (dtb__92 = 93)) then true else (dtb__92 = 44)) then true else (dtb__92 = 123)) then true else (dtb__92 = 125)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) } })) else (if (dtb__92 = 96) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) } })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__92) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__102)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__91 }; Base_dPair.f_Base_dPair_dPair_second = dtb__103 }))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnexpectedCharacter))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lexOneToken on empty input")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
# 355 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if (if (dtb__104 = 34) then (dtb__106 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__108) -> (match dtb__108 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__109; Base_dPair.f_Base_dPair_dPair_second = dtb__110 } -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__111; Base_dPair.f_Base_dPair_dPair_second = dtb__112 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__109, dtb__112)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__111 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__113) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__113))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__107; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__106) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__104) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)))
# 369 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__114) -> (match dtb__114 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__115; Base_dPair.f_Base_dPair_dPair_second = dtb__116 } -> (match dtb__116 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = dtb__118 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__121) -> (match dtb__120 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__121)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__117 }))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__115, dtb__118)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__117 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__115, dtb__118)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__117 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__115, dtb__118)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__117 }))
)) dtb__115)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

# 379 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__123))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__124) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__125; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__126 } -> (match dtb__125 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__126 }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__127) -> (match dtb__127 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__128; Base_dPair.f_Base_dPair_dPair_second = dtb__129 } -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__129) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__131) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__131))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__132) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__132))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__124))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__124)
  | _ -> failwith "DT: impossible branch"
)))

# 400 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

# 391 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }))

# 417 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__133; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__134; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__135 } -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (if (if (if (dtb__136 = 32) then true else (dtb__136 = 9)) then true else (dtb__136 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__137) else (Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

# 429 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__138; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__139 } -> (match dtb__138 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if (dtb__140 = 10) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__139 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } } else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__141; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) dtb__139) }) (Base_dList.C_Base_dList_dList_Cons (dtb__140, mc1))) dtb__139))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__139 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__142; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__143 } -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (if (if (dtb__144 = 123) then (dtb__146 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__147; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143)) }) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__146, (Base_dList.C_Base_dList_dList_Cons (dtb__144, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__143)) else (if (if (dtb__144 = 45) then (dtb__146 = 125) else false) then (if (mc1 = 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__147; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143)) }; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__143) } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__147; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143)) }) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__146, (Base_dList.C_Base_dList_dList_Cons (dtb__144, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__143))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__145; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__144, mc2))) dtb__143)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__145; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__144, mc2))) dtb__143)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__143)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine endP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol endP) })

# 465 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__148) -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (match dtb__150 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__151; Base_dPair.f_Base_dPair_dPair_second = dtb__152 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__151))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

# 453 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (match dtb__155 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (if (if (dtb__154 = 34) then (dtb__156 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__158) -> (match dtb__158 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> (match dtb__160 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__161))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__163) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__163))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (mc0 - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__157; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__156) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__154) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) }))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__164; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__165 } -> (match dtb__164 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__166, dtb__167) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (if (dtb__166 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__166) dtb__167) dtb__165) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__169) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__169) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (if (if (dtb__166 = 45) then (dtb__170 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__173 } -> (match dtb__173 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__174; Base_dPair.f_Base_dPair_dPair_second = dtb__175 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__174) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__172); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__165) dtb__175) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__171; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__170) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__166) dtb__165)) }) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__170) dtb__165))) else (if (if (dtb__166 = 123) then (dtb__170 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__176) -> (match dtb__176 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__178 } -> (match dtb__178 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__179) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__177; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__165) dtb__180) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__181) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__181))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__171; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__170) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__166) dtb__165)) }) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__170) dtb__165))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__167; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__166) dtb__165) }) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }) Base_dList.C_Base_dList_dList_Nil))
