open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState of (string) * (t_Vuna_dCompiler_dFrontend_dLexer_dPTok t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dPos)

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__0, dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__4, dtb__5, dtb__6) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__7, dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> dtb__10
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof, (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__12, dtb__13, dtb__14) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st -> (fun st2 -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__15, dtb__16, dtb__17) -> (match dtb__16 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__15, dtb__16, dtb__17))
  | _ -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__15, dtb__19, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf dtb__18)))
)
  | _ -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__15, dtb__19, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dposOf dtb__18)))
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__15, dtb__16, dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__22, dtb__23) -> (match dtb__22 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTEof -> true
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState (dtb__24, dtb__25, dtb__26) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((bi_add ((bi_mul 128) (v_Base_dList_dlength (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf st)))) 1024))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__27, dtb__28) -> (C_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st), (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf st), (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__27, 0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st -> (fun s -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__29, dtb__30) -> (match dtb__29 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__31) -> ((bi_eq_str dtb__31) s)
  | _ -> false
)
  | _ -> false
)))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__33) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st -> (fun n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtoksOf st)) n)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHeadName = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__36) -> (match ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (match dtb__37 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__40) -> (if ((bi_eq_str dtb__40) ":") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st -> (fun k -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__41, dtb__42) -> (match dtb__41 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__43) -> ((bi_eq_str dtb__43) k)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__44, dtb__45) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__46, dtb__47) -> (if ((bi_eq_int dtb__44) dtb__46) then true else ((bi_gt_int dtb__45) blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st -> (fun s -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__48, dtb__49) -> (match dtb__48 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__50) -> (if ((bi_eq_str dtb__50) s) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s)))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s)))
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st -> (fun k -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__51, dtb__52) -> (match dtb__51 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__53) -> (if ((bi_eq_str dtb__53) k) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k)))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k)))
)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st) with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__56) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected identifier"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected identifier"))
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((bi_ge_int dtb__57) 65) then ((bi_le_int dtb__57) 90) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if ((bi_eq_int dtb__59) 95) then (match dtb__60 with
  | C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if ((bi_ge_int dtb__61) 65) then ((bi_le_int dtb__61) 90) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__63, dtb__64) -> (match dtb__63 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__65) -> (if ((bi_eq_str dtb__65) "(") then true else (if ((bi_eq_str dtb__65) "[") then true else false))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__66) -> (if ((bi_eq_str dtb__66) "Type") then true else false)
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__67) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__68) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__69) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__70, dtb__71) -> (match dtb__70 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__72) -> (if ((bi_eq_str dtb__72) "(") then true else (if ((bi_eq_str dtb__72) "[") then true else false))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTStr (dtb__73) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTInt (dtb__74) -> true
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTIdent (dtb__75) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dinfixInfo = (fun mc0 -> (if ((bi_eq_str mc0) "->") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 1)))) else (if ((bi_eq_str mc0) "||") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (2, 0)))) else (if ((bi_eq_str mc0) "&&") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (3, 0)))) else (if ((bi_eq_str mc0) "==") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "/=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "<") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "<=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) ">") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) ">=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "++") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (5, 1)))) else (if ((bi_eq_str mc0) "+") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (6, 0)))) else (if ((bi_eq_str mc0) "-") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (6, 0)))) else (if ((bi_eq_str mc0) "*") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (7, 0)))) else (if ((bi_eq_str mc0) "/") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (7, 0)))) else (if ((bi_eq_str mc0) "::") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (8, 1)))) else (if ((bi_eq_str mc0) ">>=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 1)))) else (if ((bi_eq_str mc0) ">>") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 0)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dopExpr = (fun mc0 -> (fun mc1 -> (if ((bi_eq_str mc0) "::") then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Cons", mc1)) else (if ((bi_eq_str mc0) ">>=") then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", mc1)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc0, mc1))))))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkInfixExpr = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (if ((bi_eq_str mc0) ">>") then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", mc3)), (C_Base_dList_dList_Cons (mc1, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_seq_ignore", C_Base_dList_dList_Nil)), mc2, mc3)), C_Base_dList_dList_Nil)))), mc3)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dopExpr mc0) mc3), (C_Base_dList_dList_Cons (mc1, (C_Base_dList_dList_Cons (mc2, C_Base_dList_dList_Nil)))), mc3)))))))

let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__76, dtb__77, dtb__78) -> (match dtb__76 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__79, dtb__80) -> (if ((bi_eq_str dtb__79) "->") then (match dtb__77 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__82 with
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__84 with
  | C_Base_dList_dList_Nil -> ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__83))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun tok -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dFrontend_dLexer_dPTok_Vuna_dCompiler_dFrontend_dLexer_dPTok (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTKw (dtb__87) -> (if ((bi_eq_str dtb__87) "else") then true else (if ((bi_eq_str dtb__87) "in") then true else (if ((bi_eq_str dtb__87) "then") then true else false)))
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_Vuna_dCompiler_dFrontend_dLexer_dTSym (dtb__88) -> (if ((bi_eq_str dtb__88) ")") then true else (if ((bi_eq_str dtb__88) "]") then true else (if ((bi_eq_str dtb__88) ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) tok))

let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st -> (fun altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__89, dtb__90) -> (if ((bi_gt_int dtb__90) altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
))))
