open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf : string; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft : int }

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__0; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__1; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__2; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__4; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__5; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__6; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__7 } -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__10; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__11; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__12; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)) })

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__14; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__15; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__16; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__17 } -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__14; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__15; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__16; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__17 }
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__20; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__21 } -> (match dtb__20 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__14; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__15; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__16; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__17 }
  | _ -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__14; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__19; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = (dtb__18).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (if (dtb__17 > 0) then (dtb__17 - 1) else 0) }
)
  | _ -> failwith "DT: impossible branch"
)) dtb__18)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__22; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft) + 1024))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__24; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__25 } -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__24; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__26; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__27 } -> (match dtb__26 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__28) -> (dtb__28 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__30) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf) n))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun fuel st n acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> (match dtb__31 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__32; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__33 } -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__34) -> (if (dtb__34 = ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dreverse acc))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__35) -> ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (fuel - 1)) st) (n + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__35, acc)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36) -> (match dtb__36 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__37; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__38 } -> (match dtb__37 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__39) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 2) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40)) }))
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
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__41; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__42 } -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__43) -> (if (dtb__43 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__43 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__44) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 1) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__46; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__47 } -> (match dtb__46 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__48) -> (dtb__48 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__49; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__50 } -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__51; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__52 } -> (if (dtb__49 = dtb__51) then true else (dtb__50 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__53; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__54 } -> (match dtb__53 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__55) -> (if (dtb__55 = s) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__56; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__57 } -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__58) -> (if (dtb__58 = k) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })) else ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__59; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__60 } -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__61) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) }))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (if (dtb__62 >= 65) then (dtb__62 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if (dtb__64 = 95) then (match dtb__65 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if (dtb__66 >= 65) then (dtb__66 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__68; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__69 } -> (match dtb__68 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__70) -> (if (dtb__70 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (match dtb__71 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__72; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__73 } -> (match dtb__72 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__74) -> (if (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__73) = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__69)) then ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__73) = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__69) + 1)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ("?" ^ dtb__74); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__69); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__69); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__73); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__73) + (bi_strLength dtb__74)) } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
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
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__75; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__76 } -> (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__77) -> (if (dtb__77 = "(") then true else (if (dtb__77 = "[") then true else (if (dtb__77 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__79) -> (if (dtb__79 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__80, dtb__81, dtb__82) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__83) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__84) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__85) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__86) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__87; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__88 } -> (match dtb__87 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__89) -> (if (dtb__89 = "(") then true else (if (dtb__89 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__90, dtb__91, dtb__92) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__93) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__94) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__95) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__96; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__97 } -> (match dtb__96 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__98) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__98) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__99) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__99) then ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (match dtb__100 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__101; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__102 } -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__103) -> (if (dtb__103 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (match dtb__104 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__105; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__106 } -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__107) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__107) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (dtb__107 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107))
  | _ -> failwith "DT: impossible branch"
) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__109, dtb__110, dtb__111) -> (match dtb__109 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__112, dtb__113) -> (if (dtb__112 = "->") then (match dtb__110 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__116))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__118, dtb__119, dtb__120, dtb__121) -> (if (dtb__118 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__120)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__122; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__123 } -> (match dtb__122 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__124) -> (if (dtb__124 = "else") then true else (if (dtb__124 = "in") then true else (if (dtb__124 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__125) -> (if (dtb__125 = ")") then true else (if (dtb__125 = "]") then true else (if (dtb__125 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__126; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__127 } -> (if (dtb__127 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
