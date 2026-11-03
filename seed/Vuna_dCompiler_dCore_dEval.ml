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

let rec v_Vuna_dCompiler_dCore_dEval_deval = (fun env -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__13, dtb__14) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__14) env) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__16) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__16, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__17, C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__18) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__18))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__19, dtb__20, dtb__21, ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__22), (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__23))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__24, dtb__25, dtb__26) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__24, dtb__25, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__26))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__27, dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyValue ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__27)) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__28))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__30, dtb__31) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__30, ((v_Vuna_dCompiler_dCore_dEval_devalArgTerms env) dtb__31)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__32, dtb__33) -> ((v_Vuna_dCompiler_dCore_dEval_devalCase ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__32)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__33))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__34) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__35) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__35))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__36) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__36))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__37, dtb__38, dtb__39) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__37)) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__38)) ((v_Vuna_dCompiler_dCore_dEval_deval env) dtb__39))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_deval mc0) dtb__42), ((v_Vuna_dCompiler_dCore_dEval_devalArgTerms mc0) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut -> (fun alts -> (match scrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__44, dtb__45) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__44) dtb__45) alts)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) mc0) then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__48, dtb__49) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dappend (v_Base_dList_dreverse mc1)) dtb__48)) dtb__49)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46)) "") then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dCore_dEval_deval (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__46) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (mc0, mc1))) dtb__50)) dtb__51)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt mc0) mc1) dtb__47)))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (mc0, mc1)), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f -> (fun a -> (match f with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__52, dtb__53, dtb__54) -> (match dtb__54 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__55, dtb__56) -> ((v_Vuna_dCompiler_dCore_dEval_deval (C_Base_dList_dList_Cons (a, dtb__55))) dtb__56)
  | _ -> f
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__57) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__57) a)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__58, dtb__59) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__58, ((v_Base_dList_dappend dtb__59) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | _ -> f
)))

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

let rec v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__127) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__127))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__128, dtb__129, dtb__130, ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__131), ((v_Vuna_dCompiler_dCore_dEval_dquote ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__132) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__128) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__133, dtb__134, dtb__135) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__133, dtb__134, ((v_Vuna_dCompiler_dCore_dEval_dquote ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__135) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__133) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__136) -> ((v_Vuna_dCompiler_dCore_dEval_dquoteNeutral depth) dtb__136)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__137))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dquote depth)) dtb__138))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__139, dtb__140) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__139, ((v_Vuna_dCompiler_dCore_dEval_dquoteArgValues depth) dtb__140)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__141, dtb__142) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__141), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt depth)) dtb__142)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__143) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__143))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__144) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__144))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__145) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__145))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__146, dtb__147, dtb__148) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__146), ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__147), ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__148)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__149, dtb__150, dtb__151) -> ((fun n -> ((fun argVals -> ((fun body -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__149, dtb__150, body))) ((v_Vuna_dCompiler_dCore_dEval_dquote ((bi_add mc0) n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__151) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__150) mc0) 0))) (v_Base_dList_dlength dtb__150))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__152), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), ((v_Vuna_dCompiler_dCore_dEval_dquoteArgValues mc0) dtb__153)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth -> (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__154, dtb__155, dtb__156) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__154, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__155)))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dquote depth)) dtb__156))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__157, dtb__158) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__157))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dquote depth)) dtb__158))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__159) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__159) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then t else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__160))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__161, dtb__162, dtb__163, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__164), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__165)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__166, dtb__167, dtb__168) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__166, dtb__167, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__168)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__169, dtb__170, dtb__171) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__169), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__170), dtb__171))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__172, dtb__173) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__172, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__173)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__174, dtb__175) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__174), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt sols)) dtb__175)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__176, dtb__177, dtb__178) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__176), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__177), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas sols) dtb__178)))
  | _ -> t
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__179, dtb__180, dtb__181) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__179, dtb__180, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__181)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun depth -> (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__182) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__182) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__183)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__184, dtb__185, dtb__186, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__187), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__188)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__189, dtb__190, dtb__191) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__189, dtb__190, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__191)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__192, dtb__193, dtb__194) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__192), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__193), dtb__194))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__195, dtb__196) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__195, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__196)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__197, dtb__198) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__197), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt depth) sols)) dtb__198)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__199, dtb__200, dtb__201) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__199), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__200), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo depth) sols) dtb__201)))
  | _ -> t
))))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__202, dtb__203, dtb__204) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__202, dtb__203, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__204)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun d -> (fun sols -> (fun t -> (match sols with
  | C_Base_dList_dList_Nil -> t
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo d) sols) t)
))))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth -> (fun v -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__205, dtb__206) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__205) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__207) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__207) dtb__206))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__208, dtb__209) -> ((fun s2 -> (match s2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__210, dtb__211) -> (match dtb__209 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__210) dtb__211) dtb__209))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, dtb__209))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__208))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__212) -> (match dtb__212 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__213, dtb__214) -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__213) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__215) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__215)) dtb__214))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) dtb__213) dtb__214) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) ((bi_sub fuel) 1)) dtb__216)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
))))))
and v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs -> (fun sols -> (fun g -> (fun sp -> (if ((bi_eq_str g) "+") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_add a) b)))))) else (if ((bi_eq_str g) "-") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_sub a) b)))))) else (if ((bi_eq_str g) "*") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((bi_mul a) b)))))) else (if ((bi_eq_str g) "/") then (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp) else (if ((bi_eq_str g) "==") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "/=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "<") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "<=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) ">") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) ">=") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "++") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (((bi_concat a) b)))))) else (if ((bi_eq_str g) "True") then ((v_Vuna_dCompiler_dCore_dEval_dprimConst sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (true))) else (if ((bi_eq_str g) "False") then ((v_Vuna_dCompiler_dCore_dEval_dprimConst sp) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (false))) else (if ((bi_eq_str g) "&&") then ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then b else false)))))) else (if ((bi_eq_str g) "||") then ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then true else b)))))) else (if ((bi_eq_str g) "bi_eq_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "bi_neq_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "bi_eq_str") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))) else (if ((bi_eq_str g) "bi_neq_str") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))) else (if ((bi_eq_str g) "bi_eq_generic") then ((((v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim defs) sols) sp) false) else (if ((bi_eq_str g) "bi_neq_generic") then ((((v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim defs) sols) sp) true) else (if ((bi_eq_str g) "strFromInt") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((bi_strFromInt n))))) else (if ((bi_eq_str g) "strLength") then ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((bi_strLength s))))) else (if ((bi_eq_str g) "bi_lt_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "bi_le_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) "bi_gt_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) "bi_ge_int") then ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "bi_lt_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_lt_int o) 0))) else (if ((bi_eq_str g) "bi_le_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_le_int o) 0))) else (if ((bi_eq_str g) "bi_gt_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_gt_int o) 0))) else (if ((bi_eq_str g) "bi_ge_generic") then ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> ((bi_ge_int o) 0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))))))))))))))))))))))))))
and v_Vuna_dCompiler_dCore_dEval_dgenericEqPrim = (fun defs -> (fun sols -> (fun sp -> (fun neg -> (match sp with
  | C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__218 with
  | C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (match dtb__220 with
  | C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match dtb__222 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if neg then (v_Vuna_dCompiler_dCore_dTerm_dnotBool (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) dtb__219) dtb__221)) else (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) dtb__219) dtb__221))))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))
