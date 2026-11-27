open Vuna_runtime
type t_UnitParts = { f_UnitParts_unitPartsFragments : string B_dData_dList.t_List; f_UnitParts_unitPartsBodies : string B_dData_dList.t_List; f_UnitParts_unitPartsState : Vuna_dTarget_dOcaml_dTerm.t_GenSt; f_UnitParts_unitPartsDeps : string B_dData_dList.t_List }

# 24 "Vuna/Target/Ocaml/Assembly.vuna"
let v_runtimeUnit = "Vuna_runtime"

# 29 "Vuna/Target/Ocaml/Assembly.vuna"
let v_deflocsUnit = "Vuna_deflocs"

# 81 "Vuna/Target/Ocaml/Assembly.vuna"
let rec v_checkDefsForBuild = (fun (dtb_u_u1 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2, dtb_u_u3) -> (match (Vuna_dIr_dModel.v_irDefExtern dtb_u_u2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u4) -> (v_checkDefsForBuild dtb_u_u3)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Vuna_dIr_dModel.v_irDefSpan dtb_u_u2)) (Vuna_dIr_dModel.v_irDefName dtb_u_u2)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u5) -> (v_checkDefsForBuild dtb_u_u3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Target/Ocaml/Assembly.vuna"
let rec v_checkGroupsForBuild = (fun (dtb_u_u6 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> ((Base_dCommon.v_bind (v_checkDefsForBuild (Vuna_dIr_dModel.v_irGroupDefs dtb_u_u7))) (fun (dtb_u_u9 : int) -> (v_checkGroupsForBuild dtb_u_u8)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Target/Ocaml/Assembly.vuna"
let v_checkUnitParts = (fun (dtb_u_u10 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u11 : Vuna_dIr_dModel.t_IrUnit) -> (v_checkGroupsForBuild (dtb_u_u11).Vuna_dIr_dModel.f_IrUnit_irUnitGroups))

# 93 "Vuna/Target/Ocaml/Assembly.vuna"
let v_genTypePart = (fun (dtb_u_u12 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u13 : Vuna_dIr_dModel.t_IrUnit) -> (Base_dDiag.C_Check_OkC (((Vuna_dTarget_dOcaml_dDecl.v_irTypeDeclsText dtb_u_u12) (dtb_u_u13).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls))))

# 97 "Vuna/Target/Ocaml/Assembly.vuna"
let v_addDep = (fun (dtb_u_u14 : string B_dData_dList.t_List) (dtb_u_u15 : string) -> (if (if (dtb_u_u15 = "") then true else ((B_dData_dList.v_memName dtb_u_u15) dtb_u_u14)) then dtb_u_u14 else ((B_dData_dList.v_append dtb_u_u14) (B_dData_dList.C_List__x58__x58_ (dtb_u_u15, B_dData_dList.C_List_Nil)))))

# 100 "Vuna/Target/Ocaml/Assembly.vuna"
let v_uniqueDeps = (fun (dtb_u_u16 : string B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addDep) B_dData_dList.C_List_Nil) dtb_u_u16))

# 105 "Vuna/Target/Ocaml/Assembly.vuna"
let v_genUnitText = (fun (dtb_u_u17 : t_UnitParts) -> (match dtb_u_u17 with
  | { f_UnitParts_unitPartsFragments = dtb_u_u18; f_UnitParts_unitPartsBodies = dtb_u_u19; f_UnitParts_unitPartsState = dtb_u_u20; f_UnitParts_unitPartsDeps = dtb_u_u21 } -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_append dtb_u_u18) (B_dData_dList.C_List__x58__x58_ (((Vuna_dTarget_dOcaml_dRender.v_joinWith "\n\n") dtb_u_u19), B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Target/Ocaml/Assembly.vuna"
let v_openHeader = (fun (dtb_u_u22 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) -> (if ((dtb_u_u22).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit = "") then "" else (String.concat "" ["open "; v_runtimeUnit; "\n"])))

# 116 "Vuna/Target/Ocaml/Assembly.vuna"
let v_listBridgeFor = (fun (dtb_u_u23 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u24 : Vuna_dIr_dModel.t_IrUnit) -> (if (dtb_u_u24).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily then (Vuna_dTarget_dOcaml_dTerm.v_dtListBridge (dtb_u_u23).Vuna_dIr_dModel.f_IrShared_irSharedListFam) else ""))

# 122 "Vuna/Target/Ocaml/Assembly.vuna"
let rec v_typeRefDeps = (fun (dtb_u_u25 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u26 : string B_dData_dList.t_List) -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u27, dtb_u_u28) -> (let dtb_u_u29 = ((Vuna_dTarget_dOcaml_dDecl.v_unitOfTbl (dtb_u_u25).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas) dtb_u_u27) in (if (if (dtb_u_u29 = "") then true else (dtb_u_u29 = (dtb_u_u25).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit)) then ((v_typeRefDeps dtb_u_u25) dtb_u_u28) else (if ((B_dData_dList.v_memName dtb_u_u29) ((v_typeRefDeps dtb_u_u25) dtb_u_u28)) then ((v_typeRefDeps dtb_u_u25) dtb_u_u28) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u29, ((v_typeRefDeps dtb_u_u25) dtb_u_u28))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Target/Ocaml/Assembly.vuna"
let v_genUnitPartsWith = (fun (dtb_u_u30 : (string) -> string) (dtb_u_u31 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u32 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u33 : Vuna_dIr_dModel.t_IrUnit) -> (let dtb_u_u34 = (if ((dtp_log_on 2) "Vuna.Target.Ocaml.Assembly") then (((dtp_log_emit 2) "Vuna.Target.Ocaml.Assembly") "cg-unit-ir-ready") else 0) in ((Base_dCommon.v_bind ((v_genTypePart dtb_u_u31) dtb_u_u33)) (fun (dtb_u_u35 : string) -> (let dtb_u_u36 = (if ((dtp_log_on 2) "Vuna.Target.Ocaml.Assembly") then (((dtp_log_emit 2) "Vuna.Target.Ocaml.Assembly") "cg-typedecls-done") else 0) in (let dtb_u_u37 = ((Vuna_dTarget_dOcaml_dTerm.v_genGroups (((Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith dtb_u_u30) dtb_u_u31) dtb_u_u32)) (dtb_u_u33).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (match dtb_u_u37 with
  | Base_dDiag.C_Check_OkC (dtb_u_u38) -> (match dtb_u_u38 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u39; B_dData_dPair.f_Pair_second = dtb_u_u40 } -> (let dtb_u_u41 = (if ((dtp_log_on 2) "Vuna.Target.Ocaml.Assembly") then (((dtp_log_emit 2) "Vuna.Target.Ocaml.Assembly") "cg-genGroups-done") else 0) in (let dtb_u_u42 = (v_uniqueDeps ((B_dData_dList.v_append ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (v_runtimeUnit, B_dData_dList.C_List_Nil))) ((v_typeRefDeps dtb_u_u31) (dtb_u_u33).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs))) (dtb_u_u40).Vuna_dTarget_dOcaml_dTerm.f_GenSt_gsDeps)) in (Base_dDiag.C_Check_OkC ({ f_UnitParts_unitPartsFragments = (B_dData_dList.C_List__x58__x58_ ((v_openHeader dtb_u_u31), (B_dData_dList.C_List__x58__x58_ (dtb_u_u35, (B_dData_dList.C_List__x58__x58_ (((v_listBridgeFor dtb_u_u32) dtb_u_u33), B_dData_dList.C_List_Nil)))))); f_UnitParts_unitPartsBodies = dtb_u_u39; f_UnitParts_unitPartsState = dtb_u_u40; f_UnitParts_unitPartsDeps = dtb_u_u42 }))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u43) -> (Base_dDiag.C_Check_ErrC (dtb_u_u43))
  | _ -> failwith "DT: impossible branch"
)))))))

# 48 "Vuna/Target/Ocaml/Assembly.vuna"
let v_genUnitParts = (fun (dtb_u_u44 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u45 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u46 : Vuna_dIr_dModel.t_IrUnit) -> ((((v_genUnitPartsWith (fun (dtb_u_u47 : string) -> dtb_u_u47)) dtb_u_u44) dtb_u_u45) dtb_u_u46))

# 35 "Vuna/Target/Ocaml/Assembly.vuna"
let v_unitPartsFragments = (fun (dtb_u_u48 : t_UnitParts) -> (match dtb_u_u48 with
  | { f_UnitParts_unitPartsFragments = dtb_u_u49; f_UnitParts_unitPartsBodies = dtb_u_u50; f_UnitParts_unitPartsState = dtb_u_u51; f_UnitParts_unitPartsDeps = dtb_u_u52 } -> dtb_u_u49
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Target/Ocaml/Assembly.vuna"
let v_unitPartsBodies = (fun (dtb_u_u53 : t_UnitParts) -> (match dtb_u_u53 with
  | { f_UnitParts_unitPartsFragments = dtb_u_u54; f_UnitParts_unitPartsBodies = dtb_u_u55; f_UnitParts_unitPartsState = dtb_u_u56; f_UnitParts_unitPartsDeps = dtb_u_u57 } -> dtb_u_u55
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Target/Ocaml/Assembly.vuna"
let v_unitPartsState = (fun (dtb_u_u58 : t_UnitParts) -> (match dtb_u_u58 with
  | { f_UnitParts_unitPartsFragments = dtb_u_u59; f_UnitParts_unitPartsBodies = dtb_u_u60; f_UnitParts_unitPartsState = dtb_u_u61; f_UnitParts_unitPartsDeps = dtb_u_u62 } -> dtb_u_u61
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Target/Ocaml/Assembly.vuna"
let v_unitPartsDeps = (fun (dtb_u_u63 : t_UnitParts) -> (match dtb_u_u63 with
  | { f_UnitParts_unitPartsFragments = dtb_u_u64; f_UnitParts_unitPartsBodies = dtb_u_u65; f_UnitParts_unitPartsState = dtb_u_u66; f_UnitParts_unitPartsDeps = dtb_u_u67 } -> dtb_u_u67
  | _ -> failwith "DT: impossible branch"
))
