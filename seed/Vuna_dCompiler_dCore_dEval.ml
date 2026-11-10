open Vuna_runtime
let rec v_Vuna_dCompiler_dCore_dEval_dlookupEnv = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0)) else ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv (mc0 - 1)) dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_devalFuelMax = 1000000

let v_Vuna_dCompiler_dCore_dEval_devalFuelFor = (fun t -> ((fun need -> (if (need > v_Vuna_dCompiler_dCore_dEval_devalFuelMax) then v_Vuna_dCompiler_dCore_dEval_devalFuelMax else need)) (128 + (4 * (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t)))))

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

let v_Vuna_dCompiler_dCore_dEval_dasInt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__16) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__17, dtb__18) -> ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__17) dtb__18)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__19) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dCore_dEval_dnatCtorInt = (fun c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt dtb__20) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dnatSatAdd dtb__22) 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

let v_Vuna_dCompiler_dCore_dEval_dasNat = (fun v -> (v_Vuna_dCompiler_dCore_dEval_dnatValueToInt v))

let rec v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (if (if (dtb__23 >= 48) then (dtb__23 <= 57) else false) then ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars dtb__24) ((mc1 * 10) + (dtb__23 - 48))) else ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars dtb__24) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_ddigitsOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dpow10Of = (fun n -> (if (n <= 0) then 1 else (if (n > 18) then 1000000000000000000 else ((v_Vuna_dCompiler_dCore_dEval_dpow10Of (n - 1)) * 10))))

let v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw = (fun raw -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__28 with
  | Base_dList.C_Base_dList_dList_Nil -> ((float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf (dtb__25 ^ dtb__27))) /. (float_of_int (v_Vuna_dCompiler_dCore_dEval_dpow10Of (bi_strLength dtb__27))))
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)
  | _ -> (float_of_int (v_Vuna_dCompiler_dCore_dEval_ddigitsOf raw))
)) ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnChar 46) raw)))

let v_Vuna_dCompiler_dCore_dEval_dshowFloatOf = (fun x -> (string_of_float x))

let v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw = (fun raw -> (v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw raw)))

let rec v_Vuna_dCompiler_dCore_dEval_devalFuel = (fun fuel env t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__29, dtb__30) -> (match ((v_Vuna_dCompiler_dCore_dEval_dlookupEnv dtb__30) env) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> dtb__31
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__29, dtb__30, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__32) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__32, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__33) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__33, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__34) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__34))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__35, dtb__36, dtb__37, (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__38), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (env, dtb__39))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__40, dtb__41, dtb__42) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__40, dtb__41, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (env, dtb__42))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__43, dtb__44, dtb__45) -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__43)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__44))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__46, dtb__47) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__46, (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__47)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__48, dtb__49) -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__48)) ((v_Vuna_dCompiler_dCore_dEval_devalAlts env) dtb__49))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__50) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__50))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__51) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__51))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__52) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw dtb__52)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__53) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__53))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__54, dtb__55, dtb__56) -> (((v_Vuna_dCompiler_dCore_dEval_devalIf (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__54)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__55)) (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__56))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel = (fun fuel env args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__59, dtb__60) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) env) dtb__59), (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel (fuel - 1)) env) dtb__58)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) args)))
and v_Vuna_dCompiler_dCore_dEval_devalCaseFuel = (fun fuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match scrut with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__61, dtb__62) -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) dtb__61) dtb__62) alts)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts))
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel = (fun fuel c args alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match alts with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args)), Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if ((match dtb__63 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__65, dtb__66, dtb__67) -> dtb__65
  | _ -> failwith "DT: impossible branch"
) = c) then (match (match dtb__63 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__68, dtb__69, dtb__70) -> dtb__70
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__71, dtb__72) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse args)) dtb__71)) dtb__72)
  | _ -> failwith "DT: impossible branch"
) else (if ((match dtb__63 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__73, dtb__74, dtb__75) -> dtb__73
  | _ -> failwith "DT: impossible branch"
) = "") then (match (match dtb__63 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__76, dtb__77, dtb__78) -> dtb__78
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__79, dtb__80) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv dtb__63) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (c, args))) dtb__79)) dtb__80)
  | _ -> failwith "DT: impossible branch"
) else ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel (fuel - 1)) c) args) dtb__64)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel = (fun fuel f a -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__81, dtb__82) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__81, ((Base_dList.v_Base_dList_dappend dtb__82) (Base_dList.C_Base_dList_dList_Cons (a, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__83) -> (match dtb__83 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__84 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName) then (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel (fuel - 1)) dtb__86) a) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__84, (Base_dList.C_Base_dList_dList_Cons (dtb__86, Base_dList.C_Base_dList_dList_Nil))))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__83) a)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__84 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEraseName) then a else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__84, Base_dList.C_Base_dList_dList_Nil))) a))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__83) a)))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__83) a)))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__88, dtb__89, dtb__90) -> (match dtb__90 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__91, dtb__92) -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons (a, dtb__91))) dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f, a))
)) f)))

