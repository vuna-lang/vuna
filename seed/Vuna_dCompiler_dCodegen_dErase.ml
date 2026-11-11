open Vuna_runtime
let rec v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__0, dtb__1) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__0; Base_dPair.f_Base_dPair_dPair_second = dtb__1 }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__2, dtb__3) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__4, dtb__5, dtb__6) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (match dtb__7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__9) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__5; Base_dPair.f_Base_dPair_dPair_second = dtb__6 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp dtb__4))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__10) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10); Base_dPair.f_Base_dPair_dPair_second = dtb__12 }, (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__11)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__13) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__14))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef = (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__15) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__16))) else (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__16))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__17) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__17), mc3))) else (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__17) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__17), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) (Base_dList.C_Base_dList_dList_Cons (dtb__17, mc2))) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc2); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) defs) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag = (fun d e -> (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) e))

let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt (mc0 - 1)) dtb__20))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel = (fun fuel typeNames binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__21, dtb__22, dtb__23) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["unbound runtime variable "; dtb__21; " (index "; (bi_strFromInt dtb__22); ", binders "; (bi_strFromInt (Base_dList.v_Base_dList_dlength binders)); ")"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> (match dtb__24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__25; Base_dPair.f_Base_dPair_dPair_second = dtb__26 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__26) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__21))) dtb__21) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__22) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__27) -> (if ((Base_dList.v_Base_dList_dmemName dtb__27) typeNames) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelNameRuntime (dtb__27))) dtb__27) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__28) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__34) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__34)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__34))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__35, dtb__36, dtb__37) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__35; Base_dPair.f_Base_dPair_dPair_second = dtb__36 }, binders))) dtb__37)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__38, dtb__39, dtb__40) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__40) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__38) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__38)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__39))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> (match dtb__41 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__43)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__44, dtb__45) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__45)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__46, dtb__47) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__48, dtb__49) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__50)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__55)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__56; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__57; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__59 }, Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__60, dtb__61) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__60)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (fuel - 1)) typeNames) binders) dtb__61)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__62) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__63) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__64) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__65) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__66, dtb__67, dtb__68) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__66)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__67)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (fuel - 1)) typeNames) binders) dtb__68)))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__72) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__71)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__73))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__74)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__73)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (dtb__75 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76)) else (Base_dList.C_Base_dList_dList_Cons (dtb__75, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__76))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel = (fun fuel runtimeNames acc t -> (if (fuel <= 0) then acc else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__77) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__77) runtimeNames) then ((v_Vuna_dCompiler_dCodegen_dErase_daddName dtb__77) acc) else acc)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__78, dtb__79, dtb__80) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__81) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__82) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__88, dtb__89, dtb__90) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__90)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__91, dtb__92, dtb__93) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__93) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__91) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__91)) dtb__92))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (match dtb__94 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__96)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__97, dtb__98) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__98)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__99, dtb__100) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__100)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__101, dtb__102) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__103)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__108)) (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__109; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__110; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__112 }, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__113, dtb__114) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__113)) dtb__114)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__115) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__116) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__117) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__118) -> acc
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__119, dtb__120, dtb__121) -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__119)) dtb__120)) dtb__121)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__125) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__123) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__124)) dtb__123)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__126))) dtb__127))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__128), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__129)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef = (fun defs name -> ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs))

let v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf = (fun adjT name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) adjT) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__130) -> dtb__130
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddDependents = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> ((fun cur -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents mc0) dtb__132) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__131) (Base_dList.C_Base_dList_dList_Cons (mc0, cur))) mc2))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__131) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> dtb__133
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__134 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> (((v_Vuna_dCompiler_dCodegen_dErase_daddDependents dtb__136) dtb__137) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl dtb__135))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf = (fun adj -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) adj) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel = (fun fuel adjT ms visited order -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order } else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order }
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__138) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__139) visited) order) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel (fuel - 1)) adjT) dtb__138) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__138) true) visited)) order) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__140; Base_dPair.f_Base_dPair_dPair_second = dtb__141 } -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) dtb__139) dtb__140) dtb__141)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel = (fun fuel adjT n visited order -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = order } else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) order) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (n, dtb__143)) }
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost = (fun adjT ms visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel 100000) adjT) ms) visited) order))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsPost = (fun adjT n visited order -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel 100000) adjT) n) visited) order))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpostOrder = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__144) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__145) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsPost mc0) dtb__144) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__144) true) mc2)) mc3) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__146; Base_dPair.f_Base_dPair_dPair_second = dtb__147 } -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder mc0) dtb__145) dtb__146) dtb__147)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel = (fun fuel adjT ms visited comp -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp } else (match ms with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp }
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__148) visited) then (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__149) visited) comp) else (match (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel (fuel - 1)) adjT) dtb__148) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__148) true) visited)) comp) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__150; Base_dPair.f_Base_dPair_dPair_second = dtb__151 } -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) dtb__149) dtb__150) dtb__151)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel = (fun fuel adjT n visited comp -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = comp } else (match (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel (fuel - 1)) adjT) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT) n)) visited) comp) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (n, dtb__153)) }
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect = (fun adjT ms visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

let v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect = (fun adjT n visited comp -> (((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel 100000) adjT) n) visited) comp))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcollectComps = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__154) mc2) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__155) mc2) mc3) else (match ((((v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect mc0) dtb__154) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__154) true) mc2)) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__156; Base_dPair.f_Base_dPair_dPair_second = dtb__157 } -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps mc0) dtb__155) dtb__156) (Base_dList.C_Base_dList_dList_Cons (dtb__157, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf = (fun comps -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap (fun g -> ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = g })) g))) comps)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_daddAllNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__159) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__158) true) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dfilterNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (if (mc0 dtb__160) then (Base_dList.C_Base_dList_dList_Cons (dtb__160, ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__161))) else ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames mc0) dtb__161))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__162, Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
)
  | _ -> ((fun memberTbl -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun m -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) m) memberTbl))) mc0)) (Base_dHashMap.v_Base_dHashMap_dofNames mc1))
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__164) mc3) then ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__165) mc3) else (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__164) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dErase_dgroupOf mc1) dtb__166), ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__165) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__166) mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo mc0) mc1) dtb__165) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps = (fun comps names -> ((((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo (v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf comps)) names) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_dnotIn = (fun name names -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName name) names)))

