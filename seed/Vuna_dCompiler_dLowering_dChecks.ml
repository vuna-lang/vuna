open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dChecks_dUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs : bool }
and t_Vuna_dCompiler_dLowering_dChecks_dTermUse = { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags : t_Vuna_dCompiler_dLowering_dChecks_dUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit : bool }

# 47 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__0, dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo dtb__0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__2 }, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 44 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine = (fun t -> ((v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 34 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp = (fun t -> (match (v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__3; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__4 } -> (match dtb__3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__5, dtb__6) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__5; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__6) dtb__4) }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__7, dtb__8) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__8) dtb__4) }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_ddefTable = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__9) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__9); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }, (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__12) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef mc0) dtb__13))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef = (fun d -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

# 70 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__14) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__14), (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))) else (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

# 84 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else (if ((v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef mc0) dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, mc2))) mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc2); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) table)) defs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 97 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag = (fun d e -> (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) e))

# 139 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

# 200 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dbinderAt = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18)) else ((v_Vuna_dCompiler_dLowering_dChecks_dbinderAt (mc0 - 1)) dtb__19))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel = (fun fuel typeNames binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__20, dtb__21, dtb__22) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unbound runtime variable "; dtb__20; " (index "; (bi_strFromInt dtb__21); ", binders "; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength binders)); ")"]))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23) -> (match dtb__23 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__24; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__25 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__25) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__20))) dtb__20) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLowering_dChecks_dbinderAt dtb__21) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__26) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__26) typeNames) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelNameRuntime (dtb__26))) dtb__26) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__27) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__33) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__33)))) (v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__33))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__34; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__35 }, binders))) dtb__38)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__39, dtb__40, dtb__41) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__41) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__39) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__39)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__40))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__43; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__44 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__45, dtb__46) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__47, dtb__48) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__48)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__49, dtb__50) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__51)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__56)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__57; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__58); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__60 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__61, dtb__62) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__61)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__62)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__65) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__66) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__67, dtb__68, dtb__69) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__67)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__68)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__69)))))
  | _ -> failwith "DT: impossible branch"
)))
# 177 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__72; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__73 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__73) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__71) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__72)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__71)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 189 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__74))) (fun (_u : int) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__75)))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__74))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daddName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (if (dtb__76 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, ((v_Vuna_dCompiler_dLowering_dChecks_daddName mc0) dtb__77))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__78) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__78) runtimeNames) then ((v_Vuna_dCompiler_dLowering_dChecks_daddName dtb__78) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__79, dtb__80, dtb__81) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__82) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__83) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__93)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__94, dtb__95, dtb__96) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__96) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__94) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__94)) dtb__95))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__97) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__98; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__99)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__100, dtb__101) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__101)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__102, dtb__103) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__103)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__104, dtb__105) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__106)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__111)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__112; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__113); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__115 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__116, dtb__117) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__116)) dtb__117)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__118) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__119) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__120) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__121) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__122, dtb__123, dtb__124) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__122)) dtb__123)) dtb__124)
  | _ -> failwith "DT: impossible branch"
)))
# 234 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel = (fun (mc0 : int) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (match dtb__125 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 } -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__128) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__126) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__127)) dtb__126)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel = (fun (mc0 : int) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__129))) dtb__130))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false }

# 276 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags = (fun a b -> { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs) })

# 294 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor = (fun size -> (512 + (4 * size)))

# 297 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep = (fun names live n u -> (if (if live then ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) n) names) else false) then { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = ((v_Vuna_dCompiler_dLowering_dChecks_daddName n) (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit } else u))

# 304 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dwithFlags = (fun f u -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = ((v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags) f); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit })

# 307 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel = (fun fuel names flagOf live acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__131) -> ((v_Vuna_dCompiler_dLowering_dChecks_dwithFlags (flagOf dtb__131)) ((((v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep names) live) dtb__131) acc))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__132) -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = true }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__133, dtb__134, dtb__135) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__136) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__137) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__138) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__139) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__140) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) acc) dtb__144)) dtb__145)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__150)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__151, dtb__152, dtb__153) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) (if live then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__153)) else false)) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__151)) dtb__152)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__154, dtb__155) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__155)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__156, dtb__157) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__157)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__158, dtb__159) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) false) acc) dtb__159)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__160)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__165)) dtb__169)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__170, dtb__171) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__170)) dtb__171)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__172, dtb__173, dtb__174) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__172)) dtb__173)) dtb__174)
  | _ -> failwith "DT: impossible branch"
)))
# 332 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel = (fun (mc0 : int) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string) -> t_Vuna_dCompiler_dLowering_dChecks_dUseFlags) (mc3 : bool) (mc4 : t_Vuna_dCompiler_dLowering_dChecks_dTermUse) (mc5 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__177; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 } -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) (if mc3 then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__178)) else false)) mc4) dtb__177)) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 346 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel = (fun (mc0 : int) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string) -> t_Vuna_dCompiler_dLowering_dChecks_dUseFlags) (mc3 : bool) (mc4 : t_Vuna_dCompiler_dLowering_dChecks_dTermUse) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__179, dtb__180) -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) mc3) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__179))) dtb__180))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto = (fun runtimeNames flagOf t -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) runtimeNames) flagOf) true) { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }) t))

# 360 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__181, dtb__182) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__181), (v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf dtb__182)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__183, dtb__184) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__183)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__184)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__185)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__187))) dtb__189)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__190)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__195, dtb__196, dtb__197) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__195)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__196)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__197)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__201)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__202)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesSlot mc0) dtb__205)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__207)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__209)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__210, dtb__211) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__211)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__212, dtb__213) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__213)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__214, dtb__215, dtb__216) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__214)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__215)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__217) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__218) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__219) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__220) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__221) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__222) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__223) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__224, dtb__225, dtb__226) -> (if (dtb__225 >= 0) then (if (dtb__225 < mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__225); " (depth "; (bi_strFromInt mc0); ")"]))) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__225))))
  | _ -> failwith "DT: impossible branch"
))
# 407 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesMaybe = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__227) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__227)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 411 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesSlot = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__228) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesMaybe mc0) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__228))) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesMaybe (mc0 + 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__228))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 418 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__229, dtb__230) -> (match dtb__229 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__231; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__232 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__231)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 423 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__233, dtb__234) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__233)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__233))) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__234)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__235) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__236)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__237) -> (match ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes 0) dtb__237) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__238) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag dtb__235) dtb__238)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__239) -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__236)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize a3))) a1) a2) a3))

# 105 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__240) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__241)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__242) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__242) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__241)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__243, dtb__244) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__240)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__240)) (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__243))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__243, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames axiomNames)) defs))

# 445 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel 100000) a1) a2) a3))

# 448 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel 100000) a1) a2) a3))

# 467 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax = 1000000

# 461 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor = (fun size -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax) then v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax else scaled)) (512 + (4 * size))))

# 451 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure = (fun typeNames binders t -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__245) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__246) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "axiom reached the runtime erasure check (partition must erase it)")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure typeNames) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__247) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__248) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag d) dtb__248)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__249) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__249))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure mc0) dtb__250)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure mc0) dtb__251)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, dtb__253) -> (match dtb__252 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__254; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__255 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__254) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs dtb__253))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs a3))) a1) a2) a3))

# 481 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__256, dtb__257) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__256)) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts dtb__257))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts a3))) a1) a2) a3))
