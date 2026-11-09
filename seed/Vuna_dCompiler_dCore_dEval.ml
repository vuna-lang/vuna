open Vuna_runtime
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv (mc0 - 1)) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_devalAlt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__2, dtb__3, dtb__4) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__2, dtb__3, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (mc0, dtb__4))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_devalAlt mc0) dtb__5), ((v_Vuna_dCompiler_dCore_dEval_devalAlts mc0) dtb__6)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv = (fun alt scrut env -> (match (match alt with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__7, dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Nil -> env
  | _ -> (Base_dList.C_Base_dList_dList_Cons (scrut, env))
))

let v_Vuna_dCompiler_dCore_dEval_devalIf = (fun mc0 mc1 mc2 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__10) -> (if dtb__10 then mc1 else mc2)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (mc0, mc1, mc2))
))

let v_Vuna_dCompiler_dCore_dEval_dspineAppend = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__11, dtb__12) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__11, ((Base_dList.v_Base_dList_dappend dtb__12) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__13, dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__13, dtb__14, ((Base_dList.v_Base_dList_dappend dtb__15) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel env t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__16, dtb__17) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__17) env) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> dtb__18
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__16, dtb__17, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__19) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__19, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__20) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__20, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__21) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__21))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__22, dtb__23, dtb__24, (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__25), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (env, dtb__26))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__27, dtb__28, dtb__29) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__27, dtb__28, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (env, dtb__29))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__30)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__31))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__33, dtb__34) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__33, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__34)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__35)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__36))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__37) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__37))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__38) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__38))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__39) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__39))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__40) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__40))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__41, dtb__42, dtb__43) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__41)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__42)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__43))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel env args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__46, dtb__47) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__46), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__48, dtb__49) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) dtb__48) dtb__49) alts)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel c args alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args)), Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((match dtb__50 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__52, dtb__53, dtb__54) -> dtb__52
  | _ -> failwith "DT: impossible branch"
) = c) then (match (match dtb__50 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__55, dtb__56, dtb__57) -> dtb__57
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__58, dtb__59) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse args)) dtb__58)) dtb__59)
  | _ -> failwith "DT: impossible branch"
) else (if ((match dtb__50 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__60, dtb__61, dtb__62) -> dtb__60
  | _ -> failwith "DT: impossible branch"
) = "") then (match (match dtb__50 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__66, dtb__67) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__50) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args))) dtb__66)) dtb__67)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) c) args) dtb__51)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel f a -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__68, dtb__69) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__68, ((Base_dList.v_Base_dList_dappend dtb__69) (Base_dList.C_Base_dList_dList_Cons (a, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, dtb__72) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__74 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__71 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName) then (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) dtb__73) a) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, (Base_dList.C_Base_dList_dList_Cons (dtb__73, Base_dList.C_Base_dList_dList_Nil))))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__70) a)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__71 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName) then a else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, Base_dList.C_Base_dList_dList_Nil))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__70) a)))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__70) a)))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__75, dtb__76, dtb__77) -> (match dtb__77 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__78, dtb__79) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons (a, dtb__78))) dtb__79)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f, a))
)) f)))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel 128) env) t))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c args alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__80, dtb__81) -> ((v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__80))) dtb__81)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__82)) dtb__83)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__84) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatMax = 4611686018427387903

