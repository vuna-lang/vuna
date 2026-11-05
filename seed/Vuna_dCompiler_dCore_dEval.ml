open Vuna_runtime
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv (mc0 - 1)) dtb__1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__2, dtb__3, dtb__4) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__2, dtb__3, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (mc0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt scrut env -> (match (match alt with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__7, dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> env
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (scrut, env))
))

let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__10) -> (if dtb__10 then mc1 else mc2)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (mc0, mc1, mc2))
))

let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__11, dtb__12) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__11, ((Base_dList.v_Base_dList_dappend dtb__12) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__13, dtb__14, ((Base_dList.v_Base_dList_dappend dtb__15) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel env t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__16, dtb__17) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__17) env) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> dtb__18
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__16, dtb__17, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__19) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__19, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__20) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__20, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__21) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__21))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__22, dtb__23, dtb__24, (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__25), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (env, dtb__26))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__27, dtb__28, dtb__29) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__27, dtb__28, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (env, dtb__29))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__30, dtb__31, dtb__32) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__30)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__31))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__33, dtb__34) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__33, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__34)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__35)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__36))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__37) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__37))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__38) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__39) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__39))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__40, dtb__41, dtb__42) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__40)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__41)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__42))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel env args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (match dtb__43 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__45), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__44)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__47, dtb__48) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) dtb__47) dtb__48) alts)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel c args alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> (if ((match dtb__49 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__51, dtb__52, dtb__53) -> dtb__51
  | _ -> failwith "DT: impossible branch"
) = c) then (match (match dtb__49 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__54, dtb__55, dtb__56) -> dtb__56
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__57, dtb__58) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse args)) dtb__57)) dtb__58)
  | _ -> failwith "DT: impossible branch"
) else (if ((match dtb__49 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__59, dtb__60, dtb__61) -> dtb__59
  | _ -> failwith "DT: impossible branch"
) = "") then (match (match dtb__49 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__62, dtb__63, dtb__64) -> dtb__64
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__65, dtb__66) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__49) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (c, args))) dtb__65)) dtb__66)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) c) args) dtb__50)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel f a -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__67, dtb__68) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__67, ((Base_dList.v_Base_dList_dappend dtb__68) (Base_dList.C_Base_dList_dList_Base_dList_dCons (a, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__69) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__69) a)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__70, dtb__71, dtb__72) -> (match dtb__72 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__73, dtb__74) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (a, dtb__73))) dtb__74)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f, a))
)) f)))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel 128) env) t))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c args alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__75, dtb__76) -> ((v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, dtb__75))) dtb__76)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__77)) dtb__78)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__79) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__79))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatMax = 4611686018427387903

let v_Vuna_dCompiler_dCore_dEval_dnatClamp = (fun n -> (if (n <= 0) then 0 else (if (n >= v_Vuna_dCompiler_dCore_dEval_dnatMax) then v_Vuna_dCompiler_dCore_dEval_dnatMax else n)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatAdd = (fun a b -> (if (a > (v_Vuna_dCompiler_dCore_dEval_dnatMax - b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a + b)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatMul = (fun a b -> (if (if (a <= 0) then true else (b <= 0)) then 0 else (if (a > (if b = 0 then failwith "division by zero" else v_Vuna_dCompiler_dCore_dEval_dnatMax / b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a * b))))

let v_Vuna_dCompiler_dCore_dEval_dnatTruncSub = (fun a b -> (if (a <= b) then 0 else (a - b)))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList_Base_dList_dCons (acc, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dCore_dEval_dnatValue = (fun n -> ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (v_Vuna_dCompiler_dCore_dEval_dnatClamp n)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueToInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__80, dtb__81) -> ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__80) dtb__81)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__82) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dCore_dEval_dnatCtorInt = (fun c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (match dtb__84 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__85) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd dtb__85) 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dCore_dEval_dasNat = (fun v -> (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt v))

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__86) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__87) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__88) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__90) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__92) dtb__93)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__95 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__94) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__96) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> (if (dtb__99 = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((if dtb__99 = 0 then failwith "division by zero" else dtb__98 / dtb__99))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dboolPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__101 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__100) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__102) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__105) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__104) dtb__105)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dprimConst = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (match dtb__109 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__106) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__108) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__111) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__110) dtb__111)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__112) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__114)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__115) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__117)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__118) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__122) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__120) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((mc1 dtb__122) dtb__123)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match dtb__127 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__124) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__126) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (if (dtb__129 <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dCore_dEval_dnatValue (if dtb__129 = 0 then failwith "division by zero" else dtb__128 / dtb__129)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__130) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((mc1 dtb__132)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrEq = (fun a b -> (a = b))

let v_Vuna_dCompiler_dCore_dEval_dcmpInt = (fun a b -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__133) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__134) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__133) dtb__134) then 0 else (if dtb__133 then 1 else (0 - 1)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__135) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__136) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((if (dtb__135 = dtb__136) then 0 else (if (dtb__135 < dtb__136) then (0 - 1) else 1))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__137) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__138) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__137) dtb__138)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__139) dtb__141) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((mc1 dtb__143)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim3 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__144) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__146) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__148) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((mc1 dtb__150) dtb__151) dtb__152)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__154) (((mc1 * 33) + dtb__153) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__153) / 1024) * 1024)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (if (mc1 <= 0) then dtb__155 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__156) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s i -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (Base_dList.dtp_unpack s)) i)))

