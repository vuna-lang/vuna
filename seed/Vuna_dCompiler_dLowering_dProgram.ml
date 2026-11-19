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
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor = (fun (size : int) -> (512 + (8 * size)))

# 145 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3)) else ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn (mc0 - 1)) dtb__4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__8 } -> (if (dtb__7 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__8)) else ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt mc0) dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__11; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__12 } -> ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__11, dtb__12))) dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (name : string) (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir))))

# 188 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffUnitTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 162 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (name : string) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = "strFromFloat") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName)))) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn)))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicReturnsEff dtb__13) then (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn, (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__13), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__13)))))) else (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__13))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (match dtb__14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__16 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__15, name, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))

# 204 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> ((fun p -> ((fun result -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName = dtb__17; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig = dtb__18; f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamTy = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamBinderTyOf dtb__19) }, (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders)); f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = result }) (match (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (p).f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamResultTyOf dtb__19)
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn dtb__21))
  | _ -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = mc0; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }
))

# 280 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcountRuntimeParams = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (dtb__23).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig) then (v_Vuna_dCompiler_dLowering_dProgram_dcountRuntimeParams dtb__24) else (1 + (v_Vuna_dCompiler_dLowering_dProgram_dcountRuntimeParams dtb__24)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dsigArrowTys = (fun (fuel : int) (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ty with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__25, dtb__26) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dsigArrowTys (fuel - 1)) dtb__26) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__27))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
)))

# 304 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dheadGlobalOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__28, dtb__29) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__28))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> (v_Vuna_dCompiler_dLowering_dProgram_dheadGlobalOf dtb__30)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__33) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__33))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 298 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deffResultTyOf = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dheadGlobalOf t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__34) -> (if (dtb__34 = Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEffTypeName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (p : t_Vuna_dCompiler_dLowering_dProgram_dLamParam) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (match (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__35) -> ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped (p).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName) (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOfTotal env) outer) dtb__35))
  | _ -> failwith "DT: impossible branch"
)))

# 311 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParams = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> ((fun b -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, (((v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParams mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) dtb__37)))) (((v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam mc0) mc1) dtb__36))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParamsHint = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> ((fun erased -> ((fun hint -> ((fun restHints -> ((fun b -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, ((((v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParamsHint mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) restHints) dtb__39)))) (match hint with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__40) -> ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped (dtb__38).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamName) dtb__40)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam mc0) mc1) dtb__38)
  | _ -> failwith "DT: impossible branch"
))) (if erased then mc2 else (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, dtb__42) -> dtb__42
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))) (if erased then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__43))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (dtb__38).f_Vuna_dCompiler_dLowering_dProgram_dLamParam_lamParamRig))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dappTyOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (f : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__45) -> (match dtb__45 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__46, dtb__47) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__45; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__47 }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotCalleeTy env) binders) f)))

# 405 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dappTyOfIr = (fun (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__49, dtb__50) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__48; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirResultTyOf ir)))

# 411 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dappTyFrom = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (f : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (irF : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match (((v_Vuna_dCompiler_dLowering_dProgram_dappTyOf env) binders) f) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dProgram_dappTyOfIr irF)
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__52, dtb__53, dtb__54) -> (match dtb__52 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__55, dtb__56, dtb__57) -> ((fun whole -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__57) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__54)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)) else (match dtb__55 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__58) -> (if (dtb__58 = "++") then ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__56) ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__53) mc1)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (whole, mc1))
))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__55, dtb__56, dtb__57)), dtb__53, dtb__54)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
)
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, mc1))
))

# 481 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 471 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__59, dtb__60, dtb__61) -> (match dtb__59 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__62, dtb__63, dtb__64) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__64) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__61)) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__62 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__65) -> (if (dtb__65 = "++") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__63)) (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__60)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 509 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 } -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__69)) then (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__67) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__70; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 } -> (if (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__71) then (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__72) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__72) > 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__72; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn = (fun (name : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 522 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs = (fun (mc0 : string) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> (if dtb__73 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__78) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__74) dtb__76)) (fun (ts : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__78) then (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__74) dtb__76) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__74) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 }, dtb__76)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if dtb__73 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__74) Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 565 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : bool) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (if mc1 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc0, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque)), mc2)) else mc2))

