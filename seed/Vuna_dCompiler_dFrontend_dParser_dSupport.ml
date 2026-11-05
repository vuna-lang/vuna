open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState of (string) * (Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dPos) * (int)

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__4, dtb__5, dtb__6, dtb__7) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__10, dtb__11) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)), (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__16, dtb__17, dtb__18, dtb__19) -> (match dtb__17 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__16, dtb__17, dtb__18, dtb__19))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__22, dtb__23) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__16, dtb__17, dtb__18, dtb__19))
  | _ -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__16, dtb__21, (match dtb__20 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__24, dtb__25) -> dtb__25
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
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__26, dtb__27) -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
)) + 1024))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__32, dtb__33) -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__35
  | _ -> failwith "DT: impossible branch"
), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__32, 0)), (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__41
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__42, dtb__43) -> (match dtb__42 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__44) -> (dtb__44 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__46) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (match st with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
)) n))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHeadName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__51, dtb__52) -> (match dtb__51 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__53) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__54) -> (match dtb__54 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__55, dtb__56) -> (match dtb__55 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__57) -> (if (dtb__57 = ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__58, dtb__59) -> (match dtb__58 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__60) -> (dtb__60 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__61, dtb__62) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__63, dtb__64) -> (if (dtb__61 = dtb__63) then true else (dtb__62 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__65, dtb__66) -> (match dtb__65 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__67) -> (if (dtb__67 = s) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__68, dtb__69) -> (match dtb__68 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__70) -> (if (dtb__70 = k) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__71, dtb__72) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__73) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (if (dtb__74 >= 65) then (dtb__74 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (if (dtb__76 = 95) then (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (if (dtb__78 >= 65) then (dtb__78 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__80, dtb__81) -> (match dtb__80 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__82) -> (if (dtb__82 = "(") then true else (if (dtb__82 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__83) -> (if (dtb__83 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__84) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__85) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__86) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__87, dtb__88) -> (match dtb__87 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__89) -> (if (dtb__89 = "(") then true else (if (dtb__89 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__90) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__91) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__92) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__93, dtb__94) -> (match dtb__93 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__95) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__95) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__96) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__96) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (match dtb__97 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__98, dtb__99) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__100) -> (if (dtb__100 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__101) -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__102, dtb__103) -> (match dtb__102 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__104) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__104) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__105, dtb__106, dtb__107) -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__108, dtb__109) -> (if (dtb__108 = "->") then (match dtb__106 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (match dtb__111 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__112))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__114, dtb__115, dtb__116, dtb__117) -> (if (dtb__114 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__116)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__118, dtb__119) -> (match dtb__118 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__120) -> (if (dtb__120 = "else") then true else (if (dtb__120 = "in") then true else (if (dtb__120 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__121) -> (if (dtb__121 = ")") then true else (if (dtb__121 = "]") then true else (if (dtb__121 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__122, dtb__123) -> (if (dtb__123 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
