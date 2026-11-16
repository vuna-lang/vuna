open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dProgram_dLwSt = int
and t_Vuna_dCompiler_dLowering_dProgram_dLamChainIn = { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn = { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt : t_Vuna_dCompiler_dLowering_dProgram_dLwSt }

# 52 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__0; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__1 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

# 117 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2)) else ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn (mc0 - 1)) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> (if (dtb__6 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__7)) else ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__10, dtb__11))) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ir))))

# 156 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffUnitTypeName, Base_dList.C_Base_dList_dList_Nil))

# 134 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = "strFromFloat") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName)))) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn)))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicReturnsEff dtb__12) then (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName, Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn, (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__12), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__12)))))) else (((v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName dtb__12))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> (match dtb__13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__14, name, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))

# 165 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__16, dtb__17, dtb__18) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn dtb__18) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__19; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__20 } -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 }, dtb__19)); f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__20 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = mc0 }
))

# 181 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__22) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder dtb__21))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__23, dtb__24, dtb__25) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__26, dtb__27, dtb__28) -> ((fun whole -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__28) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__25)) then (Base_dList.C_Base_dList_dList_Cons (whole, mc1)) else (match dtb__26 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__29) -> (if (dtb__29 = "++") then ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__27) ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo dtb__24) mc1)) else (Base_dList.C_Base_dList_dList_Cons (whole, mc1)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (whole, mc1))
))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__26, dtb__27, dtb__28)), dtb__24, dtb__25)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, mc1))
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, mc1))
))

# 244 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn = (fun t -> ((v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo t) Base_dList.C_Base_dList_dList_Nil))

# 237 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> (match dtb__30 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__33, dtb__34, dtb__35) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__35) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__32)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__36) -> (if (dtb__36 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__34)) (v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn dtb__31)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 266 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__37 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = dtb__40 } -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__40)) then (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__38) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn = (fun t -> (match (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> (if (v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs dtb__42) then (match dtb__41 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__43) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__43) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__42 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 279 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__46 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> (if dtb__44 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__49) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__45) dtb__47)) (fun ts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__49) then (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__45) dtb__47) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__45) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 }, dtb__47)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__44 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs mc0) dtb__45) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr = (fun mc0 mc1 -> (if mc0 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc1)) else mc1))

# 311 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if dtb__52 then (Base_dList.C_Base_dList_dList_Cons (dtb__54, ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__53) dtb__55))) else ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__53) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dsecondOf dtb__56); Base_dPair.f_Base_dPair_dPair_second = dtb__58 }, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__57) dtb__59)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish = (fun env st family c irs -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__61 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)) irs) else (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) family) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames dtb__62) irs))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 374 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__63; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__64; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__65 } -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daePatsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__66; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__67; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__68 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daeStOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = dtb__69; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = dtb__70; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = dtb__71 } -> dtb__71
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if dtb__72 then (1 + (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__73)) else (v_Vuna_dCompiler_dLowering_dProgram_dcountKept dtb__73))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__77) then ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__75) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo (fresh + 1)) (Base_dList.C_Base_dList_dList_Cons (b, mc1))) dtb__75) (Base_dList.C_Base_dList_dList_Cons (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__78 = mc0 in dtb__78)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc3); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Nil))

# 408 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (match dtb__79 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = dtb__82 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (if ((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__83) dtb__82) then (if dtb__83 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__80) dtb__84) (Base_dList.C_Base_dList_dList_Cons (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__85 = mc0 in dtb__85)) else ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn mc0) mc1) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__80) dtb__84) mc5)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc5); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__88 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__91) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__89) (Base_dList.C_Base_dList_dList_Cons (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__92 = mc0 in dtb__92)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc4); f_Vuna_dCompiler_dLowering_dProgram_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength flags)) then ((((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Nil) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength binders) = (v_Vuna_dCompiler_dLowering_dProgram_dcountKept flags)) then (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn st) label) outer) binders) Base_dList.C_Base_dList_dList_Nil) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 435 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__93) = "") then true else (v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt dtb__94))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__95) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__96) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__97) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (match dtb__99 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__100; Base_dPair.f_Base_dPair_dPair_second = dtb__101 } -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__100) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll dtb__98) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__97)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor)))

# 503 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__102) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__103) else ((fun name -> (if (v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName name) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors dtb__103) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__102)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__104) = "") then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor dtb__105) else true)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor mc0) else false)
))

