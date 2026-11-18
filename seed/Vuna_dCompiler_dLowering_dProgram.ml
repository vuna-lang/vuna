open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dProgram_dLwSt = int
and t_Vuna_dCompiler_dLowering_dProgram_dLamParam = { f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName : string; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamTy : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dLowering_dProgram_dLamChainIn = { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn = { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt : t_Vuna_dCompiler_dLowering_dProgram_dLwSt }

# 53 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__0; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__1; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

# 135 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3)) else ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn (mc0 - 1)) dtb__4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__8 } -> (if (dtb__7 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__8)) else ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt mc0) dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__11; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__12 } -> ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__11, dtb__12))) dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir))))

# 178 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffUnitTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 152 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = "strFromFloat") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName)))) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn)))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicReturnsEff dtb__13) then (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn, (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__13), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__13)))))) else (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__13))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (match dtb__14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__16 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__15, name, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))

# 194 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> ((fun p -> ((fun result -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName = dtb__17; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig = dtb__18; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamTy = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamBinderTyOf dtb__19) }, (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders)); f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = result }) (match (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamResultTyOf dtb__19)
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn dtb__21))
  | _ -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = mc0; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }
))

# 233 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam = (fun env outer p -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (match (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23) -> (match (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) outer) dtb__23) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__24) -> ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName) dtb__24)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 226 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParams = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> ((fun b -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, (((v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParams mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) dtb__26)))) (((v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam mc0) mc1) dtb__25))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__27, dtb__28, dtb__29) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> ((fun whole -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__32) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__29)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)) else (match dtb__30 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__33) -> (if (dtb__33 = "++") then ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__31) ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__28) mc1)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1))
))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32)), dtb__28, dtb__29)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
)
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
))

# 352 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn = (fun t -> ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 342 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__34, dtb__35, dtb__36) -> (match dtb__34 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__37, dtb__38, dtb__39) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__39) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__36)) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__37 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__40) -> (if (dtb__40 = "++") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__38)) (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__35)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 380 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (match dtb__41 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__43; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__44 } -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__44)) then (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__42) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn = (fun t -> (match (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__45; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__46 } -> (if (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__46) then (match dtb__45 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__47) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__47) > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__47; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__46 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 393 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs = (fun (mc0 : string) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (match dtb__50 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__52; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__53 } -> (if dtb__48 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__53) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__49) dtb__51)) (fun (ts : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__52; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__53 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__53) then (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__49) dtb__51) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__49) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__52; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__53 }, dtb__51)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if dtb__48 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__49) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : bool) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if mc1 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc0, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque)), mc2)) else mc2))

# 441 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (if dtb__56 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__57) dtb__59))) else ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__57) dtb__59))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames = (fun (mc0 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__60); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__62 }, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__61) dtb__63)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish = (fun env st family c irs -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__64) irs))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__65; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__66; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__67 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 525 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daePatsOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__68; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__69; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__70 } -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeStOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__71; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__72; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__73 } -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcountKept = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if dtb__74 then (1 + (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__75)) else (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__75))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__78; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__79 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__79) then ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__77) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo (fresh + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) dtb__77) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__80 = mc0 in dtb__80)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc3); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo st) outer) tele) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 561 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__83; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__84 } -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (if ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__85) dtb__84) then (if dtb__85 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__82) dtb__86) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__87 = mc0 in dtb__87)) else ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn mc0) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__82) dtb__86) mc5)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc5); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__93) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__91) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__94 = mc0 in dtb__94)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc4); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength flags)) then ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn st) label) outer) binders) flags) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (v_Vuna_dCompiler_dLowering_dProgram_dcountKept flags)) then (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn st) label) outer) binders) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 596 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__95) = "") then true else (v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt dtb__96))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__97) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__98) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__99, dtb__100) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__99) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__101) -> (match dtb__101 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__102; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__103 } -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__102) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__100) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__99)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__99)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 697 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__104) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__105) else ((fun name -> (if (v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName name) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__105) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__104)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 704 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__106) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor dtb__107) else true)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor mc0) else false)
))

# 711 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__108) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108)) else ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy mc0) dtb__109))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__110) = "") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__110)) else (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt dtb__111))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 800 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn mc1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__112) }, ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn dtb__113) (mc1 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__116; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__117 } -> (if (dtb__116 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117)) else ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn mc0) dtb__115))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__121 } -> (if (dtb__120 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn mc0) dtb__119) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 817 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn = (fun (mc0 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn dtb__122) mc0) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__124 }, ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__123)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 824 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn = (fun (mc0 : int) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__129; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__130 } -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129)) else (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (mc0 - 1)) dtb__126) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 835 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 832 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn = (fun tele binders -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_deraseTele) tele))) binders))

