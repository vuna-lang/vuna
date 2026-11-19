open Vuna_runtime
type t_UnitParts = { f_UnitParts_unitPartsFragments : string B_dData_dList.t_List; f_UnitParts_unitPartsBodies : string B_dData_dList.t_List; f_UnitParts_unitPartsState : Codegen_dTerm.t_GenSt; f_UnitParts_unitPartsDeps : string B_dData_dList.t_List }

# 24 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_runtimeUnit = "Vuna_runtime"

# 36 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_unitPartsDeps = (fun (mc0 : t_UnitParts) -> (match mc0 with
  | { f_UnitParts_unitPartsFragments = dtb__0; f_UnitParts_unitPartsBodies = dtb__1; f_UnitParts_unitPartsState = dtb__2; f_UnitParts_unitPartsDeps = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_checkDefsForBuild = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match (Vuna_dIr_dModel.v_irDefExtern dtb__4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (v_checkDefsForBuild dtb__5)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Vuna_dIr_dModel.v_irDefBody dtb__4) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Vuna_dIr_dModel.v_irDefSpan dtb__4)) (Vuna_dIr_dModel.v_irDefName dtb__4)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (v_checkDefsForBuild dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_checkGroupsForBuild = (fun (mc0 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> ((Base_dCommon.v_bind (v_checkDefsForBuild (Vuna_dIr_dModel.v_irGroupDefs dtb__8))) (fun (_u : int) -> (v_checkGroupsForBuild dtb__9)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_checkUnitParts = (fun (shared : Vuna_dIr_dModel.t_IrShared) (unitIr : Vuna_dIr_dModel.t_IrUnit) -> (v_checkGroupsForBuild (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))

# 89 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_genTypePart = (fun (qc : Codegen_dDecl.t_QualCtx) (unitIr : Vuna_dIr_dModel.t_IrUnit) -> (Base_dDiag.C_Check_OkC (((Codegen_dDecl.v_irTypeDeclsText qc) (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls))))

# 93 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_addDep = (fun (acc : string B_dData_dList.t_List) (dep : string) -> (if (if (dep = "") then true else ((B_dData_dList.v_memName dep) acc)) then acc else ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (dep, B_dData_dList.C_List_Nil)))))

# 96 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_uniqueDeps = (fun (deps : string B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addDep) B_dData_dList.C_List_Nil) deps))

# 101 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_genUnitText = (fun (mc0 : t_UnitParts) -> (match mc0 with
  | { f_UnitParts_unitPartsFragments = dtb__10; f_UnitParts_unitPartsBodies = dtb__11; f_UnitParts_unitPartsState = dtb__12; f_UnitParts_unitPartsDeps = dtb__13 } -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_append dtb__10) (B_dData_dList.C_List__x58__x58_ (((Codegen_dOcaml_dRender.v_joinWith "\n\n") dtb__11), B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_openHeader = (fun (qc : Codegen_dDecl.t_QualCtx) -> (if ((qc).Codegen_dDecl.f_QualCtx_qcUnit = "") then "" else (String.concat "" ["open "; v_runtimeUnit; "\n"])))

# 112 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_listBridgeFor = (fun (shared : Vuna_dIr_dModel.t_IrShared) (unitIr : Vuna_dIr_dModel.t_IrUnit) -> (if (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily then (Codegen_dTerm.v_dtListBridge (shared).Vuna_dIr_dModel.f_IrShared_irSharedListFam) else ""))

# 118 "Vuna/Compiler/Codegen/Assembly.vuna"
let rec v_typeRefDeps = (fun (mc0 : Codegen_dDecl.t_QualCtx) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).Codegen_dDecl.f_QualCtx_qcUnit)) then ((v_typeRefDeps mc0) dtb__15) else (if ((B_dData_dList.v_memName owner) ((v_typeRefDeps mc0) dtb__15)) then ((v_typeRefDeps mc0) dtb__15) else (B_dData_dList.C_List__x58__x58_ (owner, ((v_typeRefDeps mc0) dtb__15)))))) ((Codegen_dDecl.v_unitOfTbl (mc0).Codegen_dDecl.f_QualCtx_qcDatas) dtb__14))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_genUnitPartsWith = (fun (norm : (string) -> string) (qc : Codegen_dDecl.t_QualCtx) (shared : Vuna_dIr_dModel.t_IrShared) (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((v_genTypePart qc) unitIr)) (fun (typeText : string) -> ((fun _u -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__16) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> ((fun _u -> ((fun deps -> (Base_dDiag.C_Check_OkC ({ f_UnitParts_unitPartsFragments = (B_dData_dList.C_List__x58__x58_ ((v_openHeader qc), (B_dData_dList.C_List__x58__x58_ (typeText, (B_dData_dList.C_List__x58__x58_ (((v_listBridgeFor shared) unitIr), B_dData_dList.C_List_Nil)))))); f_UnitParts_unitPartsBodies = dtb__17; f_UnitParts_unitPartsState = dtb__18; f_UnitParts_unitPartsDeps = deps }))) (v_uniqueDeps ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (v_runtimeUnit, B_dData_dList.C_List_Nil))) ((v_typeRefDeps qc) (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs))) (dtb__18).Codegen_dTerm.f_GenSt_gsDeps)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-genGroups-done") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__19) -> (Base_dDiag.C_Check_ErrC (dtb__19))
  | _ -> failwith "DT: impossible branch"
)) ((Codegen_dTerm.v_genGroups (((Codegen_dTerm.v_mkGenStWith norm) qc) shared)) (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-typedecls-done") else 0)))))

# 46 "Vuna/Compiler/Codegen/Assembly.vuna"
let v_genUnitParts = (fun (qc : Codegen_dDecl.t_QualCtx) (shared : Vuna_dIr_dModel.t_IrShared) (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((((v_genUnitPartsWith (fun (p : string) -> p)) qc) shared) unitIr))
