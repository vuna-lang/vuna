open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts = { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState : Vuna_dCompiler_dCodegen_dTerm.t_Vuna_dCompiler_dCodegen_dTerm_dGenSt; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps : string Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit = "Vuna_runtime"

let v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__0; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__1; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__2; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = dtb__5 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__4)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames datas) dtb__4)) (fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__4)) (fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs dtb__4)) (fun groups -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = groups }))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-groups-done") else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-erasure-done") else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-names-done") else 0))))))))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-partition-done") else 0))) ((Base_dList.v_Base_dList_dappend dtb__5) familyTypeNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__4))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs))) (Base_dPair.v_Base_dPair_dsecondOf program))) (Base_dPair.v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCodegen_dAssembly_daddDep = (fun acc dep -> (if (if (dep = "") then true else ((Base_dList.v_Base_dList_dmemName dep) acc)) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps = (fun deps -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dCodegen_dAssembly_daddDep) Base_dList.C_Base_dList_dList_Nil) deps))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__6; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__7; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__8; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__9 } -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dappend dtb__6) (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__7), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dhookDeps = (fun dep -> (if (dep = "") then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook = (fun qc program runtimeDefs printResult -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") runtimeDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_NoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> ((fun table -> ((fun mainRef -> (match (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dactionResultTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> ((fun innerTy -> ((fun runText -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) innerTy) (Base_dPair.v_Base_dPair_dfirstOf runText)) printResult)) (fun hook -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = hook; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dAssembly_dhookDeps (Base_dPair.v_Base_dPair_dsecondOf runText)) }))))) (((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dactionRunText qc) program) mainRef) (Base_dPair.v_Base_dPair_dfirstOf dtb__11)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__11))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10)) mainRef) printResult)) (fun hook -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = hook; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName "main"))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable (Base_dPair.v_Base_dPair_dsecondOf program)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader = (fun qc -> (if ((qc).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = "") then "" else (String.concat "" ["open "; v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit; "\n"])))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((Base_dList.v_Base_dList_dappend dtb__12) (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__14) = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName mc0) dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor = (fun allDatas unitDatas -> (match (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData allDatas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (if ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__16)) unitDatas) then (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts = (fun usedTbl qc allDatas unitDatas groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) usedTbl) allDatas) unitDatas)) (fun typeText -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups groups)))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt qc) allDatas)) groups)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__17; Base_dPair.f_Base_dPair_dPair_second = dtb__18 } -> ((fun _u -> ((fun deps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader qc), (Base_dList.C_Base_dList_dList_Cons (typeText, (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor allDatas) unitDatas), Base_dList.C_Base_dList_dList_Nil)))))); f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__17; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__18; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = deps }))) (v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Nil))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf qc) unitDatas))) (dtb__18).Vuna_dCompiler_dCodegen_dTerm.f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-genGroups-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-typedecls-done") else 0)))))

let v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram = (fun program -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram program)) (fun p -> ((fun _u -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__19; Base_dPair.f_Base_dPair_dPair_second = dtb__20 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program)))) Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dnoQual) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program))) dtb__20)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "cg-prepare-done") else 0)))))
