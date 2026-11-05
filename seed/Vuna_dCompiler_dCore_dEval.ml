open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (mc0 <= 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv (mc0 - 1)) dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__2, dtb__3, dtb__4) -> (C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__2, dtb__3, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (mc0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt scrut env -> (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders alt) with
  | C_Base_dList_dList_Base_dList_dNil -> env
  | _ -> (C_Base_dList_dList_Base_dList_dCons (scrut, env))
))

let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__7) -> (if dtb__7 then mc1 else mc2)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (mc0, mc1, mc2))
))

let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, dtb__9) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, ((v_Base_dList_dappend dtb__9) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__10, dtb__11, dtb__12) -> (C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__10, dtb__11, ((v_Base_dList_dappend dtb__12) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel env t -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__13, dtb__14) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__14) env) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__16) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__16, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__17, C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__18) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__18))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__19, dtb__20, dtb__21, (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__22), (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__23))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__24, dtb__25, dtb__26) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__24, dtb__25, (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (env, dtb__26))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__27, dtb__28, dtb__29) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__27)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__28))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__30, dtb__31) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__30, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__31)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__32, dtb__33) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__32)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__33))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__34) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__35) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__35))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__36) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__36))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__37, dtb__38, dtb__39) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__37)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__38)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__39))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel env args -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__42), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel scrut alts -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) dtb__44) dtb__45) alts)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel c args alts -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args)), C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46) = c) then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__48, dtb__49) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) ((v_Base_dList_dappend (v_Base_dList_dreverse args)) dtb__48)) dtb__49)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName dtb__46) = "") then (match (v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure dtb__46) with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__50, dtb__51) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__46) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args))) dtb__50)) dtb__51)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) c) args) dtb__47)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel f a -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__52, dtb__53) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__52, ((v_Base_dList_dappend dtb__53) (C_Base_dList_dList_Base_dList_dCons (a, C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__54) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__54) a)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__55, dtb__56, dtb__57) -> (match dtb__57 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__58, dtb__59) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (C_Base_dList_dList_Base_dList_dCons (a, dtb__58))) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f, a))
)) f)))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel 128) env) t))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c args alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__60, dtb__61) -> ((v_Vuna_dCompiler_dCore_dEval_deval (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__60))) dtb__61)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__62)) dtb__63)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__64) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatMax = 4611686018427387903

let v_Vuna_dCompiler_dCore_dEval_dnatClamp = (fun n -> (if (n <= 0) then 0 else (if (n >= v_Vuna_dCompiler_dCore_dEval_dnatMax) then v_Vuna_dCompiler_dCore_dEval_dnatMax else n)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatAdd = (fun a b -> (if (a > (v_Vuna_dCompiler_dCore_dEval_dnatMax - b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a + b)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatMul = (fun a b -> (if (if (a <= 0) then true else (b <= 0)) then 0 else (if (a > (if b = 0 then failwith "division by zero" else v_Vuna_dCompiler_dCore_dEval_dnatMax / b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a * b))))

let v_Vuna_dCompiler_dCore_dEval_dnatTruncSub = (fun a b -> (if (a <= b) then 0 else (a - b)))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (n - 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (C_Base_dList_dList_Base_dList_dCons (acc, C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dCore_dEval_dnatValue = (fun n -> ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (v_Vuna_dCompiler_dCore_dEval_dnatClamp n)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueToInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__65, dtb__66) -> ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__65) dtb__66)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__67) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dCore_dEval_dnatCtorInt = (fun c args -> (if (c = v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (c = v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__69 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt dtb__68) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd dtb__70) 1)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dCore_dEval_dasNat = (fun v -> (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt v))

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__71) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__72) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__72))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__74 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (match dtb__76 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__73) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__75) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__77) dtb__78)))
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

let v_Vuna_dCompiler_dCore_dEval_dintPrim2Div = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__80 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (match dtb__82 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__79) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__81) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (if (dtb__84 = 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((if dtb__84 = 0 then failwith "division by zero" else dtb__83 / dtb__84))))))
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

let v_Vuna_dCompiler_dCore_dEval_dboolPrim2 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__86 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__85) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__87) with
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
))

let v_Vuna_dCompiler_dCore_dEval_dprimConst = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (match dtb__92 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__94 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__91) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__93) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__95) dtb__96)))
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

let v_Vuna_dCompiler_dCore_dEval_dintPrim1 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__98 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__97) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__99)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__101 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__100) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__102)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__103) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__105) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__108) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__107) dtb__108)))
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

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (match dtb__112 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__109) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__111) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (if (dtb__114 <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dCore_dEval_dnatValue (if dtb__114 = 0 then failwith "division by zero" else dtb__113 / dtb__114)))))
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

let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__115) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__117)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrEq = (fun a b -> (a = b))

