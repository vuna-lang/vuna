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
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
type t_Vuna_dCompiler_dParser_dPState = C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState of (string) * (t_Vuna_dCompiler_dLexer_dPTok t_Base_dList_dList) * (t_Vuna_dCompiler_dCommon_dPos)
and t_Vuna_dCompiler_dParser_dWhereItem = C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWISig of (string) * (t_Vuna_dCompiler_dAst_dExpr) * (t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWIBind of ((t_Vuna_dCompiler_dAst_dPat, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair)

let v_Vuna_dCompiler_dParser_dposOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__0, dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dtokOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dfileOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__4, dtb__5, dtb__6) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dpeekTok = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__7, dtb__8, dtb__9) -> (match dtb__8 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> dtb__10
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTEof, (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 1))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dpeekPos = (fun st -> (v_Vuna_dCompiler_dParser_dposOf (v_Vuna_dCompiler_dParser_dpeekTok st)))

let v_Vuna_dCompiler_dParser_dlastPos = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__12, dtb__13, dtb__14) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dspanOf = (fun st -> (fun st2 -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dpeekPos st)), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2))))))

let v_Vuna_dCompiler_dParser_dadvance = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__15, dtb__16, dtb__17) -> (match dtb__16 with
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTEof -> (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__15, dtb__16, dtb__17))
  | _ -> (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__15, dtb__19, (v_Vuna_dCompiler_dParser_dposOf dtb__18)))
)
  | _ -> (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__15, dtb__19, (v_Vuna_dCompiler_dParser_dposOf dtb__18)))
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__15, dtb__16, dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_disEof = (fun st -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__22, dtb__23) -> (match dtb__22 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTEof -> true
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dParser_dtoksOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (dtb__24, dtb__25, dtb__26) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__27, dtb__28) -> (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dParser_dtoksOf st), (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__27, 0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_datSym = (fun st -> (fun s -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__29, dtb__30) -> (match dtb__29 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__31) -> ((bi_eq_str dtb__31) s)
  | _ -> false
)
  | _ -> false
)))

let rec v_Vuna_dCompiler_dParser_dnthTok = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if ((bi_le_int mc1) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32)) else ((v_Vuna_dCompiler_dParser_dnthTok dtb__33) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dParser_dpeekTokAt = (fun st -> (fun n -> ((v_Vuna_dCompiler_dParser_dnthTok (v_Vuna_dCompiler_dParser_dtoksOf st)) n)))

let v_Vuna_dCompiler_dParser_dbinderHeadName = (fun st -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__36) -> (match ((v_Vuna_dCompiler_dParser_dpeekTokAt st) 1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (match dtb__37 with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__38, dtb__39) -> (match dtb__38 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__40) -> (if ((bi_eq_str dtb__40) ":") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
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

let v_Vuna_dCompiler_dParser_datKw = (fun st -> (fun k -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__41, dtb__42) -> (match dtb__41 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__43) -> ((bi_eq_str dtb__43) k)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dParser_dcanContinue = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__44, dtb__45) -> (match (v_Vuna_dCompiler_dParser_dlastPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__46, dtb__47) -> (if ((bi_eq_int dtb__44) dtb__46) then true else ((bi_gt_int dtb__45) blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dParser_dexpectSym = (fun st -> (fun s -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__48, dtb__49) -> (match dtb__48 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__50) -> (if ((bi_eq_str dtb__50) s) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dParser_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s)))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") s)))
)))

let v_Vuna_dCompiler_dParser_dexpectKw = (fun st -> (fun k -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__51, dtb__52) -> (match dtb__51 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__53) -> (if ((bi_eq_str dtb__53) k) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dParser_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k)))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected ") k)))
)))

let v_Vuna_dCompiler_dParser_dexpectIdent = (fun st -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__56) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, (v_Vuna_dCompiler_dParser_dadvance st)))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected identifier"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected identifier"))
))

let v_Vuna_dCompiler_dParser_dupperFirst = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((bi_ge_int dtb__57) 65) then ((bi_le_int dtb__57) 90) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dunderscoreCtorName = (fun s -> (match (dtp_unpack s) with
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if ((bi_eq_int dtb__59) 95) then (match dtb__60 with
  | C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if ((bi_ge_int dtb__61) 65) then ((bi_le_int dtb__61) 90) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dParser_dupperFirst name) then true else (v_Vuna_dCompiler_dParser_dunderscoreCtorName name)))

let v_Vuna_dCompiler_dParser_dstartsAtom = (fun st -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__63, dtb__64) -> (match dtb__63 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__65) -> (if ((bi_eq_str dtb__65) "(") then true else (if ((bi_eq_str dtb__65) "[") then true else false))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__66) -> (if ((bi_eq_str dtb__66) "Type") then true else false)
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr (dtb__67) -> true
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt (dtb__68) -> true
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__69) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st)))

let v_Vuna_dCompiler_dParser_dstartsPatternAtom = (fun st -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__70, dtb__71) -> (match dtb__70 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__72) -> (if ((bi_eq_str dtb__72) "(") then true else (if ((bi_eq_str dtb__72) "[") then true else false))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr (dtb__73) -> true
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt (dtb__74) -> true
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__75) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st)))

let v_Vuna_dCompiler_dParser_dinfixInfo = (fun mc0 -> (if ((bi_eq_str mc0) "->") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 1)))) else (if ((bi_eq_str mc0) "||") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (2, 0)))) else (if ((bi_eq_str mc0) "&&") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (3, 0)))) else (if ((bi_eq_str mc0) "==") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "/=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "<") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "<=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) ">") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) ">=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (4, 0)))) else (if ((bi_eq_str mc0) "++") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (5, 1)))) else (if ((bi_eq_str mc0) "+") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (6, 0)))) else (if ((bi_eq_str mc0) "-") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (6, 0)))) else (if ((bi_eq_str mc0) "*") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (7, 0)))) else (if ((bi_eq_str mc0) "/") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (7, 0)))) else (if ((bi_eq_str mc0) "::") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (8, 1)))) else (if ((bi_eq_str mc0) ">>=") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 1)))) else (if ((bi_eq_str mc0) ">>") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (1, 0)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))))))))))

