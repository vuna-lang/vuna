open Vuna_runtime
# 25 "Vuna/Compiler/Lowering/Entry.vuna"
let v_actionResultTyIn = (fun (dtb_u_u1 : Core_dTerm.t_Term) -> (match dtb_u_u1 with
  | Core_dTerm.C_Term_TApp (dtb_u_u2, dtb_u_u3, dtb_u_u4) -> (match dtb_u_u2 with
  | Core_dTerm.C_Term_TApp (dtb_u_u5, dtb_u_u6, dtb_u_u7) -> (match dtb_u_u5 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u8) -> (if (dtb_u_u8 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = "eff"; B_dData_dPair.f_Pair_second = dtb_u_u3 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 33 "Vuna/Compiler/Lowering/Entry.vuna"
let v_unwrapNamedTerm = (fun (dtb_u_u9 : Core_dTerm.t_Term) -> (match dtb_u_u9 with
  | Core_dTerm.C_Term_TApp (dtb_u_u10, dtb_u_u11, dtb_u_u12) -> (match dtb_u_u10 with
  | Core_dTerm.C_Term_TApp (dtb_u_u13, dtb_u_u14, dtb_u_u15) -> (match dtb_u_u13 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u16) -> (if (dtb_u_u16 = Base_dIntrinsics.v_effNamedName) then dtb_u_u11 else dtb_u_u9)
  | _ -> dtb_u_u9
)
  | _ -> dtb_u_u9
)
  | _ -> dtb_u_u9
))

# 47 "Vuna/Compiler/Lowering/Entry.vuna"
let v_tagOf = (fun (dtb_u_u17 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (dtb_u_u18 : string B_dData_dList.t_List) -> (match (v_unwrapNamedTerm (B_dData_dPair.v_firstOf dtb_u_u17)) with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u19) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb_u_u19) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u18)) else dtb_u_u18)
  | _ -> dtb_u_u18
))

# 37 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_collectBuiltinRowTags = (fun (dtb_u_u20 : Core_dTerm.t_Term) -> (match dtb_u_u20 with
  | Core_dTerm.C_Term_TCon (dtb_u_u21, dtb_u_u22) -> (if (dtb_u_u21 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u23 = dtb_u_u22 in (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> ((v_tagOf dtb_u_u24) (v_collectBuiltinRowTags (B_dData_dPair.v_firstOf dtb_u_u26)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 53 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainRowTags = (fun (dtb_u_u28 : Core_dTerm.t_Term) -> (match dtb_u_u28 with
  | Core_dTerm.C_Term_TApp (dtb_u_u29, dtb_u_u30, dtb_u_u31) -> (match dtb_u_u29 with
  | Core_dTerm.C_Term_TApp (dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (match dtb_u_u32 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u35) -> (if (dtb_u_u35 = Base_dIntrinsics.v_effTypeName) then (v_collectBuiltinRowTags ((Core_dEval.v_quote 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u33))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 78 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowRtIr = (fun (dtb_u_u36 : string) -> (if (dtb_u_u36 = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowInt)))) else (if (dtb_u_u36 = Base_dIntrinsics.v_natTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowNat)))) else (if (dtb_u_u36 = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowStr)))) else (if (dtb_u_u36 = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowFloat)))) else (if (dtb_u_u36 = Base_dIntrinsics.v_boolTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowBool)))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 72 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowForNameIr = (fun (dtb_u_u37 : string) -> (match (v_mainShowRtIr dtb_u_u37) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u38) -> dtb_u_u38
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowIr = (fun (dtb_u_u39 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u40 : Core_dTerm.t_Term) -> (match ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u39)) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u40)) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u41) -> (let dtb_u_u42 = dtb_u_u41 in (match dtb_u_u42 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u43, dtb_u_u44) -> (match dtb_u_u44 with
  | B_dData_dList.C_List_Nil -> (v_mainShowForNameIr dtb_u_u43)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
))

# 112 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainRunNameOf = (fun (dtb_u_u45 : string B_dData_dList.t_List) -> (match dtb_u_u45 with
  | B_dData_dList.C_List_Nil -> Base_dIntrinsics.v_effRunName
  | _ -> Base_dIntrinsics.v_effMainRunName
))

# 117 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_filterMapRunHost = (fun (dtb_u_u46 : string B_dData_dList.t_List) -> (match dtb_u_u46 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u47, dtb_u_u48) -> (let dtb_u_u49 = (Base_dIntrinsics.v_builtinEffectImplOf dtb_u_u47) in (if (dtb_u_u49 = "") then (v_filterMapRunHost dtb_u_u48) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u49, (v_filterMapRunHost dtb_u_u48)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_filterMapErrorRunHost = (fun (dtb_u_u50 : string B_dData_dList.t_List) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (let dtb_u_u53 = (Base_dIntrinsics.v_builtinEffectErrorRunHostOf dtb_u_u51) in (if (dtb_u_u53 = "") then (v_filterMapErrorRunHost dtb_u_u52) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u53, (v_filterMapErrorRunHost dtb_u_u52)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Lowering/Entry.vuna"
let v_lowerEntryOf = (fun (dtb_u_u54 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u55 = (Lowering_dChecks.v_defTable dtb_u_u54) in (match ((Lowering_dChecks.v_findDtDef "main") dtb_u_u54) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u56) -> (match (v_actionResultTyIn (Elab_dTypes.v_dtDefType dtb_u_u56)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u57) -> (let dtb_u_u58 = (B_dData_dPair.v_secondOf dtb_u_u57) in (let dtb_u_u59 = (v_mainRowTags (Elab_dTypes.v_dtDefType dtb_u_u56)) in (let dtb_u_u60 = ((B_dData_dList.v_append (v_filterMapRunHost dtb_u_u59)) (v_filterMapErrorRunHost dtb_u_u59)) in (let dtb_u_u61 = (v_mainRunNameOf dtb_u_u59) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrEntry_irEntryShow = ((v_mainShowIr dtb_u_u55) dtb_u_u58); Vuna_dIr_dModel.f_IrEntry_irEntryMain = "main"; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = true; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u61)); Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = dtb_u_u60; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = dtb_u_u59 }))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrEntry_irEntryShow = ((v_mainShowIr dtb_u_u55) (Elab_dTypes.v_dtDefType dtb_u_u56)); Vuna_dIr_dModel.f_IrEntry_irEntryMain = "main"; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = false; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = B_dData_dList.C_List_Nil; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = B_dData_dList.C_List_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
