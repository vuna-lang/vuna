open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState of (string) * (t_Vuna_dCompiler_dFrontend_dLexer_dPTok t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dPos) * (int)

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__0, dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__8, dtb__9, dtb__10, dtb__11) -> (match dtb__9 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof, (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> dtb__12
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__14, dtb__15, dtb__16, dtb__17) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st -> (fun st2 -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__18, dtb__19, dtb__20, dtb__21) -> (match dtb__19 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__18, dtb__19, dtb__20, dtb__21))
  | C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__24, dtb__25) -> (match dtb__24 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__18, dtb__19, dtb__20, dtb__21))
  | _ -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__18, dtb__23, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf dtb__22), (if ((bi_gt_int dtb__21) 0) then ((bi_sub dtb__21) 1) else 0)))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__22)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksLeft = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((bi_add ((bi_mul 128) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksLeft st))) 1024))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__36, dtb__37) -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf st), (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__36, 0)), (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksLeft st)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st -> (fun s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__40) -> ((bi_eq_str dtb__40) s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st))))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__42) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st -> (fun n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf st)) n)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHeadName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__43, dtb__44) -> (match dtb__43 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__45) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__46) -> (match dtb__46 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__47, dtb__48) -> (match dtb__47 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__49) -> (if ((bi_eq_str dtb__49) ":") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st -> (fun k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__50, dtb__51) -> (match dtb__50 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__52) -> ((bi_eq_str dtb__52) k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__53, dtb__54) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__55, dtb__56) -> (if ((bi_eq_int dtb__53) dtb__55) then true else ((bi_gt_int dtb__54) blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st -> (fun s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__57, dtb__58) -> (match dtb__57 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__59) -> (if ((bi_eq_str dtb__59) s) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st -> (fun k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__62) -> (if ((bi_eq_str dtb__62) k) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else ((v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1 (C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__63, dtb__64) -> (match dtb__63 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__65) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)))))
  | _ -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if ((bi_ge_int dtb__66) 65) then ((bi_le_int dtb__66) 90) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (if ((bi_eq_int dtb__68) 95) then (match dtb__69 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (if ((bi_ge_int dtb__70) 65) then ((bi_le_int dtb__70) 90) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__72, dtb__73) -> (match dtb__72 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__74) -> (if ((bi_eq_str dtb__74) "(") then true else (if ((bi_eq_str dtb__74) "[") then true else false))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__75) -> (if ((bi_eq_str dtb__75) "Type") then true else false)
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__76) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__77) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__78) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__81) -> (if ((bi_eq_str dtb__81) "(") then true else (if ((bi_eq_str dtb__81) "[") then true else false))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__82) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__83) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__84) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if ((bi_eq_str op) "=") then true else (if ((bi_eq_str op) ":") then true else (if ((bi_eq_str op) ",") then true else (if ((bi_eq_str op) ";") then true else (if ((bi_eq_str op) "|") then true else (if ((bi_eq_str op) "=>") then true else (if ((bi_eq_str op) "<-") then true else (if ((bi_eq_str op) "\\") then true else (if ((bi_eq_str op) ".") then true else (if ((bi_eq_str op) "..") then true else (if ((bi_eq_str op) "@") then true else (if ((bi_eq_str op) "(") then true else (if ((bi_eq_str op) ")") then true else (if ((bi_eq_str op) "[") then true else (if ((bi_eq_str op) "]") then true else (if ((bi_eq_str op) "{") then true else (if ((bi_eq_str op) "}") then true else false))))))))))))))))))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__85, dtb__86, dtb__87) -> (match dtb__85 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__88, dtb__89) -> (if ((bi_eq_str dtb__88) "->") then (match dtb__86 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (match dtb__91 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__93 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__92))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__94, dtb__95, dtb__96, dtb__97) -> (if ((bi_eq_str dtb__94) "->") then ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__96)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__98, dtb__99) -> (match dtb__98 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__100) -> (if ((bi_eq_str dtb__100) "else") then true else (if ((bi_eq_str dtb__100) "in") then true else (if ((bi_eq_str dtb__100) "then") then true else false)))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__101) -> (if ((bi_eq_str dtb__101) ")") then true else (if ((bi_eq_str dtb__101) "]") then true else (if ((bi_eq_str dtb__101) ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st -> (fun altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__102, dtb__103) -> (if ((bi_gt_int dtb__103) altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
))))