let rec v_Vuna_dCompiler_dCodegen_dErase_duniqueNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (if (dtb__167 = "") then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__168) else (if ((Base_dList.v_Base_dList_dmemName dtb__167) dtb__168) then (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__168) else (Base_dList.C_Base_dList_dList_Cons (dtb__167, (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames dtb__168)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps = (fun adjT group -> ((v_Vuna_dCompiler_dCodegen_dErase_dfilterNames (fun n -> ((v_Vuna_dCompiler_dCodegen_dErase_dnotIn n) group))) (v_Vuna_dCompiler_dCodegen_dErase_duniqueNames ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf adjT)) group))))

let rec v_Vuna_dCompiler_dCodegen_dErase_dallIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__169) mc1) then ((v_Vuna_dCompiler_dCodegen_dErase_dallIn dtb__170) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupReady = (fun adjT group emitted -> ((v_Vuna_dCompiler_dCodegen_dErase_dallIn ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps adjT) group)) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (if (((v_Vuna_dCompiler_dCodegen_dErase_dgroupReady mc0) dtb__171) mc3) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__171; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse mc2)) dtb__172) })) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc mc0) dtb__172) (Base_dList.C_Base_dList_dList_Cons (dtb__171, mc2))) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dpickReady = (fun adjT groups emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc adjT) groups) Base_dList.C_Base_dList_dList_Nil) emitted))

let rec v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel = (fun fuel adjT remaining emitted -> (if (fuel <= 0) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle) else (match remaining with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__173) -> (match dtb__173 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__174; Base_dPair.f_Base_dPair_dPair_second = dtb__175 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel (fuel - 1)) adjT) dtb__175) ((v_Vuna_dCompiler_dCodegen_dErase_daddAllNames dtb__174) emitted))) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__174, tail))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_DependencyCycle)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dErase_dpickReady adjT) remaining) emitted))
)))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc = (fun adjT remaining emitted -> ((((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel ((Base_dList.v_Base_dList_dlength remaining) + 1)) adjT) remaining) emitted))

let v_Vuna_dCompiler_dCodegen_dErase_dorderGroups = (fun adjT groups -> (((v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc adjT) groups) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf = (fun defs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = d })) defs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__176) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__177)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (Base_dList.C_Base_dList_dList_Cons (dtb__178, ((v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf mc0) dtb__177)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__179) mc2) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__179; "`"])) else (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo mc0) dtb__180) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__179) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas)))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__181, dtb__182) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__181)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__182)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__183)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength dtb__185))) dtb__187)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__188)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__193, dtb__194, dtb__195) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__193)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__194)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__195)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__199)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__200)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__201, dtb__202, dtb__203) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__203)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__204, dtb__205) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__205)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__206, dtb__207) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__207)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__208, dtb__209) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__209)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__210, dtb__211, dtb__212) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__210)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__211)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__213) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__214) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__215) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__216) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__217) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__218) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__219) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__220, dtb__221, dtb__222) -> (if (dtb__221 >= 0) then (if (dtb__221 < mc0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__221); " (depth "; (bi_strFromInt mc0); ")"]))) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__221))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (match dtb__223 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__225)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__224)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__227)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__227))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__228)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__229) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__230)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) dtb__231) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__232) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag dtb__229) dtb__232)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__233) -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__230)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__234) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__235)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) Base_dList.C_Base_dList_dList_Nil) dtb__236) with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__235)
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__234)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__234)) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__237))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__237, Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo (Base_dHashMap.v_Base_dHashMap_dofNames axiomNames)) defs))

let v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency = (fun defs -> ((fun names -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) Base_dList.C_Base_dList_dList_Nil) dtb__239) }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))) defs)) (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs))))

let v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs = (fun defs -> ((fun names -> ((fun defsTbl -> ((fun adj -> ((fun adjT -> ((fun revT -> (match ((((v_Vuna_dCompiler_dCodegen_dErase_dpostOrder adjT) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__240; Base_dPair.f_Base_dPair_dPair_second = dtb__241 } -> ((fun comps -> ((fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dorderGroups adjT) groups)) (fun ordered -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf defsTbl)) ordered)))))) ((v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps comps) names))) ((((v_Vuna_dCompiler_dCodegen_dErase_dcollectComps revT) dtb__241) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl adj))) (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf adj))) (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency defs))) (v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf defs))) (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax = 1000000

let v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor = (fun size -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax) then v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax else scaled)) (512 + (4 * size))))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun typeNames binders t -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "axiom reached the runtime erasure check (partition must erase it)")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__244) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) Base_dList.C_Base_dList_dList_Nil) dtb__244) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__245) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag d) dtb__245)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__246) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__246))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__247)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__248)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (match dtb__249 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__251; Base_dPair.f_Base_dPair_dPair_second = dtb__252 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__251) + (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs dtb__250))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs a3))) a1) a2) a3))

let rec v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__253)) + (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts dtb__254))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts a3))) a1) a2) a3))
