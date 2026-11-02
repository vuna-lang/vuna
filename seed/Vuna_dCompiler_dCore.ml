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
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
type t_Vuna_dCompiler_dCore_dRig = C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1 | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRigOmega
and t_Vuna_dCompiler_dCore_dLevel = C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel of (int)
and t_Vuna_dCompiler_dCore_dTerm = C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar of (string) * (int) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType of (t_Vuna_dCompiler_dCore_dLevel) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dTerm) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dRig) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dCaseAlt t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt of (int) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr of (string) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf of (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and t_Vuna_dCompiler_dCore_dCaseAlt = C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm)
and t_Vuna_dCompiler_dCore_dClosure = C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos of (t_Vuna_dCompiler_dCore_dValue t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm)
and t_Vuna_dCompiler_dCore_dNeutral = C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal of (string) * (t_Vuna_dCompiler_dCore_dValue t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dValue = C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType of (t_Vuna_dCompiler_dCore_dLevel) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dClosure) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam of (string) * (t_Vuna_dCompiler_dCore_dRig) * (t_Vuna_dCompiler_dCore_dClosure) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral of (t_Vuna_dCompiler_dCore_dNeutral) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta of (int) * (t_Vuna_dCompiler_dCore_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon of (string) * (t_Vuna_dCompiler_dCore_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase of (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dVCaseAlt t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt of (int) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr of (string) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool of (bool) | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf of (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue) * (t_Vuna_dCompiler_dCore_dValue)
and t_Vuna_dCompiler_dCore_dVCaseAlt = C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dClosure)

let v_Vuna_dCompiler_dCore_drigIsErased = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 -> true
  | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1 -> false
  | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRigOmega -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_drigIsLinear = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1 -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_drigIsOmega = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRigOmega -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_drigOfBinder = (fun implicit -> (fun isTypeDom -> (if implicit then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else (if isTypeDom then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))))

let v_Vuna_dCompiler_dCore_dlevelZero = fun () -> (C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (0))

let v_Vuna_dCompiler_dCore_dlevelSucc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__0) -> (C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (((bi_add dtb__0) 1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dlevelMax = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__1) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__2) -> (C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel ((if ((bi_ge_int dtb__1) dtb__2) then dtb__1 else dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dlevelToInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dlevelOfInt = (fun n -> (C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (n)))

let v_Vuna_dCompiler_dCore_dlevelEq = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__4) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__5) -> ((bi_eq_int dtb__4) dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dlevelLt = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__6) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dLevel_Vuna_dCompiler_dCore_dMkLevel (dtb__7) -> ((bi_lt_int dtb__6) dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dcaseAltName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__8, dtb__9, dtb__10) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__11, dtb__12, dtb__13) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dcaseAltBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__14, dtb__15, dtb__16) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dvCaseAltName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt (dtb__17, dtb__18, dtb__19) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dvCaseAltBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt (dtb__20, dtb__21, dtb__22) -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dvCaseAltClosure = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt (dtb__23, dtb__24, dtb__25) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_ddefaultFuel = fun () -> 512

let rec v_Vuna_dCompiler_dCore_dlookupEnv = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if ((bi_le_int mc0) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__26)) else ((v_Vuna_dCompiler_dCore_dlookupEnv ((bi_sub mc0) 1)) dtb__27))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_devalAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__28, dtb__29, dtb__30) -> (C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt (dtb__28, dtb__29, (C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (mc0, dtb__30))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_devalAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_devalAlt mc0) dtb__31), ((v_Vuna_dCompiler_dCore_devalAlts mc0) dtb__32)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dcatchAllEnv = (fun alt -> (fun scrut -> (fun env -> (match (v_Vuna_dCompiler_dCore_dvCaseAltBinders alt) with
  | C_Base_dList_dList_Nil -> env
  | _ -> (C_Base_dList_dList_Cons (scrut, env))
))))

let v_Vuna_dCompiler_dCore_devalIf = (fun c -> (fun th -> (fun el -> (match c with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__33) -> (if dtb__33 then th else el)
  | _ -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (c, th, el))
))))

let v_Vuna_dCompiler_dCore_dspineAppend = (fun n -> (fun a -> (match n with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__34, dtb__35, dtb__36) -> (C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__34, dtb__35, ((v_Base_dList_dappend dtb__36) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__37, dtb__38) -> (C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__37, ((v_Base_dList_dappend dtb__38) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_deval = (fun env -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__39, dtb__40) -> (match ((v_Vuna_dCompiler_dCore_dlookupEnv dtb__40) env) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> dtb__41
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__39, dtb__40, C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__42) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__42, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__43) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__43, C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__44) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__44))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__45, dtb__46, dtb__47, ((v_Vuna_dCompiler_dCore_deval env) dtb__48), (C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (env, dtb__49))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__50, dtb__51, dtb__52) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__50, dtb__51, (C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (env, dtb__52))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__53, dtb__54, dtb__55) -> ((v_Vuna_dCompiler_dCore_dapplyValue ((v_Vuna_dCompiler_dCore_deval env) dtb__53)) ((v_Vuna_dCompiler_dCore_deval env) dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__56, dtb__57) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__56, ((v_Vuna_dCompiler_dCore_devalArgTerms env) dtb__57)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__58, dtb__59) -> ((v_Vuna_dCompiler_dCore_devalCase ((v_Vuna_dCompiler_dCore_deval env) dtb__58)) ((v_Vuna_dCompiler_dCore_devalAlts env) dtb__59))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__60) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__60))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__61) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__61))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__62) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__62))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__63, dtb__64, dtb__65) -> (((v_Vuna_dCompiler_dCore_devalIf ((v_Vuna_dCompiler_dCore_deval env) dtb__63)) ((v_Vuna_dCompiler_dCore_deval env) dtb__64)) ((v_Vuna_dCompiler_dCore_deval env) dtb__65))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_devalArgTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_deval mc0) dtb__68), ((v_Vuna_dCompiler_dCore_devalArgTerms mc0) dtb__67)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_devalCase = (fun scrut -> (fun alts -> (match scrut with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__70, dtb__71) -> (((v_Vuna_dCompiler_dCore_dapplyCaseAlt dtb__70) dtb__71) alts)
  | _ -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dapplyCaseAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__72)) mc0) then (match (v_Vuna_dCompiler_dCore_dvCaseAltClosure dtb__72) with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__74, dtb__75) -> ((v_Vuna_dCompiler_dCore_deval ((v_Base_dList_dappend (v_Base_dList_dreverse mc1)) dtb__74)) dtb__75)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__72)) "") then (match (v_Vuna_dCompiler_dCore_dvCaseAltClosure dtb__72) with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__76, dtb__77) -> ((v_Vuna_dCompiler_dCore_deval (((v_Vuna_dCompiler_dCore_dcatchAllEnv dtb__72) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (mc0, mc1))) dtb__76)) dtb__77)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCore_dapplyCaseAlt mc0) mc1) dtb__73)))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (mc0, mc1)), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dapplyValue = (fun f -> (fun a -> (match f with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__78, dtb__79, dtb__80) -> (match dtb__80 with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__81, dtb__82) -> ((v_Vuna_dCompiler_dCore_deval (C_Base_dList_dList_Cons (a, dtb__81))) dtb__82)
  | _ -> f
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__83) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (((v_Vuna_dCompiler_dCore_dspineAppend dtb__83) a)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__84, dtb__85) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__84, ((v_Base_dList_dappend dtb__85) (C_Base_dList_dList_Cons (a, C_Base_dList_dList_Nil)))))
  | _ -> f
)))