# 515 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__106) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106)) else ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy mc0) dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__108) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108)) else (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt dtb__109))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 579 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__110) }, ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn dtb__111) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 586 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__112 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__114; Base_dPair.f_Base_dPair_dPair_second = dtb__115 } -> (if (dtb__114 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115)) else ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn mc0) dtb__113))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__116 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__119 } -> (if (dtb__118 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn mc0) dtb__117) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match (((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn dtb__120) mc0) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__120; Base_dPair.f_Base_dPair_dPair_second = dtb__122 }, ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__121)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn mc0) dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__125 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__127; Base_dPair.f_Base_dPair_dPair_second = dtb__128 } -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127)) else (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (mc0 - 1)) dtb__124) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 610 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn = (fun tele binders -> ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_deraseTele) tele))) binders))

# 75 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__129, dtb__130, dtb__131) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn dtb__130) binders) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132) -> (if (v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf dtb__132) then ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__129))) dtb__129) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__132)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__133) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef env) dtb__133)) (fun ir -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ir; Base_dPair.f_Base_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__134) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__134)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__135) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__135)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__136) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__136)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__137) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__137)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__138, dtb__139, dtb__140) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__138)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__142) binders) dtb__139)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__144 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__144) binders) dtb__140)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__141, dtb__143, dtb__145)); Base_dPair.f_Base_dPair_dPair_second = dtb__146 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__147, dtb__148, dtb__149) -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__147) dtb__148) dtb__149)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__150, dtb__151, dtb__152) -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__150) dtb__151) dtb__152)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__153, dtb__154) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__153) dtb__154)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__155, dtb__156) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__155) dtb__156)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__157, dtb__158) -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__157))) dtb__158))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__159, dtb__160) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__159) dtb__160)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__162) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> ((((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__161) dtb__162) dtb__163) dtb__166) dtb__164) dtb__165)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__161, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__162; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__163; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__165 }, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__168) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt dtb__171) dtb__172)) (fun label -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__167)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__173, dtb__168, label)); Base_dPair.f_Base_dPair_dPair_second = dtb__174 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__167) dtb__168) dtb__169) dtb__170) dtb__171)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__180) -> (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__181) -> ((Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__181)))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint dtb__181))
  | _ -> failwith "DT: impossible branch"
)))
# 170 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel = (fun fuel env st binders name rig body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, body))) with
  | { f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBinders = dtb__182; f_Vuna_dCompiler_dLowering_dProgram_dLamChainIn_lamChainBody = dtb__183 } -> ((fun bs -> ((fun envB -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__183)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, dtb__184)); Base_dPair.f_Base_dPair_dPair_second = dtb__185 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse bs)) binders))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam) dtb__182))
  | _ -> failwith "DT: impossible branch"
)))
# 185 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__186) >= 3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__186)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__187)); Base_dPair.f_Base_dPair_dPair_second = dtb__188 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (match dtb__189 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__190; Base_dPair.f_Base_dPair_dPair_second = dtb__191 } -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__190) dtb__191)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 197 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__192) dtb__193) dtb__194)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__196; Base_dPair.f_Base_dPair_dPair_second = dtb__197 } -> (if ((v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn dtb__196) dtb__197) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__197)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = dtb__199 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__196, dtb__198)); Base_dPair.f_Base_dPair_dPair_second = dtb__199 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__192) dtb__193) dtb__194))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 208 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun pf -> (match pf with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__201 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) dtb__201) binders) a)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__202; Base_dPair.f_Base_dPair_dPair_second = dtb__203 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__200, dtb__202)); Base_dPair.f_Base_dPair_dPair_second = dtb__203 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 216 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__204 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__206; Base_dPair.f_Base_dPair_dPair_second = dtb__207 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__207) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__206)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__209) mc3) dtb__205)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = dtb__211 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__210)); Base_dPair.f_Base_dPair_dPair_second = dtb__211 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 227 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__212)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel (mc0 - 1)) mc1) dtb__215) mc3) dtb__213)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__216; Base_dPair.f_Base_dPair_dPair_second = dtb__217 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__214, dtb__216)); Base_dPair.f_Base_dPair_dPair_second = dtb__217 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 293 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (match dtb__220 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__222; Base_dPair.f_Base_dPair_dPair_second = dtb__223 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__222)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__224; Base_dPair.f_Base_dPair_dPair_second = dtb__225 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__225) mc3) dtb__219) dtb__221)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = dtb__227 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr dtb__218) dtb__224), dtb__226)); Base_dPair.f_Base_dPair_dPair_second = dtb__227 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 317 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__230)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 323 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Nil) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__231) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__231))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__232) -> (match dtb__232 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Cons (true, Base_dList.C_Base_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__234) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dList.C_Base_dList_dList_Cons (false, Base_dList.C_Base_dList_dList_Nil))) dtb__234)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> (match dtb__235 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__237)); Base_dPair.f_Base_dPair_dPair_second = dtb__236 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> (match dtb__239 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__240; Base_dPair.f_Base_dPair_dPair_second = dtb__241 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__241) args)) (fun runtimeArgs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__241) dtb__242)) runtimeArgs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__243; Base_dPair.f_Base_dPair_dPair_second = dtb__244 } -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish env) dtb__244) dtb__240) c) dtb__243)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))))
# 432 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dLowering_dProgram_daeStOf bound)) (v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf bound)) body))
# 454 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245) -> (match dtb__245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__246; Base_dPair.f_Base_dPair_dPair_second = dtb__247 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__248; Base_dPair.f_Base_dPair_dPair_second = dtb__249 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn dtb__249) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__247)) (fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__250; Base_dPair.f_Base_dPair_dPair_second = dtb__251 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound), dtb__248, dtb__250)); Base_dPair.f_Base_dPair_dPair_second = dtb__251 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))
# 468 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__253 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__252 }; Base_dPair.f_Base_dPair_dPair_second = dtb__253 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__254) -> (match dtb__254 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__256)) (fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__257; Base_dPair.f_Base_dPair_dPair_second = dtb__258 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__257 }; Base_dPair.f_Base_dPair_dPair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))))
# 484 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__259)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (mc0 - 1)) mc1) dtb__262) mc3) dtb__260)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__263)); Base_dPair.f_Base_dPair_dPair_second = dtb__264 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 524 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__265))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__266; Base_dPair.f_Base_dPair_dPair_second = dtb__267 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dLowering_dProgram_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__266 })); Base_dPair.f_Base_dPair_dPair_second = dtb__267 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__265))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 534 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun pz -> (match pz with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__270; Base_dPair.f_Base_dPair_dPair_second = dtb__271 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__271) outer) succAlt)) (fun ps -> (match ps with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__272; Base_dPair.f_Base_dPair_dPair_second = dtb__273 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel (fuel - 1)) env) dtb__273) outer) catchAlt)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__274; Base_dPair.f_Base_dPair_dPair_second = dtb__275 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__268, fresh, dtb__270, dtb__272, dtb__274)); Base_dPair.f_Base_dPair_dPair_second = dtb__275 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__276 = dtb__269 in dtb__276))
  | _ -> failwith "DT: impossible branch"
)))))
# 556 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else (match ((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt env) alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> ((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel (fuel - 1)) env) st) outer) scrut) dtb__277)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__278; Base_dPair.f_Base_dPair_dPair_second = dtb__279 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel (fuel - 1)) env) dtb__279) outer) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__278, dtb__280)); Base_dPair.f_Base_dPair_dPair_second = dtb__281 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 568 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = ((v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn tele) 0); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 })) }, Base_dList.C_Base_dList_dList_Nil)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tele))))
# 616 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__284, dtb__285) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__283) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__282) c) fields) idxs) dtb__285)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__286, dtb__287) -> (((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__283) ((v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn tele) outer)) dtb__282) c) fields) idxs) dtb__287)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
# 629 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (match dtb__288 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__289; Base_dPair.f_Base_dPair_dPair_second = dtb__290 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__291) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs c) dtb__290) args)) (fun runtimeArgs -> ((fun positions -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags dtb__290) dtb__291)) positions) runtimeArgs)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__292; Base_dPair.f_Base_dPair_dPair_second = dtb__293 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__292)); Base_dPair.f_Base_dPair_dPair_second = dtb__293 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 642 "Vuna/Compiler/Lowering/Program.vuna"
and v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__294, dtb__295) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn (Base_dPair.v_Base_dPair_dsecondOf dtb__294)) mc5) mc7) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position out of range")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__296) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__296)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = dtb__298 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__298) mc3) mc4) mc5) dtb__295) mc7)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__299; Base_dPair.f_Base_dPair_dPair_second = dtb__300 } -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn (Base_dPair.v_Base_dPair_dfirstOf dtb__294)) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__301) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__301; Base_dPair.f_Base_dPair_dPair_second = dtb__297 }, dtb__299)); Base_dPair.f_Base_dPair_dPair_second = dtb__300 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "record update position has no runtime field")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel (v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 660 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__302, dtb__303, dtb__304) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__303) then (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__304) else (1 + (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__304)))
  | _ -> 0
))