and v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then false else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) a) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__223) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__224) -> ((bi_eq_int dtb__223) dtb__224)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__225) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__226) -> ((v_Vuna_dCompiler_dCore_dEval_dstrEq dtb__225) dtb__226)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__227) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__228) -> (if dtb__227 then dtb__228 else (v_Vuna_dCompiler_dCore_dTerm_dnotBool dtb__228))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__229) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__230) -> ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__229)) (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__230))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__231, dtb__232) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__233, dtb__234) -> (if ((bi_eq_str dtb__231) dtb__233) then (((((v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__232) dtb__234) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__235, dtb__236) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__237, dtb__238) -> ((bi_eq_int dtb__235) dtb__237)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__239) -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__240) -> ((bi_eq_str (v_Vuna_dCompiler_dCore_dEval_dshowValue (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__239)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__240))))
  | _ -> false
)
  | _ -> false
)))))))
and v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun xs -> (fun ys -> (match xs with
  | C_Base_dList_dList_Nil -> (match ys with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (match ys with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (if (((((v_Vuna_dCompiler_dCore_dEval_dvalueEqDeep defs) sols) fuel) dtb__241) dtb__243) then (((((v_Vuna_dCompiler_dCore_dEval_dvalueListEqDeep defs) sols) fuel) dtb__242) dtb__244) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__245) -> ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral defs) sols) fuel) dtb__245)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__246, dtb__247, dtb__248) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIf defs) sols) fuel) dtb__246) dtb__247) dtb__248)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__249, dtb__250) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCase defs) sols) fuel) dtb__249) dtb__250)
  | dtb__251 -> dtb__251
))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun defs -> (fun sols -> (fun fuel -> (fun scrut -> (fun alts -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) scrut) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__252, dtb__253) -> ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__252) dtb__253) alts))
  | dtb__254 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__254, alts))
))))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun defs -> (fun sols -> (fun fuel -> (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__255, dtb__256, dtb__257) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__255, dtb__256, ((v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) fuel)) dtb__257)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__258, dtb__259) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__258) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__260) -> ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__260)) sp2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) dtb__258) sp2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261) -> ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) dtb__261)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__258, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) fuel)) dtb__259))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun defs -> (fun sols -> (fun fuel -> (fun c -> (fun th -> (fun el -> (match ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) c) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__262) -> ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) (if dtb__262 then th else el))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__263) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__263)), ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) th), ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) el)))
  | dtb__264 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__264, ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) th), ((((v_Vuna_dCompiler_dCore_dEval_dnormalize defs) sols) ((bi_sub fuel) 1)) el)))
)))))))
