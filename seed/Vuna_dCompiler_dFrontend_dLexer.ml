open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok of (t_Vuna_dCompiler_dFrontend_dLexer_dTok) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars of (int Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment of (t_Vuna_dCompiler_dFrontend_dLexer_dCKind) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__0, dtb__1) -> (if (mc0 = 10) then (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos ((dtb__0 + 1), 1)) else (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__0, (dtb__1 + 1))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__2, dtb__3) -> (match dtb__2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (dtb__4 = 10) then (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5)), dtb__3)) else (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__5, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__4) dtb__3)))))
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__6, dtb__7) -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if (dtb__8 = 123) then (dtb__10 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 + 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))) else (if (if (dtb__8 = 45) then (dtb__10 = 125) else false) then (if (mc0 = 1) then (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__9, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__9, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__12, dtb__13) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__14) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13)))) else (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (if (dtb__14 = 45) then (dtb__16 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13))))) else (if (if (dtb__14 = 123) then (dtb__16 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment 1) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13)))) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__18) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__18))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__19) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__19)
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Ok (cs))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (cs))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (cs))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__20, dtb__21) -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__22) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__23, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21)))) (Base_dList.C_Base_dList_dList_Cons (dtb__22, mc1))) else (if (dtb__22 = 46) then (match dtb__23 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__24) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__23, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21)))) (Base_dList.C_Base_dList_dList_Cons (dtb__22, mc1))) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__21))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__21))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__26, dtb__27) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__28) then ((fun d -> (if (mc1 > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_IntLiteralOutOfRange) else ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__29, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__28) dtb__27)))) ((mc1 * 10) + d)))) (dtb__28 - 48)) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc1, (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)), dtb__27)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc1, (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__27))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__30, dtb__31) -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__32) then (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__33, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__32) dtb__31)))) else (if (dtb__32 = 46) then (match dtb__33 with
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
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__36, dtb__37) -> (match dtb__36 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__38) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__39, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__38) dtb__37)))) (Base_dList.C_Base_dList_dList_Cons (dtb__38, mc1))) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39)), dtb__37)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__37))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__40, dtb__41) -> (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__42) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__43, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__42) dtb__41)))) (Base_dList.C_Base_dList_dList_Cons (dtb__42, mc1))) else (if (dtb__42 = 46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__43, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__42) dtb__41)))) (Base_dList.C_Base_dList_dList_Cons (dtb__42, mc1))) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43)), dtb__41))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__41))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__44, dtb__45) -> (match dtb__44 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__47, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__46) dtb__45)))) (Base_dList.C_Base_dList_dList_Cons (dtb__46, mc1))) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47)), dtb__45)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__45))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__48, dtb__49) -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (dtb__50 = 10) then (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__51, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__50) dtb__49))) else mc0)
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

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__53, dtb__54) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (dtb__55 = 36) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (dtb__57 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__59) -> (match dtb__59 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__60, dtb__61) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__62, dtb__63) -> (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if (dtb__64 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__65, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__63)))) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__60)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__61)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__66) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__66))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__58, holeStart))) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__57) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__56, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54)))) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__56, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54)))) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__55 = 92) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__67) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__68, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__67) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))))) (Base_dList.C_Base_dList_dList_Cons (dtb__69, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__55 = 34) else false) then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if (if (dtb__70 = 34) then (dtb__72 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__73, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__72) pos3))), pos3))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__72) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__70) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__56, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54)))) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__55 = 34) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__56, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54))), dtb__54)))))) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__55 = 10) else false) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__56, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54)))) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__74) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__74))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__75) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__76, dtb__77) -> (match dtb__76 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if (if (dtb__78 = 125) then (depth = 0) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), dtb__75)))) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__80) -> (match dtb__80 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__81, dtb__82) -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (match dtb__81 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__83, dtb__84) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))) dtb__82) (Base_dList.C_Base_dList_dList_Cons (dtb__81, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__85) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__85))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__75)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__75)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__86, dtb__87) -> (match dtb__86 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__88) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87)))) (Base_dList.C_Base_dList_dList_Cons (dtb__88, Base_dList.C_Base_dList_dList_Nil))) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__90, dtb__91) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__90), dtb__87)), dtb__91))))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__88) then (if (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87)))) then ((fun frac -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat ((Base_dPair.v_Base_dPair_dfirstOf frac))), dtb__87)), (Base_dPair.v_Base_dPair_dsecondOf frac)))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87)))) (Base_dList.C_Base_dList_dList_Cons (dtb__88, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__92) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__93, dtb__94) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__93)), dtb__87)), dtb__94))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__95) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__95))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87)))) (dtb__88 - 48)))) else (if (dtb__88 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__88) dtb__89) dtb__87) else (if (if (if (if (if (if (if (dtb__88 = 40) then true else (dtb__88 = 41)) then true else (dtb__88 = 91)) then true else (dtb__88 = 93)) then true else (dtb__88 = 44)) then true else (dtb__88 = 123)) then true else (dtb__88 = 125)) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__88, Base_dList.C_Base_dList_dList_Nil))))), dtb__87)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87))))))) else (if (dtb__88 = 96) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")), dtb__87)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87))))))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__88) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__89, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__88) dtb__87)))) (Base_dList.C_Base_dList_dList_Cons (dtb__88, Base_dList.C_Base_dList_dList_Nil))) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__96, dtb__97) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__96)), dtb__87)), dtb__97))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnexpectedCharacter)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: lexOneToken on empty input"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (if (if (dtb__98 = 34) then (dtb__100 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__102) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__103, dtb__104) -> (match dtb__104 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__105, dtb__106) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__103, dtb__106)), p)), dtb__105))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__107) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__107))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__101, bodyStart)))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__100) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__98) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__108) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__111, dtb__112) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__113 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__115) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__115)), p)), dtb__111))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__109, dtb__112)), p)), dtb__111))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__109, dtb__112)), p)), dtb__111))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__109, dtb__112)), p)), dtb__111))))
)) dtb__109)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__116) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__116))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__117) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__117))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__118) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__119, dtb__120) -> (match dtb__119 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof, dtb__120)), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__121) -> (match dtb__121 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__122, dtb__123) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__123) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__124) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__124))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__125) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__125))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__126) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__126))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__118))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__118)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (1, 1))))))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (dtb__127, dtb__128, dtb__129) -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (if (if (if (dtb__130 = 32) then true else (dtb__130 = 9)) then true else (dtb__130 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__131) else (Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__132, dtb__133) -> (match dtb__132 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if (dtb__134 = 10) then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135)), dtb__133)), mc2)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__135, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__134) dtb__133)))) (Base_dList.C_Base_dList_dList_Cons (dtb__134, mc1))) dtb__133))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__133)), mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__136, dtb__137) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if (if (dtb__138 = 123) then (dtb__140 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__141, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137))))) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__140, (Base_dList.C_Base_dList_dList_Cons (dtb__138, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) dtb__137)) else (if (if (dtb__138 = 45) then (dtb__140 = 125) else false) then (if (mc1 = 1) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__141, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137)))), ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) dtb__137))))))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__141, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137))))) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__140, (Base_dList.C_Base_dList_dList_Cons (dtb__138, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__140) dtb__137))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__139, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137)))) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__138, mc2))) dtb__137)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__139, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__138) dtb__137)))) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__138, mc2))) dtb__137)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine endP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol endP))))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__142) -> (match dtb__142 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__143, dtb__144) -> (match dtb__144 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__145, dtb__146) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__145))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__147) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__147))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (if (if (dtb__148 = 34) then (dtb__150 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__152) -> (match dtb__152 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__153, dtb__154) -> (match dtb__154 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__155, dtb__156) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__157))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (mc0 - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__151, bodyStart)))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__150) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__158, dtb__159) -> (match dtb__158 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (if (dtb__160 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__160) dtb__161) dtb__159) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__162) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__162))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__163) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__163) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__161 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (if (if (dtb__160 = 45) then (dtb__164 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__168, dtb__169) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__168) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine, (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__166), ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__159) dtb__169))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__165, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__160) dtb__159))))) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) dtb__159))) else (if (if (dtb__160 = 123) then (dtb__164 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__170) -> (match dtb__170 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__173, dtb__174) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__173) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock, dtb__171, ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__159) dtb__174))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__175) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__175))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__165, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__160) dtb__159))))) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__164) dtb__159))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__161, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__160) dtb__159)))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (1, 1))))) Base_dList.C_Base_dList_dList_Nil))
