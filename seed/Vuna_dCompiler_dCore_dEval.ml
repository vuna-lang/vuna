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
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv ((bi_sub mc0) 1)) dtb__1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__2, dtb__3, dtb__4) -> (C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__2, dtb__3, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (mc0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt -> (fun scrut -> (fun env -> (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders alt) with
  | C_Base_dList_dList_Nil -> env
  | _ -> (C_Base_dList_dList_Cons (scrut, env))
))))

let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun c -> (fun th -> (fun el -> (match c with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__7) -> (if dtb__7 then th else el)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el))
))))

let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun n -> (fun a -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__8, dtb__9, dtb__10) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__8, dtb__9, ((v_Base_dList_dappend dtb__10) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__11, dtb__12) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__11, ((v_Base_dList_dappend dtb__12) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel -> (fun env -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__13, dtb__14) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__14) env) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__16) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__16, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__17, C_Base_dList_dList_Nil))))
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
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel -> (fun env -> (fun args -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Nil else (match args with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) env) dtb__42), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel ((bi_sub fuel) 1)) env) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match scrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel ((bi_sub fuel) 1)) dtb__44) dtb__45) alts)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts))
)))))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel -> (fun c -> (fun args -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match alts with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args)), C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) c) then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__48, dtb__49) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) ((v_Base_dList_dappend (v_Base_dList_dreverse args)) dtb__48)) dtb__49)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) "") then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__50, dtb__51) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__46) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args))) dtb__50)) dtb__51)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel ((bi_sub fuel) 1)) c) args) dtb__47)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel -> (fun f -> (fun a -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match f with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__55, dtb__56) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel ((bi_sub fuel) 1)) (C_Base_dList_dList_Cons (a, dtb__55))) dtb__56)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f, a))
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__57) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__57) a)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__58, dtb__59) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__58, ((v_Base_dList_dappend dtb__59) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f, a))
)))))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env -> (fun t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel 128) env) t)))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env -> (fun args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args)))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut -> (fun alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts)))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c -> (fun args -> (fun alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f -> (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a)))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__60, dtb__61) -> ((v_Vuna_dCompiler_dCore_dEval_deval (C_Base_dList_dList_Cons (mc1, dtb__60))) dtb__61)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__62, dtb__63) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__62)) dtb__63)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_disPrimitiveName = (fun g -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str g) "+") then true else ((bi_eq_str g) "-")) then true else ((bi_eq_str g) "*")) then true else ((bi_eq_str g) "/")) then true else ((bi_eq_str g) "==")) then true else ((bi_eq_str g) "/=")) then true else ((bi_eq_str g) "<")) then true else ((bi_eq_str g) "<=")) then true else ((bi_eq_str g) ">")) then true else ((bi_eq_str g) ">=")) then true else ((bi_eq_str g) "++")) then true else ((bi_eq_str g) "&&")) then true else ((bi_eq_str g) "||")) then true else ((bi_eq_str g) "bi_eq_int")) then true else ((bi_eq_str g) "bi_neq_int")) then true else ((bi_eq_str g) "bi_eq_str")) then true else ((bi_eq_str g) "bi_neq_str")) then true else ((bi_eq_str g) "bi_eq_generic")) then true else ((bi_eq_str g) "bi_neq_generic")) then true else ((bi_eq_str g) "strFromInt")) then true else ((bi_eq_str g) "strLength")))

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__64) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__65) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__66) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (match dtb__68 with
  | C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__70 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__67) with
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
  | C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__74 with
  | C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__76 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__73) with
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
  | C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (match dtb__80 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__82 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__79) with
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
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (match dtb__86 with
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__85) with
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
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__92 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__91) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__93)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match dtb__95 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__94) with
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

