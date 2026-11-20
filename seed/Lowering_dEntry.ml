open Vuna_runtime
# 25 "Vuna/Compiler/Lowering/Entry.vuna"
let v_actionResultTyIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | Core_dTerm.C_Term_TApp (dtb__3, dtb__4, dtb__5) -> (match dtb__3 with
  | Core_dTerm.C_Term_TGlobal (dtb__6) -> (if (dtb__6 = Base_dIntrinsics.v_effTypeName) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = "eff"; B_dData_dPair.f_Pair_second = dtb__1 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 33 "Vuna/Compiler/Lowering/Entry.vuna"
let v_unwrapNamedTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__7, dtb__8, dtb__9) -> (match dtb__7 with
  | Core_dTerm.C_Term_TApp (dtb__10, dtb__11, dtb__12) -> (match dtb__10 with
  | Core_dTerm.C_Term_TGlobal (dtb__13) -> (if (dtb__13 = Base_dIntrinsics.v_effNamedName) then dtb__8 else mc0)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 47 "Vuna/Compiler/Lowering/Entry.vuna"
let v_tagOf = (fun (label : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (rest : string B_dData_dList.t_List) -> (match (v_unwrapNamedTerm (B_dData_dPair.v_firstOf label)) with
  | Core_dTerm.C_Term_TGlobal (dtb__14) -> (if (Base_dIntrinsics.v_isBuiltinEffectTag dtb__14) then (B_dData_dList.C_List__x58__x58_ (dtb__14, rest)) else rest)
  | _ -> rest
))

# 37 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_collectBuiltinRowTags = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__15, dtb__16) -> (if (dtb__15 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__16 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> ((v_tagOf dtb__17) (v_collectBuiltinRowTags (B_dData_dPair.v_firstOf dtb__19)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 53 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainRowTags = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__21, dtb__22, dtb__23) -> (match dtb__21 with
  | Core_dTerm.C_Term_TApp (dtb__24, dtb__25, dtb__26) -> (match dtb__24 with
  | Core_dTerm.C_Term_TGlobal (dtb__27) -> (if (dtb__27 = Base_dIntrinsics.v_effTypeName) then (v_collectBuiltinRowTags ((Core_dEval.v_quote 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__25))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 78 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowRtIr = (fun (g : string) -> (if (g = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowInt)))) else (if (g = Base_dIntrinsics.v_natTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowNat)))) else (if (g = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowStr)))) else (if (g = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowFloat)))) else (if (g = Base_dIntrinsics.v_boolTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtShowBool)))) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 72 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowForNameIr = (fun (g : string) -> (match (v_mainShowRtIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> dtb__28
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Lowering/Entry.vuna"
let v_mainShowIr = (fun (defTbl : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (tyTerm : Core_dTerm.t_Term) -> (match ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) defTbl)) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)) with
  | Core_dTerm.C_Value_VNeutral (dtb__29) -> (let nd_uscrut3 = dtb__29 in (match nd_uscrut3 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> (v_mainShowForNameIr dtb__30)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (Base_dIntrinsics.v_mainShowDefName))
))

# 110 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_filterMapRunHost = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (let host = (Base_dIntrinsics.v_builtinEffectImplOf dtb__32) in (if (host = "") then (v_filterMapRunHost dtb__33) else (B_dData_dList.C_List__x58__x58_ (host, (v_filterMapRunHost dtb__33)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_filterMapErrorRunHost = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (let host = (Base_dIntrinsics.v_builtinEffectErrorRunHostOf dtb__34) in (if (host = "") then (v_filterMapErrorRunHost dtb__35) else (B_dData_dList.C_List__x58__x58_ (host, (v_filterMapErrorRunHost dtb__35)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Lowering/Entry.vuna"
let v_lowerEntryOf = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let defTbl = (Lowering_dChecks.v_defTable defs) in (match ((Lowering_dChecks.v_findDtDef "main") defs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (match (v_actionResultTyIn (Elab_dTypes.v_dtDefType dtb__36)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (let innerTy = (B_dData_dPair.v_secondOf dtb__37) in (let tags = (v_mainRowTags (Elab_dTypes.v_dtDefType dtb__36)) in (let handlers = ((B_dData_dList.v_append (v_filterMapRunHost tags)) (v_filterMapErrorRunHost tags)) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrEntry_irEntryShow = ((v_mainShowIr defTbl) innerTy); Vuna_dIr_dModel.f_IrEntry_irEntryMain = "main"; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = true; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_effMainRunName)); Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = handlers; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = tags })))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrEntry_irEntryShow = ((v_mainShowIr defTbl) (Elab_dTypes.v_dtDefType dtb__36)); Vuna_dIr_dModel.f_IrEntry_irEntryMain = "main"; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = false; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = B_dData_dList.C_List_Nil; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = B_dData_dList.C_List_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