let v_Vuna_dCompiler_dParser_dopExpr = (fun mc0 -> (fun mc1 -> (if ((bi_eq_str mc0) "::") then (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Cons", mc1)) else (if ((bi_eq_str mc0) ">>=") then (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", mc1)) else (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (mc0, mc1))))))

let v_Vuna_dCompiler_dParser_dmkInfixExpr = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (if ((bi_eq_str mc0) ">>") then (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", mc3)), (C_Base_dList_dList_Cons (mc1, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_seq_ignore", C_Base_dList_dList_Nil)), mc2, mc3)), C_Base_dList_dList_Nil)))), mc3)) else (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (((v_Vuna_dCompiler_dParser_dopExpr mc0) mc3), (C_Base_dList_dList_Cons (mc1, (C_Base_dList_dList_Cons (mc2, C_Base_dList_dList_Nil)))), mc3)))))))

let rec v_Vuna_dCompiler_dParser_dcountArrows = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__76, dtb__77, dtb__78) -> (match dtb__76 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__79, dtb__80) -> (if ((bi_eq_str dtb__79) "->") then (match dtb__77 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__82 with
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__84 with
  | C_Base_dList_dList_Nil -> ((bi_add 1) (v_Vuna_dCompiler_dParser_dcountArrows dtb__83))
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

let v_Vuna_dCompiler_dParser_dterminatesExpression = (fun tok -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__87) -> (if ((bi_eq_str dtb__87) "else") then true else (if ((bi_eq_str dtb__87) "in") then true else (if ((bi_eq_str dtb__87) "then") then true else false)))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__88) -> (if ((bi_eq_str dtb__88) ")") then true else (if ((bi_eq_str dtb__88) "]") then true else (if ((bi_eq_str dtb__88) ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) tok))

let v_Vuna_dCompiler_dParser_dbadCaseIndent = (fun st -> (fun altCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then false else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__89, dtb__90) -> (if ((bi_gt_int dtb__90) altCol) then (if (v_Vuna_dCompiler_dParser_dterminatesExpression (v_Vuna_dCompiler_dParser_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseExportItem = (fun st -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__91, dtb__92) -> (match dtb__91 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__93) -> ((fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) "(") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "(")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st2) "..")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st3) ")")) (fun _u -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__93, ((v_Vuna_dCompiler_dParser_dspanOf st) st4))), st4))))))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__93, ((v_Vuna_dCompiler_dParser_dspanOf st) st1))), st1)))))) (v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__94) -> (if ((bi_eq_str dtb__94) "module") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "module")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (name, ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected an export item")))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected an export item"))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st)))

let rec v_Vuna_dCompiler_dParser_dparseExportItemsFrom = (fun st -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItem st)) (fun item -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ",") then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItemsFrom (v_Vuna_dCompiler_dParser_dadvance st1))) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (item, rest)), st2))))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ")")) (fun _u -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (item, C_Base_dList_dList_Nil)), st2))))))))))))

let v_Vuna_dCompiler_dParser_dparseExportItems = (fun st -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "(")) (fun _u -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ")") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (v_Vuna_dCompiler_dParser_dadvance st1))))) else (v_Vuna_dCompiler_dParser_dparseExportItemsFrom st1))))))

let v_Vuna_dCompiler_dParser_dparseModDecl = (fun st -> (if ((v_Vuna_dCompiler_dParser_datKw st) "module") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "module")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> (if ((v_Vuna_dCompiler_dParser_datSym st2) "(") then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseExportItems st2)) (fun items -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st3) "where")) (fun _u -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (name, true, items, ((v_Vuna_dCompiler_dParser_dspanOf st) st4))))), st4)))))))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st2) "where")) (fun _u -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (name, false, C_Base_dList_dList_Nil, ((v_Vuna_dCompiler_dParser_dspanOf st) st3))))), st3)))))))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, st))))))

let v_Vuna_dCompiler_dParser_dparseImportAlias = (fun st -> (fun isQualified -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun name -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datKw st1) "as") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st1) "as")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st2)) (fun alias -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (name, isQualified, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (alias)), ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), st3)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (name, isQualified, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, ((v_Vuna_dCompiler_dParser_dspanOf st) st1))), st1))))))))))

let v_Vuna_dCompiler_dParser_dparseImportSpec = (fun st -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "import")) (fun _u -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datKw st1) "qualified") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st1) "qualified")) (fun _u -> (fun st2 -> ((v_Vuna_dCompiler_dParser_dparseImportAlias st2) true)))) else ((v_Vuna_dCompiler_dParser_dparseImportAlias st1) false))))))

let rec v_Vuna_dCompiler_dParser_dparseImports = (fun st -> (if ((v_Vuna_dCompiler_dParser_datKw st) "import") then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImportSpec st)) (fun imp -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImports st1)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (imp, rest)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))

let v_Vuna_dCompiler_dParser_dpatBoundName = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__95, dtb__96) -> dtb__95
  | _ -> ""
))