let v_Vuna_dCompiler_dCore_dEval_dcmpInt = (fun a b -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__118) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__119) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) dtb__118) dtb__119) then 0 else (if dtb__118 then 1 else (0 - 1)))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__120) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__121) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (dtb__120 = dtb__121) then 0 else (if (dtb__120 < dtb__121) then (0 - 1) else 1))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__122) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__123) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__122) dtb__123)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (match dtb__125 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match dtb__127 with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__124) dtb__126) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((mc1 dtb__128)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim3 = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__129, dtb__130) -> (match dtb__130 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__134 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__129) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__131) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__133) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((mc1 dtb__135) dtb__136) dtb__137)))
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
))

let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__139) (((mc1 * 33) + dtb__138) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__138) / 1024) * 1024)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__140, dtb__141) -> (if (mc1 <= 0) then dtb__140 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__141) (mc1 - 1)))
  | C_Base_dList_dList_Base_dList_dNil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s i -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (dtp_unpack s)) i)))

let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match dtb__143 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__145 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__142) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__144) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__146) dtb__147)))))
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

let rec v_Vuna_dCompiler_dCore_dEval_dtakeBytes = (fun n xs -> (if (n <= 0) then C_Base_dList_dList_Base_dList_dNil else (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (C_Base_dList_dList_Base_dList_dCons (dtb__148, ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes (n - 1)) dtb__149)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_ddropBytes = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> ((v_Vuna_dCompiler_dCore_dEval_ddropBytes (n - 1)) dtb__151)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringBytes = (fun start len s -> ((fun n -> ((fun st -> ((fun ln -> (dtp_pack ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes ln) ((v_Vuna_dCompiler_dCore_dEval_ddropBytes st) (dtp_unpack s))))) (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)))) (if (start < 0) then 0 else (if (start > n) then n else start)))) (bi_strLength s)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringPrim = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (match dtb__153 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (match dtb__155 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__152) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__158) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__154) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__156) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((((v_Vuna_dCompiler_dCore_dEval_dsubstringBytes dtb__158) dtb__159) dtb__160)))))
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
))