# 570 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (if dtb__81 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__82) dtb__84))) else ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__82) dtb__84))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames = (fun (mc0 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__85); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__87 }, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__86) dtb__88)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 629 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (family : string) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (irs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__89) -> ((fun recTy -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, recTy, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__89) irs))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))) (match (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf env) c) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__90) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (family, dtb__90))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf env) c) args), irs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 657 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__91; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__92; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__93 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daePatsOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__94; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__95; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__96 } -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeStOf = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__97; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__98; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__99 } -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

# 666 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcountKept = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (if dtb__100 then (1 + (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__101)) else (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__101))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 670 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (match dtb__102 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__104; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__105 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__105) then ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__103) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo (fresh + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc1))) dtb__103) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__106 = mc0 in dtb__106)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc3); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn = (fun (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (tele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo st) outer) tele) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 696 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 } -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (if ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__111) dtb__110) then (if dtb__111 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__108) dtb__112) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__113 = mc0 in dtb__113)) else ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn mc0) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__108) dtb__112) mc5)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc5); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc1 : string) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__116 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__119) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn (fresh + 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc2))) dtb__117) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__120 = mc0 in dtb__120)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dData_dList.v_Base_dData_dList_dreverse mc4); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn = (fun (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (label : string) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (binders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (flags : bool Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength flags)) then ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn st) label) outer) binders) flags) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (v_Vuna_dCompiler_dLowering_dProgram_dcountKept flags)) then (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn st) label) outer) binders) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 728 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderWithTy = (fun (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = ty })

# 731 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dtypedPats = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLowering_dProgram_dbinderWithTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121))) dtb__123), ((v_Vuna_dCompiler_dLowering_dProgram_dtypedPats dtb__122) dtb__124)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 736 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dtypedPatsAll = (fun (ty : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (bs : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> ((v_Vuna_dCompiler_dLowering_dProgram_dbinderWithTy ty) b))) bs))

# 741 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_darmTyTblOf = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> ((fun tail -> (match (dtb__125).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__127) -> (match (dtb__125).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__128) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 }, tail))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | _ -> tail
)) (v_Vuna_dCompiler_dLowering_dProgram_darmTyTblOf dtb__126))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupArmTy = (fun (mc0 : int) (mc1 : (int, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__132 } -> (if (dtb__131 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132)) else ((v_Vuna_dCompiler_dLowering_dProgram_dlookupArmTy mc0) dtb__130))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dretagArmBinder = (fun (tbl : (int, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match (b).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrBName_IrBArm (dtb__133) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dlookupArmTy dtb__133) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> ((v_Vuna_dCompiler_dLowering_dProgram_dbinderWithTy (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134))) b)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> b
  | _ -> failwith "DT: impossible branch"
)
  | _ -> b
))

# 766 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dretagArmEnv = (fun (mc0 : (int, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLowering_dProgram_dretagArmBinder mc0) dtb__135), ((v_Vuna_dCompiler_dLowering_dProgram_dretagArmEnv mc0) dtb__136)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 770 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dretagAltEnv = (fun (mc0 : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__137; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__138; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__139 } -> { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = ((v_Vuna_dCompiler_dLowering_dProgram_dretagArmEnv (v_Vuna_dCompiler_dLowering_dProgram_darmTyTblOf mc1)) dtb__137); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = mc1; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__139 }
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__140) = "") then true else (v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt dtb__141))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__142) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__143) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 786 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__144) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__147) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__145) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__144)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__144)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_darmResultTyOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) (bodyIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (coreBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirResultTyOf bodyIr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__149) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__149))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match bodyIr with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__150) -> (match (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotGlobalTy env) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) dtb__150) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__151) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__151))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) coreBody)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) coreBody)
)
  | _ -> failwith "DT: impossible branch"
))