let rec v_Vuna_dCompiler_dParser_dwhereSigOf = (fun name -> (fun sigs -> (match sigs with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (if ((bi_eq_str dtb__99) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100)) else ((v_Vuna_dCompiler_dParser_dwhereSigOf name) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dParser_dhasWhereSig = (fun name -> (fun sigs -> (match ((v_Vuna_dCompiler_dParser_dwhereSigOf name) sigs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__101) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dParser_dfirstDanglingSig = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__102 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (if ((v_Base_dList_dmemName dtb__104) mc1) then ((v_Vuna_dCompiler_dParser_dfirstDanglingSig dtb__103) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__107)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dParser_dwhereBindsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__108 with
  | C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWISig (dtb__110, dtb__111, dtb__112) -> (if ((v_Base_dList_dmemName dtb__110) mc2) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__112)) ((bi_concat ": where signature for `") ((bi_concat dtb__110) "` must come before its clause"))))) else (if ((v_Vuna_dCompiler_dParser_dhasWhereSig dtb__110) mc1) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__112)) ((bi_concat ": duplicate where signature for `") ((bi_concat dtb__110) "`"))))) else ((((v_Vuna_dCompiler_dParser_dwhereBindsGo dtb__109) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112)))), mc1))) mc2) mc3)))
  | C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWIBind (dtb__113) -> (match dtb__113 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115) -> (match ((v_Vuna_dCompiler_dParser_dwhereSigOf (v_Vuna_dCompiler_dParser_dpatBoundName dtb__114)) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (match dtb__116 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dParser_dpatBoundName dtb__114)) mc2) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__118)) ((bi_concat ": where binding `") ((bi_concat (v_Vuna_dCompiler_dParser_dpatBoundName dtb__114)) "` has more than one clause; a signature can annotate only one"))))) else ((((v_Vuna_dCompiler_dParser_dwhereBindsGo dtb__109) mc1) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dParser_dpatBoundName dtb__114), mc2))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__115, dtb__117, dtb__118)))), mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dParser_dwhereBindsGo dtb__109) mc1) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dParser_dpatBoundName dtb__114), mc2))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115)), mc3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dParser_dfirstDanglingSig (v_Base_dList_dreverse mc1)) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc3)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119) -> (match dtb__119 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__120, dtb__121) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__121)) ((bi_concat ": where signature for `") ((bi_concat dtb__120) "` has no definition")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dParser_dwhereItemsToBinds = (fun items -> ((((v_Vuna_dCompiler_dParser_dwhereBindsGo items) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dParser_dlamNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__124, dtb__125) -> (match (v_Vuna_dCompiler_dParser_dlamNames dtb__123) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__126) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__124, dtb__126))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__127) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("where function arguments must be simple names"))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dParser_dparseDerivingNames = (fun st -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun name -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ",") then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDerivingNames (v_Vuna_dCompiler_dParser_dadvance st1))) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (name, rest)), st2))))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ")")) (fun _u -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (name, C_Base_dList_dList_Nil)), st2))))))))))))

let v_Vuna_dCompiler_dParser_dparseDeriving = (fun st -> (if ((v_Vuna_dCompiler_dParser_datKw st) "deriving") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "deriving")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "(")) (fun _u -> (fun st2 -> (if ((v_Vuna_dCompiler_dParser_datSym st2) ")") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (v_Vuna_dCompiler_dParser_dadvance st2))))) else ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDerivingNames st2)) (fun names -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (names, st3)))))))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))

let v_Vuna_dCompiler_dParser_dinstanceIsDefault = (fun name -> (match name with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dParser_dparseInstanceName = (fun st -> (if ((v_Vuna_dCompiler_dParser_datKw st) "as") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "as")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, st))))))

let rec v_Vuna_dCompiler_dParser_dparseParams = (fun st -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__129, dtb__130) -> (match dtb__129 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__131) -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams (v_Vuna_dCompiler_dParser_dadvance st))) (fun rest -> (fun st1 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__131, rest)), st1)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))
))

let v_Vuna_dCompiler_dParser_dspanFromExpr = (fun e -> (fun st2 -> ((fun sp -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dCommon_dspanFile sp), (v_Vuna_dCompiler_dCommon_dspanStartLine sp), (v_Vuna_dCompiler_dCommon_dspanStartCol sp), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2))))) (v_Vuna_dCompiler_dAst_dexprSpan e))))

let v_Vuna_dCompiler_dParser_dparseInstanceSelector = (fun st -> (fun blockCol -> (fun first -> (if ((v_Vuna_dCompiler_dParser_datSym st) "@") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "@")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (first, name, ((v_Vuna_dCompiler_dParser_dspanFromExpr first) st2))), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (first, st))))))))

let rec v_Vuna_dCompiler_dParser_dparseFieldSuffix = (fun st -> (fun blockCol -> (fun base -> (if ((v_Vuna_dCompiler_dParser_datSym st) ".") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) ".")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun fname -> (fun st2 -> (((v_Vuna_dCompiler_dParser_dparseFieldSuffix st2) blockCol) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (base, fname, ((v_Vuna_dCompiler_dParser_dspanFromExpr base) st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (base, st))))))))

let rec v_Vuna_dCompiler_dParser_dfoldCons = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Cons", mc0)), (C_Base_dList_dList_Cons (dtb__132, (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dParser_dfoldCons mc0) dtb__133), C_Base_dList_dList_Nil)))), mc0))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Nil", mc0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dParser_dparseLambdaParams = (fun st -> (fun acc -> (if ((v_Vuna_dCompiler_dParser_datSym st) ",") then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent (v_Vuna_dCompiler_dParser_dadvance st))) (fun name -> (fun st1 -> ((v_Vuna_dCompiler_dParser_dparseLambdaParams st1) ((v_Base_dList_dappend acc) (C_Base_dList_dList_Cons (name, C_Base_dList_dList_Nil))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (acc, st)))))))