let v_Vuna_dCompiler_dCore_dEval_dnatClamp = (fun n -> (if (n <= 0) then 0 else (if (n >= v_Vuna_dCompiler_dCore_dEval_dnatMax) then v_Vuna_dCompiler_dCore_dEval_dnatMax else n)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatAdd = (fun a b -> (if (a > (v_Vuna_dCompiler_dCore_dEval_dnatMax - b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a + b)))

let v_Vuna_dCompiler_dCore_dEval_dnatSatMul = (fun a b -> (if (if (a <= 0) then true else (b <= 0)) then 0 else (if (a > (if b = 0 then failwith "division by zero" else v_Vuna_dCompiler_dCore_dEval_dnatMax / b)) then v_Vuna_dCompiler_dCore_dEval_dnatMax else (a * b))))

let v_Vuna_dCompiler_dCore_dEval_dnatTruncSub = (fun a b -> (if (a <= b) then 0 else (a - b)))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList_Cons (acc, Base_dList.C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dCore_dEval_dnatValue = (fun n -> ((v_Vuna_dCompiler_dCore_dEval_dnatValueGo (v_Vuna_dCompiler_dCore_dEval_dnatClamp n)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dCore_dEval_dnatValueToInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__85, dtb__86) -> ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__85) dtb__86)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__87) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dCore_dEval_dnatCtorInt = (fun c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt dtb__88) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd dtb__90) 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

let v_Vuna_dCompiler_dCore_dEval_dasNat = (fun v -> (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt v))

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__91) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__92) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (match dtb__94 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__93) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__95) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__97) dtb__98)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__100 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__99) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__101) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (if (dtb__104 = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((if dtb__104 = 0 then failwith "division by zero" else dtb__103 / dtb__104))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dboolPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (match dtb__106 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__109) dtb__110)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dprimConst = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc1))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__111) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__113) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__115) dtb__116)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__117) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__119)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__120) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__122)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__126 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__123) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__125) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__127) dtb__128)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match dtb__132 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__129) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__131) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__134) -> (if (dtb__134 <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dEval_dnatValue (if dtb__134 = 0 then failwith "division by zero" else dtb__133 / dtb__134)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__135) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__137)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrEq = (fun a b -> (a = b))

let v_Vuna_dCompiler_dCore_dEval_dcmpInt = (fun a b -> (if (a = b) then 0 else (if (a < b) then (0 - 1) else 1)))

let v_Vuna_dCompiler_dCore_dEval_dgenericCmp = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__138) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__139) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__138) dtb__139) then 0 else (if dtb__138 then 1 else (0 - 1)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__140) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__141) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (dtb__140 = dtb__141) then 0 else (if (dtb__140 < dtb__141) then (0 - 1) else 1))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__142) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__143) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__142) dtb__143)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__144) dtb__146) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__148) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((mc1 dtb__148)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dstrPrim3 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (match dtb__150 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match dtb__154 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__149) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__151) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__153) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((mc1 dtb__155) dtb__156) dtb__157)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel = (fun fuel a b -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__158) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__159) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__158) dtb__159)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__160) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__161) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__160 = dtb__161)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__162) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__163) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dstrEq dtb__162) dtb__163)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__164) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__165) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__164 = dtb__165)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__166) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__167) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__166) dtb__167)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__168, dtb__169) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__170, dtb__171) -> (if (dtb__168 = dtb__170) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (fuel - 1)) dtb__169) dtb__171) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__172) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__173) -> (((v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel (fuel - 1)) dtb__172) dtb__173)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
and v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__174, dtb__175, dtb__176) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__177, dtb__178, dtb__179) -> (if (if (dtb__174 = dtb__177) then (dtb__175 = dtb__178) else false) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__176) dtb__179) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__180, dtb__181) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__182, dtb__183) -> (if (dtb__180 = dtb__182) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__181) dtb__183) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (if dtb__188 then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel mc0) dtb__185) dtb__187) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel mc0) dtb__184) dtb__186))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__190) (((mc1 * 33) + dtb__189) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__189) / 1024) * 1024)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (if (mc1 <= 0) then dtb__191 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__192) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s i -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (Base_dList.dtp_unpack s)) i)))