let v_Vuna_dCompiler_dCore_dEval_deval = (fun env t -> (((v_Vuna_dCompiler_dCore_dEval_devalFuel (v_Vuna_dCompiler_dCore_dEval_devalFuelFor t)) env) t))

let v_Vuna_dCompiler_dCore_dEval_devalArgTerms = (fun env args -> (((v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel 128) env) args))

let v_Vuna_dCompiler_dCore_dEval_devalCase = (fun scrut alts -> (((v_Vuna_dCompiler_dCore_dEval_devalCaseFuel 128) scrut) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt = (fun c args alts -> ((((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel 128) c) args) alts))

let v_Vuna_dCompiler_dCore_dEval_dapplyValue = (fun f a -> (((v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel 128) f) a))

let v_Vuna_dCompiler_dCore_dEval_dapplyClosure = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__93, dtb__94) -> ((v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__93))) dtb__94)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dapplySpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__95)) dtb__96)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dasFloat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__97) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw dtb__97)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__98) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (mc1 dtb__100))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__104 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__101) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__103) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf ((mc1 dtb__105) dtb__106))))))
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

let v_Vuna_dCompiler_dCore_dEval_dfloatBool2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (match (v_Vuna_dCompiler_dCore_dEval_dasFloat dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (((mc1 dtb__111) dtb__112)))))
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

let v_Vuna_dCompiler_dCore_dEval_dasStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__113) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dasBool = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dintPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__116 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__115) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__117) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__119) dtb__120)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__121) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__123) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> (if (dtb__126 = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((if dtb__126 = 0 then failwith "division by zero" else dtb__125 / dtb__126))))))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__127) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131) -> (match (v_Vuna_dCompiler_dCore_dEval_dasBool dtb__129) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__131) dtb__132)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match dtb__134 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__133) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__135) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__137) dtb__138)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__139) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__141)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim1 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__142) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__144) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__144)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dnatPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__146 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__148 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__145) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__147) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((mc1 dtb__149) dtb__150)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match dtb__154 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__151) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (match (v_Vuna_dCompiler_dCore_dEval_dasNat dtb__153) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> (if (dtb__156 <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dEval_dnatValue (if dtb__156 = 0 then failwith "division by zero" else dtb__155 / dtb__156)))))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (match dtb__158 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__157) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((mc1 dtb__159)))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__160) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__161) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__160) dtb__161) then 0 else (if dtb__160 then 1 else (0 - 1)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__162) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__163) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((if (dtb__162 = dtb__163) then 0 else (if (dtb__162 < dtb__163) then (0 - 1) else 1))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__164) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__165) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dcmpInt dtb__164) dtb__165)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCore_dEval_dgenericPrim2 = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__169 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dEval_dgenericCmp dtb__166) dtb__168) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool ((mc1 dtb__170)))))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__171) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__173) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__175) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((mc1 dtb__177) dtb__178) dtb__179)))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__180) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__181) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__180) dtb__181)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__182) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__183) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__182 = dtb__183)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__184) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__185) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dCore_dEval_dstrEq dtb__184) dtb__185)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__186) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__187) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__186 = dtb__187)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__188) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__189) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__188) dtb__189)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__190, dtb__191) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__192, dtb__193) -> (if (dtb__190 = dtb__192) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (fuel - 1)) dtb__191) dtb__193) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__194) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__195) -> (((v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel (fuel - 1)) dtb__194) dtb__195)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
and v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__196, dtb__197, dtb__198) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__199, dtb__200, dtb__201) -> (if (if (dtb__196 = dtb__199) then (dtb__197 = dtb__200) else false) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__198) dtb__201) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__202, dtb__203) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__204, dtb__205) -> (if (dtb__202 = dtb__204) then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel (mc0 - 1)) dtb__203) dtb__205) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (if dtb__210 then (((v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel mc0) dtb__207) dtb__209) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel mc0) dtb__206) dtb__208))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (true))
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dstrHashChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars dtb__212) (((mc1 * 33) + dtb__211) - ((if 1024 = 0 then failwith "division by zero" else ((mc1 * 33) + dtb__211) / 1024) * 1024)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrHashOf = (fun s -> ((v_Vuna_dCompiler_dCore_dEval_dstrHashChars (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dCore_dEval_dnthByte = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (if (mc1 <= 0) then dtb__213 else ((v_Vuna_dCompiler_dCore_dEval_dnthByte dtb__214) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dstrAtBytes = (fun s i -> (if (if (i < 0) then true else (i >= (bi_strLength s))) then (0 - 1) else ((v_Vuna_dCompiler_dCore_dEval_dnthByte (Base_dList.dtp_unpack s)) i)))

let v_Vuna_dCompiler_dCore_dEval_datPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__218 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__215) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__217) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (((v_Vuna_dCompiler_dCore_dEval_dstrAtBytes dtb__219) dtb__220)))))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (Base_dList.C_Base_dList_dList_Cons (dtb__221, ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes (n - 1)) dtb__222)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dEval_ddropBytes = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> ((v_Vuna_dCompiler_dCore_dEval_ddropBytes (n - 1)) dtb__224)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringBytes = (fun start len s -> ((fun n -> ((fun st -> ((fun ln -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dCore_dEval_dtakeBytes ln) ((v_Vuna_dCompiler_dCore_dEval_ddropBytes st) (Base_dList.dtp_unpack s))))) (if (len < 0) then 0 else (if ((st + len) > n) then (n - st) else len)))) (if (start < 0) then 0 else (if (start > n) then n else start)))) (bi_strLength s)))

