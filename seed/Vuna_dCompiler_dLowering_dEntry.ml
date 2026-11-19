open Vuna_runtime
# 25 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dactionResultTyIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__0, dtb__1, dtb__2) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__3, dtb__4, dtb__5) -> (match dtb__3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__6) -> (if (dtb__6 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = "eff"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 33 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dunwrapNamedTerm = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__7, dtb__8, dtb__9) -> (match dtb__7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__10, dtb__11, dtb__12) -> (match dtb__10 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__13) -> (if (dtb__13 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then dtb__8 else mc0)
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 47 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dtagOf = (fun (label : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) (rest : string Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dLowering_dEntry_dunwrapNamedTerm (Base_dData_dPair.v_Base_dData_dPair_dfirstOf label)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__14) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBuiltinEffectTag dtb__14) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, rest)) else rest)
  | _ -> rest
))

# 37 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_Vuna_dCompiler_dLowering_dEntry_dcollectBuiltinRowTags = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__15, dtb__16) -> (if (dtb__15 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> ((v_Vuna_dCompiler_dLowering_dEntry_dtagOf dtb__17) (v_Vuna_dCompiler_dLowering_dEntry_dcollectBuiltinRowTags (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__19)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__16) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 53 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dmainRowTags = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__21, dtb__22, dtb__23) -> (match dtb__21 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__24, dtb__25, dtb__26) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__27) -> (if (dtb__27 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then (v_Vuna_dCompiler_dLowering_dEntry_dcollectBuiltinRowTags ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__25))) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 77 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dmainShowRtIr = (fun (g : string) -> (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowInt)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowNat)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowStr)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowFloat)))) else (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowBool)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 71 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dmainShowForNameIr = (fun (g : string) -> (match (v_Vuna_dCompiler_dLowering_dEntry_dmainShowRtIr g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__28) -> dtb__28
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName))
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dmainShowIr = (fun (tyTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__29) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dLowering_dEntry_dmainShowForNameIr dtb__30)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName))
)) dtb__29)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName))
))

# 106 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_Vuna_dCompiler_dLowering_dEntry_dfilterMapRunHost = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapRunHost dtb__33) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (host, (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapRunHost dtb__33))))) (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectImplOf dtb__32))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Lowering/Entry.vuna"
let rec v_Vuna_dCompiler_dLowering_dEntry_dfilterMapErrorRunHost = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapErrorRunHost dtb__35) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (host, (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapErrorRunHost dtb__35))))) (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectErrorRunHostOf dtb__34))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Lowering/Entry.vuna"
let v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf = (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef "main") defs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__36) -> (match (v_Vuna_dCompiler_dLowering_dEntry_dactionResultTyIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__36)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__37) -> ((fun innerTy -> ((fun tags -> ((fun handlers -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dLowering_dEntry_dmainShowIr innerTy); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMainRunName)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = handlers; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = tags }))))) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapRunHost tags)) (v_Vuna_dCompiler_dLowering_dEntry_dfilterMapErrorRunHost tags)))) (v_Vuna_dCompiler_dLowering_dEntry_dmainRowTags (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__36)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__37))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dLowering_dEntry_dmainShowIr (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__36)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags = Base_dData_dList.C_Base_dData_dList_dList_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