let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match dtb__158 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> (match dtb__160 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__157) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__159) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__162) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__161) dtb__162)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dEval_dtakeBytes = (fun n xs -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match xs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__163, ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes (n - 1)) dtb__164)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_ddropBytes = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dCore_dEval_ddropBytes (n - 1)) dtb__166)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringBytes = (fun start len s -> ((fun n -> ((fun st -> ((fun ln -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes ln) ((v_Vuna_dCompiler_dCore_dEval_ddropBytes st) (Base_dList.dtp_unpack s))))) (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)))) (if (start < 0) then 0 else (if (start > n) then n else start)))) (bi_strLength s)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match dtb__170 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__167) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__169) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__171) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((((v_Vuna_dCompiler_dCore_dEval_dsubstringBytes dtb__173) dtb__174) dtb__175)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs sols fuel g sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (match (match dtb__176 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> dtb__179
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAdd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a + b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpSub -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a - b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpMul -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((a * b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpDiv -> (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a = b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((Base_dBool.v_Base_dBool_dnot (a = b))))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a < b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a <= b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a > b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((a >= b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpEqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNeqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o < 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpLeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o <= 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o > 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpGeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o >= 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpConcat -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((a ^ b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpAnd -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then b else false)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpOr -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool ((if a then true else b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((bi_strFromInt n)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrLength -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((bi_strLength s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrHash -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt ((v_Vuna_dCompiler_dCore_dEval_dstrHashOf s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrAt -> (v_Vuna_dCompiler_dCore_dEval_datPrim sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrSubstring -> (v_Vuna_dCompiler_dCore_dEval_dsubstringPrim sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrShow -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowCoreString s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatAdd -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatSub -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatTruncSub a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatMul -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatMul a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatDiv -> (v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatToInt -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (n))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (v_Vuna_dCompiler_dCore_dEval_dnatValue (v_Vuna_dCompiler_dCore_dEval_dnatClamp n))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrUnpack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrPack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrConcatMany -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpStrSubstTemplate -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_Vuna_dCompiler_dIntrinsics_dOpNone -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs sols fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__183, dtb__184) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__183) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__185) dtb__184))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__186, dtb__187) -> ((fun s2 -> (match s2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__188, dtb__189) -> (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__188) dtb__189) dtb__187))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (s2, dtb__187))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__186))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__190, dtb__191) -> ((fun f2 -> (match f2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__192, dtb__193, dtb__194) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__194) dtb__191))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__195, dtb__196) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__195, ((Base_dList.v_Base_dList_dappend dtb__196) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__191, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__197) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__197) dtb__191))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (f2, dtb__191))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__190))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__198) -> (match dtb__198 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__199, dtb__200) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__199) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__201) -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__199) (match sols with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__202, dtb__203, dtb__204, dtb__205) -> dtb__205
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__206) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__206) dtb__200))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__201)) dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__199) dtb__200) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__207) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__207)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel defs sols fuel v -> (if (fuel <= 0) then v else (if (fuel <= 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) fuel) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__208) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel (fuel - 1)) defs) sols) fuel) dtb__208)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__209, dtb__210, dtb__211) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel (fuel - 1)) defs) sols) fuel) dtb__209) dtb__210) dtb__211)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__212, dtb__213) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel (fuel - 1)) defs) sols) fuel) dtb__212) dtb__213)
  | dtb__214 -> dtb__214
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel defs sols fuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) scrut) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__215, dtb__216) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__215) dtb__216) alts))
  | dtb__217 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__217, alts))
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel defs sols fuel n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (n)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__218, dtb__219, dtb__220) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__218, dtb__219, ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) fuel)) dtb__220)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__221, dtb__222) -> ((fun sp2 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__221) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__223)) sp2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__221) sp2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) dtb__224)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__221, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) fuel)) dtb__222))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel defs sols fuel c th el -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) c) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__225) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) (if dtb__225 then th else el))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__226) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__226)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) el)))
  | dtb__227 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__227, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (fuel - 1)) el)))
))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__228, dtb__229) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__231) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__228)), dtb__229))) dtb__231)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ("_alt", Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> (match dtb__232 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, dtb__235) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__234) (mc1 + mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__233) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth level -> (if (level < depth) then ((depth - level) - 1) else (0 - 1)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc0, dtb__236, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) dtb__237)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel depth v -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__238) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__238))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__239, dtb__240, dtb__241, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__242), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__243) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__239) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__244, dtb__245, dtb__246) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__244, dtb__245, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__246) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__244) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__247) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel (fuel - 1)) depth) dtb__247)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__248, dtb__249) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__248))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__249))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__250, dtb__251) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__250, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__251)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__252, dtb__253) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__252), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__253), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__254, dtb__255) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__254), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__255)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__256) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__256))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__257) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__257))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__258) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__258))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__259, dtb__260, dtb__261) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__259), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__260), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__261)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel depth alt0 -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", Base_dList.C_Base_dList_dList_Base_dList_dNil, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))) else (match alt0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__262, dtb__263, dtb__264) -> ((fun n -> ((fun argVals -> ((fun body -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__262, dtb__263, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__264) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__263) depth) 0))) (Base_dList.v_Base_dList_dlength dtb__263))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel depth vs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match vs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__265), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__266)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel depth n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__267, dtb__268, dtb__269) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__267, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__268)))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__269))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__270, dtb__271) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__270))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__271))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__272, dtb__273, dtb__274) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__272), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__273), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__274)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__275, dtb__276) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__275), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__276)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__277, dtb__278) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__277, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__278)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__279, dtb__280, dtb__281) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__279), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__280), dtb__281))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__282, dtb__283, dtb__284) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__282, dtb__283, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__284)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__285, dtb__286, dtb__287, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__288), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__289)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__290) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__290) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__291) -> ((fun soln -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__291))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__292, dtb__293, dtb__294) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__292, dtb__293, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__294)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__295, dtb__296, dtb__297) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__295), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__296), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__297)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__298, dtb__299) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__298), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__299)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__300, dtb__301) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__300, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__301)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__302, dtb__303, dtb__304) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__302), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__303), dtb__304))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__305, dtb__306, dtb__307) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__305, dtb__306, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__307)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__308, dtb__309, dtb__310, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__311), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__312)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__313) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__313) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__314) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__314)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__315, dtb__316, dtb__317) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__315, dtb__316, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__317)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) mc2)
))