# 665 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__305, dtb__306) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__307, dtb__308, dtb__309) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__308) then (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__309) else true)
  | _ -> false
))

# 671 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf = (fun mc0 mc1 mc2 mc3 -> (if mc1 then false else (if (if (if ((mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn mc3) = 0) else false) then true else false)))

# 714 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__310) -> (match dtb__310 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__311, dtb__312) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__311) then (match (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__311) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__313) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__313))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type has no runtime representation: " ^ dtb__311))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("extern type is not basic: " ^ dtb__311)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is not basic")
))

# 708 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__314) -> (match dtb__314 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__315, dtb__316) -> (if (dtb__315 = "Array") then (match dtb__316 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__317, dtb__318) -> (match dtb__318 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr dtb__317)) (fun e -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__315 = "Array") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr mc0)
))

# 700 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (if dtb__320 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr dtb__322)) (fun domIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__323) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__319, mc1, Base_dList.C_Base_dList_dList_Nil))))))) (fun resIr -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr mc2))
))

# 697 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) ty)))

# 680 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__324) -> (match (v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__325) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__325)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__326) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__326, dtb__324, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__327) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__328) -> (match dtb__328 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__329; Base_dPair.f_Base_dPair_dPair_second = dtb__330 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn dtb__327), ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)), dtb__329, (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__327), ((((v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__327), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__331)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm env) st) Base_dList.C_Base_dList_dList_Nil) dtb__327))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__332, dtb__333) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDef mc0) mc1) dtb__332)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__334; Base_dPair.f_Base_dPair_dPair_second = dtb__335 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) dtb__335) dtb__333)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = dtb__337 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__334, dtb__336)); Base_dPair.f_Base_dPair_dPair_second = dtb__337 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 737 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__338, dtb__339) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__338) mc2) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__338; "`"])) else (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo mc0) dtb__339) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__338) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 734 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 743 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 759 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs table) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__340; Base_dPair.f_Base_dPair_dPair_second = dtb__341 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime axiomNames) dtb__340)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn datas) dtb__340)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure allTypeNames) dtb__340)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__340))))))))))) ((Base_dList.v_Base_dList_dappend dtb__341) familyTypeNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__340))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)))

