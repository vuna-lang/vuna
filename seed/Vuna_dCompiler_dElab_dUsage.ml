open Vuna_runtime
type t_Vuna_dCompiler_dElab_dUsage_dUseBox = { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag : int }

let rec v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__0) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1, 0, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dUsage_disTypeForming = (fun v -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel 128) v))

let rec v_Vuna_dCompiler_dElab_dUsage_duZeroOf = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (n - 1))))))

let rec v_Vuna_dCompiler_dElab_dUsage_duVarAtGo = (fun n i -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((if (i = 0) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0), ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo (n - 1)) (i - 1))))))

let v_Vuna_dCompiler_dElab_dUsage_duVarAt = (fun depth i -> (if (if (i < 0) then true else (i >= depth)) then (v_Vuna_dCompiler_dElab_dUsage_duZeroOf depth) else ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo depth) i)))

let rec v_Vuna_dCompiler_dElab_dUsage_duAdd = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigAdd dtb__6) dtb__8), ((v_Vuna_dCompiler_dElab_dUsage_duAdd dtb__7) dtb__9)))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> mc1
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_duScale = (fun rig us -> ((Base_dList.v_Base_dList_dmap (fun u -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigScale rig) u))) us))

let rec v_Vuna_dCompiler_dElab_dUsage_duJoin = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigJoin dtb__10) dtb__12), ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__11) dtb__13)))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> mc1
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_duDrop = (fun n us -> (if (n <= 0) then us else (match us with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dUsage_duDrop (n - 1)) dtb__15)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dUsage_disRigZero = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__18; Base_dPair.f_Base_dPair_dPair_second = dtb__19 } -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__19) then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime mc0) dtb__17) else (if (dtb__18 = mc0) then true else ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime mc0) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax = 1000000

let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor = (fun t -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax) then v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax else scaled)) (1024 + (4 * (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t)))))

let v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear = (fun ec c -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__20)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__21)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel = (fun fuel ec sp t allowed -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "capture check fuel exhausted") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__22, dtb__23, dtb__24) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__25) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__26) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__27) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__28) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__29) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__30) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__31) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__37, dtb__38, dtb__39) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinClosureName dtb__37) then (if allowed then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__39) false) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearCaptureEscapes ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__37)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__37))) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__39) false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__40, dtb__41, dtb__42) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__40) true)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__42) then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__41) false) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__41) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__42)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__43, dtb__44) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__43) dtb__44)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__45, dtb__46) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__45) dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__47, dtb__48) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__47) dtb__48)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__49, dtb__50, dtb__51) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__49) true)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__50) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__51) allowed)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__52) true)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__57) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__61) allowed)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__62, dtb__63) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__62) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel fuel) ec) sp) allowed) dtb__63)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel = (fun fuel ec sp c args -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo fuel) ec) sp) ((v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear ec) c)) args))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__64 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = dtb__67 } -> ((fun allowed -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__66) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo (mc0 - 1)) mc1) mc2) mc3) dtb__65)))) (if mc3 then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__67) else false))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match dtb__68 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__70; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__71; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__72 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__72) mc3)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel (mc0 - 1)) mc1) mc2) mc3) dtb__69)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcapCheck = (fun ec sp t allowed -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor t)) ec) sp) t) allowed))

let v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef = (fun ec d -> (v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> dtb__73
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture = (fun ec d body -> ((((v_Vuna_dCompiler_dElab_dUsage_dcapCheck ec) (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf d)) body) false))

let v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder = (fun sp name -> ((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1Mod (fun d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = (String.concat "" ["rename unused binder `"; name; "` to `_"; name; "`"]); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = sp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = ("_" ^ name) }, Base_dList.C_Base_dList_dList_Nil)) }) d))) sp) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_UnusedBinder (name))) name))

let v_Vuna_dCompiler_dElab_dUsage_duseSpansRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = 0 }))

let v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans = (fun _u -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef) { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = 0 })))

let v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan = (fun name sp -> ((fun box -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef) { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = sp }, (box).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems)); f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = (box).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag })))) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef))))

