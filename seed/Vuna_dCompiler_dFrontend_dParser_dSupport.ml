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

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsymAt = (fun st n s -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51) -> (match dtb__51 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__52, dtb__53) -> (match dtb__52 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__54) -> (dtb__54 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> (match dtb__55 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__56, dtb__57) -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__58) -> (if (((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsymAt st) 2) ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (q)), dtb__58)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__59, dtb__60) -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__61) -> (if (dtb__61 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ0) else (if (dtb__61 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__62) -> (if (((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsymAt st) 1) ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, dtb__62)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__63, dtb__64) -> (match dtb__63 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__65) -> (dtb__65 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__66, dtb__67) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__68, dtb__69) -> (if (dtb__66 = dtb__68) then true else (dtb__67 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__70, dtb__71) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__72) -> (if (dtb__72 = s) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__73, dtb__74) -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__75) -> (if (dtb__75 = k) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__76, dtb__77) -> (match dtb__76 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__78) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (if (dtb__79 >= 65) then (dtb__79 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (if (dtb__81 = 95) then (match dtb__82 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (if (dtb__83 >= 65) then (dtb__83 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__85, dtb__86) -> (match dtb__85 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__87) -> (if (dtb__87 = "(") then true else (if (dtb__87 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__88) -> (if (dtb__88 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (dtb__89, dtb__90, dtb__91) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__92) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__93) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__94) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__95, dtb__96) -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__97) -> (if (dtb__97 = "(") then true else (if (dtb__97 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTTmpl (dtb__98, dtb__99, dtb__100) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__101) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__102) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__103) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__104, dtb__105) -> (match dtb__104 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__106) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__106) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__107) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__107) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken ("value name"))) "value name") else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__108) -> (match dtb__108 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__109, dtb__110) -> (match dtb__109 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__111) -> (if (dtb__111 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> (match dtb__112 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__113, dtb__114) -> (match dtb__113 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__115) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__115) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__115)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__116, dtb__117, dtb__118) -> (match dtb__116 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__119, dtb__120) -> (if (dtb__119 = "->") then (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__123))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (dtb__125 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__127)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__129, dtb__130) -> (match dtb__129 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__131) -> (if (dtb__131 = "else") then true else (if (dtb__131 = "in") then true else (if (dtb__131 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__132) -> (if (dtb__132 = ")") then true else (if (dtb__132 = "]") then true else (if (dtb__132 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__133, dtb__134) -> (if (dtb__134 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