# 908 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName = (fun (name : string) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 915 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__152) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__153) else ((fun name -> (if (v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName name) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__153) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__152)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 922 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__154) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor dtb__155) else true)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor mc0) else false)
))

# 929 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__156) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156)) else ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy mc0) dtb__157))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__158) = "") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__158)) else (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt dtb__159))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 1022 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn mc1); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__160) }, ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn dtb__161) (mc1 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__165 } -> (if (dtb__164 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__165)) else ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn mc0) dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__166 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__169 } -> (if (dtb__168 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn mc0) dtb__167) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn = (fun (mc0 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (match (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn dtb__170) mc0) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__172) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__170; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__172 }, ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__171)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__171)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1046 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn = (fun (mc0 : int) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__177; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__178 } -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__177)) else (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (mc0 - 1)) dtb__174) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1057 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deraseTele = (fun (b : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 1054 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn = (fun (tele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_deraseTele) tele))) binders))

# 76 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__179, dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn dtb__180) binders) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__182) -> (if (v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf dtb__182) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__179))) dtb__179) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__182)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st })))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__183) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef env) dtb__183)) (fun (ir : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ir; Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__184) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__184)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__185) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__185)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__186) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__186)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__187) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__187)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__188, dtb__189, dtb__190) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__188)) (fun (pc : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__191; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__192 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__192) binders) dtb__189)) (fun (pt : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pt with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__194) binders) dtb__190)) (fun (pe : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pe with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__195; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__196 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__191, dtb__193, dtb__195)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__196 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__197) dtb__198) dtb__199) dtb__200) dtb__201)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__202, dtb__203, dtb__204) -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__202) dtb__203) dtb__204)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__205, dtb__206) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__205) dtb__206)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__207, dtb__208) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__207) dtb__208)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__209, dtb__210) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__209))) dtb__210))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__211, dtb__212) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__211) dtb__212)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__214) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__218) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__213) dtb__214) dtb__215) dtb__218) dtb__216) dtb__217)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__213, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__214; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__215); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__217 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__220) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__224) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt dtb__223) dtb__224)) (fun (label : string) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__219)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__225; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__226 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dctorKeptFieldTys env) dtb__220)) (fun (fieldTys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> ((fun args -> ((fun resTy -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__225, dtb__220, label, resTy)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__226 }))) (match (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn dtb__223) dtb__224) 0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__227) -> ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTyAt ((Base_dData_dList.v_Base_dData_dList_dmap (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTySubstVars args)) fieldTys)) dtb__227)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTyDataArgsOf (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) dtb__219)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__219) dtb__220) dtb__221) dtb__222) dtb__223)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__233) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__234) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__234)))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__234))
  | _ -> failwith "DT: impossible branch"
)))
# 215 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (name : string) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) (slot : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (body : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, slot, sp, body))) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__235; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__236; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = dtb__237 } -> ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamChainFuel fuel) env) st) binders) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__235) dtb__236) dtb__237)
  | _ -> failwith "DT: impossible branch"
)))
# 225 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerLamChainFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (hints : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (params : t_Vuna_dCompiler_dLowering_dProgram_dLamParam Base_dData_dList.t_Base_dData_dList_dList) (inner : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (resultTy : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun bs -> ((fun envB -> ((fun resultIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) envB) inner)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__238; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__239 } -> ((fun resultIr2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, resultIr2, dtb__238)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__239 }))) (match resultIr with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__240) -> resultIr
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirResultTyOf dtb__238)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))) (match resultTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__241) -> (match (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) envB) dtb__241) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__242) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__242))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLowering_dProgram_deffResultTyOf dtb__241)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse bs)) binders))) ((((v_Vuna_dCompiler_dLowering_dProgram_dbindersOfParamsHint env) binders) hints) params))))
# 356 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (f : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__243) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__243) >= 3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__243)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__244; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__244)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__246) -> (match dtb__246 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__247; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__248 } -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__247) dtb__248)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 378 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__249, dtb__250, dtb__251) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__249) dtb__250) dtb__251)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252) -> (match dtb__252 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__253; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__254 } -> (if ((v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn dtb__253) dtb__254) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__254)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__255; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__256 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__253, dtb__255)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__256 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__249) dtb__250) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 417 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (f : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (rig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pf with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__257; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__258 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__258) binders) a)) (fun (pa : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__259; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__260 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((((v_Vuna_dCompiler_dLowering_dProgram_dappTyFrom env) binders) f) dtb__257), dtb__257, dtb__259)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__260 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 433 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__261, dtb__262) -> (match dtb__261 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__263; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__264 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__264) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__263)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__265; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__266 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__266) mc3) dtb__262)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__267; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__268 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__265, dtb__267)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__268 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 453 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__269, dtb__270) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__269)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (mc0 - 1)) mc1) dtb__272) mc3) dtb__270)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__273; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__271, dtb__273)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__274 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__275, dtb__276) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__277, dtb__278) -> (match dtb__277 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__279; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__280 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__279)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__281; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__282 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__282) mc3) dtb__276) dtb__278)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__283; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__284 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf mc1) mc3) dtb__279)) dtb__275) dtb__281), dtb__283)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__284 }))
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
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__285, dtb__286) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 576 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__287) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__287)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 585 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) Base_dData_dList.C_Base_dData_dList_dList_Nil) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__288) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__288))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__289) -> (match dtb__289 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (true, Base_dData_dList.C_Base_dData_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__290) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__290))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__291) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (false, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__291)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__292; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__293 } -> (match dtb__292 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__294, dtb__295) -> (match dtb__295 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__294)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__293 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__296) -> (match dtb__296 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__297; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__298 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__299) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__298) args)) (fun (runtimeArgs : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__298) dtb__299)) runtimeArgs)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__300; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__301 } -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish env) dtb__301) dtb__297) c) args) dtb__300)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))
# 774 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) (body : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dLowering_dProgram_daeStOf bound)) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) body))
# 847 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (scrutTy : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((fun typed -> ((fun bound2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__302; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__303 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = typed; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__302 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dLowering_dProgram_darmResultTyOf env) bound2) dtb__302) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__303 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dretagAltEnv bound) typed))) ((v_Vuna_dCompiler_dLowering_dProgram_dtypedPatsAll scrutTy) (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__304) -> (match dtb__304 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__305; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__306 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__306)) (fun (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dctorKeptFieldTys env) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))) (fun (fieldTys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> ((fun argTys -> ((fun typed -> ((fun bound2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__307; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__308 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__305; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = typed; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__307 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((v_Vuna_dCompiler_dLowering_dProgram_darmResultTyOf env) bound2) dtb__307) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__308 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dretagAltEnv bound) typed))) ((v_Vuna_dCompiler_dLowering_dProgram_dtypedPats argTys) (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound)))) ((Base_dData_dList.v_Base_dData_dList_dmap (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTySubstVars (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTyDataArgsOf scrutTy))) fieldTys))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))))
# 881 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc3 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc4 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__309, dtb__310) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__309)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt, (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__311; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__312 } -> (match dtb__312 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__313; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__314 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (mc0 - 1)) mc1) mc2) dtb__314) mc4) dtb__310)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__315; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__316 } -> (match dtb__316 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__317; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__318 } -> ((fun resultTy -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__311, dtb__315)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = resultTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__318 } }))) (match dtb__313 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__319) -> dtb__313
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dtb__317
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 938 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__320) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun bound -> ((fun typed -> ((fun bound2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (mc0 - 1)) mc1) bound2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__320))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = typed; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__321 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dretagAltEnv bound) typed))) ((v_Vuna_dCompiler_dLowering_dProgram_dtypedPatsAll (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))) (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__320)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 954 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (scrut : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (alts : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__323; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__324 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pz with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__325; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__326 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__326) outer) succAlt)) (fun (ps : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match ps with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__327; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__328 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__328) outer) catchAlt)) (fun (pc : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__329; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__323, fresh, dtb__325, dtb__327, dtb__329)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__331 = dtb__324 in dtb__331))
  | _ -> failwith "DT: impossible branch"
)))))
# 989 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (scrut : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (alts : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__332; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__333 } -> ((fun scrutTy -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (fuel - 1)) env) scrutTy) dtb__333) outer) alts)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__334; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__335 } -> (match dtb__335 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (scrutTy, dtb__336, dtb__332, dtb__334)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) outer) scrut))
  | _ -> failwith "DT: impossible branch"
))))))
# 1010 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (base : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (c : string) (tele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (i : int) (fi : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn tele) 0)); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tele))))
# 1060 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (base : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (c : string) (tele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (fields : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (idxs : int Base_dData_dList.t_Base_dData_dList_dList) (body : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__338; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__339 } -> ((fun baseTy -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__340, dtb__341) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__339) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__338) baseTy) c) fields) idxs) dtb__341)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__342, dtb__343) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__339) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__338) baseTy) c) fields) idxs) dtb__343)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update body is not a constructor application")
)) (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) outer) base))
  | _ -> failwith "DT: impossible branch"
)))))
# 1077 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (baseIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) (baseTy : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (c : string) (fields : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (idxs : int Base_dData_dList.t_Base_dData_dList_dList) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__344) -> (match dtb__344 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__345; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__346 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__347) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__346) args)) (fun (runtimeArgs : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun positions -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__346) dtb__347)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__348; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__349 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__348, baseTy)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__349 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 1099 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc2 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc3 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc6 : (int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc7 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__350, dtb__351) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__350)) mc5) mc7) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position out of range")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__352) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__352)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__353; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__354 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__354) mc3) mc4) mc5) dtb__351) mc7)) (fun (r : ((string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__355; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__356 } -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__350)) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__357) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__357; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__353 }, dtb__355)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__356 }))
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
let v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 256 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerDefBodyTerm = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (body : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (defTy : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__358; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__359; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainResultTy = dtb__360 } -> (match dtb__358 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) body)
  | _ -> (match defTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) body)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__361) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dsigArrowTys 256) dtb__361) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) body)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__362) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__362) = (v_Vuna_dCompiler_dLowering_dProgram_dcountRuntimeParams dtb__358)) then ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamChainFuel (v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize body))) env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__362) dtb__358) dtb__359) dtb__360) else ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dData_dList.C_Base_dData_dList_dList_Nil) body))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn body)))

