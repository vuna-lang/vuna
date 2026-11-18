open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dProgram_dLwSt = int
and t_Vuna_dCompiler_dLowering_dProgram_dLamChainIn = { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn = { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt : t_Vuna_dCompiler_dLowering_dProgram_dLwSt }

# 52 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__0; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__1 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

# 118 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2)) else ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn (mc0 - 1)) dtb__3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__6; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 } -> (if (dtb__6 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__7)) else ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__10, dtb__11))) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir))))

# 157 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffUnitTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 135 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = "strFromFloat") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName)))) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn)))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicReturnsEff dtb__12) then (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn, (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__12), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__12)))))) else (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__12))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> (match dtb__13 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__14; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__15 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__14, name, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))

# 166 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__16, dtb__17, dtb__18, dtb__19) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn dtb__19) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__20; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__21 } -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 }, dtb__20)); f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__21 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = mc0 }
))

# 182 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam = (fun mc0 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__23 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__23) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder dtb__22))
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__24, dtb__25, dtb__26) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__27, dtb__28, dtb__29) -> ((fun whole -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__29) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__26)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)) else (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__30) -> (if (dtb__30 = "++") then ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__28) ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__25) mc1)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1))
))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__27, dtb__28, dtb__29)), dtb__25, dtb__26)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
)
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
))

# 245 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn = (fun t -> ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 238 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__34, dtb__35, dtb__36) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__36) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__33)) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__34 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__37) -> (if (dtb__37 = "++") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__35)) (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__32)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 267 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__40; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__41 } -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__41)) then (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__39) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn = (fun t -> (match (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__42; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__43 } -> (if (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__43) then (match dtb__42 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__44) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__44) > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__43 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 280 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__45, dtb__46) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (match dtb__47 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__49; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 } -> (if dtb__45 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__50) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__46) dtb__48)) (fun ts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__49; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__50) then (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__46) dtb__48) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__46) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__49; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 }, dtb__48)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if dtb__45 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__46) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr = (fun mc0 mc1 -> (if mc0 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc1)) else mc1))

# 312 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (if dtb__53 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__54) dtb__56))) else ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__54) dtb__56))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__57); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__59 }, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__58) dtb__60)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish = (fun env st family c irs -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__61; Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)) irs) else (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__63) irs))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 375 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__64; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__65; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__66 } -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daePatsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__67; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__68; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__69 } -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeStOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__70; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__71; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__72 } -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (if dtb__73 then (1 + (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__74)) else (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__74))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__78) then ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__76) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo (fresh + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) dtb__76) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__79 = mc0 in dtb__79)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc3); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo st) outer) tele) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 409 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__82; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__83 } -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (if ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__84) dtb__83) then (if dtb__84 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__81) dtb__85) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__86 = mc0 in dtb__86)) else ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn mc0) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__81) dtb__85) mc5)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc5); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__92) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__90) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__93 = mc0 in dtb__93)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc4); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength flags)) then ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn st) label) outer) binders) flags) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (v_Vuna_dCompiler_dLowering_dProgram_dcountKept flags)) then (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn st) label) outer) binders) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 436 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__94) = "") then true else (v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt dtb__95))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__96) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__97) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__98, dtb__99) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__98) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__100) -> (match dtb__100 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__101) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__99) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__98)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 504 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__103) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__104) else ((fun name -> (if (v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName name) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__104) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__103)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__105) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor dtb__106) else true)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor mc0) else false)
))

# 516 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__107) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107)) else ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy mc0) dtb__108))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__109) = "") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__109)) else (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt dtb__110))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 580 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn mc1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__111) }, ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn dtb__112) (mc1 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, dtb__114) -> (match dtb__113 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 } -> (if (dtb__115 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116)) else ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn mc0) dtb__114))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (if (dtb__119 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn mc0) dtb__118) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (match (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn dtb__121) mc0) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 }, ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__122)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__122)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 603 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (match dtb__126 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__128; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__129 } -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__128)) else (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (mc0 - 1)) dtb__125) dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 611 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn = (fun tele binders -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_deraseTele) tele))) binders))