let v_Vuna_dCompiler_dCore_dapplyClosure = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__86, dtb__87) -> ((v_Vuna_dCompiler_dCore_deval (C_Base_dList_dList_Cons (mc1, dtb__86))) dtb__87)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dapplySpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__88, dtb__89) -> ((v_Vuna_dCompiler_dCore_dapplySpine ((v_Vuna_dCompiler_dCore_dapplyValue mc0) dtb__88)) dtb__89)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dmetaLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if ((bi_eq_int mc0) dtb__92) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93)) else ((v_Vuna_dCompiler_dCore_dmetaLookup mc0) dtb__91))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_ddefLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> (if ((bi_eq_str mc0) dtb__96) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97)) else ((v_Vuna_dCompiler_dCore_ddefLookup mc0) dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_disPrimitiveName = (fun g -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str g) "+") then true else ((bi_eq_str g) "-")) then true else ((bi_eq_str g) "*")) then true else ((bi_eq_str g) "/")) then true else ((bi_eq_str g) "==")) then true else ((bi_eq_str g) "/=")) then true else ((bi_eq_str g) "<")) then true else ((bi_eq_str g) "<=")) then true else ((bi_eq_str g) ">")) then true else ((bi_eq_str g) ">=")) then true else ((bi_eq_str g) "++")) then true else ((bi_eq_str g) "&&")) then true else ((bi_eq_str g) "||")) then true else ((bi_eq_str g) "bi_eq_int")) then true else ((bi_eq_str g) "bi_neq_int")) then true else ((bi_eq_str g) "bi_eq_str")) then true else ((bi_eq_str g) "bi_neq_str")) then true else ((bi_eq_str g) "bi_eq_generic")) then true else ((bi_eq_str g) "bi_neq_generic")) then true else ((bi_eq_str g) "strFromInt")) then true else ((bi_eq_str g) "strLength")))

let v_Vuna_dCompiler_dCore_dasInt = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__98) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dasStr = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__99) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dasBool = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__100) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dintPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__102 with
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasInt dtb__101) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> (match (v_Vuna_dCompiler_dCore_dasInt dtb__103) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__106) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__105) dtb__106)))
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

let v_Vuna_dCompiler_dCore_dintPrim2Div = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__108 with
  | C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasInt dtb__107) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__111) -> (match (v_Vuna_dCompiler_dCore_dasInt dtb__109) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> (if ((bi_eq_int dtb__112) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (((bi_div dtb__111) dtb__112))))))
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

let v_Vuna_dCompiler_dCore_dboolPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__116 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasBool dtb__113) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (match (v_Vuna_dCompiler_dCore_dasBool dtb__115) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__118) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__117) dtb__118)))
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

let v_Vuna_dCompiler_dCore_dprimConst = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dstrPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (match dtb__120 with
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__119) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__121) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__123) dtb__124)))
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

let v_Vuna_dCompiler_dCore_dintPrim1 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__126 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasInt dtb__125) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__127) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__127)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dstrPrim1 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__129 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__128) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__130)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dstrEq = (fun a -> (fun b -> ((bi_eq_str a) b)))

let v_Vuna_dCompiler_dCore_dcmpInt = (fun a -> (fun b -> (if ((bi_eq_int a) b) then 0 else (if ((bi_lt_int a) b) then ((bi_sub 0) 1) else 1))))

let v_Vuna_dCompiler_dCore_dgenericCmp = (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__131) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__132) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dcmpInt dtb__131) dtb__132)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__133) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__134) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if ((bi_eq_str dtb__133) dtb__134) then 0 else (if ((bi_lt_generic dtb__133) dtb__134) then ((bi_sub 0) 1) else 1))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__135) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__136) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__135) dtb__136) then 0 else (if dtb__135 then 1 else ((bi_sub 0) 1)))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dgenericPrim2 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__138 with
  | C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dgenericCmp dtb__137) dtb__139) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((mc1 dtb__141)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dCore_dstrPrim3 = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__143 with
  | C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match dtb__145 with
  | C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__147 with
  | C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__142) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__144) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (match (v_Vuna_dCompiler_dCore_dasStr dtb__146) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((mc1 dtb__148) dtb__149) dtb__150)))
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

let v_Vuna_dCompiler_dCore_dnotBool = (fun b -> (if b then false else true))

let rec v_Vuna_dCompiler_dCore_dapplyClosureBinder = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dCore_dapplyClosureBinder (C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos ((C_Base_dList_dList_Cons (dtb__151, dtb__153)), dtb__154))) dtb__152)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon ("_alt", C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dfreshVar = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (name, level, C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dCore_dargValsAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__157, dtb__158) -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dfreshVar dtb__157) ((bi_add mc1) mc2)), (((v_Vuna_dCompiler_dCore_dargValsAt dtb__156) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dvarIndex = (fun depth -> (fun level -> (if ((bi_lt_int level) depth) then ((bi_sub ((bi_sub depth) level)) 1) else ((bi_sub 0) 1))))

let rec v_Vuna_dCompiler_dCore_dapplyTermSpine = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__159, dtb__160) -> ((v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (mc0, dtb__159, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))) dtb__160)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dquote = (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__161) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__161))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__162, dtb__163, dtb__164, ((v_Vuna_dCompiler_dCore_dquote depth) dtb__165), ((v_Vuna_dCompiler_dCore_dquote ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__166) ((v_Vuna_dCompiler_dCore_dfreshVar dtb__162) depth)))))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__167, dtb__168, dtb__169) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__167, dtb__168, ((v_Vuna_dCompiler_dCore_dquote ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__169) ((v_Vuna_dCompiler_dCore_dfreshVar dtb__167) depth)))))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__170) -> ((v_Vuna_dCompiler_dCore_dquoteNeutral depth) dtb__170)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__171, dtb__172) -> ((v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__171))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth)) dtb__172))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__173, dtb__174) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__173, ((v_Vuna_dCompiler_dCore_dquoteArgValues depth) dtb__174)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__175, dtb__176) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (((v_Vuna_dCompiler_dCore_dquote depth) dtb__175), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquoteCaseAlt depth)) dtb__176)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__177) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__177))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__178) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__178))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__179) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__179))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__180, dtb__181, dtb__182) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (((v_Vuna_dCompiler_dCore_dquote depth) dtb__180), ((v_Vuna_dCompiler_dCore_dquote depth) dtb__181), ((v_Vuna_dCompiler_dCore_dquote depth) dtb__182)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dquoteCaseAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dVCaseAlt_Vuna_dCompiler_dCore_dVCaseAlt (dtb__183, dtb__184, dtb__185) -> ((fun n -> ((fun argVals -> ((fun body -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__183, dtb__184, body))) ((v_Vuna_dCompiler_dCore_dquote ((bi_add mc0) n)) ((v_Vuna_dCompiler_dCore_dapplyClosureBinder dtb__185) argVals)))) (((v_Vuna_dCompiler_dCore_dargValsAt dtb__184) mc0) 0))) (v_Base_dList_dlength dtb__184))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dquoteArgValues = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dquote mc0) dtb__186), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), ((v_Vuna_dCompiler_dCore_dquoteArgValues mc0) dtb__187)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dquoteNeutral = (fun depth -> (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__188, dtb__189, dtb__190) -> ((v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__188, ((v_Vuna_dCompiler_dCore_dvarIndex depth) dtb__189)))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth)) dtb__190))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__191, dtb__192) -> ((v_Vuna_dCompiler_dCore_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__191))) ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dquote depth)) dtb__192))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_disBoolTyName = (fun n -> (if ((bi_eq_str n) "Bool") then true else ((bi_eq_str n) "Base.Bool.Bool")))