# 800 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (outer : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (scrut : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__363) -> (match dtb__363 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__364; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__365 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__366; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__367 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn dtb__367) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) dtb__365)) (fun (bound : t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dctorKeptFieldTys env) name)) (fun (fieldTys : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> ((fun argTys -> ((fun typed -> ((fun bound2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__368; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__369 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (typed, dtb__366, dtb__368)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__369 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dretagAltEnv bound) typed))) ((v_Vuna_dCompiler_dLowering_dProgram_dtypedPats argTys) (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound)))) ((Base_dData_dList.v_Base_dData_dList_dmap (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTySubstVars (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirTyDataArgsOf (((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) outer) scrut)))) fieldTys))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))

# 1127 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__371) then (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__374) else (1 + (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__374)))
  | _ -> 0
))

# 1132 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__375, dtb__376) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__378) then (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__381) else true)
  | _ -> false
))

# 1139 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : bool) (mc2 : string) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if mc1 then false else (if (if (if ((mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn mc3) = 0) else false) then true else false)))

# 1192 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__382) -> (match dtb__382 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__383, dtb__384) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__383) then (match (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__383) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__385) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__385))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type has no runtime representation: " ^ dtb__383))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type is not basic: " ^ dtb__383)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not basic")
))

# 1186 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__386) -> (match dtb__386 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__387, dtb__388) -> (if (dtb__387 = "Array") then (match dtb__388 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__389, dtb__390) -> (match dtb__390 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr dtb__389)) (fun (e : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__387 = "Array") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
))