# 76 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__131, dtb__132, dtb__133) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn dtb__132) binders) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> (if (v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf dtb__134) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__131))) dtb__131) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__134)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st })))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__135) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef env) dtb__135)) (fun (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ir; Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__136) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__136)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__137) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__137)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__138) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__138)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__139) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__139)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__140, dtb__141, dtb__142) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__140)) (fun (pc : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__143; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__144 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__144) binders) dtb__141)) (fun (pt : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pt with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__145; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__146 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__146) binders) dtb__142)) (fun (pe : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pe with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__143, dtb__145, dtb__147)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__149) dtb__150) dtb__151) dtb__152) dtb__153)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__154, dtb__155, dtb__156) -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__154) dtb__155) dtb__156)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__157, dtb__158) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__157) dtb__158)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__159, dtb__160) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__159) dtb__160)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__161, dtb__162) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__161))) dtb__162))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__163, dtb__164) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__163) dtb__164)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__166) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__170) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__165) dtb__166) dtb__167) dtb__170) dtb__168) dtb__169)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__165, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__166; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__167); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__169 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__172) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__176) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt dtb__175) dtb__176)) (fun (label : string) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__171)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__177; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__177, dtb__172, label)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__171) dtb__172) dtb__173) dtb__174) dtb__175)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__184) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__185) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__185)))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__185))
  | _ -> failwith "DT: impossible branch"
)))
# 205 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel = (fun fuel env st binders name rig slot sp body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, slot, sp, body))) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__186; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__187; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = dtb__188 } -> ((fun bs -> ((fun envB -> ((fun resultIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__187)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, resultIr, dtb__189)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 }))
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__188 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__191) -> (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) envB) dtb__191)
  | _ -> failwith "DT: impossible branch"
))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse bs)) binders))) (((v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParams env) binders) dtb__186))
  | _ -> failwith "DT: impossible branch"
)))
# 246 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__192) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__192) >= 3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__192)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__193)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__195) -> (match dtb__195 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__196) dtb__197)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 268 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__198, dtb__199, dtb__200) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__198) dtb__199) dtb__200)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__201) -> (match dtb__201 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__202; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__203 } -> (if ((v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn dtb__202) dtb__203) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__203)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__204; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__202, dtb__204)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__198) dtb__199) dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 288 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pf with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__206; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__207 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__207) binders) a)) (fun (pa : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__208; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__206, dtb__208)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 304 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__213) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__212)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__214; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__215 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__215) mc3) dtb__211)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, dtb__216)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 324 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__218)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__220; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__221 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (mc0 - 1)) mc1) dtb__221) mc3) dtb__219)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__222; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__223 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__222)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__223 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 415 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__226, dtb__227) -> (match dtb__226 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__228; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__228)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__230; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__231 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__231) mc3) dtb__225) dtb__227)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__232; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__233 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf mc1) mc3) dtb__228)) dtb__224) dtb__230), dtb__232)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__233 }))
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
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 447 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__236) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__236)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 456 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) Base_dData_dList.C_Base_dData_dList_dList_Nil) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__238) -> (match dtb__238 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (true, Base_dData_dList.C_Base_dData_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__239) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__239))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__240) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (false, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__240)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__241; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__242 } -> (match dtb__241 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__243, dtb__244) -> (match dtb__244 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__243)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__242 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__245) -> (match dtb__245 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__246; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__247 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__248) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__247) args)) (fun (runtimeArgs : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__247) dtb__248)) runtimeArgs)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__249; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__250 } -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish env) dtb__250) dtb__246) c) dtb__249)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))
# 593 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dLowering_dProgram_daeStOf bound)) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) body))
# 645 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__251; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__252 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__251 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__252 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__253) -> (match dtb__253 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__254; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__255 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__255)) (fun (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__256; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__257 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__254; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__256 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__257 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))))
# 670 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__258)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__260; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (mc0 - 1)) mc1) dtb__261) mc3) dtb__259)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__262; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__263 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__262)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__263 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 720 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__264) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__264))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__265; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__265 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__264)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 734 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__267; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__268 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pz with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__269; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__270 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__270) outer) succAlt)) (fun (ps : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match ps with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__272) outer) catchAlt)) (fun (pc : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__273; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__267, fresh, dtb__269, dtb__271, dtb__273)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__275 = dtb__268 in dtb__275))
  | _ -> failwith "DT: impossible branch"
)))))
# 769 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__276; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (fuel - 1)) env) dtb__277) outer) alts)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__278; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__279 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__276, dtb__278)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__279 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 788 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn tele) 0)); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tele))))
# 838 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__280; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__281 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__282, dtb__283) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__281) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__280) c) fields) idxs) dtb__283)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__284, dtb__285) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__281) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__280) c) fields) idxs) dtb__285)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
# 853 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__286) -> (match dtb__286 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__287; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__288 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__289) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__288) args)) (fun (runtimeArgs : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun positions -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__288) dtb__289)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__290)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 875 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc6 : (int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__292, dtb__293) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__292)) mc5) mc7) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position out of range")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__294) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__294)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__295; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__296 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__296) mc3) mc4) mc5) dtb__293) mc7)) (fun (r : ((string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__297; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__298 } -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__292)) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__299) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__299; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__295 }, dtb__297)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__298 }))
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