let v_Vuna_dCompiler_dCore_disBoolNeutral = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__193, dtb__194) -> (if ((bi_eq_generic dtb__194) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_disBoolTyName dtb__193) else false)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__195, dtb__196, dtb__197) -> (if ((bi_eq_generic dtb__197) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dCore_disBoolTyName dtb__195) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dsplitAtVals = (fun mc0 -> (fun mc1 -> (if ((bi_eq_int mc0) 0) then (match mc1 with
  | C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | C_Base_dList_dList_Cons (dtb__200, dtb__201) -> (match ((v_Vuna_dCompiler_dCore_dsplitAtVals ((bi_sub mc0) 1)) dtb__201) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, dtb__203) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__200, dtb__202)), dtb__203))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dhasFreeVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__204, dtb__205) -> (if ((bi_ge_int dtb__205) depth) then true else false)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__206) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__207) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__208) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__212) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVar ((bi_add depth) 1)) dtb__213))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__214, dtb__215, dtb__216) -> ((v_Vuna_dCompiler_dCore_dhasFreeVar ((bi_add depth) 1)) dtb__216)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__217, dtb__218, dtb__219) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__217) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__218))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__220, dtb__221) -> ((v_Vuna_dCompiler_dCore_dhasFreeVarArgs depth) dtb__221)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__222, dtb__223) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__222) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVarAlts depth) dtb__223))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__224) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__225) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__226) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__227, dtb__228, dtb__229) -> (if (if ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__227) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__228)) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVar depth) dtb__229))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dhasFreeVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeVar mc0) dtb__232) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVarArgs mc0) dtb__231))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dhasFreeVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__234)))) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__234)) then true else ((v_Vuna_dCompiler_dCore_dhasFreeVarAlts mc0) dtb__235))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dhasMeta = (fun m -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__236) -> ((bi_eq_int m) dtb__236)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__237, dtb__238) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__239) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__240) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> (if (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__244) then true else (((v_Vuna_dCompiler_dCore_dhasMeta m) ((bi_add depth) 1)) dtb__245))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__246, dtb__247, dtb__248) -> (((v_Vuna_dCompiler_dCore_dhasMeta m) ((bi_add depth) 1)) dtb__248)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__249, dtb__250, dtb__251) -> (if (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__249) then true else (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__250))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__252, dtb__253) -> (((v_Vuna_dCompiler_dCore_dhasMetaArgs m) depth) dtb__253)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__254, dtb__255) -> (if (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__254) then true else (((v_Vuna_dCompiler_dCore_dhasMetaAlts m) depth) dtb__255))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__256) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__257) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__258) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__259, dtb__260, dtb__261) -> (if (if (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__259) then true else (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__260)) then true else (((v_Vuna_dCompiler_dCore_dhasMeta m) depth) dtb__261))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dhasMetaArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__262, dtb__263) -> (match dtb__262 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (if (((v_Vuna_dCompiler_dCore_dhasMeta mc0) mc1) dtb__264) then true else (((v_Vuna_dCompiler_dCore_dhasMetaArgs mc0) mc1) dtb__263))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dhasMetaAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__266, dtb__267) -> (if (((v_Vuna_dCompiler_dCore_dhasMeta mc0) ((bi_add mc1) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__266)))) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__266)) then true else (((v_Vuna_dCompiler_dCore_dhasMetaAlts mc0) mc1) dtb__267))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dsolveMetaNew = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun rhs -> ((fun t -> (if (((v_Vuna_dCompiler_dCore_dhasMeta m) 0) t) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve metavariable ?") ((bi_concat (bi_strFromInt m)) " (occurs check)")))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (m, rhs)), sols)))))) ((v_Vuna_dCompiler_dCore_dquote depth) rhs)))))))

let rec v_Vuna_dCompiler_dCore_dshift = (fun depth -> (fun amount -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__268, dtb__269) -> (if ((bi_ge_int dtb__269) depth) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__268, ((bi_add dtb__269) amount))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__270) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__271) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__272) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__273, dtb__274, dtb__275, (((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__276), (((v_Vuna_dCompiler_dCore_dshift ((bi_add depth) 1)) amount) dtb__277)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__278, dtb__279, dtb__280) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__278, dtb__279, (((v_Vuna_dCompiler_dCore_dshift ((bi_add depth) 1)) amount) dtb__280)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__281, dtb__282, dtb__283) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__281), (((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__282), dtb__283))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__284, dtb__285) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__284, (((v_Vuna_dCompiler_dCore_dshiftArgs depth) amount) dtb__285)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__286, dtb__287) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__286), (((v_Vuna_dCompiler_dCore_dshiftAlts depth) amount) dtb__287)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__288) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__289) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__290) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__291, dtb__292, dtb__293) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__291), (((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__292), (((v_Vuna_dCompiler_dCore_dshift depth) amount) dtb__293)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dshiftArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__294, dtb__295) -> (match dtb__294 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dshift mc0) mc1) dtb__296), dtb__297)), (((v_Vuna_dCompiler_dCore_dshiftArgs mc0) mc1) dtb__295)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dshiftAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dshiftAlt mc0) mc1) dtb__298), (((v_Vuna_dCompiler_dCore_dshiftAlts mc0) mc1) dtb__299)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dshiftAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__300, dtb__301, dtb__302) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__300, dtb__301, (((v_Vuna_dCompiler_dCore_dshift ((bi_add mc0) (v_Base_dList_dlength dtb__301))) mc1) dtb__302)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_disTypeValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__303) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dtypeLevelOf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__304) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__304))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dlevelEscapes = (fun limit -> (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__305) -> (match dtb__305 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__306, dtb__307, dtb__308) -> (if ((bi_ge_int dtb__307) limit) then true else ((v_Vuna_dCompiler_dCore_dlevelEscapesList limit) dtb__308))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__309, dtb__310) -> ((v_Vuna_dCompiler_dCore_dlevelEscapesList limit) dtb__310)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (if (((v_Vuna_dCompiler_dCore_dlevelEscapes limit) depth) dtb__314) then true else ((v_Vuna_dCompiler_dCore_dlevelEscapesClo limit) dtb__315))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__316, dtb__317, dtb__318) -> ((v_Vuna_dCompiler_dCore_dlevelEscapesClo limit) dtb__318)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__319, dtb__320) -> ((v_Vuna_dCompiler_dCore_dlevelEscapesList limit) dtb__320)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__321, dtb__322) -> ((v_Vuna_dCompiler_dCore_dlevelEscapesList limit) dtb__322)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__323, dtb__324) -> (((v_Vuna_dCompiler_dCore_dlevelEscapes limit) depth) dtb__323)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__325, dtb__326, dtb__327) -> (if (if (((v_Vuna_dCompiler_dCore_dlevelEscapes limit) depth) dtb__325) then true else (((v_Vuna_dCompiler_dCore_dlevelEscapes limit) depth) dtb__326)) then true else (((v_Vuna_dCompiler_dCore_dlevelEscapes limit) depth) dtb__327))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__328) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__329) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__330) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__331) -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dlevelEscapesList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__332, dtb__333) -> (if (((v_Vuna_dCompiler_dCore_dlevelEscapes mc0) 0) dtb__332) then true else ((v_Vuna_dCompiler_dCore_dlevelEscapesList mc0) dtb__333))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dlevelEscapesClo = (fun limit -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__334, dtb__335) -> ((v_Vuna_dCompiler_dCore_dlevelEscapesList limit) dtb__334)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dsubstVarAt = (fun idx -> (fun arg -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__336, dtb__337) -> (if ((bi_eq_int dtb__337) idx) then arg else t)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__338) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__339) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__340) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__341, dtb__342, dtb__343, (((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__344), (((v_Vuna_dCompiler_dCore_dsubstVarAt ((bi_add idx) 1)) arg) dtb__345)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__346, dtb__347, dtb__348) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__346, dtb__347, (((v_Vuna_dCompiler_dCore_dsubstVarAt ((bi_add idx) 1)) arg) dtb__348)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__349, dtb__350, dtb__351) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__349), (((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__350), dtb__351))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__352, dtb__353) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__352, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__353)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__354, dtb__355) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__354), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dsubstAltAt idx) arg)) dtb__355)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__356) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__357) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__358) -> t
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__359, dtb__360, dtb__361) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__359), (((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__360), (((v_Vuna_dCompiler_dCore_dsubstVarAt idx) arg) dtb__361)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dsubstAltAt = (fun idx -> (fun arg -> (fun alt -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt ((v_Vuna_dCompiler_dCore_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dsubstVarAt ((bi_add idx) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)))))))

let rec v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo = (fun depth -> (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__362) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__362) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__363) -> ((v_Vuna_dCompiler_dCore_dquote depth) dtb__363)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__364, dtb__365, dtb__366, dtb__367, dtb__368) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__364, dtb__365, dtb__366, (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__367), (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__368)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__369, dtb__370, dtb__371) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__369, dtb__370, (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__371)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__372, dtb__373, dtb__374) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__372), (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__373), dtb__374))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__375, dtb__376) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__375, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__376)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__377, dtb__378) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__377), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dsubstSolvedAltAt depth) sols)) dtb__378)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__379, dtb__380, dtb__381) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__379), (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__380), (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo depth) sols) dtb__381)))
  | _ -> t
))))
and v_Vuna_dCompiler_dCore_dsubstSolvedAltAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__382, dtb__383, dtb__384) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__382, dtb__383, (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo mc0) mc1) dtb__384)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dsubstSolvedMetasAt = (fun d -> (fun sols -> (fun t -> (match sols with
  | C_Base_dList_dList_Nil -> t
  | _ -> (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAtGo d) sols) t)
))))