# 75 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__130, dtb__131, dtb__132) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn dtb__131) binders) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__133) -> (if (v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf dtb__133) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__130))) dtb__130) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__133)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st })))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__134) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef env) dtb__134)) (fun ir -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ir; Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__135) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__135)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__136) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__136)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__137) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__137)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__138) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__138)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__139, dtb__140, dtb__141) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__139)) (fun pc -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__142; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__143) binders) dtb__140)) (fun pt -> (match pt with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__144; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__145) binders) dtb__141)) (fun pe -> (match pe with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__146; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__142, dtb__144, dtb__146)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__148, dtb__149, dtb__150, dtb__151) -> ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__148) dtb__149) dtb__150) dtb__151)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__152, dtb__153, dtb__154) -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__152) dtb__153) dtb__154)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__155, dtb__156) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__155) dtb__156)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__157, dtb__158) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__157) dtb__158)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__159, dtb__160) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__159))) dtb__160))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__161, dtb__162) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__161) dtb__162)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__164) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__168) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__163) dtb__164) dtb__165) dtb__168) dtb__166) dtb__167)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__163, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__164; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__165); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__167 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__170) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__174) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt dtb__173) dtb__174)) (fun label -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__169)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__175; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__175, dtb__170, label)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__169) dtb__170) dtb__171) dtb__172) dtb__173)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__182) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__183) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__183)))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__183))
  | _ -> failwith "DT: impossible branch"
)))
# 171 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel = (fun fuel env st binders name rig sp body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, sp, body))) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__184; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__185 } -> ((fun bs -> ((fun envB -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__185)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__186; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__187 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, dtb__186)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__187 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse bs)) binders))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam) dtb__184))
  | _ -> failwith "DT: impossible branch"
)))
# 186 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__188) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__188) >= 3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__188)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__189)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__191) -> (match dtb__191 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__192; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__193 } -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__192) dtb__193)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 198 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__194, dtb__195, dtb__196) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__194) dtb__195) dtb__196)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__197) -> (match dtb__197 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__198; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__199 } -> (if ((v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn dtb__198) dtb__199) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__199)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__198, dtb__200)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__194) dtb__195) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 209 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun pf -> (match pf with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__202; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__203 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__203) binders) a)) (fun pa -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__204; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__202, dtb__204)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 217 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__208; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__209) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__208)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__210; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__211 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__211) mc3) dtb__207)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__210, dtb__212)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 228 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, dtb__215) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__214)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (mc0 - 1)) mc1) dtb__217) mc3) dtb__215)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__218; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__219 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, dtb__218)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__219 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 294 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__225 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__224)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__226; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__227 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__227) mc3) dtb__221) dtb__223)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__228; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr dtb__220) dtb__226), dtb__228)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 318 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__232) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__232)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 324 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) Base_dData_dList.C_Base_dData_dList_dList_Nil) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__234) -> (match dtb__234 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (true, Base_dData_dList.C_Base_dData_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__235) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__235))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__236) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (false, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__236)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> (match dtb__237 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (match dtb__240 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__239)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__241) -> (match dtb__241 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__242; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__243 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__244) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__243) args)) (fun runtimeArgs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__243) dtb__244)) runtimeArgs)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__245; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__246 } -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish env) dtb__246) dtb__242) c) dtb__245)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))
# 433 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dLowering_dProgram_daeStOf bound)) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) body))
# 455 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247) -> (match dtb__247 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__248; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__249 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__250; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__251 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn dtb__251) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__249)) (fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__252; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__253 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound), dtb__250, dtb__252)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__253 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))
# 469 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__254; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__255 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__254 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__255 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__256) -> (match dtb__256 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__257; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__258 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__258)) (fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__259; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__260 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__257; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__259 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__260 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))))
# 485 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__261, dtb__262) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__261)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__263; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__264 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (mc0 - 1)) mc1) dtb__264) mc3) dtb__262)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__265; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__263, dtb__265)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 525 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__267) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__267))) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__268 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__267)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 535 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__270; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__271 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun pz -> (match pz with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__272; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__273 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__273) outer) succAlt)) (fun ps -> (match ps with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__275 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__275) outer) catchAlt)) (fun pc -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__276; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__270, fresh, dtb__272, dtb__274, dtb__276)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__278 = dtb__271 in dtb__278))
  | _ -> failwith "DT: impossible branch"
)))))
# 557 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else (match ((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt env) alts) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__279) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel (fuel - 1)) env) st) outer) scrut) dtb__279)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__280; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__281 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (fuel - 1)) env) dtb__281) outer) alts)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__282; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__280, dtb__282)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 569 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn tele) 0)); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tele))))
# 617 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__284; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__285 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__286, dtb__287) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__285) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__284) c) fields) idxs) dtb__287)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__288, dtb__289) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__285) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__284) c) fields) idxs) dtb__289)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
# 630 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__290) -> (match dtb__290 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__291; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__292 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__293) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__292) args)) (fun runtimeArgs -> ((fun positions -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__292) dtb__293)) positions) runtimeArgs)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__294; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__294)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 643 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__296, dtb__297) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__296)) mc5) mc7) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position out of range")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__298) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__298)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__299; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__300 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__300) mc3) mc4) mc5) dtb__297) mc7)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__301; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 } -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__296)) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__303) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__303; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__299 }, dtb__301)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position has no runtime field")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 661 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__304, dtb__305, dtb__306, dtb__307) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__305) then (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__307) else (1 + (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__307)))
  | _ -> 0
))

