open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts = C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts of (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCodegen_dTerm.t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) * (string Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit = "Vuna_runtime"

let v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((fun allTypeNames -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__4)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames datas) dtb__4)) (fun _u -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__4)) (fun _u -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs dtb__4)) (fun groups -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, groups))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-groups-done"))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-erasure-done"))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-names-done"))))))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-partition-done"))) ((Base_dList.v_Base_dList_dappend dtb__5) familyNames))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs))) (Base_dPair.v_Base_dPair_dsecondOf program))) (Base_dPair.v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCodegen_dAssembly_daddDep = (fun acc dep -> (if (if (dep = "") then true else ((Base_dList.v_Base_dList_dmemName dep) acc)) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dep, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps = (fun deps -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dCodegen_dAssembly_daddDep) Base_dList.C_Base_dList_dList_Base_dList_dNil) deps))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dappend dtb__6) (Base_dList.C_Base_dList_dList_Base_dList_dCons (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__7), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dhookDeps = (fun dep -> (if (dep = "") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dep, Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook = (fun qc program runtimeDefs printResult -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") runtimeDefs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> ((fun table -> ((fun mainRef -> (match (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> ((fun p -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) dtb__11) (Base_dPair.v_Base_dPair_dfirstOf p)) printResult)) (fun hook -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (hook, (v_Vuna_dCompiler_dCodegen_dAssembly_dhookDeps (Base_dPair.v_Base_dPair_dsecondOf p))))))))) (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dioRunText qc) program) mainRef))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10)) mainRef) printResult)) (fun hook -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (hook, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName "main"))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable (Base_dPair.v_Base_dPair_dsecondOf program)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader = (fun qc -> (if ((match qc with
  | Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
) = "") then "" else (String.concat "" ["open "; v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit; "\n"])))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> ((Base_dList.v_Base_dList_dappend dtb__15) (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups dtb__16))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__17) = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName mc0) dtb__18))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor = (fun allDatas unitDatas -> (match (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData allDatas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (if ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__19)) unitDatas) then (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts = (fun usedTbl qc allDatas unitDatas groups -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith qc) usedTbl) allDatas) unitDatas)) (fun typeText -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups groups)))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt qc) allDatas)) groups)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> ((fun _u -> ((fun deps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader qc), (Base_dList.C_Base_dList_dList_Base_dList_dCons (typeText, (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor allDatas) unitDatas), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))), dtb__20, dtb__21, deps))))) (v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons (v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf qc) unitDatas))) (match dtb__21 with
  | Vuna_dCompiler_dCodegen_dTerm.C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-genGroups-done"))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-typedecls-done")))))

let v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram = (fun program -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram program)) (fun p -> ((fun _u -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program)))) Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dnoQual) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Base_dPair.v_Base_dPair_dfirstOf program))) dtb__30)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-prepare-done")))))
