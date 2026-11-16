open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dChecks_dUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace : bool; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs : bool }
and t_Vuna_dCompiler_dLowering_dChecks_dTermUse = { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags : t_Vuna_dCompiler_dLowering_dChecks_dUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit : bool }

# 45 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__0, dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo dtb__0) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1; Base_dPair.f_Base_dPair_dPair_second = dtb__2 }, mc1)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
))

# 42 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine = (fun t -> ((v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo t) Base_dList.C_Base_dList_dList_Nil))

# 34 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp = (fun t -> (match (v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__3; Base_dPair.f_Base_dPair_dPair_second = dtb__4 } -> (match dtb__3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__5, dtb__6) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__5; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__6) dtb__4) }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__7, dtb__8) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__8) dtb__4) }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__9) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__9); Base_dPair.f_Base_dPair_dPair_second = dtb__11 }, (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_ddefTable dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__12) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef mc0) dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef = (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

# 67 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__14) then (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__14), (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))) else (v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

# 81 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if (v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else (if ((v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef mc0) dtb__16) then ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__16), mc3))) else ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo mc0) dtb__17) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, mc2))) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc2); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) defs) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 91 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag = (fun d e -> (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) e))

# 127 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

# 188 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18)) else ((v_Vuna_dCompiler_dLowering_dChecks_dbinderAt (mc0 - 1)) dtb__19))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel = (fun fuel typeNames binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__20, dtb__21, dtb__22) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unbound runtime variable "; dtb__20; " (index "; (bi_strFromInt dtb__21); ", binders "; (bi_strFromInt (Base_dList.v_Base_dList_dlength binders)); ")"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (match dtb__23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__25) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__20))) dtb__20) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLowering_dChecks_dbinderAt dtb__21) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__26) -> (if ((Base_dList.v_Base_dList_dmemName dtb__26) typeNames) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelNameRuntime (dtb__26))) dtb__26) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__27) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__33) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__33)))) (v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__33))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, dtb__36) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 }, binders))) dtb__36)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__37, dtb__38, dtb__39) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__39) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__37) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__37)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__38))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40) -> (match dtb__40 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__42)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__43, dtb__44) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__44)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__45, dtb__46) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__47, dtb__48) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__49)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__54)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__55; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__56; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__58 }, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__59, dtb__60) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__59)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__60)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__61) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__62) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__65, dtb__66, dtb__67) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__65)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__66)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__67)))))
  | _ -> failwith "DT: impossible branch"
)))
# 170 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match dtb__68 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__70; Base_dPair.f_Base_dPair_dPair_second = dtb__71 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__71) then ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__69) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__70)) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__69)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 178 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__72))) (fun _u -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__73)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__72)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if (dtb__74 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, ((v_Vuna_dCompiler_dLowering_dChecks_daddName mc0) dtb__75))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__76) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__76) runtimeNames) then ((v_Vuna_dCompiler_dLowering_dChecks_daddName dtb__76) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__77, dtb__78, dtb__79) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__80) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__81) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__87, dtb__88, dtb__89) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__89)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__90, dtb__91, dtb__92) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__92) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__90) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__90)) dtb__91))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93) -> (match dtb__93 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__95)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__96, dtb__97) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__97)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__98, dtb__99) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__99)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__100, dtb__101) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__102)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__107)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__108; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__109; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__111 }, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__112, dtb__113) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__112)) dtb__113)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__114) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__115) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__116) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__117) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__118, dtb__119, dtb__120) -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__118)) dtb__119)) dtb__120)
  | _ -> failwith "DT: impossible branch"
)))
# 227 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (match dtb__121 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__124 } -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__124) then ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__122) else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__123)) dtb__122)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 234 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__125))) dtb__126))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags = { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false }

# 261 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags = (fun a b -> { f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace); f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = (if (a).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs then true else (b).f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs) })

# 277 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor = (fun size -> (512 + (4 * size)))

# 280 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep = (fun names live n u -> (if (if live then ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) n) names) else false) then { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = ((v_Vuna_dCompiler_dLowering_dChecks_daddName n) (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit } else u))