let v_Vuna_dCompiler_dCore_dEval_dsubstringPrim = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match dtb__230 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__225) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> (match (v_Vuna_dCompiler_dCore_dEval_dasInt dtb__227) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (match (v_Vuna_dCompiler_dCore_dEval_dasStr dtb__229) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__233) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((((v_Vuna_dCompiler_dCore_dEval_dsubstringBytes dtb__231) dtb__232) dtb__233)))))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__234, dtb__235) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__234) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__236) dtb__235))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__237, dtb__238) -> ((fun s2 -> (match s2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__239, dtb__240) -> (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__239) dtb__240) dtb__238))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (s2, dtb__238))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__237))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__241, dtb__242) -> ((fun f2 -> (match f2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__243, dtb__244, dtb__245) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__245) dtb__242))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__246, dtb__247) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__246, ((Base_dList.v_Base_dList_dappend dtb__247) (Base_dList.C_Base_dList_dList_Cons (dtb__242, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__248) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (((v_Vuna_dCompiler_dCore_dEval_dspineAppend dtb__248) dtb__242))))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (f2, dtb__242))
)) ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__241))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__249) -> (match dtb__249 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__250, dtb__251) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__250) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__252) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__250) (match sols with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__256
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__257) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__257) dtb__251))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__252)) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (fuel - 1)) dtb__250) dtb__251) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__258) -> ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) dtb__258)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> v
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> v
)
  | _ -> v
)))
and v_Vuna_dCompiler_dCore_dEval_drowRemReduce = (fun defs sols fuel n e r -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) n) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) (fuel - 1)) r) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__259, dtb__260) -> (if (dtb__259 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor, Base_dList.C_Base_dList_dList_Nil)))) else (if (dtb__259 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__262) -> (match dtb__262 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) dtb__261) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__267) -> (if dtb__267 then ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> (if dtb__268 then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265)) else (match ((((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) n) e) dtb__265) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList_Cons (dtb__261, (Base_dList.C_Base_dList_dList_Cons (dtb__263, (Base_dList.C_Base_dList_dList_Cons (dtb__269, Base_dList.C_Base_dList_dList_Nil))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel (fuel - 1)) e) dtb__263)) else (match ((((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) n) e) dtb__265) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor, (Base_dList.C_Base_dList_dList_Cons (dtb__261, (Base_dList.C_Base_dList_dList_Cons (dtb__263, (Base_dList.C_Base_dList_dList_Cons (dtb__270, Base_dList.C_Base_dList_dList_Nil))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel (fuel - 1)) n) dtb__261)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__260) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))))
and v_Vuna_dCompiler_dCore_dEval_dprimReduce = (fun defs sols fuel g sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowRemName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match dtb__272 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (match dtb__274 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> ((((((v_Vuna_dCompiler_dCore_dEval_drowRemReduce defs) sols) (fuel - 1)) dtb__271) dtb__273) dtb__275)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp) else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> (match (match dtb__277 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Intrinsic (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> dtb__280
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
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpAddF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a +. b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpSubF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a -. b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpMulF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a *. b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpDivF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim2 sp) (fun a b -> (a /. b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpEqF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a = b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpNeqF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a <> b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLtF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a < b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpLeF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a <= b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGtF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a > b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpGeF -> ((v_Vuna_dCompiler_dCore_dEval_dfloatBool2 sp) (fun a b -> (a >= b)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpFloatAbs -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 sp) abs_float)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpFloatSqrt -> ((v_Vuna_dCompiler_dCore_dEval_dfloatPrim1 sp) sqrt)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrFromFloat -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__284, dtb__285) -> (match dtb__284 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__286) -> (match dtb__285 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr ((v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw dtb__286)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpFloatFromInt -> ((v_Vuna_dCompiler_dCore_dEval_dintPrim1 sp) (fun n -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat ((v_Vuna_dCompiler_dCore_dEval_dshowFloatOf (float_of_int n))))))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpIntFromFloat -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__287, dtb__288) -> (match dtb__287 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__289) -> (match dtb__288 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt ((int_of_float (v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw dtb__289))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) sp)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrUnpack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrPack -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrConcatMany -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpStrSubstTemplate -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsicOp_OpIdentity -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__290, dtb__291) -> (match dtb__291 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__292) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel (fuel - 1)) defs) sols) evalFuel) dtb__292)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__293, dtb__294, dtb__295) -> (((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel (fuel - 1)) defs) sols) evalFuel) dtb__293) dtb__294) dtb__295)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__296, dtb__297) -> ((((((v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel (fuel - 1)) defs) sols) evalFuel) dtb__296) dtb__297)
  | dtb__298 -> dtb__298
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel = (fun fuel defs sols evalFuel scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (scrut, alts)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) scrut) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__299, dtb__300) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (((v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt dtb__299) dtb__300) alts))
  | dtb__301 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__301, alts))
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel = (fun fuel defs sols evalFuel n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (n)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__302, dtb__303, dtb__304) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__302, dtb__303, ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__304)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__305, dtb__306) -> ((fun sp2 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup dtb__305) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__307) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplySpine ((v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__307)) sp2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dCore_dEval_dprimReduce defs) sols) (evalFuel - 1)) dtb__305) sp2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) dtb__308)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__305, sp2))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) evalFuel)) dtb__306))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel = (fun fuel defs sols evalFuel c th el -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (if (evalFuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (c, th, el)) else (match (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) c) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__309) -> (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) (if dtb__309 then th else el))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__310) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__310)), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
  | dtb__311 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__311, (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) th), (((((v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel (fuel - 1)) defs) sols) (evalFuel - 1)) el)))
))))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__312, dtb__313) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__314, dtb__315) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure ((Base_dList.C_Base_dList_dList_Cons (dtb__314, dtb__312)), dtb__313))) dtb__315)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ("_alt", Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dfreshVar = (fun name level -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dCore_dEval_dargValsAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (match dtb__316 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__318, dtb__319) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__318) (mc1 + mc2)), (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__317) mc1) (mc2 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dvarIndex = (fun depth level -> (if (level < depth) then ((depth - level) - 1) else (0 - 1)))

let rec v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__320, dtb__321) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__320, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))) dtb__321)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dquoteFuel = (fun fuel depth v -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__322) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__322))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__326), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__327) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__323) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__328, dtb__329, dtb__330) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__328, dtb__329, (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__330) ((v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__328) depth)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__331) -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel (fuel - 1)) depth) dtb__331)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__332, dtb__333) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__332))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__333))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__334, dtb__335) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__334, (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__335)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__336, dtb__337) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__336), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__337), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__338, dtb__339) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__338), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel (fuel - 1)) depth) alt))) dtb__339)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__340) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__340))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__341) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__341))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__342) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__342))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__343) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__343))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__344, dtb__345, dtb__346) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__344), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__345), (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__346)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel = (fun fuel depth alt0 -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ("", Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))) else (match alt0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__347, dtb__348, dtb__349) -> ((fun n -> ((fun argVals -> ((fun body -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__347, dtb__348, body))) (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) (depth + n)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder dtb__349) argVals)))) (((v_Vuna_dCompiler_dCore_dEval_dargValsAt dtb__348) depth) 0))) (Base_dList.v_Base_dList_dlength dtb__348))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel = (fun fuel depth vs -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__350, dtb__351) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) dtb__350), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel (fuel - 1)) depth) dtb__351)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel = (fun fuel depth n -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (match n with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__352, dtb__353, dtb__354) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__352, ((v_Vuna_dCompiler_dCore_dEval_dvarIndex depth) dtb__353)))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__354))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__355, dtb__356) -> ((v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__355))) ((Base_dList.v_Base_dList_dmap (fun a -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel (fuel - 1)) depth) a))) dtb__356))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dEval_dquote = (fun depth v -> (((v_Vuna_dCompiler_dCore_dEval_dquoteFuel 64) depth) v))

