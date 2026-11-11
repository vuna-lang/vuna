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

let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax = 1000000

let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor = (fun t -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax) then v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax else scaled)) (1024 + (4 * (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t)))))

let v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear = (fun ec c -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__16)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__17)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel = (fun fuel ec sp t allowed -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "capture check fuel exhausted") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__18, dtb__19, dtb__20) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__21) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__22) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__23) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__24) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__25) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__26) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__27) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__33, dtb__34, dtb__35) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinClosureName dtb__33) then (if allowed then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__35) false) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearCaptureEscapes ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__33)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__33))) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__35) false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__36, dtb__37, dtb__38) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__36) true)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__38) then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__37) false) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__37) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__38)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__39, dtb__40) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__39) dtb__40)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__41, dtb__42) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__41) dtb__42)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__43, dtb__44) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__43) dtb__44)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__45, dtb__46, dtb__47) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__45) true)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__46) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__47) allowed)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__48) true)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__53) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__57) allowed)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__58, dtb__59) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__58) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel fuel) ec) sp) allowed) dtb__59)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel = (fun fuel ec sp c args -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo fuel) ec) sp) ((v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear ec) c)) args))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> ((fun allowed -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__62) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo (mc0 - 1)) mc1) mc2) mc3) dtb__61)))) (if mc3 then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__63) else false))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__64 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__66; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__67; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__68 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__68) mc3)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel (mc0 - 1)) mc1) mc2) mc3) dtb__65)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcapCheck = (fun ec sp t allowed -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor t)) ec) sp) t) allowed))

let v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef = (fun ec d -> (v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> dtb__69
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture = (fun ec d body -> ((((v_Vuna_dCompiler_dElab_dUsage_dcapCheck ec) (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf d)) body) false))

let v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder = (fun sp name -> ((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1Mod (fun d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = (String.concat "" ["rename unused binder `"; name; "` to `_"; name; "`"]); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = sp; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = ("_" ^ name) }, Base_dList.C_Base_dList_dList_Nil)) }) d))) sp) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_UnusedBinder (name))) name))

let v_Vuna_dCompiler_dElab_dUsage_duseSpansRef = (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = 0 }))

let v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans = (fun _u -> (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef) { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = 0 })))

let v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan = (fun name sp -> ((fun box -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef) { f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = sp }, (box).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems)); f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag = (box).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useTag })))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef))))

let v_Vuna_dCompiler_dElab_dUsage_dusesOf = (fun name -> (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) ((Base_dList.v_Base_dList_dfilter (fun p -> ((Base_dPair.v_Base_dPair_dfirstOf p) = name))) ((Base_dIO_dHost.v_Base_dIO_dHost_drunIO (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dElab_dUsage_duseSpansRef))).f_Vuna_dCompiler_dElab_dUsage_dUseBox_useItems))))

let rec v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans dtb__71) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("use", dtb__70))) mc1))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) mc1) mc2) dtb__72)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__73))))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__72) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "_") mc1)) else false) then (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder mc0) mc1)
  | _ -> 0
) else 0))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "usage vector lost lambda binder")
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "usage vector lost case binder")
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) dtb__76) dtb__77) dtb__78)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo mc0) dtb__75) dtb__79)))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__78) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "_") dtb__76)) else false) then (match dtb__77 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder mc0) dtb__76)
  | _ -> 0
) else 0))) (if (if (dtb__76 <> "_") then ((Base_dList.v_Base_dList_dmemName dtb__76) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) dtb__75)) else false) then (((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1 mc0) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (dtb__76))) dtb__76) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders = (fun sp binders us -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo sp) (Base_dList.v_Base_dList_dreverse binders)) us))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckTerm = (fun sp env t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__80, dtb__81, dtb__82) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duVarAt (Base_dList.v_Base_dList_dlength env)) dtb__81)))) (if ((dtb__82).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0) then 0 else ((v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan dtb__80) dtb__82)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__83) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__84) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__85) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__91, dtb__92, dtb__93) -> ((fun _u -> ((fun env2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env2) dtb__93)) (fun u -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder sp) dtb__91) dtb__92) u)))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__91; Base_dPair.f_Base_dPair_dPair_second = dtb__92 }, env)))) (if (if (dtb__91 <> "_") then ((Base_dList.v_Base_dList_dmemName dtb__91) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) env)) else false) then (((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAt1 sp) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (dtb__91))) dtb__91) else 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__94, dtb__95, dtb__96) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__94)) (fun uf -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__96) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (uf)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__95)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd uf) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__96) ua)))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__97, dtb__98) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__98)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__99, dtb__100) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__100)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__101, dtb__102) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__102)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__103)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__108)) (fun ub -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__110)) env)) dtb__112)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd ub) ua)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__113, dtb__114) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__113)) (fun us -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckAlts sp) env) dtb__114)) (fun ua -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd us) ua)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__115, dtb__116, dtb__117) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__115)) (fun uc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__116)) (fun ut -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__117)) (fun ue -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dUsage_duAdd uc) ((v_Vuna_dCompiler_dElab_dUsage_duJoin ut) ue))))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__118) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__119) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__120) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__121) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgs = (fun sp env args -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo sp) env) args) (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__125) then ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__123) mc3) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) mc1) dtb__124)) (fun ua -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__123) ((v_Vuna_dCompiler_dElab_dUsage_duAdd mc3) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__125) ua))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc3))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAlts = (fun sp env alts -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo sp) env) alts) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (match dtb__126 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__128; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__129; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__130 } -> ((fun env2 -> ((fun k -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) env2) dtb__130)) (fun u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders mc0) dtb__129) u)) (fun outer -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo mc0) mc1) dtb__127) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131) -> ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__131) outer)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> outer
  | _ -> failwith "DT: impossible branch"
))))))))) (Base_dList.v_Base_dList_dlength dtb__129))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__129)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132) -> dtb__132
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage = (fun msp name body -> ((fun sp -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) Base_dList.C_Base_dList_dList_Nil) body)) (fun rest -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dlength rest)))))) (v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans 0))) (match msp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> dtb__133
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if ((v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef mc0) dtb__134) then (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__135) mc2) else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__134))) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf dtb__134)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearTopLevel ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__134)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__134)) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__134) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__135) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture mc0) dtb__134) dtb__136)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__134)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__134)) dtb__136)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__135) (mc2 + 1))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage = (fun ec defs -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo ec) defs) 0))