# 666 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__308, dtb__309) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__310, dtb__311, dtb__312, dtb__313) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__311) then (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__313) else true)
  | _ -> false
))

# 673 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf = (fun mc0 mc1 mc2 mc3 -> (if mc1 then false else (if (if (if ((mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn mc3) = 0) else false) then true else false)))

# 716 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__314) -> (match dtb__314 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__315, dtb__316) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__315) then (match (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__315) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__317) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__317))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type has no runtime representation: " ^ dtb__315))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type is not basic: " ^ dtb__315)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not basic")
))

# 710 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__318) -> (match dtb__318 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__319, dtb__320) -> (if (dtb__319 = "Array") then (match dtb__320 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__321, dtb__322) -> (match dtb__322 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr dtb__321)) (fun e -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__319 = "Array") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
))

# 702 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (if dtb__324 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr dtb__326)) (fun domIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__327) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__323, mc1, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (fun resIr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr mc2))
))

# 699 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) ty)))

# 682 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__328) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__329) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__329)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__330) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__330, dtb__328, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__331) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__332) -> (match dtb__332 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__333; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__334 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__331), ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)), dtb__333, (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__331), ((((v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__331), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__334 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__335) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__335)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__331))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__336, dtb__337) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDef mc0) mc1) dtb__336)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__338; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__339 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) dtb__339) dtb__337)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__340; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__341 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__338, dtb__340)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__341 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 739 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__342, dtb__343) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__342) mc2) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__342; "`"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo mc0) dtb__343) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__342) true) mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 736 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo kind) names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 745 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun d -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 761 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs table) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__344; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__345 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime axiomNames) dtb__344)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn datas) dtb__344)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure allTypeNames) dtb__344)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__344))))))))))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__345) familyTypeNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun n -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__344))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)))

# 796 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dtblLookup = (fun tbl name -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 799 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__346) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__346) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__347) -> (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__347)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__348) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__348)
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__349, dtb__350) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup mc0) dtb__349) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__350)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__351) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__351, ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__350)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dappendGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__352, dtb__353) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) mc1) defs)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__354; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__355 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__354)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups mc0) dtb__355) dtb__353)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__356; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__357 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = isRec; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__354 }, dtb__356)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__357 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) members))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__352))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__352))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 864 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__358, dtb__359) -> dtb__358
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 845 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList missingFromContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList extrasInContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))))))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun n -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) intrinsicNames) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun n -> (if (n = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dallIntrinsics))

# 837 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs)) (fun _u -> v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract)))

# 903 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef = (fun env d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) })

# 783 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl tbl))) (fun groups -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups env) 0) groups)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__360; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__361 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__360))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef env)) defs)))

# 906 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair = (fun mc0 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__362; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__363 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__362; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__363 }
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__364; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__365 } -> dtb__364
  | _ -> failwith "DT: impossible branch"
))

# 885 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs env) runtime)) (fun groups -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo) datas) unitDatas)) (fun decls -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) unitDatas))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs defs))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun d -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames dataNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun d -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames defNames))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas))

# 871 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)) (fun _u -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames))))

# 877 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames)) (fun u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (u)))))))

# 910 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf = (fun datas defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.env") (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv datas) defs) "")))))) (fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.prepare") (fun _u -> (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.unit") (fun _u -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))))) (fun unitIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.entry") (fun _u -> (Vuna_dCompiler_dLowering_dEntry.v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf defs)))) (fun entry -> ((fun program -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram program)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } }))))))))))