let rec v_Vuna_dCompiler_dParser_dfoldPCon = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon ("Cons", (C_Base_dList_dList_Cons (dtb__134, (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dParser_dfoldPCon mc0) dtb__135), C_Base_dList_dList_Nil)))), mc0))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon ("Nil", C_Base_dList_dList_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dParser_dparsePatternSingle = (fun st -> (fun blockCol -> ((v_Vuna_dCompiler_dParser_dparsePatternCons st) blockCol)))
and v_Vuna_dCompiler_dParser_dparsePatternCons = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternHead st) blockCol)) (fun lhs -> (fun st1 -> (if (if ((v_Vuna_dCompiler_dParser_datSym st1) "::") then ((v_Vuna_dCompiler_dParser_dcanContinue st1) blockCol) else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternCons (v_Vuna_dCompiler_dParser_dadvance st1)) blockCol)) (fun rhs -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon ("Cons", (C_Base_dList_dList_Cons (lhs, (C_Base_dList_dList_Cons (rhs, C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, st1))))))))))
and v_Vuna_dCompiler_dParser_dparsePatternHead = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__136, dtb__137) -> (match dtb__136 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__138) -> ((fun st1 -> (if (if (v_Vuna_dCompiler_dParser_dctorPatternStart dtb__138) then ((v_Vuna_dCompiler_dParser_datSym st1) "{") else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordPatternFields st1) blockCol)) (fun fields -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (dtb__138, fields, ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2))))))) else (if (v_Vuna_dCompiler_dParser_dctorPatternStart dtb__138) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternAtoms st1) blockCol)) (fun args -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__138, args, ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2))))))) else ((v_Vuna_dCompiler_dParser_dparsePatternAtom st) blockCol)))) (v_Vuna_dCompiler_dParser_dadvance st))
  | _ -> ((v_Vuna_dCompiler_dParser_dparsePatternAtom st) blockCol)
)
  | _ -> ((v_Vuna_dCompiler_dParser_dparsePatternAtom st) blockCol)
)))
and v_Vuna_dCompiler_dParser_dparseRecordPatternFields = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "{")) (fun _u -> (fun st1 -> ((v_Vuna_dCompiler_dParser_dparseRecordPatternList st1) blockCol))))))
and v_Vuna_dCompiler_dParser_dparseRecordPatternList = (fun st -> (fun blockCol -> (if ((v_Vuna_dCompiler_dParser_datSym st) "}") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (v_Vuna_dCompiler_dParser_dadvance st))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordPatternField st) blockCol)) (fun f -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ",") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordPatternList (v_Vuna_dCompiler_dParser_dadvance st1)) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (f, rest)), st2))))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "}")) (fun _u -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (f, C_Base_dList_dList_Nil)), st2))))))))))))))
and v_Vuna_dCompiler_dParser_dparseRecordPatternField = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__139, dtb__140) -> (match dtb__139 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__141) -> ((fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) "=") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "=")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle st2) blockCol)) (fun pat -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, pat)), st3)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__141, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine dtb__140), (v_Vuna_dCompiler_dCommon_dposCol dtb__140), (v_Vuna_dCompiler_dCommon_dposLine dtb__140), (v_Vuna_dCompiler_dCommon_dposCol dtb__140))))))), st1)))))) (v_Vuna_dCompiler_dParser_dadvance st))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected a record field pattern"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected a record field pattern"))
)))
and v_Vuna_dCompiler_dParser_dparsePatternAtoms = (fun st -> (fun blockCol -> (if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st) then ((v_Vuna_dCompiler_dParser_dcanContinue st) blockCol) else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternAtom st) blockCol)) (fun pat -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternAtoms st1) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (pat, rest)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))))
and v_Vuna_dCompiler_dParser_dparsePatternAtom = (fun st -> (fun blockCol -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__144) -> (if ((bi_eq_str dtb__144) "(") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle (v_Vuna_dCompiler_dParser_dadvance st)) blockCol)) (fun inner -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ")")) (fun _u -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (inner, st2)))))))))) else (if ((bi_eq_str dtb__144) "[") then ((v_Vuna_dCompiler_dParser_dparseListPattern st) blockCol) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected pattern"))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr (dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__145, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st)))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt (dtb__146) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__146, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st)))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__147) -> (if ((bi_eq_str dtb__147) "_") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st))))) else (if (v_Vuna_dCompiler_dParser_dctorPatternStart dtb__147) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__147, C_Base_dList_dList_Nil, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__147, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected pattern"))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st))))
and v_Vuna_dCompiler_dParser_dparseListPattern = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "[")) (fun _u -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) "]") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon ("Nil", C_Base_dList_dList_Nil, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st1)))), (v_Vuna_dCompiler_dParser_dadvance st1))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseListPatternElems st1) blockCol)) (fun pats -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dParser_dfoldPCon ((v_Vuna_dCompiler_dParser_dspanOf st) st2)) pats), st2)))))))))))))
and v_Vuna_dCompiler_dParser_dparseListPatternElems = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle st) blockCol)) (fun pat -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ",") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseListPatternElems (v_Vuna_dCompiler_dParser_dadvance st1)) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (pat, rest)), st2))))))) else (if ((v_Vuna_dCompiler_dParser_datSym st1) "]") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (pat, C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dParser_dadvance st1))))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected , or ]")))))))))

let rec v_Vuna_dCompiler_dParser_dparseClausePatterns = (fun st -> (fun blockCol -> (if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st) then ((v_Vuna_dCompiler_dParser_dcanContinue st) blockCol) else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternAtom st) blockCol)) (fun pat -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseClausePatterns st1) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (pat, rest)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))))

let rec v_Vuna_dCompiler_dParser_dparseExpr = (fun st -> (fun blockCol -> (fun minPrec -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected end of input")) else (if ((v_Vuna_dCompiler_dParser_dcanContinue st) blockCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseLhs st) blockCol)) (fun lhs -> (fun st1 -> ((((v_Vuna_dCompiler_dParser_dparseInfix st1) blockCol) minPrec) lhs)))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expression is not indented enough")))))))
and v_Vuna_dCompiler_dParser_dparseInfix = (fun st -> (fun blockCol -> (fun minPrec -> (fun lhs -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__148, dtb__149) -> (match dtb__148 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__150) -> (match (v_Vuna_dCompiler_dParser_dinfixInfo dtb__150) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (match dtb__151 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (if (if ((bi_ge_int dtb__152) minPrec) then ((v_Vuna_dCompiler_dParser_dcanContinue st) blockCol) else false) then ((fun rhsPrec -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dadvance st)) blockCol) rhsPrec)) (fun rhs -> (fun st2 -> ((((v_Vuna_dCompiler_dParser_dparseInfix st2) blockCol) minPrec) ((((v_Vuna_dCompiler_dParser_dmkInfixExpr dtb__150) lhs) rhs) ((v_Vuna_dCompiler_dParser_dspanOf st) st2))))))) (if ((bi_eq_int dtb__153) 0) then ((bi_add dtb__152) 1) else dtb__152)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, st))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, st))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, st))))
)))))
and v_Vuna_dCompiler_dParser_dparseLhs = (fun st -> (fun blockCol -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__154, dtb__155) -> (match dtb__154 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__156) -> (if ((bi_eq_str dtb__156) "let") then ((v_Vuna_dCompiler_dParser_dparseLet st) blockCol) else (if ((bi_eq_str dtb__156) "case") then ((v_Vuna_dCompiler_dParser_dparseCase st) blockCol) else (if ((bi_eq_str dtb__156) "if") then ((v_Vuna_dCompiler_dParser_dparseIf st) blockCol) else (if ((bi_eq_str dtb__156) "do") then ((v_Vuna_dCompiler_dParser_dparseDo st) blockCol) else ((v_Vuna_dCompiler_dParser_dparseApplication st) blockCol)))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__157) -> (if ((bi_eq_str dtb__157) "\\") then ((v_Vuna_dCompiler_dParser_dparseLambda st) blockCol) else ((v_Vuna_dCompiler_dParser_dparseApplication st) blockCol))
  | _ -> ((v_Vuna_dCompiler_dParser_dparseApplication st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st))))