# 794 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dtblLookup = (fun tbl name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 797 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__342) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__342) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__343) -> (v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn dtb__343)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__344) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__344)
  | _ -> failwith "DT: impossible branch"
))

# 825 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__345, dtb__346) -> (match ((v_Vuna_dCompiler_dLowering_dProgram_dtblLookup mc0) dtb__345) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__346)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__347) -> (Base_dList.C_Base_dList_dList_Cons (dtb__347, ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef mc0) dtb__346)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 809 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_Vuna_dCompiler_dLowering_dProgram_dappendGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs mc0) mc1) defs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = dtb__351 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__350)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups mc0) dtb__351) dtb__349)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__352; Base_dPair.f_Base_dPair_dPair_second = dtb__353 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = isRec; Base_dPair.f_Base_dPair_dPair_second = dtb__350 }, dtb__352)); Base_dPair.f_Base_dPair_dPair_second = dtb__353 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef (mc0).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) members))) (Base_dPair.v_Base_dPair_dsecondOf dtb__348))) (Base_dPair.v_Base_dPair_dfirstOf dtb__348))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 862 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__354, dtb__355) -> dtb__354
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 843 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList missingFromContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList extrasInContract); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if ((Base_dList.v_Base_dList_dmemName n) intrinsicNames) then false else (if ((Base_dList.v_Base_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if (n = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dList.v_Base_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dallIntrinsics))

# 835 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs)) (fun _u -> v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract)))

# 901 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef = (fun env d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf env) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) })

# 781 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl tbl))) (fun groups -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dappendGroups env) 0) groups)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__356; Base_dPair.f_Base_dPair_dPair_second = dtb__357 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__356))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef env)) defs)))

# 904 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__358; Base_dPair.f_Base_dPair_dPair_second = dtb__359 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__358; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__359 }
  | _ -> failwith "DT: impossible branch"
))

# 921 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_ddefTable defs)) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__360; Base_dPair.f_Base_dPair_dPair_second = dtb__361 } -> dtb__360
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs env) runtime)) (fun groups -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo) datas) unitDatas)) (fun decls -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (Vuna_dCompiler_dLowering_dTy.v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) unitDatas))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs defs))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dHashMap.v_Base_dHashMap_dofNames dataNames))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs))) (Base_dHashMap.v_Base_dHashMap_dofNames defNames))) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas))

# 869 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)) (fun _u -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames))))

# 875 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked = (fun env defNames dataNames -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) defNames) dataNames)) (fun u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit u)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (u)))))))

# 908 "Vuna/Compiler/Lowering/Program.vuna"
let v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf = (fun datas defs -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.env") (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv datas) defs) "")))))) (fun env -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.prepare") (fun _u -> (v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env)))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.unit") (fun _u -> (((v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks env) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))))) (fun unitIr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.codegen.entry") (fun _u -> (Vuna_dCompiler_dLowering_dEntry.v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf defs)))) (fun entry -> ((fun program -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dIr_dValidate.v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram program)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } }))))))))))
