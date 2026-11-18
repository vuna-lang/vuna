open Vuna_runtime
# 31 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__0) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | _ -> false
)))

# 28 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_disTypeForming = (fun v -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel 128) v))

# 43 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_duZeroOf = (fun n -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (n - 1))))))

# 49 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_duVarAtGo = (fun n i -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((if (i = 0) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0), ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo (n - 1)) (i - 1))))))

# 46 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_duVarAt = (fun depth i -> (if (if (i < 0) then true else (i >= depth)) then (v_Vuna_dCompiler_dElab_dUsage_duZeroOf depth) else ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo depth) i)))

# 53 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_duAdd = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigAdd dtb__6) dtb__8), ((v_Vuna_dCompiler_dElab_dUsage_duAdd dtb__7) dtb__9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_duScale = (fun rig us -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun u -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigScale rig) u))) us))

# 61 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_duJoin = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigJoin dtb__10) dtb__12), ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__11) dtb__13)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_duDrop = (fun n us -> (if (n <= 0) then us else (match us with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dUsage_duDrop (n - 1)) dtb__15)
  | _ -> failwith "DT: impossible branch"
)))

# 90 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dresolvedBinderSpan = (fun binderSp fallback -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_disSpanEmpty binderSp) then fallback else binderSp))

# 95 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dbinderEditSpan = (fun name binderSp -> ((fun width -> (if (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_disSpanEmpty binderSp) then true else (width <> (bi_strLength name))) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (binderSp)))) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEndOffset binderSp) - (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset binderSp))))

# 227 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_disRigZero = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> false
))

# 119 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__18; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__19 } -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__19) then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime mc0) dtb__17) else (if (dtb__18 = mc0) then true else ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime mc0) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax = 1000000

# 261 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor = (fun t -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax) then v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax else scaled)) (1024 + (4 * (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t)))))

# 323 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear = (fun ec c -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__20) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__20)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__21) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__21)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel = (fun fuel ec sp t allowed -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "capture check fuel exhausted") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__22, dtb__23, dtb__24) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__25) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__26) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__27) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__28) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__29) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__30) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__31) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinClosureName dtb__37) then (if allowed then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__41) false) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearCaptureEscapes ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__37)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__37))) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__41) false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__42, dtb__43, dtb__44) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__42) true)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__44) then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__43) false) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__43) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__44)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__45, dtb__46) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__45) dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__47, dtb__48) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__47) dtb__48)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__49, dtb__50) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__49) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__51, dtb__52, dtb__53) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__51) true)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__52) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__53) allowed)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__54) true)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__59) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__63) allowed)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__64, dtb__65) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__64) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel fuel) ec) sp) allowed) dtb__65)))
  | _ -> failwith "DT: impossible branch"
)))
# 305 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel = (fun fuel ec sp c args -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo fuel) ec) sp) ((v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear ec) c)) args))
# 308 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 } -> ((fun allowed -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__68) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo (mc0 - 1)) mc1) mc2) mc3) dtb__67)))) (if mc3 then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__69) else false))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 316 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__72; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__73; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__74 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__74) mc3)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel (mc0 - 1)) mc1) mc2) mc3) dtb__71)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcapCheck = (fun ec sp t allowed -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor t)) ec) sp) t) allowed))

# 334 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef = (fun ec d -> (v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

# 354 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__75) -> dtb__75
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture = (fun ec d body -> ((((v_Vuna_dCompiler_dElab_dUsage_dcapCheck ec) (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf d)) body) false))

# 365 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_drenameSuggestion = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__76) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSuggestion { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionTitle = (String.concat "" ["rename unused binder `"; mc0; "` to `_"; mc0; "`"]); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionEdits = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editSpan = dtb__76; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editNewText = ("_" ^ mc0) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans = (fun ec -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans ec) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 381 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan = (fun ec name sp -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans ec) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = name; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sp }, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decUseSpans ec)))))

# 385 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dusesOf = (fun ec name -> (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun p -> ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) = name))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decUseSpans ec)))))

# 393 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans dtb__78) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldSpan ("use", dtb__77))) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwithUseFields = (fun ec name d -> ((v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans ((v_Vuna_dCompiler_dElab_dUsage_dusesOf ec) name)) d))

# 74 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc0) mc2) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldQuantity (mc2, 1, 0))) d)))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearUnused (mc2))) mc2))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc0) mc2) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldQuantity (mc2, 1, 2))) d)))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearOverused (mc2))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero mc4) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dUsage_dwithUseFields mc0) mc2) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldQuantity (mc2, 0, 1))) d)))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ErasedBinderUsed (mc2))) mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnAt = (fun ec sp e args -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddWarning ec) (((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAt sp) e) args)))

# 407 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnAt0 = (fun ec sp e -> ((((v_Vuna_dCompiler_dElab_dUsage_dwarnAt ec) sp) e) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))

# 411 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnAt1 = (fun ec sp e a0 -> ((((v_Vuna_dCompiler_dElab_dUsage_dwarnAt ec) sp) e) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (a0, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))

# 415 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod = (fun ec f sp e a0 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddWarning ec) ((((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAtMod f) sp) e) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (a0, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))))

# 361 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder = (fun ec sp mEdit name -> (((((v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod ec) ((v_Vuna_dCompiler_dElab_dUsage_drenameSuggestion name) mEdit)) sp) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_UnusedBinder (name))) name))