let rec v_Vuna_dCompiler_dCore_dsubstMetaVarGo = (fun m -> (fun name -> (fun q -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__385) -> (if ((bi_eq_int dtb__385) m) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (name, ((bi_sub depth) q))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__386, dtb__387, dtb__388, (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__389), (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__390)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__391, dtb__392, dtb__393) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__391, dtb__392, (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__393)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__394, dtb__395, dtb__396) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__394), (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__395), dtb__396))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__397, dtb__398) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__397, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__398)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__399, dtb__400) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__399), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dsubstMetaVarAlt m) name) q) depth)) dtb__400)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__401, dtb__402, dtb__403) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__401), (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__402), (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) depth) dtb__403)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dCore_dsubstMetaVarAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__404, dtb__405, dtb__406) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__404, dtb__405, (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo mc0) mc1) mc2) ((bi_add mc3) (v_Base_dList_dlength dtb__405))) dtb__406)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCore_dsubstMetaVar = (fun m -> (fun name -> (fun q -> (fun t -> (((((v_Vuna_dCompiler_dCore_dsubstMetaVarGo m) name) q) 0) t)))))

let rec v_Vuna_dCompiler_dCore_dinsertDictBinderGo = (fun name -> (fun idx -> (fun dictDom -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__407, dtb__408, dtb__409, dtb__410, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (name, true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, dictDom, (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__411))))) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__407, dtb__408, dtb__409, dtb__410, (((((v_Vuna_dCompiler_dCore_dinsertDictBinderGo name) idx) dictDom) ((bi_add depth) 1)) dtb__411))))
  | _ -> t
))))))

let v_Vuna_dCompiler_dCore_dinsertDictBinder = (fun name -> (fun idx -> (fun dictDom -> (fun t -> (((((v_Vuna_dCompiler_dCore_dinsertDictBinderGo name) idx) dictDom) 0) t)))))

let v_Vuna_dCompiler_dCore_dcutoffOf = (fun total -> (fun idx -> (if ((bi_le_int ((bi_sub total) ((bi_add idx) 1))) 0) then 0 else ((bi_sub total) ((bi_add idx) 1)))))