and v_Vuna_dCompiler_dParser_dparseApplication = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseAtom st) blockCol)) (fun first -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseInstanceSelector st1) blockCol) first)) (fun first2 -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseArgs st2) blockCol)) (fun args -> (fun st3 -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (first2, st3))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (first2, args, ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), st3))))
))))))))))))
and v_Vuna_dCompiler_dParser_dparseArgs = (fun st -> (fun blockCol -> (if (if (v_Vuna_dCompiler_dParser_dstartsAtom st) then ((v_Vuna_dCompiler_dParser_dcanContinue st) blockCol) else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseAtom st) blockCol)) (fun arg -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseArgs st1) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (arg, rest)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))))
and v_Vuna_dCompiler_dParser_dparseAtom = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseAtomBase st) blockCol)) (fun base -> (fun st1 -> (((v_Vuna_dCompiler_dParser_dparseFieldSuffix st1) blockCol) base))))))
and v_Vuna_dCompiler_dParser_dparseAtomBase = (fun st -> (fun blockCol -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__158, dtb__159) -> (match dtb__158 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTSym (dtb__160) -> (if ((bi_eq_str dtb__160) "(") then (match (v_Vuna_dCompiler_dParser_dbinderHeadName (v_Vuna_dCompiler_dParser_dadvance st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> ((((((v_Vuna_dCompiler_dParser_dparsePiBinder st) blockCol) dtb__161) false) "(") ")")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dadvance st)) blockCol) 0)) (fun inner -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ")")) (fun _u -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (inner, st2))))))))))
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str dtb__160) "[") then ((v_Vuna_dCompiler_dParser_dparseListExpr st) blockCol) else (if ((bi_eq_str dtb__160) "{") then (match (v_Vuna_dCompiler_dParser_dbinderHeadName (v_Vuna_dCompiler_dParser_dadvance st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> ((((((v_Vuna_dCompiler_dParser_dparsePiBinder st) blockCol) dtb__162) true) "{") "}")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "{")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun base -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st2) "|")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordAssignments st3) blockCol)) (fun fields -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (base, fields, ((v_Vuna_dCompiler_dParser_dspanOf st) st4))), st4))))))))))))))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected expression")))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__163) -> (if ((bi_eq_str dtb__163) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st))))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected expression")))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTStr (dtb__164) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__164, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st)))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTInt (dtb__165) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__165, ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st)))), (v_Vuna_dCompiler_dParser_dadvance st)))))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__166) -> ((fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) "{") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "{")) (fun _u -> (fun st1b -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordAssignments st1b) blockCol)) (fun fields -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__166, fields, ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__166, ((v_Vuna_dCompiler_dParser_dspanOf st) st1))), st1)))))) (v_Vuna_dCompiler_dParser_dadvance st))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected expression"))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st))))
and v_Vuna_dCompiler_dParser_dparsePiBinder = (fun st -> (fun blockCol -> (fun name -> (fun implicit -> (fun openSym -> (fun closeSym -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr ("pi binder name must be a simple identifier")) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) openSym)) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name2 -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st2) ":")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st3) blockCol) 0)) (fun dom -> (fun st4 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st4) closeSym)) (fun _u -> (fun st5 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st5) "->")) (fun _u -> (fun st6 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st6) blockCol) 1)) (fun cod -> (fun st7 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (name2, implicit, dom, cod, ((v_Vuna_dCompiler_dParser_dspanOf st) st7))), st7))))))))))))))))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseRecordAssignments = (fun st -> (fun blockCol -> (if ((v_Vuna_dCompiler_dParser_datSym st) "}") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (v_Vuna_dCompiler_dParser_dadvance st))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordAssignList st) blockCol)) (fun fs -> (fun st1 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (fs, st1))))))))))
and v_Vuna_dCompiler_dParser_dparseRecordAssignList = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun fname -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "=")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) blockCol) 0)) (fun value -> (fun st3 -> (if ((v_Vuna_dCompiler_dParser_datSym st3) ",") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseRecordAssignList (v_Vuna_dCompiler_dParser_dadvance st3)) blockCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fname, value)), rest)), st4))))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st3) "}")) (fun _u -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fname, value)), C_Base_dList_dList_Nil)), st4)))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseListExpr = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "[")) (fun _u -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) "]") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Nil", ((v_Vuna_dCompiler_dParser_dspanOf st) (v_Vuna_dCompiler_dParser_dadvance st1)))), (v_Vuna_dCompiler_dParser_dadvance st1))))) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseListExprElems st1) blockCol)) (fun elems -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dParser_dfoldCons ((v_Vuna_dCompiler_dParser_dspanOf st) st2)) elems), st2)))))))))))))
and v_Vuna_dCompiler_dParser_dparseListExprElems = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st) blockCol) 0)) (fun e -> (fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ",") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseListExprElems (v_Vuna_dCompiler_dParser_dadvance st1)) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (e, rest)), st2))))))) else (if ((v_Vuna_dCompiler_dParser_datSym st1) "]") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (e, C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dParser_dadvance st1))))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected , or ]")))))))))
and v_Vuna_dCompiler_dParser_dparseLambda = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "\\")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun first -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseLambdaParams st2) (C_Base_dList_dList_Cons (first, C_Base_dList_dList_Nil)))) (fun params -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st3) "=>")) (fun _u -> (fun st4 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st4) blockCol) 0)) (fun body -> (fun st5 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (params, body, ((v_Vuna_dCompiler_dParser_dspanOf st) st5))), st5)))))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseLet = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "let")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseLetBindings st1) blockCol)) (fun binds -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st2) "in")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st3) blockCol) 0)) (fun body -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (binds, body, false, ((v_Vuna_dCompiler_dParser_dspanOf st) st4))), st4))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseLetBindings = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dErr ("expected a let binding")) else (if ((v_Vuna_dCompiler_dParser_datKw st) "in") then (C_Base_dResult_dResult_Base_dResult_dErr ("expected a let binding")) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__167, dtb__168) -> (if ((bi_le_int dtb__168) blockCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("let binding is not indented enough")) else ((v_Vuna_dCompiler_dParser_dparseLetBindingsAt st) dtb__168))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dParser_dparseLetBindingsAt = (fun st -> (fun declCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (if ((v_Vuna_dCompiler_dParser_datKw st) "in") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__169, dtb__170) -> (if ((bi_eq_int dtb__170) declCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle st) declCol)) (fun pat -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "=")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) declCol) 0)) (fun value -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseLetBindingsAt st3) declCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, value)), rest)), st4)))))))))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dParser_dparseCase = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "case")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun scrut -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st2) "of")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseCaseAlts st3) blockCol)) (fun alts -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (scrut, alts, ((v_Vuna_dCompiler_dParser_dspanOf st) st4))), st4))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseCaseAlts = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dErr ("case expression needs an alternative")) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__171, dtb__172) -> (if ((bi_le_int dtb__172) blockCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("case alternative is not indented enough")) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseAltList st) dtb__172)) (fun alts -> (fun st2 -> (if ((v_Vuna_dCompiler_dParser_dbadCaseIndent st2) dtb__172) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation after case alternative")) else (match alts with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("case expression needs an alternative"))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (alts, st2))))
))))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dParser_dparseAltList = (fun st -> (fun altCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__173, dtb__174) -> (if ((bi_eq_int dtb__174) altCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle st) altCol)) (fun pat -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "=>")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) altCol) 0)) (fun body -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseAltList st3) altCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), rest)), st4)))))))))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dParser_dparseIf = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "if")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun cond -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st2) "then")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st3) blockCol) 0)) (fun yes -> (fun st4 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st4) "else")) (fun _u -> (fun st5 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st5) blockCol) 0)) (fun no -> (fun st6 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (cond, yes, no, ((v_Vuna_dCompiler_dParser_dspanOf st) st6))), st6))))))))))))))))))))))))
and v_Vuna_dCompiler_dParser_dparseDo = (fun st -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "do")) (fun _u -> (fun st1 -> (if (v_Vuna_dCompiler_dParser_disEof st1) then (C_Base_dResult_dResult_Base_dResult_dErr ("do block needs at least one statement")) else (match (v_Vuna_dCompiler_dParser_dpeekPos st1) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__175, dtb__176) -> (if ((bi_le_int dtb__176) blockCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("do block statement is not indented enough")) else ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseDoStmts st1) dtb__176) C_Base_dList_dList_Nil)) (fun stmts -> (fun st2 -> (match (v_Base_dList_dreverse stmts) with
  | C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match dtb__177 with
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (dtb__179, dtb__180) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (stmts, ((v_Vuna_dCompiler_dParser_dspanOf st) st2))), st2))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("do block must end with an expression"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("do block must end with an expression"))
)))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dParser_dparseDoStmts = (fun st -> (fun stmtCol -> (fun acc -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__181, dtb__182) -> (if ((bi_lt_int dtb__182) stmtCol) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), st)))) else (if ((bi_gt_int dtb__182) stmtCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in do block")) else ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseDoStmt st) stmtCol)) (fun stmt -> (fun st1 -> (match (v_Vuna_dCompiler_dParser_dpeekPos st1) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__183, dtb__184) -> (if (v_Vuna_dCompiler_dParser_disEof st1) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (stmt, acc))), st1)))) else (if ((bi_lt_int dtb__184) stmtCol) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (stmt, acc))), st1)))) else (if ((bi_gt_int dtb__184) stmtCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in do block")) else (((v_Vuna_dCompiler_dParser_dparseDoStmts st1) stmtCol) (C_Base_dList_dList_Cons (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dParser_dparseDoStmt = (fun st -> (fun stmtCol -> (match ((v_Vuna_dCompiler_dParser_dparsePatternSingle st) stmtCol) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__185) -> (match dtb__185 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dParser_datSym dtb__187) "<-") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym dtb__187) "<-")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) stmtCol) 0)) (fun e -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDBind (dtb__186, e, ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), st3)))))))))) else ((v_Vuna_dCompiler_dParser_dparseDoExprStmt st) stmtCol))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__188) -> ((v_Vuna_dCompiler_dParser_dparseDoExprStmt st) stmtCol)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dParser_dparseDoExprStmt = (fun st -> (fun stmtCol -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr (v_Vuna_dCompiler_dParser_dsameLineState st)) stmtCol) 0)) (fun e -> (fun st1 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (e, ((v_Vuna_dCompiler_dParser_dspanOf st) st1))), st1)))))))))

