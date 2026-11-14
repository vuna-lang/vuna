open Vuna_runtime
# 30 "Vuna/Compiler/Codegen/Erase.vuna"
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

# 41 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_ddefTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__10) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10); Base_dPair.f_Base_dPair_dPair_second = dtb__12 }, (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__11)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_ddefTable dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__13) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef mc0) dtb__14))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef = (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody d)))

# 56 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__15) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__15), (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__16))) else (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf dtb__16))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef = (fun tbl d -> (Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce tbl) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

# 70 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if (v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef dtb__17) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__17), mc3))) else (if ((v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef mc0) dtb__17) then ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__17), mc3))) else ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo mc0) dtb__18) (Base_dList.C_Base_dList_dList_Cons (dtb__17, mc2))) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc2); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs = (fun table defs -> ((((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) defs) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 80 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag = (fun d e -> (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) e))

# 115 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint = (fun m -> (" ?" ^ (bi_strFromInt m)))

# 176 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dbinderAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19)) else ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt (mc0 - 1)) dtb__20))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Codegen/Erase.vuna"
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
# 158 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__72) then ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) mc2) dtb__71)) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__70)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 166 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else ((fun altBinders -> ((fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (mc0 - 1)) mc1) env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__73))) (fun _u -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__74)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse altBinders)) mc2))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__73)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "erasure") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_daddName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (dtb__75 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76)) else (Base_dList.C_Base_dList_dList_Cons (dtb__75, ((v_Vuna_dCompiler_dCodegen_dErase_daddName mc0) dtb__76))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Codegen/Erase.vuna"
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
# 215 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (if (mc0 <= 0) then mc2 else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__125) then ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__123) else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__124)) dtb__123)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (mc0 <= 0) then mc2 else ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel (mc0 - 1)) mc1) ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel (mc0 - 1)) mc1) mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__126))) dtb__127))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__128), (v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf dtb__129)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__130, dtb__131) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__130)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__131)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__132)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength dtb__134))) dtb__136)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__137)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__142, dtb__143, dtb__144) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__142)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__143)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__144)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__148)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__149)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__150, dtb__151, dtb__152) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + 1)) dtb__152)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__154)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__155, dtb__156) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__156)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__157, dtb__158) -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__158)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__159, dtb__160, dtb__161) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__159)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__160)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__162) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__163) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__164) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__165) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__166) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__167) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__168) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__169, dtb__170, dtb__171) -> (if (dtb__170 >= 0) then (if (dtb__170 < mc0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__170); " (depth "; (bi_strFromInt mc0); ")"]))) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__170))))
  | _ -> failwith "DT: impossible branch"
))
# 274 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (match dtb__172 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__174; Base_dPair.f_Base_dPair_dPair_second = dtb__175 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes mc0) dtb__174)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs mc0) dtb__173)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 279 "Vuna/Compiler/Codegen/Erase.vuna"
and v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes (mc0 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__176)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__176))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes mc0) dtb__177)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__178) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__179)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__180) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes 0) dtb__180) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__181) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag dtb__178) dtb__181)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__182) -> (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes dtb__179)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel 100000) a1) a2) a3))

# 88 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__183) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__184)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto mc0) Base_dList.C_Base_dList_dList_Nil) dtb__185) with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo mc0) dtb__184)
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__183)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__183)) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_AxiomAtRuntime (dtb__186))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__186, Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime = (fun axiomNames defs -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo (Base_dHashMap.v_Base_dHashMap_dofNames axiomNames)) defs))

# 299 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel 100000) a1) a2) a3))

# 302 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel 100000) a1) a2) a3))

# 320 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax = 1000000

# 314 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor = (fun size -> ((fun scaled -> (if (scaled > v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax) then v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax else scaled)) (512 + (4 * size))))

# 305 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure = (fun typeNames binders t -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure = (fun typeNames d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "axiom reached the runtime erasure check (partition must erase it)")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> (match (((v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure typeNames) Base_dList.C_Base_dList_dList_Nil) dtb__190) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__191) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag d) dtb__191)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__192) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__192))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure mc0) dtb__193)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure mc0) dtb__194)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = dtb__198 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__197) + (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs a3))) a1) a2) a3))

# 334 "Vuna/Compiler/Codegen/Erase.vuna"
let rec v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__199)) + (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts dtb__200))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Codegen/Erase.vuna"
let v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor (v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts a3))) a1) a2) a3))
