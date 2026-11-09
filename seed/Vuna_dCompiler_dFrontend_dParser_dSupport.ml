open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState of (string) * (Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos) * (int)

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__4, dtb__5, dtb__6, dtb__7) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (1, 1))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__10, dtb__11) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__16, dtb__17, dtb__18, dtb__19) -> (match dtb__17 with
  | Base_dList.C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__16, dtb__17, dtb__18, dtb__19))
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__22, dtb__23) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__16, dtb__17, dtb__18, dtb__19))
  | _ -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__16, dtb__21, (match dtb__20 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__24, dtb__25) -> dtb__25
  | _ -> failwith "DT: impossible branch"
), (if (dtb__19 > 0) then (dtb__19 - 1) else 0)))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__20)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__26, dtb__27) -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
)) + 1024))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__32, dtb__33) -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__35
  | _ -> failwith "DT: impossible branch"
), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__32, 0)), (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__41
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__42, dtb__43) -> (match dtb__42 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__44) -> (dtb__44 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__46) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_PState (dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
)) n))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun fuel st n acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (match dtb__51 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__52, dtb__53) -> (match dtb__52 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__54) -> (if (dtb__54 = ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dreverse acc))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__55) -> ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (fuel - 1)) st) (n + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__55, acc)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__57, dtb__58) -> (match dtb__57 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__59) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 2) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (q)), (Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__61, dtb__62) -> (match dtb__61 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__63) -> (if (dtb__63 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__63 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__64) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 1) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__66, dtb__67) -> (match dtb__66 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__68) -> (dtb__68 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__69, dtb__70) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__71, dtb__72) -> (if (dtb__69 = dtb__71) then true else (dtb__70 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__73, dtb__74) -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__75) -> (if (dtb__75 = s) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__76, dtb__77) -> (match dtb__76 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__78) -> (if (dtb__78 = k) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__79, dtb__80) -> (match dtb__79 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__81) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__81, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if (dtb__82 >= 65) then (dtb__82 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (if (dtb__84 = 95) then (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (if (dtb__86 >= 65) then (dtb__86 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__88, dtb__89) -> (match dtb__88 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__90) -> (if (dtb__90 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> (match dtb__91 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__92, dtb__93) -> (match dtb__92 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__94) -> (if (if ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine dtb__93) = (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine dtb__89)) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol dtb__93) = ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol dtb__89) + 1)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (("?" ^ dtb__94), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine dtb__89), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol dtb__89), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine dtb__93), ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol dtb__93) + (bi_strLength dtb__94)))))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__95, dtb__96) -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__97) -> (if (dtb__97 = "(") then true else (if (dtb__97 = "[") then true else (if (dtb__97 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__99) -> (if (dtb__99 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__100, dtb__101, dtb__102) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__103) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__104) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__105) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__106) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__107, dtb__108) -> (match dtb__107 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__109) -> (if (dtb__109 = "(") then true else (if (dtb__109 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__110, dtb__111, dtb__112) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__113) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__114) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__115) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__116, dtb__117) -> (match dtb__116 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__118) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__118) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__118, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__119) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__119) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__119, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__121, dtb__122) -> (match dtb__121 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__123) -> (if (dtb__123 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124) -> (match dtb__124 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__125, dtb__126) -> (match dtb__125 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__127) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__127) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (dtb__127 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127))
  | _ -> failwith "DT: impossible branch"
) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__129, dtb__130, dtb__131) -> (match dtb__129 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__132, dtb__133) -> (if (dtb__132 = "->") then (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__136))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__138, dtb__139, dtb__140, dtb__141) -> (if (dtb__138 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__140)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_PTok (dtb__142, dtb__143) -> (match dtb__142 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__144) -> (if (dtb__144 = "else") then true else (if (dtb__144 = "in") then true else (if (dtb__144 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__145) -> (if (dtb__145 = ")") then true else (if (dtb__145 = "]") then true else (if (dtb__145 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Pos (dtb__146, dtb__147) -> (if (dtb__147 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
