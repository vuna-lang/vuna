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

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__20; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__22) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__23; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21) }) (Base_dList.C_Base_dList_dList_Cons (dtb__22, mc1))) else (if (dtb__22 = 46) then (match dtb__23 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__24) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__23; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21) }) (Base_dList.C_Base_dList_dList_Cons (dtb__22, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } }
  | _ -> failwith "DT: impossible branch"
) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__21 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__26; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__28) then ((fun d -> (if (mc1 > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_IntLiteralOutOfRange) else ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__29; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__28) dtb__27) }) ((mc1 * 10) + d)))) (dtb__28 - 48)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } })))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__27 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__30; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__31 } -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__32) then (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__33; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__32) dtb__31) }) else (if (dtb__32 = 46) then (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__34)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__36; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__37 } -> (match dtb__36 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__38) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__39; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__38) dtb__37) }) (Base_dList.C_Base_dList_dList_Cons (dtb__38, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__37 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__37 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__40; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } -> (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__42) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__43; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__42) dtb__41) }) (Base_dList.C_Base_dList_dList_Cons (dtb__42, mc1))) else (if (dtb__42 = 46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__43; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__42) dtb__41) }) (Base_dList.C_Base_dList_dList_Cons (dtb__42, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__41 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__44; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } -> (match dtb__44 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__47; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__46) dtb__45) }) (Base_dList.C_Base_dList_dList_Cons (dtb__46, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__45 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__48; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__49 } -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (dtb__50 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__51; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__50) dtb__49) } else mc0)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__52) -> (if (dtb__52 = "{") then (mc0 + 1) else (if (dtb__52 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__53; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__54 } -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (dtb__55 = 36) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (dtb__57 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__59) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__62; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__63 } -> (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if (dtb__64 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__65; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__63) }) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__60)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__61)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__58; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = holeStart }) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__57) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__55 = 92) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__67) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__68; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__67) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54)) }) (Base_dList.C_Base_dList_dList_Cons (dtb__69, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__55 = 34) else false) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if (if (dtb__70 = 34) then (dtb__72 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__73; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__72) pos3) }; Base_dPair.f_Base_dPair_dPair_second = pos3 } }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__72) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__70) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__55 = 34) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } })) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__55 = 10) else false) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__74) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__74))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__75) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__76; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__77 } -> (match dtb__76 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if (if (dtb__78 = 125) then (depth = 0) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = dtb__75 })) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__80) -> (match dtb__80 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = dtb__82 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__81).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__82) (Base_dList.C_Base_dList_dList_Cons (dtb__81, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__83) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__83))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__75)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__75)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__84; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__85 } -> (match dtb__84 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__86) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) }) (Base_dList.C_Base_dList_dList_Cons (dtb__86, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = dtb__89 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__88); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = dtb__89 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__86) then (if (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) }) then ((fun frac -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat ((Base_dPair.v_Base_dPair_dfirstOf frac))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf frac) }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) }) (Base_dList.C_Base_dList_dList_Cons (dtb__86, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__90) -> (match dtb__90 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__91; Base_dPair.f_Base_dPair_dPair_second = dtb__92 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__91)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = dtb__92 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__93) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__93))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) }) (dtb__86 - 48)))) else (if (dtb__86 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__86) dtb__87) dtb__85) else (if (if (if (if (if (if (if (dtb__86 = 40) then true else (dtb__86 = 41)) then true else (dtb__86 = 91)) then true else (dtb__86 = 93)) then true else (dtb__86 = 44)) then true else (dtb__86 = 123)) then true else (dtb__86 = 125)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__86, Base_dList.C_Base_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) } })) else (if (dtb__86 = 96) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) } })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__86) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__87; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) dtb__85) }) (Base_dList.C_Base_dList_dList_Cons (dtb__86, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__94)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__85 }; Base_dPair.f_Base_dPair_dPair_second = dtb__95 }))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnexpectedCharacter)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lexOneToken on empty input")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if (if (dtb__96 = 34) then (dtb__98 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__100) -> (match dtb__100 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__101, dtb__104)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__103 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__105) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__105))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__99; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__98) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__96) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__106) -> (match dtb__106 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__107; Base_dPair.f_Base_dPair_dPair_second = dtb__108 } -> (match dtb__108 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__109; Base_dPair.f_Base_dPair_dPair_second = dtb__110 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (match dtb__111 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__113) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__113)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__107, dtb__110)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__107, dtb__110)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__107, dtb__110)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
)) dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__114) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__114))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__115) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__115))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__116) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__117; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__118 } -> (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__118 }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__119) -> (match dtb__119 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__120; Base_dPair.f_Base_dPair_dPair_second = dtb__121 } -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__121) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__123))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__124) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__124))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__116))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__116)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__125; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__126; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__127 } -> dtb__127
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (if (if (if (dtb__128 = 32) then true else (dtb__128 = 9)) then true else (dtb__128 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__129) else (Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__130; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__131 } -> (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if (dtb__132 = 10) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__131 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } } else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__133; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__132) dtb__131) }) (Base_dList.C_Base_dList_dList_Cons (dtb__132, mc1))) dtb__131))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__131 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__134; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__135 } -> (match dtb__134 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if (if (dtb__136 = 123) then (dtb__138 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__139; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) dtb__135)) }) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__138, (Base_dList.C_Base_dList_dList_Cons (dtb__136, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__135)) else (if (if (dtb__136 = 45) then (dtb__138 = 125) else false) then (if (mc1 = 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__139; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) dtb__135)) }; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__135) } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__139; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) dtb__135)) }) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__138, (Base_dList.C_Base_dList_dList_Cons (dtb__136, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__135))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__137; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) dtb__135) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__136, mc2))) dtb__135)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__137; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) dtb__135) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__136, mc2))) dtb__135)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol startP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine endP); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol endP) })

let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__140) -> (match dtb__140 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> (match dtb__142 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__144 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__143))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__145) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__145))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if (if (dtb__146 = 34) then (dtb__148 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__150) -> (match dtb__150 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__151; Base_dPair.f_Base_dPair_dPair_second = dtb__152 } -> (match dtb__152 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__153; Base_dPair.f_Base_dPair_dPair_second = dtb__154 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__155) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__155))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (mc0 - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__149; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) }))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = mc2; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__156; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__157 } -> (match dtb__156 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (if (dtb__158 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__158) dtb__159) dtb__157) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__160) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__160))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__161) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__161) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__159 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (if (if (dtb__158 = 45) then (dtb__162 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 } -> (match dtb__165 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__166; Base_dPair.f_Base_dPair_dPair_second = dtb__167 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__166) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__164); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__157) dtb__167) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__163; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__162) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__158) dtb__157)) }) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__162) dtb__157))) else (if (if (dtb__158 = 123) then (dtb__162 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__168) -> (match dtb__168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__170 } -> (match dtb__170 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__171; Base_dPair.f_Base_dPair_dPair_second = dtb__172 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__171) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__169; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__157) dtb__172) }, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__163; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__162) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__158) dtb__157)) }) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__162) dtb__157))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__159; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__158) dtb__157) }) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "lexer") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }) Base_dList.C_Base_dList_dList_Nil))
