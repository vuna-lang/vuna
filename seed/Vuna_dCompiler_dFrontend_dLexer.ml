open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof
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

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__30, dtb__31) -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__32) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__33, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__32) dtb__31)))) (Base_dList.C_Base_dList_dList_Cons (dtb__32, mc1))) else (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33)), dtb__31)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__31))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (dtb__36 = 10) then (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__37, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35))) else mc0)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__38) -> (if (dtb__38 = "{") then (mc0 + 1) else (if (dtb__38 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__39, dtb__40) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (dtb__41 = 36) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (if (dtb__43 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__45) -> (match dtb__45 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__46, dtb__47) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__48, dtb__49) -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (dtb__50 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__51, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__49)))) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__46)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__47)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__52) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__52))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__44, holeStart))) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__43) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Cons (dtb__41, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Cons (dtb__41, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__41 = 92) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__53) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__54, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__53) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))))) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__41 = 34) else false) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if (if (dtb__56 = 34) then (dtb__58 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__59, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__58) pos3))), pos3))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__58) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__56) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Cons (dtb__41, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__41 = 34) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))), dtb__40)))))) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__41 = 10) else false) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Cons (dtb__41, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__60) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__60))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__61) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__62, dtb__63) -> (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if (if (dtb__64 = 125) then (depth = 0) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), dtb__61)))) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__66) -> (match dtb__66 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__67, dtb__68) -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (match dtb__67 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__69, dtb__70) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))) dtb__68) (Base_dList.C_Base_dList_dList_Cons (dtb__67, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__71) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__71))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__61)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__61)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__72, dtb__73) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__74) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (Base_dList.C_Base_dList_dList_Cons (dtb__74, Base_dList.C_Base_dList_dList_Nil))) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__76, dtb__77) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__76), dtb__73)), dtb__77))))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__74) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__78) -> (match dtb__78 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__79, dtb__80) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__79)), dtb__73)), dtb__80))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__81) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__81))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (dtb__74 - 48))) else (if (dtb__74 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__74) dtb__75) dtb__73) else (if (if (if (if (if (if (if (dtb__74 = 40) then true else (dtb__74 = 41)) then true else (dtb__74 = 91)) then true else (dtb__74 = 93)) then true else (dtb__74 = 44)) then true else (dtb__74 = 123)) then true else (dtb__74 = 125)) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__74, Base_dList.C_Base_dList_dList_Nil))))), dtb__73)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73))))))) else (if (dtb__74 = 96) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")), dtb__73)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73))))))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__74) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (Base_dList.C_Base_dList_dList_Cons (dtb__74, Base_dList.C_Base_dList_dList_Nil))) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__82, dtb__83) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__82)), dtb__73)), dtb__83))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnexpectedCharacter)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: lexOneToken on empty input"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (if (dtb__84 = 34) then (dtb__86 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__88) -> (match dtb__88 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__89, dtb__90) -> (match dtb__90 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__91, dtb__92) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__89, dtb__92)), p)), dtb__91))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__93) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__93))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__87, bodyStart)))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__86) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__84) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__94) -> (match dtb__94 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__97, dtb__98) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__101) -> (match dtb__100 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__101)), p)), dtb__97))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__95, dtb__98)), p)), dtb__97))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__95, dtb__98)), p)), dtb__97))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__95, dtb__98)), p)), dtb__97))))
)) dtb__95)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__102) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__102))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__103) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__103))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__104) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__105, dtb__106) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof, dtb__106)), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__107) -> (match dtb__107 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__108, dtb__109) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__109) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__110) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__110))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__111) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__111))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__112) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__112))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__104))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__104)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (1, 1))))))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (dtb__113, dtb__114, dtb__115) -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (if (if (if (dtb__116 = 32) then true else (dtb__116 = 9)) then true else (dtb__116 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__117) else (Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__118, dtb__119) -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (if (dtb__120 = 10) then (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121)), dtb__119)), mc2)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__121, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__120) dtb__119)))) (Base_dList.C_Base_dList_dList_Cons (dtb__120, mc1))) dtb__119))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (Base_dList.C_Base_dList_dList_Nil, dtb__119)), mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__122, dtb__123) -> (match dtb__122 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (if (dtb__124 = 123) then (dtb__126 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__127, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__123))))) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__126, (Base_dList.C_Base_dList_dList_Cons (dtb__124, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) dtb__123)) else (if (if (dtb__124 = 45) then (dtb__126 = 125) else false) then (if (mc1 = 1) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), (Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__127, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__123)))), ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) dtb__123))))))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__127, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__123))))) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__126, (Base_dList.C_Base_dList_dList_Cons (dtb__124, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__126) dtb__123))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__125, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__123)))) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__124, mc2))) dtb__123)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__125, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__123)))) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__124, mc2))) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine endP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol endP))))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__128) -> (match dtb__128 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__131, dtb__132) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__131))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__133) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__133))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (if (if (dtb__134 = 34) then (dtb__136 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__138) -> (match dtb__138 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__141, dtb__142) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__141))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__143) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__143))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (mc0 - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__137, bodyStart)))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__136) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__134) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (mc2, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar mc1) mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__144, dtb__145) -> (match dtb__144 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (if (dtb__146 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__146) dtb__147) dtb__145) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__148) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__148))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__149) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__149) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (if (if (dtb__146 = 45) then (dtb__150 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__154, dtb__155) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__154) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine, (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__152), ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__145) dtb__155))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__151, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__150) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__145))))) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__150) dtb__145))) else (if (if (dtb__146 = 123) then (dtb__150 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__156) -> (match dtb__156 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__157, dtb__158) -> (match dtb__158 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__159, dtb__160) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__159) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Comment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock, dtb__157, ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__145) dtb__160))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__161) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__161))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__151, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__150) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__145))))) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__150) dtb__145))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars (dtb__147, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__146) dtb__145)))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Chars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (1, 1))))) Base_dList.C_Base_dList_dList_Nil))