let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__97) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__98) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__97) dtb__98)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__99) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__100) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if ((bi_eq_str dtb__99) dtb__100) then 0 else (if ((bi_lt_generic dtb__99) dtb__100) then ((bi_sub 0) 1) else 1))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__101) -> (match b with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__102) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__101) dtb__102) then 0 else (if dtb__101 then 1 else ((bi_sub 0) 1)))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__103) dtb__105) with
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
  | C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__111 with
  | C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__108) with
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

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__119, dtb__120) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos ((C_Base_dList_dList_Cons (dtb__117, dtb__119)), dtb__120))) dtb__118)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ("_alt", C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (match dtb__121 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__123) ((bi_add mc1) mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__122) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth -> (fun level -> (if ((bi_lt_int level) depth) then ((bi_sub ((bi_sub depth) level)) 1) else ((bi_sub 0) 1))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__125, dtb__126) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__125, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__126)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel -> (fun depth -> (fun v -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__127) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__127))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__128, dtb__129, dtb__130, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__131), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__132) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__128) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__133, dtb__134, dtb__135) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__133, dtb__134, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__135) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__133) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__136) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel ((bi_sub fuel) 1)) depth) dtb__136)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__137))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__138))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__139, dtb__140) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__139, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel ((bi_sub fuel) 1)) depth) dtb__140)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__141, dtb__142) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__141), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__142), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__143, dtb__144) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__143), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel ((bi_sub fuel) 1)) depth) alt))) dtb__144)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__145) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__145))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__146) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__146))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__147) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__147))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__148, dtb__149, dtb__150) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__148), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__149), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__150)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel -> (fun depth -> (fun alt0 -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Nil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__151, dtb__152, dtb__153) -> ((fun n -> ((fun argVals -> ((fun body -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__151, dtb__152, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__153) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__152) depth) 0))) (v_Base_dList_dlength dtb__152))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel -> (fun depth -> (fun vs -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Nil else (match vs with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) dtb__154), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel ((bi_sub fuel) 1)) depth) dtb__155)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel -> (fun depth -> (fun n -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__156, dtb__157, dtb__158) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__156, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__157)))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__158))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__159, dtb__160) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__159))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel ((bi_sub fuel) 1)) depth) a))) dtb__160))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth -> (fun v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v)))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth -> (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt)))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth -> (fun vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs)))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth -> (fun n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__161) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__161) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then t else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__162))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__163, dtb__164, dtb__165, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__166), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__167)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__168, dtb__169, dtb__170) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__168, dtb__169, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__170)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__171, dtb__172, dtb__173) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__171), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__172), dtb__173))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__174, dtb__175) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__174, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__175)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__176, dtb__177) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__176), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt sols)) dtb__177)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__178, dtb__179, dtb__180) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__178), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__179), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__180)))
  | _ -> t
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__181, dtb__182, dtb__183) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__181, dtb__182, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__183)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun depth -> (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__184) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__184) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__185)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__186, dtb__187, dtb__188, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__189), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__190)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__191, dtb__192, dtb__193) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__191, dtb__192, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__193)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__194, dtb__195, dtb__196) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__194), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__195), dtb__196))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__197, dtb__198) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__197, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__198)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__199, dtb__200) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__199), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt depth) sols)) dtb__200)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__201, dtb__202, dtb__203) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__201), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__202), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__203)))
  | _ -> t
))))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__204, dtb__205, dtb__206) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__204, dtb__205, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__206)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun d -> (fun sols -> (fun t -> (match sols with
  | C_Base_dList_dList_Nil -> t
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo d) sols) t)
))))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth -> (fun v -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__207, dtb__208) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__207) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__209) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__209) dtb__208))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__210, dtb__211) -> ((fun s2 -> (match s2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__212, dtb__213) -> (match dtb__211 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__212) dtb__213) dtb__211))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, dtb__211))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__210))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__214, dtb__215) -> ((fun f2 -> (match f2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__216, dtb__217, dtb__218) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__218) dtb__215))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__219, dtb__220) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__219, ((v_Base_dList_dappend dtb__220) (C_Base_dList_dList_Cons (dtb__215, C_Base_dList_dList_Nil))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__221) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__221) dtb__215))))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f2, dtb__215))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__214))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__222) -> (match dtb__222 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__223, dtb__224) -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__223) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__225) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__225)) dtb__224))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) ((bi_sub fuel) 1)) dtb__223) dtb__224) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__226) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__226)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
))))))
and v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs -> (fun sols -> (fun fuel -> (fun g -> (fun sp -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((bi_eq_str g) "+") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_add a) b)))))) else (if ((bi_eq_str g) "-") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_sub a) b)))))) else (if ((bi_eq_str g) "*") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_mul a) b)))))) else (if ((bi_eq_str g) "/") then (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp) else (if ((bi_eq_str g) "==") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "/=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "<") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "<=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) ">") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) ">=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "++") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (((bi_concat a) b)))))) else (if ((bi_eq_str g) "True") then ((v_Vuna_dCompiler_dCore_dEval_dprimConst sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (true))) else (if ((bi_eq_str g) "False") then ((v_Vuna_dCompiler_dCore_dEval_dprimConst sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (false))) else (if ((bi_eq_str g) "&&") then ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then b else false)))))) else (if ((bi_eq_str g) "||") then ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then true else b)))))) else (if ((bi_eq_str g) "bi_eq_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "bi_neq_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "bi_eq_str") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))) else (if ((bi_eq_str g) "bi_neq_str") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))) else (if ((bi_eq_str g) "bi_eq_generic") then (((((v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim defs) sols) ((bi_sub fuel) 1)) sp) false) else (if ((bi_eq_str g) "bi_neq_generic") then (((((v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim defs) sols) ((bi_sub fuel) 1)) sp) true) else (if ((bi_eq_str g) "strFromInt") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((bi_strFromInt n))))) else (if ((bi_eq_str g) "strLength") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((bi_strLength s))))) else (if ((bi_eq_str g) "bi_lt_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "bi_le_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) "bi_gt_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) "bi_ge_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "bi_lt_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_lt_int o) 0))) else (if ((bi_eq_str g) "bi_le_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_le_int o) 0))) else (if ((bi_eq_str g) "bi_gt_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_gt_int o) 0))) else (if ((bi_eq_str g) "bi_ge_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_ge_int o) 0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))))))))))))))))))))))))))))
and v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim = (fun defs -> (fun sols -> (fun fuel -> (fun sp -> (fun neg -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match sp with
  | C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (match dtb__228 with
  | C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match dtb__230 with
  | C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (match dtb__232 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if neg then (v_Vuna_dCompiler_dCore_dTerm_dnotBool (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__229) dtb__231)) else (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__229) dtb__231))))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))))