let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__196 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__193) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__197) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__195) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__198) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__197) dtb__198)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dEval_dtakeBytes = (fun n xs -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (Base_dList.C_Base_dList_dList_Cons (dtb__199, ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes (n - 1)) dtb__200)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_ddropBytes = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__201, dtb__202) -> ((v_Vuna_dCompiler_dCore_dEval_ddropBytes (n - 1)) dtb__202)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringBytes = (fun start len s -> ((fun n -> ((fun st -> ((fun ln -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes ln) ((v_Vuna_dCompiler_dCore_dEval_ddropBytes st) (Base_dList.dtp_unpack s))))) (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)))) (if (start < 0) then 0 else (if (start > n) then n else start)))) (bi_strLength s)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__205, dtb__206) -> (match dtb__206 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match dtb__208 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__203) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__205) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__207) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((((v_Vuna_dCompiler_dCore_dEval_dsubstringBytes dtb__209) dtb__210) dtb__211)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dEval_dforce = (fun defs sols fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__212, dtb__213) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__212) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__214) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__214) dtb__213))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__215, dtb__216) -> ((fun s2 -> (match s2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__217, dtb__218) -> (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__217) dtb__218) dtb__216))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, dtb__216))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__215))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__219, dtb__220) -> ((fun f2 -> (match f2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__221, dtb__222, dtb__223) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__223) dtb__220))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__224, dtb__225) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__224, ((Base_dList.v_Base_dList_dappend dtb__225) (Base_dList.C_Base_dList_dList_Cons (dtb__220, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__226) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__226) dtb__220))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f2, dtb__220))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__219))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__227) -> (match dtb__227 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__228, dtb__229) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__228) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__228) (match sols with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__231, dtb__232, dtb__233, dtb__234) -> dtb__234
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__235) dtb__229))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__230)) dtb__229))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__228) dtb__229) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__236)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))
and v_Vuna_dCompiler_dCore_dEval_drowRemReduce = (fun defs sols fuel e r -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__237, dtb__238) -> (if (dtb__237 = "Base.Eff.Row.Cons") then (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (match dtb__240 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (if dtb__243 then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241)) else (match (((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) e) dtb__241) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__244) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ("Base.Eff.Row.Cons", (Base_dList.C_Base_dList_dList_Cons (dtb__239, (Base_dList.C_Base_dList_dList_Cons (dtb__244, Base_dList.C_Base_dList_dList_Nil))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel (fuel - 1)) e) dtb__239))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (dtb__237 = "Base.Eff.Row.Nil") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ("Base.Eff.Row.Nil", Base_dList.C_Base_dList_dList_Nil)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) r))))
and v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs sols fuel g sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (g = "Base.Eff.rowRem") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__246 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) dtb__245) dtb__247)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp) else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> (match (match dtb__249 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Intrinsic (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> dtb__252
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpAdd -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a + b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpSub -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a - b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpMul -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((a * b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpDiv -> (v_Vuna_dCompiler_dCore_dEval_dintPrim2Div sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpEqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a = b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNeqInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((Base_dBool.v_Base_dBool_dnot (a = b))))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a < b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a <= b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGtInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a > b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGeInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((a >= b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpEqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNeqStr -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dCore_dEval_dstrEq a) b))))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o < 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o <= 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGtGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o > 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGeGeneric -> ((v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 sp) (fun o -> (o >= 0)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpConcat -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((a ^ b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpAnd -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((if a then b else false)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpOr -> ((v_Vuna_dCompiler_dCore_dEval_dboolPrim2 sp) (fun a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((if a then true else b)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((bi_strFromInt n)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrLength -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((bi_strLength s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrHash -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((v_Vuna_dCompiler_dCore_dEval_dstrHashOf s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrAt -> (v_Vuna_dCompiler_dCore_dEval_datPrim sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrSubstring -> (v_Vuna_dCompiler_dCore_dEval_dsubstringPrim sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrShow -> ((v_Vuna_dCompiler_dCore_dEval_dstrPrim1 sp) (fun s -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowCoreString s)))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatAdd -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatSub -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatTruncSub a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatMul -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim2 sp) (fun a b -> (v_Vuna_dCompiler_dCore_dEval_dnatValue ((v_Vuna_dCompiler_dCore_dEval_dnatSatMul a) b))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatDiv -> (v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatToInt -> ((v_Vuna_dCompiler_dCore_dEval_dnatPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (n))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (v_Vuna_dCompiler_dCore_dEval_dnatValue (v_Vuna_dCompiler_dCore_dEval_dnatClamp n))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrUnpack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrPack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrConcatMany -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrSubstTemplate -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpIdentity -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (match dtb__257 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNone -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel = (fun fuel defs sols evalFuel v -> (if (fuel <= 0) then v else (if (evalFuel <= 0) then v else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) evalFuel) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__258) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel (fuel - 1)) defs) sols) evalFuel) dtb__258)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__259, dtb__260, dtb__261) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel (fuel - 1)) defs) sols) evalFuel) dtb__259) dtb__260) dtb__261)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__262, dtb__263) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel (fuel - 1)) defs) sols) evalFuel) dtb__262) dtb__263)
  | dtb__264 -> dtb__264
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel defs sols evalFuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) scrut) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__265, dtb__266) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__265) dtb__266) alts))
  | dtb__267 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__267, alts))
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel defs sols evalFuel n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__268, dtb__269, dtb__270) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__268, dtb__269, ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__270)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__271, dtb__272) -> ((fun sp2 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__271) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__273) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__273)) sp2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (evalFuel - 1)) dtb__271) sp2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__274)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__271, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__272))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel defs sols evalFuel c th el -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) c) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__275) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (if dtb__275 then th else el))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__276) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__276)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
  | dtb__277 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__277, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__278, dtb__279) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__280, dtb__281) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure ((Base_dList.C_Base_dList_dList_Cons (dtb__280, dtb__278)), dtb__279))) dtb__281)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ("_alt", Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (match dtb__282 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__284, dtb__285) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__284) (mc1 + mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__283) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth level -> (if (level < depth) then ((depth - level) - 1) else (0 - 1)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__286, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))) dtb__287)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel depth v -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__288) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__288))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__289, dtb__290, dtb__291, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__292), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__293) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__289) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__294, dtb__295, dtb__296) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__294, dtb__295, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__296) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__294) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__297) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel (fuel - 1)) depth) dtb__297)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__298, dtb__299) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__298))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__299))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__300, dtb__301) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__300, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__301)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__302, dtb__303) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__302), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__303), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__304, dtb__305) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__304), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__305)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__306) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__306))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__307) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__307))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__308) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__308))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__309) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__309))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__310, dtb__311, dtb__312) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__310), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__311), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__312)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel depth alt0 -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ("", Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))) else (match alt0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__313, dtb__314, dtb__315) -> ((fun n -> ((fun argVals -> ((fun body -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__313, dtb__314, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__315) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__314) depth) 0))) (Base_dList.v_Base_dList_dlength dtb__314))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel depth vs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__316), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__317)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel depth n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__318, dtb__319, dtb__320) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__318, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__319)))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__320))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__321, dtb__322) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__321))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__322))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__323, dtb__324, dtb__325) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__323), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__324), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__325)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__326), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__327)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__328, dtb__329) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__328, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__329)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__330, dtb__331, dtb__332) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__330), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__331), dtb__332))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__333, dtb__334, dtb__335) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__333, dtb__334, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__335)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__336, dtb__337, dtb__338, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__339), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__340)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__341) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__341) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__342) -> ((fun soln -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__342))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__343, dtb__344, dtb__345) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__343, dtb__344, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__345)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__346, dtb__347, dtb__348) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__346), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__347), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__348)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__349, dtb__350) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__349), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__350)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__351, dtb__352) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__351, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__352)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__353, dtb__354, dtb__355) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__353), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__354), dtb__355))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__356, dtb__357, dtb__358) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__356, dtb__357, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__358)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__359, dtb__360, dtb__361, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__362), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__363)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__364) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__364) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__365) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__365)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__366, dtb__367, dtb__368) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__366, dtb__367, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__368)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) mc2)
))