let v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt = (fun depth alt -> (((v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel 64) depth) alt))

let v_Vuna_dCompiler_dCore_dEval_dquoteArgValues = (fun depth vs -> (((v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel 64) depth) vs))

let v_Vuna_dCompiler_dCore_dEval_dquoteNeutral = (fun depth n -> (((v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel 64) depth) n))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__357, dtb__358, dtb__359) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__357), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__358), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__359)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__360, dtb__361) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__360), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt mc0)) dtb__361)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__362, dtb__363) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__362, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__363)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__364, dtb__365, dtb__366) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__364), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__365), dtb__366))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__367, dtb__368, dtb__369) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__367, dtb__368, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__369)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__370, dtb__371, dtb__372, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__373), ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__374)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__375) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__375) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__376) -> ((fun soln -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) soln) then mc1 else soln)) ((v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__376))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__377, dtb__378, dtb__379) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__377, dtb__378, ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas mc0) dtb__379)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__380, dtb__381, dtb__382) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__380), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__381), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__382)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__383, dtb__384) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__383), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt mc0) mc1)) dtb__384)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__385, dtb__386) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__385, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__386)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__387, dtb__388, dtb__389) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__387), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__388), dtb__389))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__390, dtb__391, dtb__392) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__390, dtb__391, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__392)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__393, dtb__394, dtb__395, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__396), (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__397)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__398) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList dtb__398) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__399) -> ((v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__399)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__400, dtb__401, dtb__402) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__400, dtb__401, (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo mc0) mc1) dtb__402)))
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__403) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__403) = 0) then "Type" else ("Type " ^ (bi_strFromInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__403))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__404) -> (match dtb__404 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__405, dtb__406) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__406) then dtb__405 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__407, dtb__408, dtb__409) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__409) then dtb__407 else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__410, dtb__411) -> (if (v_Vuna_dCompiler_dCore_dEval_disNilList dtb__411) then ("?" ^ (bi_strFromInt dtb__410)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((v_Vuna_dCompiler_dCore_dEval_dquote depth) v)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__412, dtb__413) -> (match ((v_Vuna_dCompiler_dCore_dEval_dnatCtorInt dtb__412) dtb__413) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__414) -> (bi_strFromInt dtb__414)
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__415) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) dtb__415) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> t
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__416) -> ((fun q -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar q) then t else ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) q))) ((v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__416))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__417, dtb__418, dtb__419, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__420), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__421)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__422, dtb__423, dtb__424) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__422, dtb__423, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) (depth + 1)) dtb__424)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__425, dtb__426, dtb__427) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__425), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__426), dtb__427))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__428, dtb__429) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__428, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__429)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__430, dtb__431) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__430), ((Base_dList.v_Base_dList_dmap (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl (fuel - 1)) sols) depth)) dtb__431)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__432, dtb__433, dtb__434) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__432), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__433), ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel (fuel - 1)) sols) depth) dtb__434)))
  | _ -> t
)))
and v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__435, dtb__436, dtb__437) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__435, dtb__436, ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__436))) dtb__437)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl = (fun sols depth t -> ((((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel 128) sols) depth) t))