and v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then false else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) a) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__233) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__234) -> ((bi_eq_int dtb__233) dtb__234)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__235) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__236) -> ((v_Vuna_dCompiler_dCore_dEval_dstrEq dtb__235) dtb__236)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__237) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__238) -> (if dtb__237 then dtb__238 else (v_Vuna_dCompiler_dCore_dTerm_dnotBool dtb__238))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__239) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__240) -> ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__239)) (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__240))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__241, dtb__242) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__243, dtb__244) -> (if ((bi_eq_str dtb__241) dtb__243) then (((((v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__242) dtb__244) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__245, dtb__246) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__247, dtb__248) -> (if (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__245) dtb__247) then (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__246) dtb__248) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__249, dtb__250) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__251, dtb__252) -> ((bi_eq_int dtb__249) dtb__251)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__253) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__254) -> ((bi_eq_str (v_Vuna_dCompiler_dCore_dEval_dshowValue (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__253)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__254))))
  | _ -> false
)
  | _ -> false
)))))))
and v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun xs -> (fun ys -> (if ((bi_le_int fuel) 0) then false else (match xs with
  | C_Base_dList_dList_Nil -> (match ys with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | C_Base_dList_dList_Cons (dtb__255, dtb__256) -> (match ys with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__257, dtb__258) -> (if (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) fuel) dtb__255) dtb__257) then (((((v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep defs) sols) fuel) dtb__256) dtb__258) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (if ((bi_le_int fuel) 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__259) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__259)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__260, dtb__261, dtb__262) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__260) dtb__261) dtb__262)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__263, dtb__264) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel ((bi_sub fuel) 1)) defs) sols) fuel) dtb__263) dtb__264)
  | dtb__265 -> dtb__265
))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) scrut) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__266, dtb__267) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__266) dtb__267) alts))
  | dtb__268 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__268, alts))
)))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun n -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__269, dtb__270, dtb__271) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__269, dtb__270, ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) fuel)) dtb__271)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__272, dtb__273) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__272) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__274) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__274)) sp2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) ((bi_sub fuel) 1)) dtb__272) sp2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__275) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) dtb__275)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__272, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) fuel)) dtb__273))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel -> (fun defs -> (fun sols -> (fun fuel -> (fun c -> (fun th -> (fun el -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) c) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__276) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) (if dtb__276 then th else el))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__277) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__277)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) el)))
  | dtb__278 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__278, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel ((bi_sub fuel) 1)) defs) sols) ((bi_sub fuel) 1)) el)))
))))))))))

let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6)))))))
