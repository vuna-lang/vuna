open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dChecks_dUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs : bool }
and t_Vuna_dCompiler_dLowering_dChecks_dTermUse = { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags : t_Vuna_dCompiler_dLowering_dChecks_dUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit : bool }

# 45 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__0, dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo dtb__0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__2 }, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 42 "Vuna/Compiler/Lowering/Checks.vuna"
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

# 52 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__9) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__9); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }, (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__12) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef mc0) dtb__13))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef = (fun d -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

# 67 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__14) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__14), (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))) else (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

# 81 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else (if ((v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef mc0) dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, mc2))) mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc2); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) table)) defs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 91 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag = (fun d e -> (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) e))

# 127 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

# 188 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18)) else ((v_Vuna_dCompiler_dLowering_dChecks_dbinderAt (mc0 - 1)) dtb__19))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Lowering/Checks.vuna"
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, dtb__36, dtb__37) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__34; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__35 }, binders))) dtb__37)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__38, dtb__39, dtb__40) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__40) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__38) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__38)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__39))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__41) -> (match dtb__41 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__42; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__43 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__43)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__45)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__46, dtb__47) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__48, dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__55)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__56; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__57); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__59 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__60, dtb__61) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__60)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__61)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__62) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__65) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__66, dtb__67, dtb__68) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__66)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__67)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__68)))))
  | _ -> failwith "DT: impossible branch"
)))
# 170 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (match dtb__69 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__71; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__72 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__72) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__71)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 178 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__73))) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__74)))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__73))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (if (dtb__75 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, ((v_Vuna_dCompiler_dLowering_dChecks_daddName mc0) dtb__76))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__77) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__77) runtimeNames) then ((v_Vuna_dCompiler_dLowering_dChecks_daddName dtb__77) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__78, dtb__79, dtb__80) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__81) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__82) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__88, dtb__89, dtb__90, dtb__91) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__91)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__92, dtb__93, dtb__94) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__94) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__92) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__92)) dtb__93))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__95) -> (match dtb__95 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__97)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__98, dtb__99) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__99)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__100, dtb__101) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__101)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__102, dtb__103) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__104)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__109)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__110; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__111); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__113 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__114, dtb__115) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__114)) dtb__115)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__116) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__117) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__118) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__119) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__120, dtb__121, dtb__122) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__120)) dtb__121)) dtb__122)
  | _ -> failwith "DT: impossible branch"
)))
# 227 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__125; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__126 } -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__126) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__124) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__125)) dtb__124)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 234 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__127))) dtb__128))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false }

# 261 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags = (fun a b -> { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs) })

# 277 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor = (fun size -> (512 + (4 * size)))

# 280 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep = (fun names live n u -> (if (if live then ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) n) names) else false) then { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = ((v_Vuna_dCompiler_dLowering_dChecks_daddName n) (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit } else u))

# 285 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dwithFlags = (fun f u -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = ((v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags) f); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit })

# 288 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel = (fun fuel names flagOf live acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__129) -> ((v_Vuna_dCompiler_dLowering_dChecks_dwithFlags (flagOf dtb__129)) ((((v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep names) live) dtb__129) acc))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__130) -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = true }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__131, dtb__132, dtb__133) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__134) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__135) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__136) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__137) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__138) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) acc) dtb__142)) dtb__143)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__144, dtb__145, dtb__146, dtb__147) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__147)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__148, dtb__149, dtb__150) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) (if live then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__150)) else false)) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__148)) dtb__149)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__151, dtb__152) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__152)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__153, dtb__154) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__154)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__155, dtb__156) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) false) acc) dtb__156)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__157)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__162)) dtb__166)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__167, dtb__168) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__167)) dtb__168)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__169, dtb__170, dtb__171) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__169)) dtb__170)) dtb__171)
  | _ -> failwith "DT: impossible branch"
)))
# 321 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (match dtb__172 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__175 } -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) (if mc3 then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__175)) else false)) mc4) dtb__174)) dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 328 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) mc3) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__176))) dtb__177))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto = (fun runtimeNames flagOf t -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) runtimeNames) flagOf) true) { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }) t))

# 335 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__178), (v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf dtb__179)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__180, dtb__181) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__180)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__181)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__182)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__184))) dtb__186)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__187)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__192, dtb__193, dtb__194) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__192)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__193)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__194)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__198)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__199)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__200, dtb__201, dtb__202, dtb__203) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__203)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__204, dtb__205) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__205)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__206, dtb__207) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__207)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__209)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__210, dtb__211, dtb__212) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__210)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__211)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__213) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__214) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__215) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__216) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__217) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__218) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__219) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__220, dtb__221, dtb__222) -> (if (dtb__221 >= 0) then (if (dtb__221 < mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__221); " (depth "; (bi_strFromInt mc0); ")"]))) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__221))))
  | _ -> failwith "DT: impossible branch"
))
# 375 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__223, dtb__224) -> (match dtb__223 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__225; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__226 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__225)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__224)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 380 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__227, dtb__228) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__227)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__227))) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__228)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__229, dtb__230) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__229) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__230)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231) -> (match ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes 0) dtb__231) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__232) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag dtb__229) dtb__232)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__233) -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__230)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize a3))) a1) a2) a3))

# 99 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__234) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__235)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__236) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__236) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__235)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__237, dtb__238) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__234)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__234)) (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__237))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__237, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames axiomNames)) defs))

# 400 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel 100000) a1) a2) a3))

# 403 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel 100000) a1) a2) a3))

# 421 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax = 1000000

# 415 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor = (fun size -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax) then v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax else scaled)) (512 + (4 * size))))

# 406 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure = (fun typeNames binders t -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__239) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__240) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "axiom reached the runtime erasure check (partition must erase it)")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__241) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure typeNames) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__241) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__242) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag d) dtb__242)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__243) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__243))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__244, dtb__245) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure mc0) dtb__244)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure mc0) dtb__245)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__248; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__249 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__248) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs dtb__247))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs a3))) a1) a2) a3))

# 435 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__250)) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts dtb__251))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts a3))) a1) a2) a3))