# 1174 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (if dtb__392 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr dtb__394)) (fun (domIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__395) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__391, mc1, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (fun (resIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr mc2))
))

# 1171 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy = (fun (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) ty)))

# 1148 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerDef = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (st : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__396) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__397) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__397)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__398) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__398, dtb__396, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__399) -> ((fun defTy -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__400) -> (match dtb__400 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__401; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__402 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__399), ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)), defTy, dtb__401, (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__399), ((((v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__399), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__402 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__403) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__403)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefBodyTerm env) st) dtb__399) defTy))) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1203 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__404, dtb__405) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDef mc0) mc1) dtb__404)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__406; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__407 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) dtb__407) dtb__405)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__408; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__409 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__406, dtb__408)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__409 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1224 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__410, dtb__411) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__410) mc2) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__410; "`"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo mc0) dtb__411) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__410) true) mc2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames = (fun (kind : string) (names : string Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo kind) names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 1232 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "value") valueNames)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "type") typeNames)) (fun (_u : int) -> ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 1249 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs table) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__412; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__413 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime axiomNames) dtb__412)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes defs)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn datas) dtb__412)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure allTypeNames) dtb__412)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__412))))))))))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__413) familyTypeNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__412))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)))

# 1291 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dtblLookup = (fun (tbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 1294 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl = (fun (tbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__414) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__414) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__415) -> (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__415)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1303 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl = (fun (tbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__416) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__416)
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef = (fun (mc0 : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__417, dtb__418) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup mc0) dtb__417) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__418)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__419) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__419, ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__418)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1309 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dappendGroups = (fun (mc0 : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (mc1 : t_Vuna_dCompiler_dLowering_dProgram_dLwSt) (mc2 : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__420, dtb__421) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__422; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__423 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__422)) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups mc0) dtb__423) dtb__421)) (fun (q : ((bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__424; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__425 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = isRec; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__422 }, dtb__424)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__425 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) members))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__420))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__420))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1376 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__426, dtb__427) -> dtb__426
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1352 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList missingFromContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList extrasInContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))))))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) intrinsicNames) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (if (n = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dData_dList.v_Base_dData_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dallIntrinsics))