let v_Vuna_dCompiler_dCore_dEval_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__318) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__318) = 0) then "Type" else ("Type " ^ (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__318))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__319) -> (match dtb__319 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__320, dtb__321) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__321) then dtb__320 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__322, dtb__323, dtb__324) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__324) then dtb__322 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__325, dtb__326) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__326) then ("?" ^ (bi_strFromInt dtb__325)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__327, dtb__328) -> (match ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__327) dtb__328) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__329) -> (bi_strFromInt dtb__329)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__330, dtb__331, dtb__332) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__330), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__331), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__332)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__333, dtb__334) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__333), dtb__334))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__335, dtb__336) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__335, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__336)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__337, dtb__338, dtb__339) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__337), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__338), dtb__339))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__340, dtb__341, dtb__342) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__340, dtb__341, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) (mc1 + 1)) dtb__342)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__343, dtb__344, dtb__345, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) mc1) dtb__346), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl mc0) (mc1 + 1)) dtb__347)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__348) -> (match ((Base_dIntMap.v_Base_dIntMap_dlookup dtb__348) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__349) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__349)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__350, dtb__351, dtb__352) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__350), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__351), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__352)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__353, dtb__354) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__353), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl mc0)) dtb__354)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__355, dtb__356) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__355, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__356)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__357, dtb__358, dtb__359) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__357), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__358), dtb__359))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__360, dtb__361, dtb__362) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__360, dtb__361, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__362)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__363, dtb__364, dtb__365, dtb__366, dtb__367) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__363, dtb__364, dtb__365, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__366), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__367)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__368) -> (match ((Base_dIntMap.v_Base_dIntMap_dlookup dtb__368) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__369) -> ((fun soln -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__369))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltTbl = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__370, dtb__371, dtb__372) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__370, dtb__371, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasTbl mc0) dtb__372)))
  | _ -> failwith "DT: impossible branch"
))
