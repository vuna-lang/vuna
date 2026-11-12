open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts = { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState : Vuna_dCompiler_dCodegen_dTerm.t_Vuna_dCompiler_dCodegen_dTerm_dGenSt; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps : string Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit = "Vuna_runtime"

let v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__0; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__1; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__2; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenTypePart = (fun qc unitIr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText qc) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls))))

let v_Vuna_dCompiler_dCodegen_dAssembly_daddDep = (fun acc dep -> (if (if (dep = "") then true else ((Base_dList.v_Base_dList_dmemName dep) acc)) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps = (fun deps -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dCodegen_dAssembly_daddDep) Base_dList.C_Base_dList_dList_Nil) deps))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = dtb__4; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__5; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__6; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = dtb__7 } -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dappend dtb__4) (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__5), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader = (fun qc -> (if ((qc).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = "") then "" else (String.concat "" ["open "; v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit; "\n"])))

let v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor = (fun shared unitIr -> (if (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily then (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam) else ""))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> ((fun owner -> (if (if (owner = "") then true else (owner = (mc0).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__9) else (if ((Base_dList.v_Base_dList_dmemName owner) ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__9)) then ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__9) else (Base_dList.C_Base_dList_dList_Cons (owner, ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps mc0) dtb__9)))))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (mc0).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) dtb__8))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts = (fun qc shared unitIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dAssembly_dgenTypePart qc) unitIr)) (fun typeText -> ((fun _u -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__11; Base_dPair.f_Base_dPair_dPair_second = dtb__12 } -> ((fun _u -> ((fun deps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsFragments = (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader qc), (Base_dList.C_Base_dList_dList_Cons (typeText, (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor shared) unitIr), Base_dList.C_Base_dList_dList_Nil)))))); f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsBodies = dtb__11; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsState = dtb__12; f_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_unitPartsDeps = deps }))) (v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps qc) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs))) (dtb__12).Vuna_dCompiler_dCodegen_dTerm.f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-genGroups-done") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__13) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__13))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt qc) shared)) (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-typedecls-done") else 0)))))