let rec v_Vuna_dCompiler_dCore_dcountPis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dcountPis dtb__416))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dinsertLamBinderGo = (fun name -> (fun idx -> (fun total -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__417, dtb__418, dtb__419) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__417, dtb__418, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (((v_Vuna_dCompiler_dCore_dshift ((v_Vuna_dCompiler_dCore_dcutoffOf total) idx)) 1) dtb__419))))) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__417, dtb__418, (((((v_Vuna_dCompiler_dCore_dinsertLamBinderGo name) idx) total) ((bi_add depth) 1)) dtb__419))))
  | _ -> t
))))))

let rec v_Vuna_dCompiler_dCore_dcountLams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__420, dtb__421, dtb__422) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dcountLams dtb__422))
  | _ -> 0
))

let v_Vuna_dCompiler_dCore_dinsertLamBinder = (fun name -> (fun idx -> (fun t -> (((((v_Vuna_dCompiler_dCore_dinsertLamBinderGo name) idx) (v_Vuna_dCompiler_dCore_dcountLams t)) 0) t))))

let rec v_Vuna_dCompiler_dCore_dhasFreeTermVar = (fun d -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__423, dtb__424) -> ((bi_ge_int dtb__424) d)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__428) then true else ((v_Vuna_dCompiler_dCore_dhasFreeTermVar ((bi_add d) 1)) dtb__429))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__430, dtb__431, dtb__432) -> ((v_Vuna_dCompiler_dCore_dhasFreeTermVar ((bi_add d) 1)) dtb__432)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__433, dtb__434, dtb__435) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__433) then true else ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__434))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__436, dtb__437) -> ((v_Vuna_dCompiler_dCore_danyPairFree d) dtb__437)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__438, dtb__439) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__438) then true else ((v_Vuna_dCompiler_dCore_danyAltFree d) dtb__439))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__440, dtb__441, dtb__442) -> (if (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__440) then true else ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__441)) then true else ((v_Vuna_dCompiler_dCore_dhasFreeTermVar d) dtb__442))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_danyPairFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__443, dtb__444) -> (match dtb__443 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__445, dtb__446) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar mc0) dtb__445) then true else ((v_Vuna_dCompiler_dCore_danyPairFree mc0) dtb__444))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_danyAltFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__447, dtb__448) -> (match dtb__447 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__449, dtb__450, dtb__451) -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar ((bi_add mc0) (v_Base_dList_dlength dtb__450))) dtb__451) then true else ((v_Vuna_dCompiler_dCore_danyAltFree mc0) dtb__448))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dsubstSolvedMetas = (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__452) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__452) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__453) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dhasFreeTermVar 0) soln) then t else soln)) ((v_Vuna_dCompiler_dCore_dquote 0) dtb__453))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__454, dtb__455, dtb__456, dtb__457, dtb__458) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__454, dtb__455, dtb__456, ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__457), ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__458)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__459, dtb__460, dtb__461) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__459, dtb__460, ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__461)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__462, dtb__463, dtb__464) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__462), ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__463), dtb__464))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__465, dtb__466) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__465, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__466)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__467, dtb__468) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__467), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dsubstSolvedAlt sols)) dtb__468)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__469, dtb__470, dtb__471) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__469), ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__470), ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas sols) dtb__471)))
  | _ -> t
)))
and v_Vuna_dCompiler_dCore_dsubstSolvedAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__472, dtb__473, dtb__474) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__472, dtb__473, ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas mc0) dtb__474)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue = (fun sols -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__475, dtb__476) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__475) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__477) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__477)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__478) -> (match dtb__478 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__479, dtb__480, dtb__481) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList sols) dtb__481)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__482, dtb__483) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList sols) dtb__483)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__487) then true else ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaClo sols) dtb__488))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__489, dtb__490, dtb__491) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaClo sols) dtb__491)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__492, dtb__493) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList sols) dtb__493)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__494, dtb__495) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__494)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__496, dtb__497, dtb__498) -> (if (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__496) then true else ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__497)) then true else ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue sols) dtb__498))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__499, dtb__500) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue mc0) dtb__499) then true else ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList mc0) dtb__500))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dhasUnsolvedMetaClo = (fun sols -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__501, dtb__502) -> ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaList sols) dtb__501)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dshowBinders = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__503, dtb__504) -> (match dtb__503 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__505, dtb__506) -> ((bi_concat " ") ((bi_concat dtb__505) (v_Vuna_dCompiler_dCore_dshowBinders dtb__504)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dshowCoreChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__507, dtb__508) -> (if ((bi_eq_int dtb__507) 34) then ((bi_concat "\\\"") (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)) else (if ((bi_eq_int dtb__507) 92) then ((bi_concat "\\\\") (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)) else (if ((bi_eq_int dtb__507) 10) then ((bi_concat "\\n") (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)) else (if ((bi_eq_int dtb__507) 9) then ((bi_concat "\\t") (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)) else (if ((bi_eq_int dtb__507) 13) then ((bi_concat "\\r") (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)) else ((bi_concat (dtp_pack (C_Base_dList_dList_Cons (dtb__507, C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dCore_dshowCoreChars dtb__508)))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dshowCoreString = (fun s -> ((bi_concat "\"") ((bi_concat (v_Vuna_dCompiler_dCore_dshowCoreChars (dtp_unpack s))) "\"")))

let rec v_Vuna_dCompiler_dCore_dshowTerm = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__509, dtb__510) -> dtb__509
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__511) -> ((bi_concat "?") (bi_strFromInt dtb__511))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__512) -> dtb__512
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__513) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dlevelToInt dtb__513)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dlevelToInt dtb__513))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__514, dtb__515, dtb__516, dtb__517, dtb__518) -> (if ((bi_eq_str dtb__514) "_") then ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__517)) ((bi_concat " -> ") (v_Vuna_dCompiler_dCore_dshowTerm dtb__518))) else (if dtb__515 then ((bi_concat "{") ((bi_concat dtb__514) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__517)) ((bi_concat "} -> ") (v_Vuna_dCompiler_dCore_dshowTerm dtb__518)))))) else ((bi_concat "(") ((bi_concat dtb__514) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__517)) ((bi_concat ") -> ") (v_Vuna_dCompiler_dCore_dshowTerm dtb__518))))))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__519, dtb__520, dtb__521) -> ((bi_concat "\\") ((bi_concat dtb__519) ((bi_concat " => ") (v_Vuna_dCompiler_dCore_dshowTerm dtb__521))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__522, dtb__523, dtb__524) -> ((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__522)) ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__523)) ")"))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__525, dtb__526) -> ((bi_concat "(") ((bi_concat dtb__525) ((bi_concat (v_Vuna_dCompiler_dCore_dshowArgTerms dtb__526)) ")")))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__527, dtb__528) -> ((bi_concat "case ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__527)) ((bi_concat " of ") (v_Vuna_dCompiler_dCore_dshowCoreAlts dtb__528))))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__529) -> (bi_strFromInt dtb__529)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__530) -> (v_Vuna_dCompiler_dCore_dshowCoreString dtb__530)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__531) -> (if dtb__531 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__532, dtb__533, dtb__534) -> ((bi_concat "if ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__532)) ((bi_concat " then ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__533)) ((bi_concat " else ") (v_Vuna_dCompiler_dCore_dshowTerm dtb__534))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dshowArgTerms = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__535, dtb__536) -> (match dtb__535 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__537, dtb__538) -> ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm dtb__537)) (v_Vuna_dCompiler_dCore_dshowArgTerms dtb__536)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__539, dtb__540) -> ((bi_concat (v_Vuna_dCompiler_dCore_dcaseAltName dtb__539)) ((bi_concat (v_Vuna_dCompiler_dCore_dshowBinders (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__539))) ((bi_concat " => ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowTerm (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__539))) ((bi_concat " | ") (v_Vuna_dCompiler_dCore_dshowCoreAlts dtb__540))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dshowValueAt = (fun depth -> (fun v -> (v_Vuna_dCompiler_dCore_dshowTerm ((v_Vuna_dCompiler_dCore_dquote depth) v))))