let v_Vuna_dCompiler_dParser_dparseExpressionSource = (fun source -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLexer_dlexSource source)) (fun toks -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState ("<expr>", toks, (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 0))))) 0) 0)) (fun e -> (fun st -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk (e)) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected end of expression")))))))))

let v_Vuna_dCompiler_dParser_dparseSignature = (fun st -> (fun blockCol -> (fun name -> (fun namePos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) ":")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun ty -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (name, ty, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine namePos), (v_Vuna_dCompiler_dCommon_dposCol namePos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st2)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st2)))))), st2))))))))))))))

let v_Vuna_dCompiler_dParser_dparseWhereValue = (fun st -> (fun pat -> (fun blockCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st) "=")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun value -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (pat, value)), st2)))))))))))))

let v_Vuna_dCompiler_dParser_dparseWhereDef = (fun stStart -> (fun st -> (fun bindCol -> (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__189, dtb__190) -> (if (if (v_Vuna_dCompiler_dParser_dstartsPatternAtom st) then ((v_Vuna_dCompiler_dParser_dcanContinue st) bindCol) else false) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseClausePatterns st) bindCol)) (fun pats -> (fun st2 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st2) "=")) (fun _u -> (fun st3 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st3) bindCol) 0)) (fun value -> (fun st4 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dlamNames pats)) (fun names -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWIBind ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__189, (v_Vuna_dCompiler_dAst_dpatSpan pat))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (names, value, ((v_Vuna_dCompiler_dParser_dspanOf stStart) st4))))))), st4))))))))))))))) else ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseWhereValue st) pat) bindCol)) (fun b -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWIBind (b)), st2))))))))
  | _ -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseWhereValue st) pat) bindCol)) (fun b -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWIBind (b)), st2)))))))
)))))