# 1343 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs)) (fun (_u : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract)))

# 1421 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) })

# 1272 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl tbl))) (fun (groups : (bool, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups env) 0) groups)) (fun (q : ((bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dLowering_dProgram_dLwSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__428; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__429 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__428))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs))) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef env)) defs)))

# 1424 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair = (fun (mc0 : (bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__430; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__431 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__430; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__431 }
  | _ -> failwith "DT: impossible branch"
))

# 1450 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs = (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)) defs) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__432; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__433 } -> dtb__432
  | _ -> failwith "DT: impossible branch"
))

# 1399 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (defNames : string Base_dData_dList.t_Base_dData_dList_dList) (dataNames : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs env) runtime)) (fun (groups : (bool, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dIr_dRepresent.v_Vuna_dCompiler_dIr_dRepresent_drepresentUnit (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env)) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) unitDatas))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs defs))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames dataNames))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs))) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames defNames))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas))

# 1383 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (defNames : string Base_dData_dList.t_Base_dData_dList_dList) (dataNames : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)) (fun (_u : int) -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames))))

# 1390 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (defNames : string Base_dData_dList.t_Base_dData_dList_dList) (dataNames : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames)) (fun (u : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (u)))))))

# 1428 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.env") (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv datas) defs) globals) "")))))) (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)))) (fun (_u : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))))) (fun (unitIr : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrUnit) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.entry") (fun (_u : int) -> (Vuna_dCompiler_dLowering_dEntry.v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf defs)))) (fun (entry : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrEntry Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((fun program -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram program)) (fun (_u : int) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } }))))))))))