let v_Vuna_dCompiler_dCore_dmismatchAt = (fun depth -> (fun a -> (fun b -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: expected ") ((bi_concat ((v_Vuna_dCompiler_dCore_dshowValueAt depth) a)) ((bi_concat ", got ") ((v_Vuna_dCompiler_dCore_dshowValueAt depth) b)))))))))

let v_Vuna_dCompiler_dCore_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dshowValueAt 0) v))

let rec v_Vuna_dCompiler_dCore_dforce = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__541, dtb__542) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__541) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__543) -> ((((v_Vuna_dCompiler_dCore_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dapplySpine dtb__543) dtb__542))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__544, dtb__545) -> ((fun s2 -> (match s2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__546, dtb__547) -> (match dtb__545 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (s2, C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dforce defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dapplyCaseAlt dtb__546) dtb__547) dtb__545))
)
  | _ -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (s2, dtb__545))
)) ((((v_Vuna_dCompiler_dCore_dforce defs) sols) ((bi_sub fuel) 1)) dtb__544))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__548) -> (match dtb__548 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__549, dtb__550) -> (match ((v_Vuna_dCompiler_dCore_ddefLookup dtb__549) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__551) -> ((((v_Vuna_dCompiler_dCore_dforce defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dapplySpine ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__551)) dtb__550))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dprimReduce defs) sols) dtb__549) dtb__550) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__552) -> ((((v_Vuna_dCompiler_dCore_dforce defs) sols) ((bi_sub fuel) 1)) dtb__552)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
))))))
and v_Vuna_dCompiler_dCore_dprimReduce = (fun defs -> (fun sols -> (fun g -> (fun sp -> (if ((bi_eq_str g) "+") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (((bi_add a) b)))))) else (if ((bi_eq_str g) "-") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (((bi_sub a) b)))))) else (if ((bi_eq_str g) "*") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (((bi_mul a) b)))))) else (if ((bi_eq_str g) "/") then (v_Vuna_dCompiler_dCore_dintPrim2Div sp) else (if ((bi_eq_str g) "==") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "/=") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((v_Vuna_dCompiler_dCore_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "<") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "<=") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) ">") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) ">=") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "++") then ((v_Vuna_dCompiler_dCore_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (((bi_concat a) b)))))) else (if ((bi_eq_str g) "True") then ((v_Vuna_dCompiler_dCore_dprimConst sp) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (true))) else (if ((bi_eq_str g) "False") then ((v_Vuna_dCompiler_dCore_dprimConst sp) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (false))) else (if ((bi_eq_str g) "&&") then ((v_Vuna_dCompiler_dCore_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((if a then b else false)))))) else (if ((bi_eq_str g) "||") then ((v_Vuna_dCompiler_dCore_dboolPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((if a then true else b)))))) else (if ((bi_eq_str g) "bi_eq_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_eq_int a) b)))))) else (if ((bi_eq_str g) "bi_neq_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((v_Vuna_dCompiler_dCore_dnotBool ((bi_eq_int a) b))))))) else (if ((bi_eq_str g) "bi_eq_str") then ((v_Vuna_dCompiler_dCore_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((v_Vuna_dCompiler_dCore_dstrEq a) b)))))) else (if ((bi_eq_str g) "bi_neq_str") then ((v_Vuna_dCompiler_dCore_dstrPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((v_Vuna_dCompiler_dCore_dnotBool ((v_Vuna_dCompiler_dCore_dstrEq a) b))))))) else (if ((bi_eq_str g) "bi_eq_generic") then ((((v_Vuna_dCompiler_dCore_dgenericEqPrim defs) sols) sp) false) else (if ((bi_eq_str g) "bi_neq_generic") then ((((v_Vuna_dCompiler_dCore_dgenericEqPrim defs) sols) sp) true) else (if ((bi_eq_str g) "strFromInt") then ((v_Vuna_dCompiler_dCore_dintPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr ((bi_strFromInt n))))) else (if ((bi_eq_str g) "strLength") then ((v_Vuna_dCompiler_dCore_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt ((bi_strLength s))))) else (if ((bi_eq_str g) "bi_lt_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_lt_int a) b)))))) else (if ((bi_eq_str g) "bi_le_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_le_int a) b)))))) else (if ((bi_eq_str g) "bi_gt_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_gt_int a) b)))))) else (if ((bi_eq_str g) "bi_ge_int") then ((v_Vuna_dCompiler_dCore_dintPrim2 sp) (fun a -> (fun b -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (((bi_ge_int a) b)))))) else (if ((bi_eq_str g) "bi_lt_generic") then ((v_Vuna_dCompiler_dCore_dgenericPrim2 sp) (fun o -> ((bi_lt_int o) 0))) else (if ((bi_eq_str g) "bi_le_generic") then ((v_Vuna_dCompiler_dCore_dgenericPrim2 sp) (fun o -> ((bi_le_int o) 0))) else (if ((bi_eq_str g) "bi_gt_generic") then ((v_Vuna_dCompiler_dCore_dgenericPrim2 sp) (fun o -> ((bi_gt_int o) 0))) else (if ((bi_eq_str g) "bi_ge_generic") then ((v_Vuna_dCompiler_dCore_dgenericPrim2 sp) (fun o -> ((bi_ge_int o) 0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))))))))))))))))))))))))))
and v_Vuna_dCompiler_dCore_dgenericEqPrim = (fun defs -> (fun sols -> (fun sp -> (fun neg -> (match sp with
  | C_Base_dList_dList_Cons (dtb__553, dtb__554) -> (match dtb__554 with
  | C_Base_dList_dList_Cons (dtb__555, dtb__556) -> (match dtb__556 with
  | C_Base_dList_dList_Cons (dtb__557, dtb__558) -> (match dtb__558 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool ((if neg then (v_Vuna_dCompiler_dCore_dnotBool (((((v_Vuna_dCompiler_dCore_dvalueEqDeep defs) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__555) dtb__557)) else (((((v_Vuna_dCompiler_dCore_dvalueEqDeep defs) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__555) dtb__557))))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))))
and v_Vuna_dCompiler_dCore_dvalueEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then false else (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) a) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__559) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__560) -> ((bi_eq_int dtb__559) dtb__560)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__561) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__562) -> ((v_Vuna_dCompiler_dCore_dstrEq dtb__561) dtb__562)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__563) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__564) -> (if dtb__563 then dtb__564 else (v_Vuna_dCompiler_dCore_dnotBool dtb__564))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__565) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__566) -> ((bi_eq_int (v_Vuna_dCompiler_dCore_dlevelToInt dtb__565)) (v_Vuna_dCompiler_dCore_dlevelToInt dtb__566))
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__567, dtb__568) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__569, dtb__570) -> (if ((bi_eq_str dtb__567) dtb__569) then (((((v_Vuna_dCompiler_dCore_dvalueListEqDeep defs) sols) ((bi_sub fuel) 1)) dtb__568) dtb__570) else false)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__571, dtb__572) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__573, dtb__574) -> ((bi_eq_int dtb__571) dtb__573)
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__575) -> (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) b) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__576) -> ((bi_eq_str (v_Vuna_dCompiler_dCore_dshowValue (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__575)))) (v_Vuna_dCompiler_dCore_dshowValue (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__576))))
  | _ -> false
)
  | _ -> false
)))))))
and v_Vuna_dCompiler_dCore_dvalueListEqDeep = (fun defs -> (fun sols -> (fun fuel -> (fun xs -> (fun ys -> (match xs with
  | C_Base_dList_dList_Nil -> (match ys with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | C_Base_dList_dList_Cons (dtb__577, dtb__578) -> (match ys with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__579, dtb__580) -> (if (((((v_Vuna_dCompiler_dCore_dvalueEqDeep defs) sols) fuel) dtb__577) dtb__579) then (((((v_Vuna_dCompiler_dCore_dvalueListEqDeep defs) sols) fuel) dtb__578) dtb__580) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dCore_dnormalize = (fun defs -> (fun sols -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match ((((v_Vuna_dCompiler_dCore_dforce defs) sols) fuel) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__581) -> ((((v_Vuna_dCompiler_dCore_dnormalizeNeutral defs) sols) fuel) dtb__581)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__582, dtb__583, dtb__584) -> ((((((v_Vuna_dCompiler_dCore_dnormalizeIf defs) sols) fuel) dtb__582) dtb__583) dtb__584)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__585, dtb__586) -> (((((v_Vuna_dCompiler_dCore_dnormalizeCase defs) sols) fuel) dtb__585) dtb__586)
  | dtb__587 -> dtb__587
))))))
and v_Vuna_dCompiler_dCore_dnormalizeCase = (fun defs -> (fun sols -> (fun fuel -> (fun scrut -> (fun alts -> (match ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) scrut) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__588, dtb__589) -> ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) (((v_Vuna_dCompiler_dCore_dapplyCaseAlt dtb__588) dtb__589) alts))
  | dtb__590 -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__590, alts))
))))))
and v_Vuna_dCompiler_dCore_dnormalizeNeutral = (fun defs -> (fun sols -> (fun fuel -> (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__591, dtb__592, dtb__593) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__591, dtb__592, ((v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dnormalize defs) sols) fuel)) dtb__593)))))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__594, dtb__595) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dCore_ddefLookup dtb__594) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__596) -> ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) ((v_Vuna_dCompiler_dCore_dapplySpine ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__596)) sp2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dprimReduce defs) sols) dtb__594) sp2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__597) -> ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) dtb__597)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__594, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dnormalize defs) sols) fuel)) dtb__595))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dnormalizeIf = (fun defs -> (fun sols -> (fun fuel -> (fun c -> (fun th -> (fun el -> (match ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) c) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__598) -> ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) (if dtb__598 then th else el))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__599) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__599)), ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) th), ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) el)))
  | dtb__600 -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__600, ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) th), ((((v_Vuna_dCompiler_dCore_dnormalize defs) sols) ((bi_sub fuel) 1)) el)))
)))))))