# 285 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dwithFlags = (fun f u -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = ((v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags) f); f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = (u).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit })

# 288 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel = (fun fuel names flagOf live acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__127) -> ((v_Vuna_dCompiler_dLowering_dChecks_dwithFlags (flagOf dtb__127)) ((((v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep names) live) dtb__127) acc))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__128) -> { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = (acc).f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = true }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__129, dtb__130, dtb__131) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__132) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__133) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__134) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__135) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__136) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) false) acc) dtb__140)) dtb__141)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__142, dtb__143, dtb__144) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__144)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__145, dtb__146, dtb__147) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) (if live then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__147)) else false)) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__145)) dtb__146)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__148, dtb__149) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__149)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__150, dtb__151) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__151)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__152, dtb__153) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (fuel - 1)) names) flagOf) false) acc) dtb__153)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__154)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__159)) dtb__163)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__164, dtb__165) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__164)) dtb__165)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__166, dtb__167, dtb__168) -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__166)) dtb__167)) dtb__168)
  | _ -> failwith "DT: impossible branch"
)))
# 321 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (match dtb__169 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__171; Base_dPair.f_Base_dPair_dPair_second = dtb__172 } -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) (if mc3 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__172)) else false)) mc4) dtb__171)) dtb__170))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 328 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (if (mc0 <= 0) then mc4 else ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (mc0 - 1)) mc1) mc2) mc3) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__173))) dtb__174))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto = (fun runtimeNames flagOf t -> ((((((v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) runtimeNames) flagOf) true) { f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }) t))

# 335 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__175), (v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf dtb__176)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__177, dtb__178) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__177)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__178)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__179)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength dtb__181))) dtb__183)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__184)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__189, dtb__190, dtb__191) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__189)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__190)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__191)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__195)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__196)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__197, dtb__198, dtb__199) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + 1)) dtb__199)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__200, dtb__201) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__201)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__202, dtb__203) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__203)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__204, dtb__205) -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__205)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__206, dtb__207, dtb__208) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__206)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__207)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__209) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__210) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__211) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__212) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__213) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__214) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__215) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__216, dtb__217, dtb__218) -> (if (dtb__217 >= 0) then (if (dtb__217 < mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__217); " (depth "; (bi_strFromInt mc0); ")"]))) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__217))))
  | _ -> failwith "DT: impossible branch"
))
# 375 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__219, dtb__220) -> (match dtb__219 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__221; Base_dPair.f_Base_dPair_dPair_second = dtb__222 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes mc0) dtb__221)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs mc0) dtb__220)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 380 "Vuna/Compiler/Lowering/Checks.vuna"
and v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__223, dtb__224) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__223)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__223))) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes mc0) dtb__224)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__225, dtb__226) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__225) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__226)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (match ((v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes 0) dtb__227) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__228) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag dtb__225) dtb__228)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__229) -> (v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes dtb__226)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel (v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize a3))) a1) a2) a3))

# 99 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__230) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__231)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto mc0) Base_dList.C_Base_dList_dList_Nil) dtb__232) with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo mc0) dtb__231)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__233, dtb__234) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__230)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__230)) (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__233))) (Base_dVec.C_Base_dVec_dVec_VCons (dtb__233, Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo (Base_dHashMap.v_Base_dHashMap_dofNames axiomNames)) defs))

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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "axiom reached the runtime erasure check (partition must erase it)")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237) -> (match (((v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure typeNames) Base_dList.C_Base_dList_dList_Nil) dtb__237) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__238) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag d) dtb__238)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__239) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__240, dtb__241) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure mc0) dtb__240)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure mc0) dtb__241)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__242, dtb__243) -> (match dtb__242 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__244; Base_dPair.f_Base_dPair_dPair_second = dtb__245 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__244) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs dtb__243))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs a3))) a1) a2) a3))

# 435 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__246, dtb__247) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__246)) + (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts dtb__247))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Lowering/Checks.vuna"
let v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor (v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts a3))) a1) a2) a3))
