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
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv ((bi_sub mc0) 1)) dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__2, dtb__3, dtb__4) -> (C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__2, dtb__3, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (mc0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt -> (fun scrut -> (fun env -> (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders alt) with
  | C_Base_dList_dList_Base_dList_dNil -> env
  | _ -> (C_Base_dList_dList_Base_dList_dCons (scrut, env))
))))

let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__7) -> (if dtb__7 then mc1 else mc2)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (mc0, mc1, mc2))
))))

let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, dtb__9) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, ((v_Base_dList_dappend dtb__9) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__10, dtb__11, dtb__12) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__10, dtb__11, ((v_Base_dList_dappend dtb__12) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel -> (fun env -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__13, dtb__14) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__14) env) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__16) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__16, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__17, C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__18) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__18))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__19, dtb__20, dtb__21, (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__22), (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__23))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__24, dtb__25, dtb__26) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__24, dtb__25, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__26))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__27, dtb__28, dtb__29) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__27)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__28))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__30, dtb__31) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__30, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel ((bi_sub fuel) 1)) env) dtb__31)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__32, dtb__33) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__32)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__33))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__34) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__35) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__35))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__36) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__36))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__37, dtb__38, dtb__39) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__37)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__38)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__39))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel -> (fun env -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__42), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel ((bi_sub fuel) 1)) env) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)) args)))))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel ((bi_sub fuel) 1)) dtb__44) dtb__45) alts)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts))
)))))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel -> (fun c -> (fun args -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args)), C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) c) then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__48, dtb__49) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) ((v_Base_dList_dappend (v_Base_dList_dreverse args)) dtb__48)) dtb__49)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) "") then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__50, dtb__51) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__46) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args))) dtb__50)) dtb__51)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel ((bi_sub fuel) 1)) c) args) dtb__47)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel -> (fun f -> (fun a -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__52, dtb__53) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__52, ((v_Base_dList_dappend dtb__53) (C_Base_dList_dList_Base_dList_dCons (a, C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__54) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__54) a)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__55, dtb__56, dtb__57) -> (match dtb__57 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__58, dtb__59) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) (C_Base_dList_dList_Base_dList_dCons (a, dtb__58))) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f, a))
)) f)))))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env -> (fun t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel 128) env) t)))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env -> (fun args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args)))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut -> (fun alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts)))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c -> (fun args -> (fun alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f -> (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a)))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__60, dtb__61) -> ((v_Vuna_dCompiler_dCore_dEval_deval (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__60))) dtb__61)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__62)) dtb__63)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__64) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__65) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__66) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__68 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__69, dtb__70) -> (match dtb__70 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__67) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__69) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__72) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__71) dtb__72)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2Div = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__74 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (match dtb__76 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__73) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__75) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (if ((bi_eq_int dtb__78) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_div dtb__77) dtb__78))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dboolPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__80 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (match dtb__82 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__79) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__81) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__83) dtb__84)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dprimConst = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__86 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__85) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__87) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__89) dtb__90)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dintPrim1 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (match dtb__92 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__91) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__93)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__95 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__94) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__96)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrEq = (fun a -> (fun b -> ((bi_eq_str a) b)))

let v_Vuna_dCompiler_dCore_dEval_dcmpInt = (fun a -> (fun b -> (if ((bi_eq_int a) b) then 0 else (if ((bi_lt_int a) b) then ((bi_sub 0) 1) else 1))))

let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__97) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__98) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) dtb__97) dtb__98) then 0 else (if dtb__97 then 1 else ((bi_sub 0) 1)))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__99) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__100) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if ((bi_eq_str dtb__99) dtb__100) then 0 else (if ((bi_lt_generic dtb__99) dtb__100) then ((bi_sub 0) 1) else 1))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__101) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__102) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__101) dtb__102)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__103) dtb__105) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((mc1 dtb__107)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim3 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (match dtb__109 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (match dtb__111 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__108) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__110) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__115) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__112) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((mc1 dtb__114) dtb__115) dtb__116)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__118) ((bi_sub ((bi_add ((bi_mul mc1) 33)) dtb__117)) ((bi_mul ((bi_div ((bi_add ((bi_mul mc1) 33)) dtb__117)) 1024)) 1024)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (if ((bi_le_int mc1) 0) then dtb__119 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__120) ((bi_sub mc1) 1)))
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_sub 0) 1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s -> (fun i -> (if (if ((bi_lt_int i) 0) then true else ((bi_ge_int i) (bi_strLength s))) then ((bi_sub 0) 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (dtp_unpack s)) i))))