let rec v_Vuna_dCompiler_dCore_dconv = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> ((fun a2 -> ((fun y2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__601, dtb__602) -> ((((((v_Vuna_dCompiler_dCore_dsolveMeta defs) sols) depth) dtb__601) dtb__602) y2)
  | _ -> (match y2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__603, dtb__604) -> ((((((v_Vuna_dCompiler_dCore_dsolveMeta defs) sols) depth) dtb__603) dtb__604) a2)
  | _ -> (((((v_Vuna_dCompiler_dCore_dconvBoth defs) sols) depth) a2) y2)
)
)) ((((v_Vuna_dCompiler_dCore_dforce defs) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) b))) ((((v_Vuna_dCompiler_dCore_dforce defs) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) a)))))))
and v_Vuna_dCompiler_dCore_dconvBoth = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__605) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__606) -> (if ((bi_eq_generic dtb__605) dtb__606) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__607, dtb__608, dtb__609, dtb__610, dtb__611) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__612, dtb__613, dtb__614, dtb__615, dtb__616) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__608) dtb__613) then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv defs) sols) depth) dtb__610) dtb__615)) (fun sols2 -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols2) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__611) v)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__616) v))) ((v_Vuna_dCompiler_dCore_dfreshVar dtb__607) depth)))) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__617, dtb__618, dtb__619) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__620, dtb__621, dtb__622) -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__619) v)) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__622) v))) ((v_Vuna_dCompiler_dCore_dfreshVar dtb__617) depth))
  | _ -> ((((((v_Vuna_dCompiler_dCore_detaRight defs) sols) depth) dtb__617) dtb__619) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__623) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__624) -> (if (if (v_Vuna_dCompiler_dCore_disBoolNeutral dtb__623) then (v_Vuna_dCompiler_dCore_disBoolNeutral dtb__624) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((((v_Vuna_dCompiler_dCore_dconvNeutral defs) sols) depth) dtb__623) dtb__624) a) b))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__625, dtb__626, dtb__627) -> ((((((v_Vuna_dCompiler_dCore_detaLeft defs) sols) depth) a) dtb__625) dtb__627)
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__628) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__629) -> (if ((bi_eq_int dtb__628) dtb__629) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__630) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__631) -> (if ((bi_eq_str dtb__630) dtb__631) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__632) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__633) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__632) dtb__633) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__634, dtb__635) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__636, dtb__637) -> (if ((bi_eq_str dtb__634) dtb__636) then (((((v_Vuna_dCompiler_dCore_dconvValueLists defs) sols) depth) dtb__635) dtb__637) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__638, dtb__639) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__640, dtb__641) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv defs) sols) depth) dtb__638) dtb__640)) (fun sols2 -> (((((v_Vuna_dCompiler_dCore_dconvCaseAlts defs) sols2) depth) dtb__639) dtb__641)))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__642, dtb__643, dtb__644) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__645, dtb__646, dtb__647) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv defs) sols) depth) dtb__642) dtb__645)) (fun sols2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv defs) sols2) depth) dtb__643) dtb__646)) (fun sols3 -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols3) depth) dtb__644) dtb__647)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) a) b)
))))))
and v_Vuna_dCompiler_dCore_detaLeft = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun name -> (fun clo -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyValue a) v)) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v))) ((v_Vuna_dCompiler_dCore_dfreshVar name) depth))))))))
and v_Vuna_dCompiler_dCore_detaRight = (fun defs -> (fun sols -> (fun depth -> (fun name -> (fun clo -> (fun b -> ((fun v -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) ((bi_add depth) 1)) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v)) ((v_Vuna_dCompiler_dCore_dapplyValue b) v))) ((v_Vuna_dCompiler_dCore_dfreshVar name) depth))))))))
and v_Vuna_dCompiler_dCore_dconvNeutral = (fun defs -> (fun sols -> (fun depth -> (fun n1 -> (fun n2 -> (fun v1 -> (fun v2 -> (match n1 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__648, dtb__649, dtb__650) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__651, dtb__652, dtb__653) -> (if ((bi_eq_int dtb__649) dtb__652) then (((((((v_Vuna_dCompiler_dCore_dconvSpines defs) sols) depth) dtb__650) dtb__653) v1) v2) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) v1) v2)
)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__654, dtb__655) -> (match n2 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__656, dtb__657) -> (if ((bi_eq_str dtb__654) dtb__656) then (((((((v_Vuna_dCompiler_dCore_dconvSpines defs) sols) depth) dtb__655) dtb__657) v1) v2) else (((v_Vuna_dCompiler_dCore_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dconvSpines = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__658, dtb__659) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__660, dtb__661) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv mc0) mc1) mc2) dtb__658) dtb__660)) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dconvSpines mc0) sols2) mc2) dtb__659) dtb__661) mc5) mc6)))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt mc2) mc5) mc6)
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (((v_Vuna_dCompiler_dCore_dmismatchAt mc2) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dCore_dconvValueLists = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__662, dtb__663) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__664, dtb__665) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCore_dconv mc0) mc1) mc2) dtb__662) dtb__664)) (fun sols2 -> (((((v_Vuna_dCompiler_dCore_dconvValueLists mc0) sols2) mc2) dtb__663) dtb__665)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length"))
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: constructor arguments differ in length"))
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dconvCaseAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__666, dtb__667) -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__668, dtb__669) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__666)) (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__668)) then (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dvCaseAltBinders dtb__666))) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dvCaseAltBinders dtb__668))) then (match (((((v_Vuna_dCompiler_dCore_dconvOneAlt mc0) mc1) mc2) dtb__666) dtb__668) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__670) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__670))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__671) -> (((((v_Vuna_dCompiler_dCore_dconvCaseAlts mc0) dtb__671) mc2) dtb__667) dtb__669)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__666)) " binds a different number of variables"))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "type mismatch: case branch ") ((bi_concat (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__666)) ((bi_concat " vs ") (v_Vuna_dCompiler_dCore_dvCaseAltName dtb__668)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number"))
)
  | C_Base_dList_dList_Nil -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("type mismatch: case branches differ in number"))
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCore_dconvOneAlt = (fun defs -> (fun sols -> (fun depth -> (fun a -> (fun b -> ((fun bs -> ((fun n -> ((fun args -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) ((bi_add depth) n)) ((v_Vuna_dCompiler_dCore_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dvCaseAltClosure a)) args)) ((v_Vuna_dCompiler_dCore_dapplyClosureBinder (v_Vuna_dCompiler_dCore_dvCaseAltClosure b)) args))) (((v_Vuna_dCompiler_dCore_dargValsAt bs) depth) 0))) (v_Base_dList_dlength bs))) (v_Vuna_dCompiler_dCore_dvCaseAltBinders a)))))))
and v_Vuna_dCompiler_dCore_dsolveMeta = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (match sp with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup m) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__672) -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) depth) ((v_Vuna_dCompiler_dCore_dapplySpine dtb__672) C_Base_dList_dList_Nil)) rhs)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match rhs with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__673, dtb__674) -> (match dtb__674 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__673) m) then (C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((((v_Vuna_dCompiler_dCore_dsolveMetaNew defs) sols) depth) m) rhs))
  | _ -> (((((v_Vuna_dCompiler_dCore_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> (((((v_Vuna_dCompiler_dCore_dsolveMetaNew defs) sols) depth) m) rhs)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dsolveMetaHo defs) sols) depth) m) sp) rhs)
)))))))
and v_Vuna_dCompiler_dCore_dsolveMetaHo = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun rhs -> (match rhs with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__675, dtb__676) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__675) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__677) -> (((((v_Vuna_dCompiler_dCore_dconv defs) sols) depth) ((v_Vuna_dCompiler_dCore_dapplySpine (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, sp))) C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dCore_dapplySpine dtb__677) dtb__676))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_int m) dtb__675) then (((((((v_Vuna_dCompiler_dCore_dconvSpines defs) sols) depth) sp) dtb__676) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, sp))) rhs) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dsolveMeta defs) sols) depth) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__675, C_Base_dList_dList_Nil)))) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dconvSpines defs) sols2) depth) sp) dtb__676) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__678) -> (match dtb__678 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__679, dtb__680) -> ((((((((v_Vuna_dCompiler_dCore_dsolveMetaHead defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__678))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__679, C_Base_dList_dList_Nil))))) dtb__680)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__681, dtb__682, dtb__683) -> ((((((((v_Vuna_dCompiler_dCore_dsolveMetaHead defs) sols) depth) m) sp) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__678))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__681, dtb__682, C_Base_dList_dList_Nil))))) dtb__683)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)"))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)"))))
)))))))
and v_Vuna_dCompiler_dCore_dsolveMetaHead = (fun defs -> (fun sols -> (fun depth -> (fun m -> (fun sp -> (fun whole -> (fun headVal -> (fun args -> (if ((bi_ge_int (v_Base_dList_dlength args)) (v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dsplitAtVals extra) args) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__684, dtb__685) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dsolveMeta defs) sols) depth) m) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_dapplySpine headVal) dtb__684))) (fun sols2 -> (((((((v_Vuna_dCompiler_dCore_dconvSpines defs) sols2) depth) sp) dtb__685) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub (v_Base_dList_dlength args)) (v_Base_dList_dlength sp))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "cannot solve higher-order metavariable ?") ((bi_concat (bi_strFromInt m)) " (M13 limitation)")))))))))))))
