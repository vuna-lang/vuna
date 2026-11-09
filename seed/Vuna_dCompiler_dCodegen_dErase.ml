open Vuna_runtime
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__0, dtb__1) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__0, dtb__1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__2, dtb__3, dtb__4) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (match dtb__5 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__6, dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__6, ((Base_dList.v_Base_dList_dappend dtb__7) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__3, dtb__4)), Base_dList.C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__2))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__8) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__8), dtb__10)), (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__11) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__12))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef = (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__13) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__13), (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))) else (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__14))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__15) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), mc3))) else (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__15) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__16) (Base_dList.C_Base_dList_dList_Cons (dtb__15, mc2))) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc2), (Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) defs) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix = (fun d -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt (mc0 - 1)) dtb__18))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel = (fun fuel typeNames binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: erasure fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__19, dtb__20) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: unbound runtime variable "; dtb__19; " (index "; (bi_strFromInt dtb__20); ", binders "; (bi_strFromInt (Base_dList.v_Base_dList_dlength binders)); ")"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (match dtb__21 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__22, dtb__23) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__23) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__19))) dtb__19) else (Base_dResult.C_Base_dResult_dResult_Ok (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__20) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__24) -> (if ((Base_dList.v_Base_dList_dmemName dtb__24) typeNames) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelNameRuntime (dtb__24))) dtb__24) else (Base_dResult.C_Base_dResult_dResult_Ok (0)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__25) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__31) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__31)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__31))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__32, dtb__33, dtb__34) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__32, dtb__33)), binders))) dtb__34)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__35, dtb__36, dtb__37) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__37) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__35) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__35)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__36))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (match dtb__38 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__39, dtb__40) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__41, dtb__42) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__42)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__43, dtb__44) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__43)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__44)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__45) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__46) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__47) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__48) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__49, dtb__50, dtb__51) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__49)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__50)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__51)))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__52 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__54, dtb__55) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: erasure fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__55) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__53) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__54)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__53)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: erasure fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (0)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: erasure fuel exhausted")) else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__56))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__57)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__56)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: erasure fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (0)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if (dtb__58 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59)) else (Base_dList.C_Base_dList_dList_Cons (dtb__58, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__59))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__60) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__60) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__60) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__61, dtb__62) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__63) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__64) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__70, dtb__71, dtb__72) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__72)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__73, dtb__74, dtb__75) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__75) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__73) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__73)) dtb__74))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (match dtb__76 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__77, dtb__78) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__78)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__79, dtb__80) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__80)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__81, dtb__82) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__81)) dtb__82)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__83) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__84) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__85) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__86) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__87, dtb__88, dtb__89) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__87)) dtb__88)) dtb__89)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__92, dtb__93) -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__93) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__91) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__92)) dtb__91)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__94))) dtb__95))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__96), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__97)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs))