# 73 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 619 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__300) -> (match dtb__300 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__301; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__303; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__304 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn dtb__304) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__302)) (fun (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__305; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__306 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound), dtb__303, dtb__305)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__306 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))

# 903 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__308) then (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__311) else (1 + (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__311)))
  | _ -> 0
))

# 908 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__312, dtb__313) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__315) then (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__318) else true)
  | _ -> false
))

# 915 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : bool) (mc2 : string) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if mc1 then false else (if (if (if ((mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn mc3) = 0) else false) then true else false)))

# 968 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__319) -> (match dtb__319 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__320, dtb__321) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__320) then (match (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__320) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__322) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__322))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type has no runtime representation: " ^ dtb__320))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type is not basic: " ^ dtb__320)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not basic")
))

# 962 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__323) -> (match dtb__323 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__324, dtb__325) -> (if (dtb__324 = "Array") then (match dtb__325 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (match dtb__327 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr dtb__326)) (fun (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__324 = "Array") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
))

# 950 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (if dtb__329 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr dtb__331)) (fun (domIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__332) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__328, mc1, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (fun (resIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr mc2))
))

# 947 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) ty)))

# 924 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__333) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__334) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__334)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__335) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__335, dtb__333, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__336) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__337) -> (match dtb__337 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__338; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__339 } -> ((fun defTy -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__336), ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)), defTy, dtb__338, (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__336), ((((v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__336), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__339 }))) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__340)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__336))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 979 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__341, dtb__342) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDef mc0) mc1) dtb__341)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__343; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__344 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) dtb__344) dtb__342)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__345; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__346 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__343, dtb__345)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__346 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1000 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__347, dtb__348) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__347) mc2) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__347; "`"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo mc0) dtb__348) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__347) true) mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo kind) names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 1008 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "value") valueNames)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "type") typeNames)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 1025 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs table) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__349; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__350 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime axiomNames) dtb__349)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn datas) dtb__349)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure allTypeNames) dtb__349)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__349))))))))))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__350) familyTypeNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__349))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)))

# 1067 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dtblLookup = (fun tbl name -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 1070 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__351) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__351) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__352) -> (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__352)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1079 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__353) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__353)
  | _ -> failwith "DT: impossible branch"
))

# 1108 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef = (fun (mc0 : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__354, dtb__355) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup mc0) dtb__354) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__355)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__356) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__356, ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__355)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1085 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dappendGroups = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc2 : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__357, dtb__358) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__359; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__360 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__359)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups mc0) dtb__360) dtb__358)) (fun (q : ((bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__361; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__362 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = isRec; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__359 }, dtb__361)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__362 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) members))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__357))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__357))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1152 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__363, dtb__364) -> dtb__363
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1128 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList missingFromContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList extrasInContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))))))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) intrinsicNames) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (if (n = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dallIntrinsics))

# 1119 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs)) (fun (_u : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract)))

# 1197 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef = (fun env d -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) })

# 1048 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl tbl))) (fun (groups : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups env) 0) groups)) (fun (q : ((bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__365; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__365))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef env)) defs)))

# 1200 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair = (fun (mc0 : (bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__367; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__368 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__367; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__368 }
  | _ -> failwith "DT: impossible branch"
))

# 1224 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__369; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__370 } -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

# 1175 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs env) runtime)) (fun (groups : (bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dIr_dRepresent.v_Vuna_dCompiler_dIr_dRepresent_drepresentUnit (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env)) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) unitDatas))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs defs))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames dataNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames defNames))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas))

# 1159 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)) (fun (_u : int) -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames))))

# 1166 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames)) (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (u)))))))

# 1204 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf = (fun datas defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.env") (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv datas) defs) "")))))) (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))))) (fun (unitIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.entry") (fun (_u : int) -> (Vuna_dCompiler_dLowering_dEntry.v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf defs)))) (fun (entry : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrEntry Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((fun program -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram program)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } }))))))))))