let v_Vuna_dCompiler_dCore_dEval_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dEval_dshowValueAt = (fun depth v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__369) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__369) = 0) then "Type" else ("Type " ^ (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__369))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__370) -> (match dtb__370 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__371, dtb__372) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__372) then dtb__371 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__373, dtb__374, dtb__375) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__375) then dtb__373 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__376, dtb__377) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__377) then ("?" ^ (bi_strFromInt dtb__376)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__378, dtb__379) -> (match ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__378) dtb__379) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__380) -> (bi_strFromInt dtb__380)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v))
))

let v_Vuna_dCompiler_dCore_dEval_dshowValue = (fun v -> ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt 0) v))

let v_Vuna_dCompiler_dCore_dEval_dnormalize = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeCase = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel 1024) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel 1024) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCore_dEval_dnormalizeIf = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel 1024) a1) a2) a3) a4) a5) a6))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel = (fun fuel sols depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__381) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__381) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> t
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__382) -> ((fun q -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar q) then t else ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__383, dtb__384, dtb__385, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__386), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__387)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__388, dtb__389, dtb__390) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__388, dtb__389, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__390)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__391, dtb__392, dtb__393) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__391), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__392), dtb__393))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__394, dtb__395) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__394, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__395)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__396, dtb__397) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__396), ((Base_dList.v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl (fuel - 1)) sols) depth)) dtb__397)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__398, dtb__399, dtb__400) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__398), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__399), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__400)))
  | _ -> t
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__401, dtb__402, dtb__403) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__401, dtb__402, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__402))) dtb__403)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun sols depth t -> ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel 128) sols) depth) t))