let v_Vuna_dCompiler_dParser_dparseWhereItem = (fun st -> (fun bindCol -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparsePatternSingle st) bindCol)) (fun pat -> (fun st1 -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__191, dtb__192) -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ":") then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ":")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) bindCol) 0)) (fun ty -> (fun st3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dParser_dWhereItem_Vuna_dCompiler_dParser_dWISig (dtb__191, ty, ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), st3)))))))))) else ((((v_Vuna_dCompiler_dParser_dparseWhereDef st) st1) bindCol) pat))
  | _ -> ((((v_Vuna_dCompiler_dParser_dparseWhereDef st) st1) bindCol) pat)
))))))

let rec v_Vuna_dCompiler_dParser_dparseWhereItemsAt = (fun st -> (fun bindCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__193, dtb__194) -> (if ((bi_eq_int dtb__194) bindCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseWhereItem st) bindCol)) (fun item -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseWhereItemsAt st1) bindCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (item, rest)), st2)))))))))) else (if ((bi_gt_int dtb__194) bindCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in where block")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseWhereBindings = (fun st -> (fun whereCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__195, dtb__196) -> (if ((bi_gt_int dtb__196) whereCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseWhereItemsAt st) dtb__196)) (fun items -> (fun st1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dwhereItemsToBinds items)) (fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (binds, st1))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseWhere = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__197, dtb__198) -> (match dtb__197 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__199) -> (if ((bi_eq_str dtb__199) "where") then (if ((bi_gt_int (v_Vuna_dCompiler_dCommon_dposCol dtb__198)) blockCol) then ((v_Base_dResult_dstep (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (0, (v_Vuna_dCompiler_dParser_dadvance st)))))) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseWhereBindings st1) blockCol)) (fun binds -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (binds, st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))
)))

let v_Vuna_dCompiler_dParser_dparseClause = (fun st -> (fun blockCol -> (fun name -> (fun namePos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseClausePatterns st) blockCol)) (fun pats -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) "=")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) blockCol) 0)) (fun body -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseWhere st3) blockCol)) (fun wheres -> (fun st4 -> ((fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (name, pats, body2, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine namePos), (v_Vuna_dCompiler_dCommon_dposCol namePos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st4)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st4)))))), st4))))) (match wheres with
  | C_Base_dList_dList_Nil -> body
  | C_Base_dList_dList_Cons (dtb__200, dtb__201) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (wheres, body, true, ((v_Vuna_dCompiler_dParser_dspanOf st) st4)))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

let rec v_Vuna_dCompiler_dParser_dparseFieldList = (fun st -> (fun fieldCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__202, dtb__203) -> (if ((bi_eq_int dtb__203) fieldCol) then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun name -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ":")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) fieldCol) 0)) (fun ty -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseFieldList st3) fieldCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (name, ty, ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), rest)), st4)))))))))))))))) else (if ((bi_gt_int dtb__203) fieldCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in record block")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseFields = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__204, dtb__205) -> (if ((bi_gt_int dtb__205) blockCol) then ((v_Vuna_dCompiler_dParser_dparseFieldList st) dtb__205) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseRecord = (fun st -> (fun blockCol -> (fun kwPos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "record")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2)) (fun params -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st3) "where")) (fun _u -> (fun st4 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseFields st4) blockCol)) (fun fields -> (fun st5 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDeriving st5)) (fun derivings -> (fun st6 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine kwPos), (v_Vuna_dCompiler_dCommon_dposCol kwPos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st6)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st6)))))), st6)))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dParser_dparseMethodSigList = (fun st -> (fun methodCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__206, dtb__207) -> (if ((bi_eq_int dtb__207) methodCol) then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun name -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ":")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) methodCol) 0)) (fun ty -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseMethodSigList st3) methodCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (name, ty)), rest)), st4)))))))))))))))) else (if ((bi_gt_int dtb__207) methodCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in trait block")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseMethodSigs = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__208, dtb__209) -> (if ((bi_gt_int dtb__209) blockCol) then ((v_Vuna_dCompiler_dParser_dparseMethodSigList st) dtb__209) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseTrait = (fun st -> (fun blockCol -> (fun kwPos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "trait")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2)) (fun params -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st3) "where")) (fun _u -> (fun st4 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseMethodSigs st4) blockCol)) (fun methods -> (fun st5 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (name, params, methods, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine kwPos), (v_Vuna_dCompiler_dCommon_dposCol kwPos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st5)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st5)))))), st5))))))))))))))))))))))

let v_Vuna_dCompiler_dParser_dparseInstanceDecl = (fun st -> (fun blockCol -> (match (v_Vuna_dCompiler_dParser_dpeekTok st) with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__212) -> ((fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ":") then ((((v_Vuna_dCompiler_dParser_dparseSignature st1) blockCol) dtb__212) dtb__211) else ((((v_Vuna_dCompiler_dParser_dparseClause st1) blockCol) dtb__212) dtb__211))) (v_Vuna_dCompiler_dParser_dadvance st))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected an instance method"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected an instance method"))
)))

