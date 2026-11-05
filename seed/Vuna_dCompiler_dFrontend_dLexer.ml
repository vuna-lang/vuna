open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof
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

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanString = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if (dtb__36 = 34) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35))))))) else (if (dtb__36 = 10) then (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString) else (if (dtb__36 = 92) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanEscape (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35)))) mc1) else ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__37, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__36) dtb__35)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, mc1))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dFrontend_dLexer_dscanEscape = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__38, dtb__39) -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (if (dtb__40 = 110) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (10, mc1))) else (if (dtb__40 = 116) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (9, mc1))) else (if (dtb__40 = 114) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (13, mc1))) else (if (dtb__40 = 34) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (34, mc1))) else (if (dtb__40 = 92) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, mc1))) else (if (dtb__40 = 39) then ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__41, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__40) dtb__39)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (39, mc1))) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnknownEscape)))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__42) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__42))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__43) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__44, dtb__45) -> (match dtb__44 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexToken (fuel - 1)) dtb__46) dtb__47) dtb__45)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof, dtb__45)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__43)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dLexer_dlexToken = (fun fuel c rest p -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (c, Base_dList.C_Base_dList_dList_Base_dList_dNil))) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__49) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__50) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__50))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__51) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__48), p)), dtb__51))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) (c - 48)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__53) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__54) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__54))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__55) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__52)), p)), dtb__55))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = 34) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__56) -> (match dtb__56 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__58) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__59) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__59))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__60) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__57)), p)), dtb__60))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__61) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__61))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dscanString (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__62) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__62))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__63) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Base_dList_dCons (c, Base_dList.C_Base_dList_dList_Base_dList_dNil))))), p)), dtb__63))))
  | _ -> failwith "DT: impossible branch"
) else (if (c = 96) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__64) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__64))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__65) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym ("`")), p)), dtb__65))))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar c) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (rest, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (c, Base_dList.C_Base_dList_dList_Base_dList_dNil))) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__67) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__68) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__68))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__69) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok ((C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__66)), p)), dtb__69))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnexpectedCharacter)))))))))

let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((2 * (bi_strLength source)) + 64))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (dtb__70, dtb__71, dtb__72) -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (if (if (if (dtb__73 = 32) then true else (dtb__73 = 9)) then true else (dtb__73 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__74) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipStringBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__75, dtb__76) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (if (dtb__77 = 34) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__78, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__77) dtb__76))))) else (if (dtb__77 = 92) then (match dtb__78 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (v_Vuna_dCompiler_dFrontend_dLexer_dskipStringBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__80, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__79) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__77) dtb__76)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dFrontend_dLexer_dskipStringBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__78, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__77) dtb__76))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__81, dtb__82) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (if (dtb__83 = 10) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84)), dtb__82)), mc2)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__84, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__83) dtb__82)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, mc1))) dtb__82))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__82)), mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__85, dtb__86) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (if (if (dtb__87 = 123) then (dtb__89 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__90, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86))))) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) dtb__86)) else (if (if (dtb__87 = 45) then (dtb__89 = 125) else false) then (if (mc1 = 1) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__90, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86)))), ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) dtb__86))))))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__90, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86))))) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__89) dtb__86))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__88, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86)))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, mc2))) dtb__86)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__88, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86)))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, mc2))) dtb__86)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dLexDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dUnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol startP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine endP), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol endP))))

let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanComments = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__91, dtb__92) -> (match dtb__91 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (if (dtb__93 = 34) then (match (v_Vuna_dCompiler_dFrontend_dLexer_dskipStringBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__94, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__93) dtb__92)))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__95) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__95))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__96) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__96) mc2)
  | _ -> failwith "DT: impossible branch"
) else (match dtb__94 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (if (if (dtb__93 = 45) then (dtb__97 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__101) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCLine, (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__99), ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__92) dtb__102))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__98, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__97) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__93) dtb__92))))) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__97) dtb__92))) else (if (if (dtb__93 = 123) then (dtb__97 = 45) else false) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__103) -> (match dtb__103 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) dtb__106) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dLexer_dComment_Vuna_dCompiler_dFrontend_dLexer_dComment (C_Vuna_dCompiler_dFrontend_dLexer_dCKind_Vuna_dCompiler_dFrontend_dLexer_dCBlock, dtb__104, ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__92) dtb__107))), mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__98, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__97) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__93) dtb__92))))) 1) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__97) dtb__92))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (mc0 - 1)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars (dtb__94, ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__93) dtb__92)))) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: lexer fuel exhausted (internal: lexer made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dscanComments (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) (C_Vuna_dCompiler_dFrontend_dLexer_dChars_Vuna_dCompiler_dFrontend_dLexer_dChars ((Base_dList.dtp_unpack source), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))) Base_dList.C_Base_dList_dList_Base_dList_dNil))
