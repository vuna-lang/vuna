open Vuna_runtime
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__0, dtb__1) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__2, dtb__3, dtb__4) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (match dtb__5 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, ((Base_dList.v_Base_dList_dappend dtb__7) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__3, dtb__4)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__2))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__8) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__8), dtb__10)), (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__11) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__12))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef = (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__13) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__13), (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))) else (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__15) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), mc3))) else (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__15) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, mc2))) mc3)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc2), (Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo (Base_dHashMap.v_Base_dHashMap_dfromList table)) defs) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix = (fun d -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt (mc0 - 1)) dtb__18))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel = (fun fuel typeNames binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__19, dtb__20) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: unbound runtime variable "; dtb__19; " (index "; (bi_strFromInt dtb__20); ", binders "; (bi_strFromInt (Base_dList.v_Base_dList_dlength binders)); ")"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (match dtb__21 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__23) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__19))) dtb__19) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__20) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__24) -> (if ((Base_dList.v_Base_dList_dmemName dtb__24) typeNames) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelNameRuntime (dtb__24))) dtb__24) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__25) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__31) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__31)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__31))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__32, dtb__33, dtb__34) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33)), binders))) dtb__34)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__35, dtb__36, dtb__37) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__37) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__35) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__35)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__36))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (match dtb__38 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__41, dtb__42) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__42)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__43, dtb__44) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__43)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__44)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__45) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__46) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__47) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__48, dtb__49, dtb__50) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__48)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__49)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__50)))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (match dtb__51 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__54) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__54) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__52) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__53)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__52)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else ((fun altBinders -> ((fun env -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__55))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__56)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__55)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erasure fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (if (dtb__57 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__58))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__59) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__59) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__59) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__60, dtb__61) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__62) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__63) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__69, dtb__70, dtb__71) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__71)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__72, dtb__73, dtb__74) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__74) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__72) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__72)) dtb__73))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__75) -> (match dtb__75 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__77)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__78, dtb__79) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__79)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__80, dtb__81) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__80)) dtb__81)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__82) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__83) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__84) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__85, dtb__86, dtb__87) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__85)) dtb__86)) dtb__87)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (match dtb__88 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__91) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__89) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__90)) dtb__89)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__92))) dtb__93))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__94), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__95)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs))

let v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adjT name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) adjT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> dtb__96
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddDependents = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> ((fun cur -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents mc0) dtb__98) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__97) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, cur))) mc2))) (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__97) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> dtb__99
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents dtb__102) dtb__103) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf = (fun adj -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll adj) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel = (fun fuel adjT ms visited order -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match ms with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, order))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__104) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__105) visited) order) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel (fuel - 1)) adjT) dtb__104) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__104) true) visited)) order) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__105) dtb__106) dtb__107)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel = (fun fuel adjT n visited order -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, order)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) order) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, (Base_dList.C_Base_dList_dList_Base_dList_dCons (n, dtb__109))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun adjT ms visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adjT n visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel 100000) adjT) n) visited) order))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__110) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__111) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost mc0) dtb__110) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__110) true) mc2)) mc3) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__111) dtb__112) dtb__113)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel = (fun fuel adjT ms visited comp -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match ms with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, comp))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__114) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__115) visited) comp) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel (fuel - 1)) adjT) dtb__114) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__114) true) visited)) comp) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__115) dtb__116) dtb__117)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel = (fun fuel adjT n visited comp -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (visited, comp)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) comp) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, (Base_dList.C_Base_dList_dList_Base_dList_dCons (n, dtb__119))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun adjT ms visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun adjT n visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel 100000) adjT) n) visited) comp))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__120) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__121) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect mc0) dtb__120) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__120) true) mc2)) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__121) dtb__122) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__123, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf = (fun comps -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dconcatMap (fun g -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, g)))) g))) comps)) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddAllNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__125) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__124) true) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (if (mc0 dtb__126) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__127))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__127))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (match dtb__129 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((Base_dHashMap.v_Base_dHashMap_dmember m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
)
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((Base_dHashMap.v_Base_dHashMap_dmember m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__130) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__131) mc3) else (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__130) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dErase_dgroupOf mc1) dtb__132), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__131) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__132) mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__131) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo (v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf comps)) names) names) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name names -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName name) names)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (if (dtb__133 = "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__134) else (if ((Base_dList.v_Base_dList_dmemName dtb__133) dtb__134) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__134) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__133, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__134)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adjT group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT)) group))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__135) mc1) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__136) mc1) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adjT group emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adjT) group)) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__137) mc3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse mc2)) dtb__138))))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__138) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__137, mc2))) mc3))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adjT groups emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adjT) groups) Base_dList.C_Base_dList_dList_Base_dList_dNil) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel = (fun fuel adjT remaining emitted -> (if (fuel <= 0) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle) else (match remaining with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__139) -> (match dtb__139 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel (fuel - 1)) adjT) dtb__141) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__140) emitted))) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__140, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dDependencyCycle)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady adjT) remaining) emitted))
)))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun adjT remaining emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((Base_dList.v_Base_dList_dlength remaining) + 1)) adjT) remaining) emitted))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adjT groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adjT) groups) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf = (fun defs -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), d)))) defs)) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__142) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__143)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__144, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__143)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__145) mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: OCaml name collision among "; mc0; "s: `"; dtb__145; "`"]))) else (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo mc0) dtb__146) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__145) true) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo kind) names) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas defs -> ((fun runtime -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__147, dtb__148) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__147)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__148)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__149, dtb__150, dtb__151) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__149)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__150)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__151)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__155)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__156)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__157, dtb__158, dtb__159) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__159)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__160, dtb__161) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__161)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__162, dtb__163, dtb__164) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__164) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__162) else ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__162)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__163))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__165) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__166) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__167) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__168) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__169) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__170) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__171, dtb__172) -> (if (dtb__172 >= 0) then (if (dtb__172 < mc0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: out-of-scope de Bruijn index "; (bi_strFromInt dtb__172); " (depth "; (bi_strFromInt mc0); ")"])))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: negative de Bruijn index " ^ (bi_strFromInt dtb__172)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__176) then ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__174) else ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__175)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__174))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__177)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__177))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__178)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__179) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__180)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) dtb__181) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__182) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix dtb__179) ^ dtb__182)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__183) -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__180)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__184) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__185)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__186) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__185)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__184)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__184)) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dAxiomAtRuntime (dtb__187))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (dtb__187, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo (Base_dHashMap.v_Base_dHashMap_dofNames axiomNames)) defs))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__189)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))) defs)) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun defsTbl -> ((fun adj -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) names) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> ((fun comps -> ((fun groups -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adjT) groups)) (fun ordered -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defsTbl)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revT) dtb__191) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl adj))) (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: axiom reached the runtime erasure check (partition must erase it)"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__193) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__194) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix d) ^ dtb__194)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__195) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__195))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__196)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__197)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel 512) a1) a2) a3))