let v_Vuna_dCompiler_dElab_dUsage_dusesOf = (fun name -> (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) ((Base_dList.v_Base_dList_dfilter (fun p -> ((Base_dPair.v_Base_dPair_dfirstOf p) = name))) ((Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef))).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems))))

let rec v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans dtb__75) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("use", dtb__74))) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dwithUseFields = (fun name d -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans (v_Vuna_dCompiler_dElab_dUsage_dusesOf name)) d))

let v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc1) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (mc1, 1, 0))) d)))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearUnused (mc1))) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc1) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (mc1, 1, 2))) d)))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearOverused (mc1))) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero mc3) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc1) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldQuantity (mc1, 0, 1))) d)))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ErasedBinderUsed (mc1))) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) mc1) mc2) dtb__76)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__77))))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__76) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "_") mc1)) else false) then (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder mc0) mc1)
  | _ -> 0
) else 0))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "usage vector lost lambda binder")
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "usage vector lost case binder")
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) dtb__80) dtb__81) dtb__82)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo mc0) dtb__79) dtb__83)))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__82) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "_") dtb__80)) else false) then (match dtb__81 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder mc0) dtb__80)
  | _ -> 0
) else 0))) (if (if (dtb__80 <> "_") then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime dtb__80) dtb__79) else false) then (((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1 mc0) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (dtb__80))) dtb__80) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders = (fun sp binders us -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo sp) (Base_dList.v_Base_dList_dreverse binders)) us))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckTerm = (fun sp env t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__84, dtb__85, dtb__86) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duVarAt (Base_dList.v_Base_dList_dlength env)) dtb__85)))) (if ((dtb__86).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0) then 0 else ((v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan dtb__84) dtb__86)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__87) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__88) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__89) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__95, dtb__96, dtb__97) -> ((fun _u -> ((fun env2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env2) dtb__97)) (fun u -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder sp) dtb__95) dtb__96) u)))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 }, env)))) (if (if (dtb__95 <> "_") then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime dtb__95) env) else false) then (((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1 sp) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (dtb__95))) dtb__95) else 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__98, dtb__99, dtb__100) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__98)) (fun uf -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__100) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (uf)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__99)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd uf) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__100) ua)))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__101, dtb__102) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__102)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__103, dtb__104) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__104)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__105, dtb__106) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__106)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__107)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__112)) (fun ub -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__114)) env)) dtb__116)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd ub) ua)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__117, dtb__118) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__117)) (fun us -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckAlts sp) env) dtb__118)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd us) ua)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__119, dtb__120, dtb__121) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__119)) (fun uc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__120)) (fun ut -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__121)) (fun ue -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd uc) ((v_Vuna_dCompiler_dElab_dUsage_duJoin ut) ue))))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__124) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__125) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgs = (fun sp env args -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo sp) env) args) (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (match dtb__126 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__128; Base_dPair.f_Base_dPair_dPair_second = dtb__129 } -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__129) then ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__127) mc3) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) mc1) dtb__128)) (fun ua -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__127) ((v_Vuna_dCompiler_dElab_dUsage_duAdd mc3) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__129) ua))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc3))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAlts = (fun sp env alts -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo sp) env) alts) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__130 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__132; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__133; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__134 } -> ((fun env2 -> ((fun k -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) env2) dtb__134)) (fun u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders mc0) dtb__133) u)) (fun outer -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo mc0) mc1) dtb__131) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__135) -> ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__135) outer)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> outer
  | _ -> failwith "DT: impossible branch"
))))))))) (Base_dList.v_Base_dList_dlength dtb__133))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__133)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> dtb__136
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage = (fun msp name body -> ((fun sp -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) Base_dList.C_Base_dList_dList_Nil) body)) (fun rest -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dlength rest)))))) (v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans 0))) (match msp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137) -> dtb__137
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if ((v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef mc0) dtb__138) then (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__139) mc2) else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__138))) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf dtb__138)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearTopLevel ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__138)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__138)) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__138) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__139) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__140) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture mc0) dtb__138) dtb__140)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__138)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__138)) dtb__140)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__139) (mc2 + 1))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage = (fun ec defs -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo ec) defs) 0))