let v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adjT name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) adjT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> dtb__98
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddDependents = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> ((fun cur -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents mc0) dtb__100) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__99) (Base_dList.C_Base_dList_dList_Cons (mc0, cur))) mc2))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__99) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> dtb__101
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__104, dtb__105) -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents dtb__104) dtb__105) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf = (fun adj -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) adj) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel = (fun fuel adjT ms visited order -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Pair (visited, order)) else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (visited, order))
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__106) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__107) visited) order) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel (fuel - 1)) adjT) dtb__106) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__106) true) visited)) order) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__108, dtb__109) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__107) dtb__108) dtb__109)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel = (fun fuel adjT n visited order -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Pair (visited, order)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) order) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__110, dtb__111) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__110, (Base_dList.C_Base_dList_dList_Cons (n, dtb__111))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun adjT ms visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adjT n visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel 100000) adjT) n) visited) order))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__112) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__113) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost mc0) dtb__112) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__112) true) mc2)) mc3) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__114, dtb__115) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__113) dtb__114) dtb__115)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc2, mc3))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel = (fun fuel adjT ms visited comp -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Pair (visited, comp)) else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (visited, comp))
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__116) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__117) visited) comp) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel (fuel - 1)) adjT) dtb__116) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__116) true) visited)) comp) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__118, dtb__119) -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__117) dtb__118) dtb__119)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel = (fun fuel adjT n visited comp -> (if (fuel <= 0) then (Base_dPair.C_Base_dPair_dPair_Pair (visited, comp)) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) comp) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__120, dtb__121) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__120, (Base_dList.C_Base_dList_dList_Cons (n, dtb__121))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun adjT ms visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun adjT n visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel 100000) adjT) n) visited) comp))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__122) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__123) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect mc0) dtb__122) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__122) true) mc2)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__124, dtb__125) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__123) dtb__124) (Base_dList.C_Base_dList_dList_Cons (dtb__125, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf = (fun comps -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap (fun g -> ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Pair (n, g)))) g))) comps)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddAllNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__127) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__126) true) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (if (mc0 dtb__128) then (Base_dList.C_Base_dList_dList_Cons (dtb__128, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__129))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__129))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__130, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
)
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__132) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__133) mc3) else (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__132) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__134) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dErase_dgroupOf mc1) dtb__134), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__133) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__134) mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__133) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo (v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf comps)) names) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name names -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName name) names)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if (dtb__135 = "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__136) else (if ((Base_dList.v_Base_dList_dmemName dtb__135) dtb__136) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__136) else (Base_dList.C_Base_dList_dList_Cons (dtb__135, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__136)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adjT group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT)) group))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__137) mc1) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__138) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adjT group emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adjT) group)) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__139) mc3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__139, ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse mc2)) dtb__140))))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__140) (Base_dList.C_Base_dList_dList_Cons (dtb__139, mc2))) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adjT groups emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adjT) groups) Base_dList.C_Base_dList_dList_Nil) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel = (fun fuel adjT remaining emitted -> (if (fuel <= 0) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle) else (match remaining with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (match dtb__141 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__142, dtb__143) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel (fuel - 1)) adjT) dtb__143) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__142) emitted))) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__142, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady adjT) remaining) emitted))
)))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun adjT remaining emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((Base_dList.v_Base_dList_dlength remaining) + 1)) adjT) remaining) emitted))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adjT groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adjT) groups) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf = (fun defs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), d)))) defs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__144) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__145)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__146) -> (Base_dList.C_Base_dList_dList_Cons (dtb__146, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__145)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__147) mc2) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: OCaml name collision among "; mc0; "s: `"; dtb__147; "`"]))) else (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo mc0) dtb__148) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__147) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__149, dtb__150) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__149)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__150)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__151, dtb__152, dtb__153) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__151)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__152)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__153)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__157)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__158)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__159, dtb__160, dtb__161) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__161)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__162, dtb__163) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__163)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__164, dtb__165, dtb__166) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__164)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__165)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__167) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__168) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__169) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__170) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__171) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__172) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__173) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__174, dtb__175) -> (if (dtb__175 >= 0) then (if (dtb__175 < mc0) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: out-of-scope de Bruijn index "; (bi_strFromInt dtb__175); " (depth "; (bi_strFromInt mc0); ")"])))) else (Base_dResult.C_Base_dResult_dResult_Err (("DT: internal: negative de Bruijn index " ^ (bi_strFromInt dtb__175)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (match dtb__176 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__178, dtb__179) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__178)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__177)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__180)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__180))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__181)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__182) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__183)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) dtb__184) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__185) -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix dtb__182) ^ dtb__185)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__186) -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__183)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__187) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__188)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) Base_dList.C_Base_dList_dList_Nil) dtb__189) with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__188)
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__187)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__187)) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__190))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__190, Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo (Base_dHashMap.v_Base_dHashMap_dofNames axiomNames)) defs))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__192) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) Base_dList.C_Base_dList_dList_Nil) dtb__192)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))) defs)) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun defsTbl -> ((fun adj -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__193, dtb__194) -> ((fun comps -> ((fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adjT) groups)) (fun ordered -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defsTbl)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revT) dtb__194) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl adj))) (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: axiom reached the runtime erasure check (partition must erase it)"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__196) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) Base_dList.C_Base_dList_dList_Nil) dtb__196) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__197) -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocPrefix d) ^ dtb__197)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__198) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__198))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__199)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__200)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel 512) a1) a2) a3))