let rec v_Vuna_dCompiler_dParser_dparseInstanceDeclList = (fun st -> (fun declCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__213, dtb__214) -> (if ((bi_eq_int dtb__214) declCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseInstanceDecl st) declCol)) (fun decl -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseInstanceDeclList st1) declCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (decl, rest)), st2)))))))))) else (if ((bi_gt_int dtb__214) declCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in instance block")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseInstanceBody = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__215, dtb__216) -> (if ((bi_gt_int dtb__216) blockCol) then ((v_Vuna_dCompiler_dParser_dparseInstanceDeclList st) dtb__216) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseInstance = (fun st -> (fun blockCol -> (fun kwPos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "instance")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st1) blockCol) 0)) (fun head -> (fun st2 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseInstanceName st2)) (fun name -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st3) "where")) (fun _u -> (fun st4 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseInstanceBody st4) blockCol)) (fun methods -> (fun st5 -> ((fun isDefault -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (name, isDefault, head, methods, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine kwPos), (v_Vuna_dCompiler_dCommon_dposCol kwPos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st5)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st5)))))), st5))))) (v_Vuna_dCompiler_dParser_dinstanceIsDefault name))))))))))))))))))))

let rec v_Vuna_dCompiler_dParser_dparseCtorList = (fun st -> (fun ctorCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__217, dtb__218) -> (if ((bi_eq_int dtb__218) ctorCol) then ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st)) (fun name -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st1) ":")) (fun _u -> (fun st2 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st2) ctorCol) 0)) (fun ty -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseCtorList st3) ctorCol)) (fun rest -> (fun st4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (name, ty, (v_Vuna_dCompiler_dParser_dcountArrows ty), ((v_Vuna_dCompiler_dParser_dspanOf st) st3))), rest)), st4)))))))))))))))) else (if ((bi_gt_int dtb__218) ctorCol) then (C_Base_dResult_dResult_Base_dResult_dErr ("unexpected indentation in data block")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseCtors = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__219, dtb__220) -> (if ((bi_gt_int dtb__220) blockCol) then ((v_Vuna_dCompiler_dParser_dparseCtorList st) dtb__220) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseData = (fun st -> (fun blockCol -> (fun kwPos -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st) "data")) (fun _u -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dexpectIdent st1)) (fun name -> (fun st2 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseParams st2)) (fun params -> (fun st3 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectSym st3) ":")) (fun _u -> (fun st4 -> ((v_Base_dResult_dstep (((v_Vuna_dCompiler_dParser_dparseExpr st4) blockCol) 0)) (fun ty -> (fun st5 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dexpectKw st5) "where")) (fun _u -> (fun st6 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseCtors st6) blockCol)) (fun ctors -> (fun st7 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseDeriving st7)) (fun derivings -> (fun st8 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (name, params, ty, ctors, derivings, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ((v_Vuna_dCompiler_dParser_dfileOf st), (v_Vuna_dCompiler_dCommon_dposLine kwPos), (v_Vuna_dCompiler_dCommon_dposCol kwPos), (v_Vuna_dCompiler_dCommon_dposLine (v_Vuna_dCompiler_dParser_dlastPos st8)), (v_Vuna_dCompiler_dCommon_dposCol (v_Vuna_dCompiler_dParser_dlastPos st8)))))), st8)))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dParser_dparseDecl = (fun st -> (fun blockCol -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dLexer_dPTok_Vuna_dCompiler_dLexer_dPTok (dtb__221, dtb__222) -> (match dtb__221 with
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTIdent (dtb__223) -> ((fun st1 -> (if ((v_Vuna_dCompiler_dParser_datSym st1) ":") then ((((v_Vuna_dCompiler_dParser_dparseSignature st1) blockCol) dtb__223) dtb__222) else ((((v_Vuna_dCompiler_dParser_dparseClause st1) blockCol) dtb__223) dtb__222))) (v_Vuna_dCompiler_dParser_dadvance st))
  | C_Vuna_dCompiler_dLexer_dTok_Vuna_dCompiler_dLexer_dTKw (dtb__224) -> (if ((bi_eq_str dtb__224) "data") then (((v_Vuna_dCompiler_dParser_dparseData st) blockCol) dtb__222) else (if ((bi_eq_str dtb__224) "record") then (((v_Vuna_dCompiler_dParser_dparseRecord st) blockCol) dtb__222) else (if ((bi_eq_str dtb__224) "trait") then (((v_Vuna_dCompiler_dParser_dparseTrait st) blockCol) dtb__222) else (if ((bi_eq_str dtb__224) "instance") then (((v_Vuna_dCompiler_dParser_dparseInstance st) blockCol) dtb__222) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected a top-level declaration"))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("expected a top-level declaration"))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dParser_dpeekTok st))))

let rec v_Vuna_dCompiler_dParser_dparseDecls = (fun st -> (fun blockCol -> (if (v_Vuna_dCompiler_dParser_disEof st) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, st)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__225, dtb__226) -> (if ((bi_eq_int dtb__226) blockCol) then ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseDecl st) blockCol)) (fun decl -> (fun st1 -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseDecls st1) blockCol)) (fun rest -> (fun st2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (decl, rest)), st2)))))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "expected a declaration at column ") (bi_strFromInt blockCol)))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dParser_dparseSourceFile = (fun st -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseModDecl st)) (fun hdr -> (fun st1 -> ((v_Base_dResult_dstep (v_Vuna_dCompiler_dParser_dparseImports st1)) (fun imports -> (fun st2 -> (if (v_Vuna_dCompiler_dParser_disEof st2) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (hdr, imports, C_Base_dList_dList_Nil)), st2)))) else (match (v_Vuna_dCompiler_dParser_dpeekPos st2) with
  | C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (dtb__227, dtb__228) -> ((v_Base_dResult_dstep ((v_Vuna_dCompiler_dParser_dparseDecls st2) dtb__228)) (fun decls -> (fun st3 -> (if (v_Vuna_dCompiler_dParser_disEof st3) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (hdr, imports, decls)), st3)))) else (C_Base_dResult_dResult_Base_dResult_dErr ("expected end of input"))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dParser_dparseSource = (fun file -> (fun source -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLexer_dlexSource source)) (fun toks -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dparseSourceFile (C_Vuna_dCompiler_dParser_dPState_Vuna_dCompiler_dParser_dPState (file, toks, (C_Vuna_dCompiler_dCommon_dPos_Vuna_dCompiler_dCommon_dPos (1, 0)))))) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dfirstOf p)))))))))
