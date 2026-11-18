open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts = { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState : Vuna_dCompiler_dCodegen_dTerm.t_Vuna_dCompiler_dCodegen_dTerm_dGenSt; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps : string Base_dData_dList.t_Base_dData_dList_dList }

# 24 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit = "Vuna_runtime"

# 36 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts) -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__0; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__1; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__2; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDefsForBuild = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern dtb__4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__6) -> (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDefsForBuild dtb__5)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody dtb__4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan dtb__4)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName dtb__4)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDefsForBuild dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_Vuna_dCompiler_dCodegen_dAssembly_dcheckGroupsForBuild = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDefsForBuild (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs dtb__8))) (fun (_u : int) -> (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckGroupsForBuild dtb__9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dcheckUnitParts = (fun shared unitIr -> (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckGroupsForBuild (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))

# 84 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dgenTypePart = (fun qc unitIr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText qc) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls))))

# 88 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_daddDep = (fun acc dep -> (if (if (dep = "") then true else ((Base_dData_dList.v_Base_dData_dList_dmemName dep) acc)) then acc else ((Base_dData_dList.v_Base_dData_dList_dappend acc) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dep, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 91 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps = (fun deps -> (((Base_dData_dList.v_Base_dData_dList_dfoldl v_Vuna_dCompiler_dCodegen_dAssembly_daddDep) Base_dData_dList.C_Base_dData_dList_dList_Nil) deps))

# 96 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts) -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__10; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__11; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__12; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__13 } -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dappend dtb__10) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "\n\n") dtb__11), Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader = (fun qc -> (if ((qc).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = "") then "" else (String.concat "" ["open "; v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit; "\n"])))

# 107 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor = (fun shared unitIr -> (if (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily then (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam) else ""))

# 113 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps = (fun (mc0 : Vuna_dCompiler_dCodegen_dDecl.t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__15) else (if ((Base_dData_dList.v_Base_dData_dList_dmemName owner) ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__15)) then ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__15) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (owner, ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__15)))))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__14))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitPartsWith = (fun norm qc shared unitIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dAssembly_dgenTypePart qc) unitIr)) (fun (typeText : string) -> ((fun _u -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__16) -> (match dtb__16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__18 } -> ((fun _u -> ((fun deps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader qc), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (typeText, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor shared) unitIr), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))); f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__17; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__18; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = deps }))) (v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps qc) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs))) (dtb__18).Vuna_dCompiler_dCodegen_dTerm.f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-genGroups-done") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__19) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__19))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dmkGenStWith norm) qc) shared)) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-typedecls-done") else 0)))))

# 46 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts = (fun qc shared unitIr -> ((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitPartsWith (fun (p : string) -> p)) qc) shared) unitIr))