# 103 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> ((fun ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig ec1) mc1) mc3) mc4) dtb__79)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec1 }))))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__79) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith "_") mc3)) else false) then (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder mc0) mc1) mc2) mc3)
  | _ -> mc0
) else mc0))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "usage vector lost lambda binder")
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> ((fun name -> ((fun rig -> ((fun bsp -> ((fun mEdit -> ((fun restRuntime -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "usage vector lost case binder")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> ((fun ec1 -> ((fun ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig ec2) bsp) name) rig) dtb__83)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo ec2) mc1) dtb__82) dtb__84)))) (if (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__83) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith "_") name)) else false) then (match rig with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((((v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder ec1) bsp) mEdit) name)
  | _ -> ec1
) else ec1))) (if (if (name <> "_") then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime name) restRuntime) else false) then ((((v_Vuna_dCompiler_dElab_dUsage_dwarnAt1 mc0) bsp) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (name))) name) else mc0))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__82))) ((v_Vuna_dCompiler_dElab_dUsage_dbinderEditSpan name) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderSpanOf dtb__81)))) ((v_Vuna_dCompiler_dElab_dUsage_dresolvedBinderSpan (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderSpanOf dtb__81)) mc1))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf dtb__81))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf dtb__81))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders = (fun ec sp binders us -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo ec) sp) (Base_dData_dList.v_Base_dData_dList_dreverse binders)) us))

# 155 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dcheckTerm = (fun ec sp env t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__85, dtb__86, dtb__87) -> ((fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dUsage_duVarAt (Base_dData_dList.v_Base_dData_dList_dlength env)) dtb__86); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 }))) (if ((dtb__87).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0) then ec else (((v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan ec) dtb__85) dtb__87)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__88) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__89) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__90) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> ((fun bsp -> ((fun mEdit -> ((fun ecW -> ((fun env2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ecW) sp) env2) dtb__100)) (fun u ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((((v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder ec2) bsp) mEdit) dtb__96) dtb__97) u)) (fun rest ec3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = rest; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec3 }))))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 }, env)))) (if (if (dtb__96 <> "_") then ((v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime dtb__96) env) else false) then ((((v_Vuna_dCompiler_dElab_dUsage_dwarnAt1 ec) bsp) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_ShadowedBinder (dtb__96))) dtb__96) else ec))) ((v_Vuna_dCompiler_dElab_dUsage_dbinderEditSpan dtb__96) dtb__99))) ((v_Vuna_dCompiler_dElab_dUsage_dresolvedBinderSpan dtb__99) sp))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__101, dtb__102, dtb__103) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec) sp) env) dtb__101)) (fun uf ec1 -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__103) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = uf; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec1 })) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec1) sp) env) dtb__102)) (fun ua ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dUsage_duAdd uf) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__103) ua)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 })))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__104, dtb__105) -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs ec) sp) env) dtb__105)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__106, dtb__107) -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs ec) sp) env) dtb__107)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__108, dtb__109) -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs ec) sp) env) dtb__109)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec) sp) env) dtb__110)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec) sp) env) dtb__115)) (fun ub ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec1) sp) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse dtb__117)) env)) dtb__119)) (fun ua ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders ec2) sp) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__117)) ua)) (fun outer ec3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dUsage_duAdd ub) outer); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec3 }))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__120, dtb__121) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec) sp) env) dtb__120)) (fun us ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAlts ec1) sp) env) dtb__121)) (fun ua ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dUsage_duAdd us) ua); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 }))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__122, dtb__123, dtb__124) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec) sp) env) dtb__122)) (fun uc ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec1) sp) env) dtb__123)) (fun ut ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec2) sp) env) dtb__124)) (fun ue ec3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dUsage_duAdd uc) ((v_Vuna_dCompiler_dElab_dUsage_duJoin ut) ue)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec3 }))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__125) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__126) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__127) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__128) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
  | _ -> failwith "DT: impossible branch"
))
# 197 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgs = (fun ec sp env args -> (((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo ec) sp) env) args) (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength env))))
# 200 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__132 } -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__132) then (((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) mc2) dtb__130) mc4) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) mc1) mc2) dtb__131)) (fun ua ec1 -> (((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo ec1) mc1) mc2) dtb__130) ((v_Vuna_dCompiler_dElab_dUsage_duAdd mc4) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__132) ua))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 207 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcheckAlts = (fun ec sp env alts -> (((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo ec) sp) env) alts) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
# 210 "Vuna/Compiler/Elab/Usage.vuna"
and v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__135; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__136; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__137 } -> ((fun env2 -> ((fun k -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) mc1) env2) dtb__137)) (fun u ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders ec1) mc1) dtb__136) u)) (fun outer ec2 -> (((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo ec2) mc1) mc2) dtb__134) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((match mc4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__138) outer)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> outer
  | _ -> failwith "DT: impossible branch"
))))))))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__136))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__136))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__139) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__139; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dData_dList.v_Base_dData_dList_dlength mc2)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage = (fun ec msp name body -> ((fun sp -> ((fun ec0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm ec0) sp) Base_dData_dList.C_Base_dData_dList_dList_Nil) body)) (fun _urest ec1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec1))))) (v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans ec))) (match msp with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__140) -> dtb__140
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
)))

# 343 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (if ((v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef mc0) dtb__141) then ((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__142) else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__141))) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf dtb__141)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearTopLevel ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__141)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__141)) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__141) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__142)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__143) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture mc0) dtb__141) dtb__143)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__141)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__141)) dtb__143)) (fun ec2 -> ((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo ec2) dtb__142)))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage = (fun ec defs -> ((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo ec) defs))

# 419 "Vuna/Compiler/Elab/Usage.vuna"
let v_Vuna_dCompiler_dElab_dUsage_dwarnAt0Mod = (fun ec f sp e -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddWarning ec) ((((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAtMod f) sp) e) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
