open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok : t_Vuna_dCompiler_dFrontend_dLexer_dTok; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind : t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText : string; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }

let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__1 } -> (if (mc0 = 10) then { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = (dtb__0 + 1); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } else { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = (dtb__1 + 1) })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__3 } -> (match dtb__2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (dtb__4 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__3 } else (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__5; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__4) dtb__3) }))
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__3 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__6; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__7 } -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if (dtb__8 = 123) then (dtb__10 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 + 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)) }) else (if (if (dtb__8 = 45) then (dtb__10 = 125) else false) then (if (mc0 = 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__9; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7) })))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__9; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7) })
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__12; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__13 } -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__14) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__15; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13) }) else (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (if (dtb__14 = 45) then (dtb__16 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__15; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13) })) else (if (if (dtb__14 = 123) then (dtb__16 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment 1) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__15; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13) }) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__19) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__19)
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

let v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt = (fun rest -> (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dInt.v_Eq_uInt)) ((Base_dList.v_Base_dList_dtake 5) rest)) (Base_dList.C_Base_dList_dList_Cons (118, (Base_dList.C_Base_dList_dList_Cons (117, (Base_dList.C_Base_dList_dList_Cons (110, (Base_dList.C_Base_dList_dList_Cons (97, (Base_dList.C_Base_dList_dList_Cons (64, Base_dList.C_Base_dList_dList_Nil))))))))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__20; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__22) then true else (dtb__22 = 64)) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__23; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21) }) (Base_dList.C_Base_dList_dList_Cons (dtb__22, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__24; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__25 } -> (match dtb__24 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__26) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__27; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__26) dtb__25) }) (Base_dList.C_Base_dList_dList_Cons (dtb__26, mc1))) else (if (dtb__26 = 46) then (match dtb__27 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__28) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__27; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__26) dtb__25) }) (Base_dList.C_Base_dList_dList_Cons (dtb__26, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__25 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__25 } }
  | _ -> failwith "DT: impossible branch"
) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__25 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__25 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__30; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__31 } -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__32) then ((fun d -> (if (mc1 > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_IntLiteralOutOfRange) else ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__33; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__32) dtb__31) }) ((mc1 * 10) + d)))) (dtb__32 - 48)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__31 } })))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__31 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__34; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__35 } -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__36) then (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__37; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35) }) else (if (dtb__36 = 46) then (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__38)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__40; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } -> (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__42) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__43; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__42) dtb__41) }) (Base_dList.C_Base_dList_dList_Cons (dtb__42, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__44; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } -> (match dtb__44 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__47; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__46) dtb__45) }) (Base_dList.C_Base_dList_dList_Cons (dtb__46, mc1))) else (if (dtb__46 = 46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__47; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__46) dtb__45) }) (Base_dList.C_Base_dList_dList_Cons (dtb__46, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__48; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__49 } -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__50) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__51; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__50) dtb__49) }) (Base_dList.C_Base_dList_dList_Cons (dtb__50, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__49 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__49 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__52; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__53 } -> (match dtb__52 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if (dtb__54 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__55; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__54) dtb__53) } else mc0)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__56) -> (if (dtb__56 = "{") then (mc0 + 1) else (if (dtb__56 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__57; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if (dtb__59 = 36) then (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if (dtb__61 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__63) -> (match dtb__63 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__64; Base_dPair.f_Base_dPair_dPair_second = dtb__65 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__66; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__67 } -> (match dtb__66 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (if (dtb__68 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__69; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__67) }) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__64)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__65)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__70) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__70))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = holeStart }) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__61) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__59 = 92) then (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__71) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__72; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__71) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58)) }) (Base_dList.C_Base_dList_dList_Cons (dtb__73, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__59 = 34) else false) then (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (if (if (dtb__74 = 34) then (dtb__76 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__77; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__76) pos3) }; Base_dPair.f_Base_dPair_dPair_second = pos3 } }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__76) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__59 = 34) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }; Base_dPair.f_Base_dPair_dPair_second = dtb__58 } })) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__59 = 10) else false) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__78) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__78))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__79) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__80; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__81 } -> (match dtb__80 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if (if (dtb__82 = 125) then (depth = 0) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = dtb__79 })) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__84) -> (match dtb__84 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__85; Base_dPair.f_Base_dPair_dPair_second = dtb__86 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__85).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__86) (Base_dList.C_Base_dList_dList_Cons (dtb__85, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__87) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__87))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__79)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__79)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__88; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__89 } -> (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (if (if (dtb__90 = 64) then (v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt dtb__91) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) (Base_dList.C_Base_dList_dList_Cons (dtb__90, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__92); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = dtb__93 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__90) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) (Base_dList.C_Base_dList_dList_Cons (dtb__90, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__94); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = dtb__95 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__90) then (if (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) then ((fun frac -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat ((Base_dPair.v_Base_dPair_dfirstOf frac))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf frac) }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) (Base_dList.C_Base_dList_dList_Cons (dtb__90, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__96) -> (match dtb__96 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = dtb__98 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__97)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = dtb__98 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__99) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__99))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) (dtb__90 - 48)))) else (if (dtb__90 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__90) dtb__91) dtb__89) else (if (if (if (if (if (if (if (dtb__90 = 40) then true else (dtb__90 = 41)) then true else (dtb__90 = 91)) then true else (dtb__90 = 93)) then true else (dtb__90 = 44)) then true else (dtb__90 = 123)) then true else (dtb__90 = 125)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__90, Base_dList.C_Base_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) } })) else (if (dtb__90 = 96) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) } })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__90) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__91; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__90) dtb__89) }) (Base_dList.C_Base_dList_dList_Cons (dtb__90, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__100; Base_dPair.f_Base_dPair_dPair_second = dtb__101 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__100)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 }; Base_dPair.f_Base_dPair_dPair_second = dtb__101 }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnexpectedCharacter))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lexOneToken on empty input")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if (if (dtb__102 = 34) then (dtb__104 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__106) -> (match dtb__106 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__107; Base_dPair.f_Base_dPair_dPair_second = dtb__108 } -> (match dtb__108 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__109; Base_dPair.f_Base_dPair_dPair_second = dtb__110 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__107, dtb__110)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__111) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__111))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__105; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__104) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__102) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__112) -> (match dtb__112 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = dtb__114 } -> (match dtb__114 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__115; Base_dPair.f_Base_dPair_dPair_second = dtb__116 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (match dtb__117 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__119) -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__119)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__115 }))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__113, dtb__116)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__115 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__113, dtb__116)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__115 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__113, dtb__116)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__115 }))
)) dtb__113)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__120) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__120))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__121) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__121))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__122) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__123; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__124 } -> (match dtb__123 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__124 }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__125) -> (match dtb__125 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__126; Base_dPair.f_Base_dPair_dPair_second = dtb__127 } -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__127) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__128) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__128))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__129) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__129))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__130))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__122))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__122)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__131; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__132; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__133 } -> dtb__133
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if (if (if (dtb__134 = 32) then true else (dtb__134 = 9)) then true else (dtb__134 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__135) else (Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__136; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__137 } -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if (dtb__138 = 10) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__137 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } } else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__139; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137) }) (Base_dList.C_Base_dList_dList_Cons (dtb__138, mc1))) dtb__137))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__137 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__140; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__141 } -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (if (if (dtb__142 = 123) then (dtb__144 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__145; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__142) dtb__141)) }) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__144, (Base_dList.C_Base_dList_dList_Cons (dtb__142, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__141)) else (if (if (dtb__142 = 45) then (dtb__144 = 125) else false) then (if (mc1 = 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__145; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__142) dtb__141)) }; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__141) } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__145; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__142) dtb__141)) }) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__144, (Base_dList.C_Base_dList_dList_Cons (dtb__142, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__141))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__143; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__142) dtb__141) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__142, mc2))) dtb__141)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__143; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__142) dtb__141) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__142, mc2))) dtb__141)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine endP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol endP) })

let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__146) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__149))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if (if (dtb__152 = 34) then (dtb__154 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__156) -> (match dtb__156 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = dtb__158 } -> (match dtb__158 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__159))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__161) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__161))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (mc0 - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__155; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__154) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__152) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) }))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__162; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__163 } -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (if (dtb__164 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__164) dtb__165) dtb__163) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__167) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (if (if (dtb__164 = 45) then (dtb__168 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> (match dtb__171 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__173 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__172) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__170); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__163) dtb__173) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__169; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__168) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) dtb__163)) }) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__168) dtb__163))) else (if (if (dtb__164 = 123) then (dtb__168 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__174) -> (match dtb__174 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> (match dtb__176 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__178 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__177) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__175; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__163) dtb__178) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__169; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__168) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) dtb__163)) }) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__168) dtb__163))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__165; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) dtb__163) }) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }) Base_dList.C_Base_dList_dList_Nil))