let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (match dtb__124 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__121) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__123) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__126) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__125) dtb__126)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs -> (fun sols -> (fun fuel -> (fun g -> (fun sp -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic g) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__127) -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicOp dtb__127) with
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAdd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_add a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpSub -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_sub a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpMul -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_mul a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpDiv -> (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_eq_int a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((bi_eq_int a) b)))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_lt_int a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_le_int a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_gt_int a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_ge_int a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_lt_int o) 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_le_int o) 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_gt_int o) 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_ge_int o) 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpConcat -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (((bi_concat a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAnd -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then b else false))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpOr -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then true else b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((bi_strFromInt n)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrLength -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((bi_strLength s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrHash -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((v_Vuna_dCompiler_dCore_dEval_dstrHashOf s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrAt -> (v_Vuna_dCompiler_dCore_dEval_datPrim sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrShow -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((v_Vuna_dCompiler_dCore_dTerm_dshowCoreString s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrUnpack -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrPack -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrConcatMany -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrSubstTemplate -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNone -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__128, dtb__129) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__128) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__130) dtb__129))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__131, dtb__132) -> ((fun s2 -> (match s2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__133, dtb__134) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__133) dtb__134) dtb__132))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, dtb__132))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__131))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__135, dtb__136) -> ((fun f2 -> (match f2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__137, dtb__138, dtb__139) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__139) dtb__136))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__140, dtb__141) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__140, ((v_Base_dList_dappend dtb__141) (C_Base_dList_dList_Base_dList_dCons (dtb__136, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__142) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__142) dtb__136))))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f2, dtb__136))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__135))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__143) -> (match dtb__143 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__144, dtb__145) -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__144) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__144) (v_Vuna_dCompiler_dCore_dTerm_dsolsDefVals sols)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__147) dtb__145))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__146)) dtb__145))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) ((bi_sub fuel) 1)) dtb__144) dtb__145) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__148)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
))))))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (if ((bi_le_int fuel) 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__149) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__149)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__150, dtb__151, dtb__152) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__150) dtb__151) dtb__152)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__153, dtb__154) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__153) dtb__154)
  | dtb__155 -> dtb__155
))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) scrut) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__156, dtb__157) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__156) dtb__157) alts))
  | dtb__158 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__158, alts))
)))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun n -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__159, dtb__160, dtb__161) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__159, dtb__160, ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) fuel)) dtb__161)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__162, dtb__163) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__162) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__164)) sp2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) ((bi_sub fuel) 1)) dtb__162) sp2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) dtb__165)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__162, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) fuel)) dtb__163))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun c -> (fun th -> (fun el -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) c) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__166) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) (if dtb__166 then th else el))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__167) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__167)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) el)))
  | dtb__168 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__168, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) el)))
))))))))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__169, dtb__170) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos ((C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__169)), dtb__170))) dtb__172)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ("_alt", C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__175) ((bi_add mc1) mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__174) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth -> (fun level -> (if ((bi_lt_int level) depth) then ((bi_sub ((bi_sub depth) level)) 1) else ((bi_sub 0) 1))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__177, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__178)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel -> (fun depth -> (fun v -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__179) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__179))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__180, dtb__181, dtb__182, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__183), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__184) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__180) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__185, dtb__186, dtb__187) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__185, dtb__186, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__187) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__185) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__188) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel ((bi_sub fuel) 1)) depth) dtb__188)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__189, dtb__190) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__189))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__190))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__191, dtb__192) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__191, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel ((bi_sub fuel) 1)) depth) dtb__192)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__193, dtb__194) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__193), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__194), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__195, dtb__196) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__195), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel ((bi_sub fuel) 1)) depth) alt))) dtb__196)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__197) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__197))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__198) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__198))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__199) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__199))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__200, dtb__201, dtb__202) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__200), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__201), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__202)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel -> (fun depth -> (fun alt0 -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__203, dtb__204, dtb__205) -> ((fun n -> ((fun argVals -> ((fun body -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__203, dtb__204, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__205) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__204) depth) 0))) (v_Base_dList_dlength dtb__204))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel -> (fun depth -> (fun vs -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (match vs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__206), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel ((bi_sub fuel) 1)) depth) dtb__207)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel -> (fun depth -> (fun n -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__208, dtb__209, dtb__210) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__208, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__209)))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__210))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__211, dtb__212) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__211))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__212))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth -> (fun v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v)))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth -> (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt)))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth -> (fun vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs)))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth -> (fun n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__213, dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__213), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__214), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__215)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__216, dtb__217) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__216), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__217)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__218, dtb__219) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__218, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__219)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__220, dtb__221, dtb__222) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__220), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__221), dtb__222))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__223, dtb__224, dtb__225) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__223, dtb__224, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__225)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__226, dtb__227, dtb__228, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__229), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__230)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__231) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__231) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__232))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__233, dtb__234, dtb__235) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__233, dtb__234, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__235)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__236, dtb__237, dtb__238) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__236), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__237), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__238)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__239, dtb__240) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__239), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__240)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__241, dtb__242) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__241, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__242)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__243, dtb__244, dtb__245) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__243), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__244), dtb__245))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__246, dtb__247, dtb__248) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__246, dtb__247, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__248)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__249, dtb__250, dtb__251, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__252), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__253)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__254) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__254) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__255) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__255)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__256, dtb__257, dtb__258) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__256, dtb__257, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__258)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) mc2)
))))

let v_Vuna_dCompiler_dCore_dEval_disNilList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__259) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__259)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__259))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__260) -> (match dtb__260 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__261, dtb__262) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__262) then dtb__261 else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__263, dtb__264, dtb__265) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__265) then dtb__263 else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__266, dtb__267) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__267) then ((bi_concat "?") (bi_strFromInt dtb__266)) else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
)))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6)))))))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__268, dtb__269, dtb__270) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__268), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__269), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__270)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__271, dtb__272) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__271), dtb__272))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__273, dtb__274) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__273, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__274)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__275, dtb__276, dtb__277) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__275), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__276), dtb__277))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__278, dtb__279, dtb__280) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__278, dtb__279, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) ((bi_add mc1) 1)) dtb__280)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__281, dtb__282, dtb__283, dtb__284, dtb__285) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__281, dtb__282, dtb__283, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__284), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) ((bi_add mc1) 1)) dtb__285)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__286) -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt dtb__286)) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__287) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__287)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__288, dtb__289, dtb__290) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__288), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__289), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__290)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__291, dtb__292) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__291), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl mc0)) dtb__292)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__293, dtb__294) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__293, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__294)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__295, dtb__296, dtb__297) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__295), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__296), dtb__297))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__298, dtb__299, dtb__300) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__298, dtb__299, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__300)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__301, dtb__302, dtb__303, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__304), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__305)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__306) -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt dtb__306)) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__307) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__307))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__308, dtb__309, dtb__310) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__308, dtb__309, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__310)))
  | _ -> failwith "DT: impossible branch"
)))
