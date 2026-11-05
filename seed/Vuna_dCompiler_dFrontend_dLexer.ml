open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_Vuna_dCompiler_dFrontend_dLexer_dTPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_Vuna_dCompiler_dFrontend_dLexer_dTPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok of (t_Vuna_dCompiler_dFrontend_dLexer_dTok) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars of (int Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment of (t_Vuna_dCompiler_dFrontend_dLexer_dCKind) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__0, dtb__1) -> (if (mc0 = 10) then (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos ((dtb__0 + 1), 1)) else (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__0, (dtb__1 + 1))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (s))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__2, dtb__3) -> (match dtb__2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if (dtb__4 = 10) then (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5)), dtb__3)) else (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__5, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__4) dtb__3)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__6, dtb__7) -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if (if (dtb__8 = 123) then (dtb__10 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 + 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))) else (if (if (dtb__8 = 45) then (dtb__10 = 125) else false) then (if (mc0 = 1) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__11, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__10) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7)))))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__9, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__9, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__8) dtb__7))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__12, dtb__13) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__14) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13)))) else (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (if (if (dtb__14 = 45) then (dtb__16 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13))))) else (if (if (dtb__14 = 123) then (dtb__16 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment 1) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__15, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__14) dtb__13)))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__18) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__18))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__19) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__19)
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (cs))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (cs))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (cs))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__20, dtb__21) -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__22) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__23, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, mc1))) else (if (dtb__22 = 46) then (match dtb__23 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__24) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__23, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__22) dtb__21)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, mc1))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23)), dtb__21)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23)), dtb__21))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23)), dtb__21))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__21))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__26, dtb__27) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__28) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__29, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__28) dtb__27)))) ((mc1 * 10) + (dtb__28 - 48))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29)), dtb__27)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__27))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__30, dtb__31) -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__32) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__33, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__32) dtb__31)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, mc1))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33)), dtb__31)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__31))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun cs -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> cs
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if (dtb__36 = 10) then (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35))) else cs)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs))

let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_Vuna_dCompiler_dFrontend_dLexer_dTPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun depth t -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__38) -> (if (dtb__38 = "{") then (depth + 1) else (if (dtb__38 = "}") then (if (depth > 0) then (depth - 1) else 0) else depth))
  | _ -> depth
)) t))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__39, dtb__40) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (if (dtb__41 = 36) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (if (dtb__43 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__45) -> (match dtb__45 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__48, dtb__49) -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if (dtb__50 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__51, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__49)))) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_Vuna_dCompiler_dFrontend_dLexer_dTPHole (dtb__46)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedInterpolation))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__47)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__52) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__52))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__44, holeStart))) Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__43) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, acc))) parts))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__41 = 92) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__53, dtb__54) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__53) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__54, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__53) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__41 = 34) else false) then (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if (if (dtb__56 = 34) then (dtb__58 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__59, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__58) pos3))), pos3))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__58) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__56) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, acc))) parts))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__41 = 34) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40))), dtb__40)))))) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__41 = 10) else false) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__42, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__40)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__60) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__60))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__61) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__62, dtb__63) -> (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (if (if (dtb__64 = 125) then (depth = 0) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse acc), dtb__61)))) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__66) -> (match dtb__66 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (match dtb__67 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__69, dtb__70) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))) dtb__68) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__71) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__71))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__61)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__61)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__72, dtb__73) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__74) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, Base_dList.C_Base_dList_dList_Base_dList_dNil))) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__76), dtb__73)), dtb__77))))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__74) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (dtb__74 - 48)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__78)), dtb__73)), dtb__79))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__74 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__74) dtb__75) dtb__73) else (if (if (if (if (if (if (if (dtb__74 = 40) then true else (dtb__74 = 41)) then true else (dtb__74 = 91)) then true else (dtb__74 = 93)) then true else (dtb__74 = 44)) then true else (dtb__74 = 123)) then true else (dtb__74 = 125)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, Base_dList.C_Base_dList_dList_Base_dList_dNil))))), dtb__73)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73))))))) else (if (dtb__74 = 96) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym ("`")), dtb__73)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73))))))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__74) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__74) dtb__73)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, Base_dList.C_Base_dList_dList_Base_dList_dNil))) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__80)), dtb__73)), dtb__81))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnexpectedCharacter)))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: lexOneToken on empty input"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match rest with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (if (if (dtb__82 = 34) then (dtb__84 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__86) -> (match dtb__86 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (match dtb__88 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (true, dtb__87, dtb__90)), p)), dtb__89))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__91) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__91))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__85, bodyStart)))) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__84) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__82) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) p)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__92) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (match dtb__94 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_Vuna_dCompiler_dFrontend_dLexer_dTPText (dtb__99) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__99)), p)), dtb__95))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (false, dtb__93, dtb__96)), p)), dtb__95))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (false, dtb__93, dtb__96)), p)), dtb__95))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (false, dtb__93, dtb__96)), p)), dtb__95))))
)) dtb__93)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__100) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__100))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__101) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__101))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__102) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__103, dtb__104) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof, dtb__104)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__105) -> (match dtb__105 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__107) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__109) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__109))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__110) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__110))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__102))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__102)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (dtb__111, dtb__112, dtb__113) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (if (if (if (dtb__114 = 32) then true else (dtb__114 = 9)) then true else (dtb__114 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__115) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__116, dtb__117) -> (match dtb__116 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119) -> (if (dtb__118 = 10) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119)), dtb__117)), mc2)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__119, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__118) dtb__117)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__118, mc1))) dtb__117))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__117)), mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__120, dtb__121) -> (match dtb__120 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, dtb__123) -> (match dtb__123 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (if (if (dtb__122 = 123) then (dtb__124 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__125, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__122) dtb__121))))) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__124, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__121)) else (if (if (dtb__122 = 45) then (dtb__124 = 125) else false) then (if (mc1 = 1) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__125, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__122) dtb__121)))), ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__121))))))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__125, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__122) dtb__121))))) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__124, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__124) dtb__121))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__123, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__122) dtb__121)))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, mc2))) dtb__121)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__123, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__122) dtb__121)))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, mc2))) dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine endP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol endP))))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral = (fun fuel body -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__126) -> (match dtb__126 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__129))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__131) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__131))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral = (fun fuel c rest p -> (match rest with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (match dtb__133 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (if (if (dtb__132 = 34) then (dtb__134 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__136) -> (match dtb__136 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__139))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__141) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__141))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__135, bodyStart)))) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__134) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__132) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral fuel) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral fuel) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral fuel) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__142, dtb__143) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (if (dtb__144 = 34) then (match ((((v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral (mc0 - 1)) dtb__144) dtb__145) dtb__143) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__146) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__146))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__147) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__147) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if (if (dtb__144 = 45) then (dtb__148 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__152) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCLine, (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__150), ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__143) dtb__153))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__149, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143))))) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) dtb__143))) else (if (if (dtb__144 = 123) then (dtb__148 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__154) -> (match dtb__154 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, dtb__156) -> (match dtb__156 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__157, dtb__158) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__157) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCBlock, dtb__155, ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__143) dtb__158))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__159))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__149, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143))))) 1) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__148) dtb__143))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__145, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__144) dtb__143)))) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))) Base_dList.C_Base_dList_dList_Base_dList_dNil))