let v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs sols fuel g sp -> (if (fuel <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic g) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicOp dtb__161) with
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAdd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a + b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpSub -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a - b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpMul -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a * b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpDiv -> (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a = b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool (a = b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a < b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a <= b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a > b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a >= b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((v_Vuna_dCompiler_dCore_dTerm_dnotBool ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o < 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o <= 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o > 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o >= 0)))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpConcat -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((a ^ b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAnd -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then b else false)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpOr -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then true else b)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((bi_strFromInt n)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrLength -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((bi_strLength s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrHash -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((v_Vuna_dCompiler_dCore_dEval_dstrHashOf s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrAt -> (v_Vuna_dCompiler_dCore_dEval_datPrim sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrSubstring -> (v_Vuna_dCompiler_dCore_dEval_dsubstringPrim sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrShow -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((v_Vuna_dCompiler_dCore_dTerm_dshowCoreString s)))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatAdd -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd a) b))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatSub -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatTruncSub a) b))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatMul -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatMul a) b))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatDiv -> (v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div sp)
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatToInt -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim1 sp) (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (n))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (v_Vuna_dCompiler_dCore_dEval_dnatValue (v_Vuna_dCompiler_dCore_dEval_dnatClamp n))))
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrUnpack -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrPack -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrConcatMany -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrSubstTemplate -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNone -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs sols fuel v -> (if (fuel <= 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__162, dtb__163) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__162) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__164) dtb__163))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__165, dtb__166) -> ((fun s2 -> (match s2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__167, dtb__168) -> (match dtb__166 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__167) dtb__168) dtb__166))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, dtb__166))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__165))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__169, dtb__170) -> ((fun f2 -> (match f2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__171, dtb__172, dtb__173) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__173) dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__174, dtb__175) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__174, ((v_Base_dList_dappend dtb__175) (C_Base_dList_dList_Base_dList_dCons (dtb__170, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__176) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__176) dtb__170))))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f2, dtb__170))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__169))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__177) -> (match dtb__177 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__178, dtb__179) -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__178) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> (match ((v_Base_dHashMap_dlookup dtb__178) (v_Vuna_dCompiler_dCore_dTerm_dsolsDefVals sols)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__181) dtb__179))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__180)) dtb__179))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__178) dtb__179) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__182)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel defs sols fuel v -> (if (fuel <= 0) then v else (if (fuel <= 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__183) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel (fuel - 1)) defs) sols) fuel) dtb__183)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__184, dtb__185, dtb__186) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel (fuel - 1)) defs) sols) fuel) dtb__184) dtb__185) dtb__186)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__187, dtb__188) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel (fuel - 1)) defs) sols) fuel) dtb__187) dtb__188)
  | dtb__189 -> dtb__189
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel defs sols fuel scrut alts -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) scrut) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__190, dtb__191) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__190) dtb__191) alts))
  | dtb__192 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__192, alts))
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel defs sols fuel n -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__193, dtb__194, dtb__195) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__193, dtb__194, ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) fuel)) dtb__195)))))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__196, dtb__197) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__196) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__198)) sp2))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__196) sp2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__199) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) dtb__199)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__196, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) fuel)) dtb__197))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel defs sols fuel c th el -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) c) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__200) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) (if dtb__200 then th else el))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__201) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__201)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) el)))
  | dtb__202 -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__202, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) el)))
))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__203, dtb__204) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__206) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos ((C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__203)), dtb__204))) dtb__206)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ("_alt", C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name level -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (match dtb__207 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__209, dtb__210) -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__209) (mc1 + mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__208) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth level -> (if (level < depth) then ((depth - level) - 1) else (0 - 1)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__211, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__212)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel depth v -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__213) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__213))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__214, dtb__215, dtb__216, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__217), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__218) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__214) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__219, dtb__220, dtb__221) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__219, dtb__220, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__221) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__219) depth)))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__222) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel (fuel - 1)) depth) dtb__222)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__223, dtb__224) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__223))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__224))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__225, dtb__226) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__225, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__226)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__227, dtb__228) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__227), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__228), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__229, dtb__230) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__229), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__230)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__231) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__231))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__232) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__232))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__233) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__233))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__234, dtb__235, dtb__236) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__234), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__235), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__236)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel depth alt0 -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", C_Base_dList_dList_Base_dList_dNil, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))) else (match alt0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__237, dtb__238, dtb__239) -> ((fun n -> ((fun argVals -> ((fun body -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__237, dtb__238, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__239) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__238) depth) 0))) (v_Base_dList_dlength dtb__238))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel depth vs -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (match vs with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__240, dtb__241) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__240), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__241)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel depth n -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__242, dtb__243, dtb__244) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__242, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__243)))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__244))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__245, dtb__246) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__245))) ((v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__246))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__247, dtb__248, dtb__249) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__247), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__248), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__249)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__250, dtb__251) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__250), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__251)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__252, dtb__253) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__252, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__253)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__254, dtb__255, dtb__256) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__254), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__255), dtb__256))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__257, dtb__258, dtb__259) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__257, dtb__258, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__259)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__260, dtb__261, dtb__262, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__263), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__264)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__265) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__265) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__266) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__266))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__267, dtb__268, dtb__269) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__267, dtb__268, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__269)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__270, dtb__271, dtb__272) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__270), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__271), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__272)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__273, dtb__274) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__273), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__274)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__275, dtb__276) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__275, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__276)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__277), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__278), dtb__279))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__280, dtb__281, dtb__282) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__280, dtb__281, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__282)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__283, dtb__284, dtb__285, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__286), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__287)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__288) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__288) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__289) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__289)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__290, dtb__291, dtb__292) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__290, dtb__291, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__292)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) mc2)
))

let v_Vuna_dCompiler_dCore_dEval_disNilList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__293) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__293) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__293))))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__294) -> (match dtb__294 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__295, dtb__296) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__296) then dtb__295 else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__297, dtb__298, dtb__299) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__299) then dtb__297 else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__300, dtb__301) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__301) then ("?" ^ (bi_strFromInt dtb__300)) else (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__302, dtb__303) -> (match ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__302) dtb__303) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__304) -> (bi_strFromInt dtb__304)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__305, dtb__306, dtb__307) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__305), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__306), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__307)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__308, dtb__309) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__308), dtb__309))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__310, dtb__311) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__310, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__311)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__312, dtb__313, dtb__314) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__312), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__313), dtb__314))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__315, dtb__316, dtb__317) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__315, dtb__316, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) (mc1 + 1)) dtb__317)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__318, dtb__319, dtb__320, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__321), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) (mc1 + 1)) dtb__322)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__323) -> (match ((v_Base_dIntMap_dlookup dtb__323) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__324) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__324)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__325, dtb__326, dtb__327) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__325), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__326), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__327)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__328, dtb__329) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__328), ((v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl mc0)) dtb__329)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__330, dtb__331) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__330, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__331)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__332, dtb__333, dtb__334) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__332), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__333), dtb__334))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__335, dtb__336, dtb__337) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__335, dtb__336, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__337)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__338, dtb__339, dtb__340, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__341), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__342)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__343) -> (match ((v_Base_dIntMap_dlookup dtb__343) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__344) -> ((fun soln -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__344))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__345, dtb__346, dtb__347) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__345, dtb__346, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__347)))
  | _ -> failwith "DT: impossible branch"
))
