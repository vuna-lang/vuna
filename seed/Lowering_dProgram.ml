open Vuna_runtime
type t_LwSt = { f_LwSt_lwNext : int; f_LwSt_lwBinder : int }
and t_LamParam = { f_LamParam_lamParamName : string; f_LamParam_lamParamRig : Core_dTerm.t_Rig; f_LamParam_lamParamTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_LamChainIn = { f_LamChainIn_lamChainBinders : t_LamParam B_dData_dList.t_List; f_LamChainIn_lamChainBody : Core_dTerm.t_Term; f_LamChainIn_lamChainResultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_AltEnvIn = { f_AltEnvIn_aeEnv : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aePats : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aeSt : t_LwSt }

# 57 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderErasedOf = (fun (dtb_u_u1 : Vuna_dIr_dModel.t_IrBinder) -> (dtb_u_u1).Vuna_dIr_dModel.f_IrBinder_irBinderErased)

# 74 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBudgetFor = (fun (dtb_u_u2 : int) -> (512 + (8 * dtb_u_u2)))

# 150 "Vuna/Compiler/Lowering/Program.vuna"
let v_justTy = (fun (dtb_u_u3 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u4) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u4))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_binderAtIn = (fun (dtb_u_u5 : int) (dtb_u_u6 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u6 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u7, dtb_u_u8) -> (if (dtb_u_u5 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u7)) else ((v_binderAtIn (dtb_u_u5 - 1)) dtb_u_u8))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeBinderAt = (fun (dtb_u_u9 : int) (dtb_u_u10 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (if (v_binderErasedOf dtb_u_u11) then ((v_runtimeBinderAt dtb_u_u9) dtb_u_u12) else (if (dtb_u_u9 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u11)) else ((v_runtimeBinderAt (dtb_u_u9 - 1)) dtb_u_u12)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimePairGo = (fun (dtb_u_u13 : int) (dtb_u_u14 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u15 : int) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> (let dtb_u_u18 = (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u16)) in (if (dtb_u_u15 <= 0) then (if dtb_u_u18 then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u13))) else (((v_runtimePairGo (if dtb_u_u18 then dtb_u_u13 else (dtb_u_u13 + 1))) dtb_u_u17) (dtb_u_u15 - 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Lowering/Program.vuna"
let v_runtimeIndexInPairs = (fun (dtb_u_u19 : int) (dtb_u_u20 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_runtimePairGo 0) dtb_u_u20) dtb_u_u19))

# 180 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordFieldNameAt = (fun (dtb_u_u21 : int) (dtb_u_u22 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u22 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u23, dtb_u_u24) -> (match dtb_u_u23 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u25; B_dData_dPair.f_Pair_second = dtb_u_u26 } -> (if (dtb_u_u25 = dtb_u_u21) then (Base_dDiag.C_Check_OkC (dtb_u_u26)) else ((v_recordFieldNameAt dtb_u_u21) dtb_u_u24))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordTermAsAppIn = (fun (dtb_u_u27 : Core_dTerm.t_Term) (dtb_u_u28 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (match dtb_u_u29 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u31; B_dData_dPair.f_Pair_second = dtb_u_u32 } -> ((v_recordTermAsAppIn (Core_dTerm.C_Term_TApp (dtb_u_u27, dtb_u_u31, dtb_u_u32))) dtb_u_u30)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u27
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBridgeGuard = (fun (dtb_u_u33 : Lowering_dEnv.t_LwEnv) (dtb_u_u34 : string) (dtb_u_u35 : Vuna_dIr_dModel.t_Ir) -> (if (Vuna_dIr_dRuntime.v_irRtBridgesList dtb_u_u34) then (if (dtb_u_u33).Lowering_dEnv.f_LwEnv_lwHasListFamily then (Base_dDiag.C_Check_OkC (dtb_u_u35)) else ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_ListBridgeRequired (dtb_u_u34))) dtb_u_u34)) else (Base_dDiag.C_Check_OkC (dtb_u_u35))))

# 224 "Vuna/Compiler/Lowering/Program.vuna"
let v_effUnitTyIn = (Vuna_dIr_dModel.C_IrTy_IrTyData (Base_dIntrinsics.v_effUnitTypeName, B_dData_dList.C_List_Nil))

# 192 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerGlobalRef = (fun (dtb_u_u36 : Lowering_dEnv.t_LwEnv) (dtb_u_u37 : string) -> (if (dtb_u_u37 = Base_dIntrinsics.v_natZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (dtb_u_u37 = Base_dIntrinsics.v_finZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (dtb_u_u37 = "strFromFloat") then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (Lowering_dEnv.v_floatRenderRefName)))) else (if (dtb_u_u37 = Base_dIntrinsics.v_natSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (if (dtb_u_u37 = Base_dIntrinsics.v_finSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (if (dtb_u_u37 = Base_dIntrinsics.v_finToNatName) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt ("natToInt")))) else (let dtb_u_u38 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u37) (dtb_u_u36).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u38 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Base_dIntrinsics.v_findIntrinsic dtb_u_u37) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u39) -> (if (dtb_u_u37 = Base_dIntrinsics.v_primEffBind1Name) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrEffBind (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn)))) else (if (Base_dIntrinsics.v_intrinsicReturnsEff dtb_u_u39) then (((v_lowerBridgeGuard dtb_u_u36) dtb_u_u37) (Vuna_dIr_dModel.C_Ir_IrEffThunk (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn, (Base_dIntrinsics.v_intrinsicArity dtb_u_u39), (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb_u_u39)))))) else (((v_lowerBridgeGuard dtb_u_u36) dtb_u_u37) (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb_u_u39))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u37))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u40) -> (match dtb_u_u40 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u41; B_dData_dPair.f_Pair_second = dtb_u_u42 } -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u41, dtb_u_u37, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 240 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_collectLamChainIn = (fun (dtb_u_u43 : Core_dTerm.t_Term) -> (match dtb_u_u43 with
  | Core_dTerm.C_Term_TLam (dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47, dtb_u_u48) -> (let dtb_u_u49 = (v_collectLamChainIn dtb_u_u48) in (let dtb_u_u50 = (match (dtb_u_u49).f_LamChainIn_lamChainResultTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (dtb_u_u49).f_LamChainIn_lamChainResultTy
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_lamResultTyOf dtb_u_u46)
  | _ -> failwith "DT: impossible branch"
) in { f_LamChainIn_lamChainBinders = (B_dData_dList.C_List__x58__x58_ ({ f_LamParam_lamParamName = dtb_u_u44; f_LamParam_lamParamRig = dtb_u_u45; f_LamParam_lamParamTy = (Core_dTerm.v_lamBinderTyOf dtb_u_u46) }, (dtb_u_u49).f_LamChainIn_lamChainBinders)); f_LamChainIn_lamChainBody = (dtb_u_u49).f_LamChainIn_lamChainBody; f_LamChainIn_lamChainResultTy = dtb_u_u50 }))
  | _ -> { f_LamChainIn_lamChainBinders = B_dData_dList.C_List_Nil; f_LamChainIn_lamChainBody = dtb_u_u43; f_LamChainIn_lamChainResultTy = B_dData_dMaybe.C_Maybe_Nothing }
))

# 318 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countRuntimeParams = (fun (dtb_u_u52 : t_LamParam B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u53, dtb_u_u54) -> (if (Core_dTerm.v_rigIsErased (dtb_u_u53).f_LamParam_lamParamRig) then (v_countRuntimeParams dtb_u_u54) else (1 + (v_countRuntimeParams dtb_u_u54)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_sigArrowTys = (fun (dtb_u_u55 : int) (dtb_u_u56 : Vuna_dIr_dModel.t_IrTy) -> (if (dtb_u_u55 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u56 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u57, dtb_u_u58) -> (match ((v_sigArrowTys (dtb_u_u55 - 1)) dtb_u_u58) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u57, dtb_u_u59))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
)))

# 342 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_headGlobalOf = (fun (dtb_u_u60 : Core_dTerm.t_Term) -> (match dtb_u_u60 with
  | Core_dTerm.C_Term_TRecord (dtb_u_u61, dtb_u_u62) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u61))
  | Core_dTerm.C_Term_TApp (dtb_u_u63, dtb_u_u64, dtb_u_u65) -> (v_headGlobalOf dtb_u_u63)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u66) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u66))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 336 "Vuna/Compiler/Lowering/Program.vuna"
let v_effResultTyOf = (fun (dtb_u_u67 : Core_dTerm.t_Term) -> (match (v_headGlobalOf dtb_u_u67) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u68) -> (if (dtb_u_u68 = Vuna_dIr_dModel.v_irEffTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (Vuna_dIr_dModel.v_irEffTypeName, (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, B_dData_dList.C_List_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderOfParam = (fun (dtb_u_u69 : Lowering_dEnv.t_LwEnv) (dtb_u_u70 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u71 : int) (dtb_u_u72 : t_LamParam) -> (if (Core_dTerm.v_rigIsErased (dtb_u_u72).f_LamParam_lamParamRig) then Vuna_dIr_dModel.v_mkIrBinderErased else (match (dtb_u_u72).f_LamParam_lamParamTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Vuna_dIr_dModel.v_mkIrBinderOpaque dtb_u_u71) (dtb_u_u72).f_LamParam_lamParamName)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u73) -> (((Vuna_dIr_dModel.v_mkIrBinderTyped dtb_u_u71) (dtb_u_u72).f_LamParam_lamParamName) (((Lowering_dTy.v_annotTyOfTotal dtb_u_u69) dtb_u_u70) dtb_u_u73))
  | _ -> failwith "DT: impossible branch"
)))

# 361 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_bindersOfParamsHint = (fun (dtb_u_u74 : Lowering_dEnv.t_LwEnv) (dtb_u_u75 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u76 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u77 : int) (dtb_u_u78 : t_LamParam B_dData_dList.t_List) -> (match dtb_u_u78 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u79, dtb_u_u80) -> (let dtb_u_u81 = (Core_dTerm.v_rigIsErased (dtb_u_u79).f_LamParam_lamParamRig) in (let dtb_u_u82 = (if dtb_u_u81 then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u89, dtb_u_u90) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u89))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u83 = (if dtb_u_u81 then dtb_u_u76 else (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u87, dtb_u_u88) -> dtb_u_u88
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u84 = (match dtb_u_u82 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (((Vuna_dIr_dModel.v_mkIrBinderTyped dtb_u_u77) (dtb_u_u79).f_LamParam_lamParamName) dtb_u_u86)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_binderOfParam dtb_u_u74) dtb_u_u75) dtb_u_u77) dtb_u_u79)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u85 = (((((v_bindersOfParamsHint dtb_u_u74) (B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u75))) dtb_u_u83) (dtb_u_u77 + 1)) dtb_u_u80) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u84, (B_dData_dPair.v_firstOf dtb_u_u85))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u85) })))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u77 }
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_peelLams = (fun (dtb_u_u91 : Core_dTerm.t_Term) -> (match dtb_u_u91 with
  | Core_dTerm.C_Term_TLam (dtb_u_u92, dtb_u_u93, dtb_u_u94, dtb_u_u95, dtb_u_u96) -> (v_peelLams dtb_u_u96)
  | _ -> dtb_u_u91
))

# 398 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_stripEraseHead = (fun (dtb_u_u97 : Core_dTerm.t_Term) -> (match dtb_u_u97 with
  | Core_dTerm.C_Term_TApp (dtb_u_u98, dtb_u_u99, dtb_u_u100) -> (match dtb_u_u98 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u101) -> (if (dtb_u_u101 = Base_dIntrinsics.v_primEraseName) then (v_stripEraseHead dtb_u_u99) else (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u101)), dtb_u_u99, Core_dTerm.C_Rig_Rig1)))
  | _ -> dtb_u_u97
)
  | _ -> dtb_u_u97
))

# 403 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_conHeadOf = (fun (dtb_u_u102 : Core_dTerm.t_Term) -> (match dtb_u_u102 with
  | Core_dTerm.C_Term_TApp (dtb_u_u103, dtb_u_u104, dtb_u_u105) -> (v_conHeadOf dtb_u_u103)
  | Core_dTerm.C_Term_TCon (dtb_u_u106, dtb_u_u107) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u106))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 408 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appHeadVarIdx = (fun (dtb_u_u108 : Core_dTerm.t_Term) -> (match dtb_u_u108 with
  | Core_dTerm.C_Term_TApp (dtb_u_u109, dtb_u_u110, dtb_u_u111) -> (match dtb_u_u109 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u112) -> (if (dtb_u_u112 = Base_dIntrinsics.v_primEraseName) then (v_appHeadVarIdx dtb_u_u110) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (v_appHeadVarIdx dtb_u_u109)
)
  | Core_dTerm.C_Term_TVar (dtb_u_u113, dtb_u_u114, dtb_u_u115) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u113; B_dData_dPair.f_Pair_second = dtb_u_u114 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 417 "Vuna/Compiler/Lowering/Program.vuna"
let v_projFieldOf = (fun (dtb_u_u116 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u116 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u117) -> (let dtb_u_u118 = (v_peelLams dtb_u_u117) in (match dtb_u_u118 with
  | Core_dTerm.C_Term_TCase (dtb_u_u119, dtb_u_u120) -> (match dtb_u_u120 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (match dtb_u_u122 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u123 = (v_appHeadVarIdx (Core_dTerm.v_caseAltBody dtb_u_u121)) in (match dtb_u_u123 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u124) -> (match dtb_u_u124 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u125; B_dData_dPair.f_Pair_second = dtb_u_u126 } -> (let dtb_u_u127 = (B_dData_dList.v_length (dtb_u_u121).Core_dTerm.f_CaseAlt_caseAltBinders) in (let dtb_u_u128 = ((bi_natSub dtb_u_u127 1) - dtb_u_u126) in (if (if (dtb_u_u126 >= 0) then (dtb_u_u126 < dtb_u_u127) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u121).Core_dTerm.f_CaseAlt_caseAltName; B_dData_dPair.f_Pair_second = dtb_u_u128 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthTerm = (fun (dtb_u_u129 : int) (dtb_u_u130 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u129 < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u130 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u131, dtb_u_u132) -> (if (dtb_u_u129 = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u131)) else ((v_nthTerm (dtb_u_u129 - 1)) dtb_u_u132))
  | _ -> failwith "DT: impossible branch"
)))

# 440 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_foldAppTerm = (fun (dtb_u_u133 : Core_dTerm.t_Term) (dtb_u_u134 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u134 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u135, dtb_u_u136) -> ((v_foldAppTerm (Core_dTerm.C_Term_TApp (dtb_u_u133, (B_dData_dPair.v_firstOf dtb_u_u135), (B_dData_dPair.v_secondOf dtb_u_u135)))) dtb_u_u136)
  | B_dData_dList.C_List_Nil -> dtb_u_u133
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Lowering/Program.vuna"
let v_isEffBuilder = (fun (dtb_u_u137 : Core_dTerm.t_Term) -> (match (v_conHeadOf (v_peelLams (v_stripEraseHead dtb_u_u137))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u138) -> (dtb_u_u138 = Vuna_dIr_dModel.v_irEffMkCtor)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Lowering/Program.vuna"
let v_dictFieldOf = (fun (dtb_u_u139 : Lowering_dEnv.t_LwEnv) (dtb_u_u140 : string) (dtb_u_u141 : string) (dtb_u_u142 : int) -> (match ((Lowering_dEnv.v_lwDefBodyOf dtb_u_u140) dtb_u_u139) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u143) -> (match (v_stripEraseHead (v_peelLams dtb_u_u143)) with
  | Core_dTerm.C_Term_TCon (dtb_u_u144, dtb_u_u145) -> (if (dtb_u_u144 = dtb_u_u141) then (match ((v_nthTerm dtb_u_u142) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u145)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u146) -> (if (v_isEffBuilder dtb_u_u146) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u146)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Lowering/Program.vuna"
let v_runtimeArg = (fun (dtb_u_u147 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u147))))

# 469 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_dictNameOf = (fun (dtb_u_u148 : Core_dTerm.t_Term) -> (match dtb_u_u148 with
  | Core_dTerm.C_Term_TApp (dtb_u_u149, dtb_u_u150, dtb_u_u151) -> (if (Core_dTerm.v_rigIsErased dtb_u_u151) then (v_dictNameOf dtb_u_u149) else B_dData_dMaybe.C_Maybe_Nothing)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u152) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u152))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 475 "Vuna/Compiler/Lowering/Program.vuna"
let v_effFieldAppIn = (fun (dtb_u_u153 : Lowering_dEnv.t_LwEnv) (dtb_u_u154 : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine dtb_u_u154) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u155; B_dData_dPair.f_Pair_second = dtb_u_u156 } -> (match dtb_u_u155 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u157) -> (let dtb_u_u158 = (v_projFieldOf ((Lowering_dEnv.v_lwDefBodyOf dtb_u_u157) dtb_u_u153)) in (match dtb_u_u158 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u159) -> (match dtb_u_u159 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u160; B_dData_dPair.f_Pair_second = dtb_u_u161 } -> (let dtb_u_u162 = ((B_dData_dList.v_filter v_runtimeArg) dtb_u_u156) in (match dtb_u_u162 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u163, dtb_u_u164) -> (match dtb_u_u163 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u165; B_dData_dPair.f_Pair_second = dtb_u_u166 } -> (match (v_dictNameOf dtb_u_u165) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> (match ((((v_dictFieldOf dtb_u_u153) dtb_u_u167) dtb_u_u160) dtb_u_u161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u168) -> (B_dData_dMaybe.C_Maybe_Just (((v_foldAppTerm dtb_u_u168) dtb_u_u164)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOf = (fun (dtb_u_u169 : Lowering_dEnv.t_LwEnv) (dtb_u_u170 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u171 : Core_dTerm.t_Term) -> (let dtb_u_u172 = (((Lowering_dTy.v_annotRunCalleeTy dtb_u_u169) dtb_u_u170) dtb_u_u171) in (match dtb_u_u172 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u173) -> (match dtb_u_u173 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u174, dtb_u_u175) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u173; B_dData_dPair.f_Pair_second = dtb_u_u175 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 548 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOfIr = (fun (dtb_u_u176 : Vuna_dIr_dModel.t_Ir) -> (let dtb_u_u177 = (Vuna_dIr_dModel.v_irResultTyOf dtb_u_u176) in (match dtb_u_u177 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u178) -> (match dtb_u_u178 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u179, dtb_u_u180) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u178; B_dData_dPair.f_Pair_second = dtb_u_u180 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 554 "Vuna/Compiler/Lowering/Program.vuna"
let v_justAppTy = (fun (dtb_u_u181 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u181 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u182) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u182))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque }))
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyFrom = (fun (dtb_u_u183 : Lowering_dEnv.t_LwEnv) (dtb_u_u184 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u185 : Core_dTerm.t_Term) (dtb_u_u186 : Vuna_dIr_dModel.t_Ir) -> (match (((v_appTyOf dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u187) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u187))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_appTyOfIr dtb_u_u186)
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_concatLeavesGo = (fun (dtb_u_u188 : Core_dTerm.t_Term) (dtb_u_u189 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u188 with
  | Core_dTerm.C_Term_TApp (dtb_u_u190, dtb_u_u191, dtb_u_u192) -> (match dtb_u_u190 with
  | Core_dTerm.C_Term_TApp (dtb_u_u193, dtb_u_u194, dtb_u_u195) -> (let dtb_u_u196 = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp (dtb_u_u193, dtb_u_u194, dtb_u_u195)), dtb_u_u191, dtb_u_u192)) in (if (if (Core_dTerm.v_rigIsErased dtb_u_u195) then true else (Core_dTerm.v_rigIsErased dtb_u_u192)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u189)) else (match dtb_u_u193 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u197) -> (if (dtb_u_u197 = "++") then ((v_concatLeavesGo dtb_u_u194) ((v_concatLeavesGo dtb_u_u191) dtb_u_u189)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u189)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u189))
)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u188, dtb_u_u189))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u188, dtb_u_u189))
))

# 627 "Vuna/Compiler/Lowering/Program.vuna"
let v_concatLeavesIn = (fun (dtb_u_u198 : Core_dTerm.t_Term) -> ((v_concatLeavesGo dtb_u_u198) B_dData_dList.C_List_Nil))

# 617 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenConcatChainIn = (fun (dtb_u_u199 : Core_dTerm.t_Term) -> (match dtb_u_u199 with
  | Core_dTerm.C_Term_TApp (dtb_u_u200, dtb_u_u201, dtb_u_u202) -> (match dtb_u_u200 with
  | Core_dTerm.C_Term_TApp (dtb_u_u203, dtb_u_u204, dtb_u_u205) -> (if (if (Core_dTerm.v_rigIsErased dtb_u_u205) then true else (Core_dTerm.v_rigIsErased dtb_u_u202)) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u203 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u206) -> (if (dtb_u_u206 = "++") then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append (v_concatLeavesIn dtb_u_u204)) (v_concatLeavesIn dtb_u_u201)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 655 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allRuntimeArgs = (fun (dtb_u_u207 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u207 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u208, dtb_u_u209) -> (match dtb_u_u208 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = dtb_u_u211 } -> (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u211)) then (v_allRuntimeArgs dtb_u_u209) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenIntrinsicAppIn = (fun (dtb_u_u212 : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine dtb_u_u212) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u213; B_dData_dPair.f_Pair_second = dtb_u_u214 } -> (if (v_allRuntimeArgs dtb_u_u214) then (match dtb_u_u213 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u215) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb_u_u215) > 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u215; B_dData_dPair.f_Pair_second = dtb_u_u214 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 659 "Vuna/Compiler/Lowering/Program.vuna"
let v_inlineArityMatchesIn = (fun (dtb_u_u216 : string) (dtb_u_u217 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb_u_u216) <= 0) then false else ((Lowering_dEnv.v_listLength dtb_u_u217) = (Vuna_dIr_dModel.v_irInlineArity dtb_u_u216))))

# 668 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_alignCtorArgs = (fun (dtb_u_u218 : string) (dtb_u_u219 : bool B_dData_dList.t_List) (dtb_u_u220 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u219 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u221, dtb_u_u222) -> (match dtb_u_u220 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u223, dtb_u_u224) -> (match dtb_u_u223 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u225; B_dData_dPair.f_Pair_second = dtb_u_u226 } -> (if dtb_u_u221 then (if (Core_dTerm.v_rigIsErased dtb_u_u226) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u218; ": runtime field marked erased"])) else ((Base_dCommon.v_bind (((v_alignCtorArgs dtb_u_u218) dtb_u_u222) dtb_u_u224)) (fun (dtb_u_u227 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u225; B_dData_dPair.f_Pair_second = dtb_u_u226 }, dtb_u_u227))))))) else (if (Core_dTerm.v_rigIsErased dtb_u_u226) then (((v_alignCtorArgs dtb_u_u218) dtb_u_u222) dtb_u_u224) else (((v_alignCtorArgs dtb_u_u218) dtb_u_u222) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u225; B_dData_dPair.f_Pair_second = dtb_u_u226 }, dtb_u_u224)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if dtb_u_u221 then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u218; ": application has fewer arguments than its shape"])) else (((v_alignCtorArgs dtb_u_u218) dtb_u_u222) B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u220 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u218; ": application has more arguments than its shape"]))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Lowering/Program.vuna"
let v_ctorArgIr = (fun (dtb_u_u230 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u231 : bool) (dtb_u_u232 : Vuna_dIr_dModel.t_Ir) -> (if dtb_u_u231 then (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u230, (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)), dtb_u_u232)) else dtb_u_u232))

# 715 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_ctorOpaqueKeptFlags = (fun (dtb_u_u233 : bool B_dData_dList.t_List) (dtb_u_u234 : bool B_dData_dList.t_List) -> (match dtb_u_u233 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u235, dtb_u_u236) -> (match dtb_u_u234 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> (if dtb_u_u235 then (B_dData_dList.C_List__x58__x58_ (dtb_u_u237, ((v_ctorOpaqueKeptFlags dtb_u_u236) dtb_u_u238))) else ((v_ctorOpaqueKeptFlags dtb_u_u236) dtb_u_u238))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_zipFieldNames = (fun (dtb_u_u239 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u240 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match dtb_u_u239 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u241, dtb_u_u242) -> (match dtb_u_u240 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u243, dtb_u_u244) -> ((Base_dCommon.v_bind ((v_zipFieldNames dtb_u_u242) dtb_u_u244)) (fun (dtb_u_u245 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_secondOf dtb_u_u241); B_dData_dPair.f_Pair_second = dtb_u_u243 }, dtb_u_u245))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record construction has fewer runtime arguments than its runtime field table")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u240 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u246, dtb_u_u247) -> (Base_dDiag.v_icInternal "record construction has more runtime arguments than its runtime field table")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 796 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerConAppFinish = (fun (dtb_u_u248 : Lowering_dEnv.t_LwEnv) (dtb_u_u249 : t_LwSt) (dtb_u_u250 : string) (dtb_u_u251 : string) (dtb_u_u252 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u253 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u250) (dtb_u_u248).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (let dtb_u_u255 = (match (((Lowering_dTy.v_ctorTypeArgsOf dtb_u_u248) dtb_u_u251) dtb_u_u252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u257) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u250, dtb_u_u257))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind ((v_zipFieldNames dtb_u_u254) dtb_u_u253)) (fun (dtb_u_u256 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u250, dtb_u_u255, dtb_u_u256)); B_dData_dPair.f_Pair_second = dtb_u_u249 })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u250, dtb_u_u251, (((Lowering_dTy.v_ctorTypeArgsOf dtb_u_u248) dtb_u_u251) dtb_u_u252), dtb_u_u253)); B_dData_dPair.f_Pair_second = dtb_u_u249 }))
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnvOf = (fun (dtb_u_u258 : t_AltEnvIn) -> (match dtb_u_u258 with
  | { f_AltEnvIn_aeEnv = dtb_u_u259; f_AltEnvIn_aePats = dtb_u_u260; f_AltEnvIn_aeSt = dtb_u_u261 } -> dtb_u_u259
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePatsOf = (fun (dtb_u_u262 : t_AltEnvIn) -> (match dtb_u_u262 with
  | { f_AltEnvIn_aeEnv = dtb_u_u263; f_AltEnvIn_aePats = dtb_u_u264; f_AltEnvIn_aeSt = dtb_u_u265 } -> dtb_u_u264
  | _ -> failwith "DT: impossible branch"
))

# 837 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeStOf = (fun (dtb_u_u266 : t_AltEnvIn) -> (match dtb_u_u266 with
  | { f_AltEnvIn_aeEnv = dtb_u_u267; f_AltEnvIn_aePats = dtb_u_u268; f_AltEnvIn_aeSt = dtb_u_u269 } -> dtb_u_u269
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countKept = (fun (dtb_u_u270 : bool B_dData_dList.t_List) -> (match dtb_u_u270 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u271, dtb_u_u272) -> (if dtb_u_u271 then (1 + (v_countKept dtb_u_u272)) else (v_countKept dtb_u_u272))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 844 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvGo = (fun (dtb_u_u273 : t_LwSt) (dtb_u_u274 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u275 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u276 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u275 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (match dtb_u_u277 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u279; B_dData_dPair.f_Pair_second = dtb_u_u280 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u280) then ((((v_altEnvGo dtb_u_u273) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, dtb_u_u274))) dtb_u_u278) dtb_u_u276) else (let dtb_u_u281 = (dtb_u_u273).f_LwSt_lwNext in (let dtb_u_u282 = (dtb_u_u273).f_LwSt_lwBinder in (let dtb_u_u283 = ((Vuna_dIr_dModel.v_mkIrBinderArm dtb_u_u282) dtb_u_u281) in ((((v_altEnvGo { f_LwSt_lwNext = (dtb_u_u281 + 1); f_LwSt_lwBinder = (dtb_u_u282 + 1) }) (B_dData_dList.C_List__x58__x58_ (dtb_u_u283, dtb_u_u274))) dtb_u_u278) (B_dData_dList.C_List__x58__x58_ (dtb_u_u283, dtb_u_u276)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_AltEnvIn_aeEnv = dtb_u_u274; f_AltEnvIn_aePats = (B_dData_dList.v_reverse dtb_u_u276); f_AltEnvIn_aeSt = dtb_u_u273 }
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvIn = (fun (dtb_u_u284 : t_LwSt) (dtb_u_u285 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u286 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_altEnvGo dtb_u_u284) dtb_u_u285) dtb_u_u286) B_dData_dList.C_List_Nil))

# 871 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvFullIn = (fun (dtb_u_u287 : t_LwSt) (dtb_u_u288 : string) (dtb_u_u289 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u290 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u291 : bool B_dData_dList.t_List) (dtb_u_u292 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u290 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u293, dtb_u_u294) -> (match dtb_u_u293 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u295; B_dData_dPair.f_Pair_second = dtb_u_u296 } -> (match dtb_u_u291 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u288; ": case branch has more binders than its shape"]))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u297, dtb_u_u298) -> (if ((Lowering_dTy.v_flagMatchesRigIn dtb_u_u297) dtb_u_u296) then (if dtb_u_u297 then (let dtb_u_u299 = (dtb_u_u287).f_LwSt_lwNext in (let dtb_u_u300 = (dtb_u_u287).f_LwSt_lwBinder in (let dtb_u_u301 = ((Vuna_dIr_dModel.v_mkIrBinderArm dtb_u_u300) dtb_u_u299) in ((((((v_altEnvFullIn { f_LwSt_lwNext = (dtb_u_u299 + 1); f_LwSt_lwBinder = (dtb_u_u300 + 1) }) dtb_u_u288) (B_dData_dList.C_List__x58__x58_ (dtb_u_u301, dtb_u_u289))) dtb_u_u294) dtb_u_u298) (B_dData_dList.C_List__x58__x58_ (dtb_u_u301, dtb_u_u292)))))) else ((((((v_altEnvFullIn dtb_u_u287) dtb_u_u288) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, dtb_u_u289))) dtb_u_u294) dtb_u_u298) dtb_u_u292)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u288; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u291 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = dtb_u_u289; f_AltEnvIn_aePats = (B_dData_dList.v_reverse dtb_u_u292); f_AltEnvIn_aeSt = dtb_u_u287 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u302, dtb_u_u303) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u288; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 892 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvKeptIn = (fun (dtb_u_u304 : t_LwSt) (dtb_u_u305 : string) (dtb_u_u306 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u307 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u308 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u307 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u309, dtb_u_u310) -> (match dtb_u_u309 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u311; B_dData_dPair.f_Pair_second = dtb_u_u312 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u312) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u305; ": kept-field branch has an erased binder"])) else (let dtb_u_u313 = (dtb_u_u304).f_LwSt_lwNext in (let dtb_u_u314 = (dtb_u_u304).f_LwSt_lwBinder in (let dtb_u_u315 = ((Vuna_dIr_dModel.v_mkIrBinderArm dtb_u_u314) dtb_u_u313) in (((((v_altEnvKeptIn { f_LwSt_lwNext = (dtb_u_u313 + 1); f_LwSt_lwBinder = (dtb_u_u314 + 1) }) dtb_u_u305) (B_dData_dList.C_List__x58__x58_ (dtb_u_u315, dtb_u_u306))) dtb_u_u310) (B_dData_dList.C_List__x58__x58_ (dtb_u_u315, dtb_u_u308)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = dtb_u_u306; f_AltEnvIn_aePats = (B_dData_dList.v_reverse dtb_u_u308); f_AltEnvIn_aeSt = dtb_u_u304 }))
  | _ -> failwith "DT: impossible branch"
))

# 861 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvCheckedIn = (fun (dtb_u_u316 : t_LwSt) (dtb_u_u317 : string) (dtb_u_u318 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u319 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u320 : bool B_dData_dList.t_List) -> (if ((Lowering_dEnv.v_listLength dtb_u_u319) = (Lowering_dEnv.v_listLength dtb_u_u320)) then ((((((v_altEnvFullIn dtb_u_u316) dtb_u_u317) dtb_u_u318) dtb_u_u319) dtb_u_u320) B_dData_dList.C_List_Nil) else (if ((Lowering_dEnv.v_listLength dtb_u_u319) = (v_countKept dtb_u_u320)) then (((((v_altEnvKeptIn dtb_u_u316) dtb_u_u317) dtb_u_u318) dtb_u_u319) B_dData_dList.C_List_Nil) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; dtb_u_u317; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 905 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderWithTy = (fun (dtb_u_u321 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u322 : Vuna_dIr_dModel.t_IrBinder) -> (if (dtb_u_u322).Vuna_dIr_dModel.f_IrBinder_irBinderErased then { Vuna_dIr_dModel.f_IrBinder_irBinderId = (dtb_u_u322).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (dtb_u_u322).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = true; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing } else { Vuna_dIr_dModel.f_IrBinder_irBinderId = (dtb_u_u322).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (dtb_u_u322).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (v_justTy dtb_u_u321) }))

# 912 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_typedPats = (fun (dtb_u_u323 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u324 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u323 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u325, dtb_u_u326) -> (match dtb_u_u324 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u327, dtb_u_u328) -> (B_dData_dList.C_List__x58__x58_ (((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb_u_u325))) dtb_u_u327), ((v_typedPats dtb_u_u326) dtb_u_u328)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u324
  | _ -> failwith "DT: impossible branch"
))

# 917 "Vuna/Compiler/Lowering/Program.vuna"
let v_typedPatsAll = (fun (dtb_u_u329 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u330 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u331 : Vuna_dIr_dModel.t_IrBinder) -> ((v_binderWithTy dtb_u_u329) dtb_u_u331))) dtb_u_u330))

# 922 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_armTyTblOf = (fun (dtb_u_u332 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u332 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u333, dtb_u_u334) -> (let dtb_u_u335 = (v_armTyTblOf dtb_u_u334) in (match (dtb_u_u333).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb_u_u336) -> (match (dtb_u_u333).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u337) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u336; B_dData_dPair.f_Pair_second = dtb_u_u337 }, dtb_u_u335))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u335
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u335
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupArmTy = (fun (dtb_u_u338 : int) (dtb_u_u339 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u339 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u340, dtb_u_u341) -> (match dtb_u_u340 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u342; B_dData_dPair.f_Pair_second = dtb_u_u343 } -> (if (dtb_u_u342 = dtb_u_u338) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u343)) else ((v_lookupArmTy dtb_u_u338) dtb_u_u341))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagArmBinder = (fun (dtb_u_u344 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u345 : Vuna_dIr_dModel.t_IrBinder) -> (match (dtb_u_u345).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb_u_u346) -> (match ((v_lookupArmTy dtb_u_u346) dtb_u_u344) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u347) -> ((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb_u_u347))) dtb_u_u345)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u345
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u345
))

# 947 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_retagArmEnv = (fun (dtb_u_u348 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u349 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u349 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u350, dtb_u_u351) -> (B_dData_dList.C_List__x58__x58_ (((v_retagArmBinder dtb_u_u348) dtb_u_u350), ((v_retagArmEnv dtb_u_u348) dtb_u_u351)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagAltEnv = (fun (dtb_u_u352 : t_AltEnvIn) (dtb_u_u353 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u352 with
  | { f_AltEnvIn_aeEnv = dtb_u_u354; f_AltEnvIn_aePats = dtb_u_u355; f_AltEnvIn_aeSt = dtb_u_u356 } -> { f_AltEnvIn_aeEnv = ((v_retagArmEnv (v_armTyTblOf dtb_u_u353)) dtb_u_u354); f_AltEnvIn_aePats = dtb_u_u353; f_AltEnvIn_aeSt = dtb_u_u356 }
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_hasFallbackAlt = (fun (dtb_u_u357 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u357 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u358, dtb_u_u359) -> (if ((Core_dTerm.v_caseAltName dtb_u_u358) = "") then true else (v_hasFallbackAlt dtb_u_u359))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allCatchAll = (fun (dtb_u_u360 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u360 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u361, dtb_u_u362) -> (if ((Core_dTerm.v_caseAltName dtb_u_u361) = "") then (v_allCatchAll dtb_u_u362) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 967 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseAlt = (fun (dtb_u_u363 : Lowering_dEnv.t_LwEnv) (dtb_u_u364 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u364 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u365, dtb_u_u366) -> (if ((Core_dTerm.v_caseAltName dtb_u_u365) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u367 = (Core_dTerm.v_caseAltName dtb_u_u365) in (let dtb_u_u368 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u367) (dtb_u_u363).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u368 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u369) -> (match dtb_u_u369 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u370; B_dData_dPair.f_Pair_second = dtb_u_u371 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u370) (dtb_u_u363).Lowering_dEnv.f_LwEnv_lwUnboxed) then (if (v_allCatchAll dtb_u_u366) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u365)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Lowering/Program.vuna"
let v_armResultTyOf = (fun (dtb_u_u372 : Lowering_dEnv.t_LwEnv) (dtb_u_u373 : t_AltEnvIn) (dtb_u_u374 : Vuna_dIr_dModel.t_Ir) (dtb_u_u375 : Core_dTerm.t_Term) -> (match (Vuna_dIr_dModel.v_irResultTyOf dtb_u_u374) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u376) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u376))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u374 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u377) -> (match (((Lowering_dTy.v_annotGlobalTy dtb_u_u372) (v_aeEnvOf dtb_u_u373)) dtb_u_u377) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u378) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u378))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Lowering_dTy.v_annotRunTyOf dtb_u_u372) (v_aeEnvOf dtb_u_u373)) dtb_u_u375)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((Lowering_dTy.v_annotRunTyOf dtb_u_u372) (v_aeEnvOf dtb_u_u373)) dtb_u_u375)
)
  | _ -> failwith "DT: impossible branch"
))

# 1089 "Vuna/Compiler/Lowering/Program.vuna"
let v_isNatCtorName = (fun (dtb_u_u379 : string) -> (if (if (if (dtb_u_u379 = Base_dIntrinsics.v_natZeroCtor) then true else (dtb_u_u379 = Base_dIntrinsics.v_natSuccCtor)) then true else (dtb_u_u379 = Base_dIntrinsics.v_finZeroCtor)) then true else (dtb_u_u379 = Base_dIntrinsics.v_finSuccCtor)))

# 1097 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseAllCtors = (fun (dtb_u_u380 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u380 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u381, dtb_u_u382) -> (if ((Core_dTerm.v_caseAltName dtb_u_u381) = "") then (v_natCaseAllCtors dtb_u_u382) else (let dtb_u_u383 = (Core_dTerm.v_caseAltName dtb_u_u381) in (if (v_isNatCtorName dtb_u_u383) then (v_natCaseAllCtors dtb_u_u382) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseHasCtor = (fun (dtb_u_u384 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u384 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u385, dtb_u_u386) -> (if ((Core_dTerm.v_caseAltName dtb_u_u385) = "") then (v_natCaseHasCtor dtb_u_u386) else true)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1093 "Vuna/Compiler/Lowering/Program.vuna"
let v_natCaseApplies = (fun (dtb_u_u387 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u387 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> (if (v_natCaseAllCtors dtb_u_u387) then (v_natCaseHasCtor dtb_u_u387) else false)
))

# 1111 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findAltBy = (fun (dtb_u_u388 : string) (dtb_u_u389 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391) -> (if ((Core_dTerm.v_caseAltName dtb_u_u390) = dtb_u_u388) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u390)) else ((v_findAltBy dtb_u_u388) dtb_u_u391))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstAltOf = (fun (dtb_u_u392 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) (dtb_u_u393 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u392 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u393
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u394) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u394))
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findCatchAllAlt = (fun (dtb_u_u395 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u395 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u396, dtb_u_u397) -> (if ((Core_dTerm.v_caseAltName dtb_u_u396) = "") then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u396)) else (v_findCatchAllAlt dtb_u_u397))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1209 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordProjVarIn = (fun (dtb_u_u398 : int) -> ("@vuna@record@proj" ^ (string_of_int dtb_u_u398)))

# 1212 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_projBindersIn = (fun (dtb_u_u399 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u400 : int) -> (match dtb_u_u399 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u401, dtb_u_u402) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_recordProjVarIn dtb_u_u400); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u401) }, ((v_projBindersIn dtb_u_u402) (dtb_u_u400 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtLabelIn = (fun (dtb_u_u403 : int) (dtb_u_u404 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u404 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u405, dtb_u_u406) -> (match dtb_u_u405 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = dtb_u_u408 } -> (if (dtb_u_u407 = dtb_u_u403) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u408)) else ((v_lookupRtLabelIn dtb_u_u403) dtb_u_u406))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1223 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPosIn = (fun (dtb_u_u409 : int) (dtb_u_u410 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u411 : int) -> (match dtb_u_u410 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u412, dtb_u_u413) -> (match dtb_u_u412 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u414; B_dData_dPair.f_Pair_second = dtb_u_u415 } -> (if (dtb_u_u414 = dtb_u_u409) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u411)) else (((v_lookupRtPosIn dtb_u_u409) dtb_u_u413) (dtb_u_u411 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1227 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPositionsIn = (fun (dtb_u_u416 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u417 : int B_dData_dList.t_List) -> (match dtb_u_u417 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u418, dtb_u_u419) -> (match (((v_lookupRtPosIn dtb_u_u418) dtb_u_u416) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u420) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn dtb_u_u416) dtb_u_u419)) (fun (dtb_u_u421 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u418; B_dData_dPair.f_Pair_second = dtb_u_u420 }, dtb_u_u421))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["record update targets field index "; (string_of_int dtb_u_u418); ", which has no runtime field"]))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1236 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthOpqArgIn = (fun (dtb_u_u422 : int) (dtb_u_u423 : bool B_dData_dList.t_List) (dtb_u_u424 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u423 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u425, dtb_u_u426) -> (match dtb_u_u424 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u427, dtb_u_u428) -> (match dtb_u_u427 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u429; B_dData_dPair.f_Pair_second = dtb_u_u430 } -> (if (dtb_u_u422 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u429)) else (((v_nthOpqArgIn (dtb_u_u422 - 1)) dtb_u_u426) dtb_u_u428))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1247 "Vuna/Compiler/Lowering/Program.vuna"
let v_eraseTele = (fun (dtb_u_u431 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> Vuna_dIr_dModel.v_mkIrBinderErased)

# 1244 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordAltBindersIn = (fun (dtb_u_u432 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u433 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_eraseTele) dtb_u_u432))) dtb_u_u433))

# 80 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerTermFuel = (fun (dtb_u_u434 : int) (dtb_u_u435 : Lowering_dEnv.t_LwEnv) (dtb_u_u436 : t_LwSt) (dtb_u_u437 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u438 : Core_dTerm.t_Term) -> (if (dtb_u_u434 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match dtb_u_u438 with
  | Core_dTerm.C_Term_TVar (dtb_u_u439, dtb_u_u440, dtb_u_u441) -> (match ((v_runtimeBinderAt dtb_u_u440) dtb_u_u437) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u442) -> (if (v_binderErasedOf dtb_u_u442) then (Base_dDiag.v_icInternal (String.concat "" ["erased binder "; dtb_u_u439; ": runtime idx "; (string_of_int dtb_u_u440); " of "; (string_of_int (Lowering_dEnv.v_listLength dtb_u_u437)); " binders"])) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u442)); B_dData_dPair.f_Pair_second = dtb_u_u436 })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u443) -> ((Base_dCommon.v_bind ((v_lowerGlobalRef dtb_u_u435) dtb_u_u443)) (fun (dtb_u_u444 : Vuna_dIr_dModel.t_Ir) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u444; B_dData_dPair.f_Pair_second = dtb_u_u436 }))))
  | Core_dTerm.C_Term_TInt (dtb_u_u445) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u445)); B_dData_dPair.f_Pair_second = dtb_u_u436 }))
  | Core_dTerm.C_Term_TStr (dtb_u_u446) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u446)); B_dData_dPair.f_Pair_second = dtb_u_u436 }))
  | Core_dTerm.C_Term_TFloat (dtb_u_u447) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u447)); B_dData_dPair.f_Pair_second = dtb_u_u436 }))
  | Core_dTerm.C_Term_TBool (dtb_u_u448) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u448)); B_dData_dPair.f_Pair_second = dtb_u_u436 }))
  | Core_dTerm.C_Term_TIf (dtb_u_u449, dtb_u_u450, dtb_u_u451) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u449)) (fun (dtb_u_u452 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u452 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u453; B_dData_dPair.f_Pair_second = dtb_u_u454 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u454) dtb_u_u437) dtb_u_u450)) (fun (dtb_u_u455 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u455 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u456; B_dData_dPair.f_Pair_second = dtb_u_u457 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u457) dtb_u_u437) dtb_u_u451)) (fun (dtb_u_u458 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u458 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u459; B_dData_dPair.f_Pair_second = dtb_u_u460 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u453, dtb_u_u456, dtb_u_u459)); B_dData_dPair.f_Pair_second = dtb_u_u460 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Core_dTerm.C_Term_TLam (dtb_u_u461, dtb_u_u462, dtb_u_u463, dtb_u_u464, dtb_u_u465) -> (((((((((v_lowerLamFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u461) dtb_u_u462) dtb_u_u463) dtb_u_u464) dtb_u_u465)
  | Core_dTerm.C_Term_TApp (dtb_u_u466, dtb_u_u467, dtb_u_u468) -> (((((((v_lowerAppFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u466) dtb_u_u467) dtb_u_u468)
  | Core_dTerm.C_Term_TCon (dtb_u_u469, dtb_u_u470) -> ((((((v_lowerConAppFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u469) dtb_u_u470)
  | Core_dTerm.C_Term_TMk (dtb_u_u471, dtb_u_u472) -> ((((((v_lowerConAppFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u471) dtb_u_u472)
  | Core_dTerm.C_Term_TRecord (dtb_u_u473, dtb_u_u474) -> (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) ((v_recordTermAsAppIn (Core_dTerm.C_Term_TGlobal (dtb_u_u473))) dtb_u_u474))
  | Core_dTerm.C_Term_TCase (dtb_u_u475, dtb_u_u476) -> ((((((v_lowerCaseFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u475) dtb_u_u476)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u477, dtb_u_u478, dtb_u_u479, dtb_u_u480, dtb_u_u481) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u478) (dtb_u_u435).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u482) -> ((((((((((v_lowerRecordUpdateFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u477) dtb_u_u478) dtb_u_u479) dtb_u_u482) dtb_u_u480) dtb_u_u481)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) (Core_dTerm.C_Term_TCase (dtb_u_u477, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u478; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u479); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u481 }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TProj (dtb_u_u483, dtb_u_u484, dtb_u_u485, dtb_u_u486, dtb_u_u487) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u484) (dtb_u_u435).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u488) -> ((Base_dCommon.v_bind ((v_recordFieldNameAt dtb_u_u487) dtb_u_u488)) (fun (dtb_u_u489 : string) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u483)) (fun (dtb_u_u490 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u490 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u491; B_dData_dPair.f_Pair_second = dtb_u_u492 } -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys dtb_u_u435) dtb_u_u484)) (fun (dtb_u_u493 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let dtb_u_u494 = (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf dtb_u_u435) dtb_u_u437) dtb_u_u483)) in (let dtb_u_u495 = (match (((v_lookupRtPosIn dtb_u_u487) dtb_u_u488) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u496) -> ((Vuna_dIr_dModel.v_irTyAt ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars dtb_u_u494)) dtb_u_u493)) dtb_u_u496)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u491, dtb_u_u484, dtb_u_u489, (v_justTy dtb_u_u495))); B_dData_dPair.f_Pair_second = dtb_u_u492 }))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_lowerProjAsCaseFuel (dtb_u_u434 - 1)) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u483) dtb_u_u484) dtb_u_u485) dtb_u_u486) dtb_u_u487)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb_u_u497, dtb_u_u498, dtb_u_u499, dtb_u_u500, dtb_u_u501) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TType (dtb_u_u502) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb_u_u503) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((Lowering_dChecks.v_showMetaHint dtb_u_u503)))) (Lowering_dChecks.v_showMetaHint dtb_u_u503))
  | _ -> failwith "DT: impossible branch"
)))
# 251 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamFuel = (fun (dtb_u_u504 : int) (dtb_u_u505 : Lowering_dEnv.t_LwEnv) (dtb_u_u506 : t_LwSt) (dtb_u_u507 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u508 : string) (dtb_u_u509 : Core_dTerm.t_Rig) (dtb_u_u510 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u511 : Base_dSource.t_Span) (dtb_u_u512 : Core_dTerm.t_Term) -> (if (dtb_u_u504 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (v_collectLamChainIn (Core_dTerm.C_Term_TLam (dtb_u_u508, dtb_u_u509, dtb_u_u510, dtb_u_u511, dtb_u_u512))) with
  | { f_LamChainIn_lamChainBinders = dtb_u_u513; f_LamChainIn_lamChainBody = dtb_u_u514; f_LamChainIn_lamChainResultTy = dtb_u_u515 } -> ((((((((v_lowerLamChainFuel dtb_u_u504) dtb_u_u505) dtb_u_u506) dtb_u_u507) B_dData_dList.C_List_Nil) dtb_u_u513) dtb_u_u514) dtb_u_u515)
  | _ -> failwith "DT: impossible branch"
)))
# 261 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamChainFuel = (fun (dtb_u_u516 : int) (dtb_u_u517 : Lowering_dEnv.t_LwEnv) (dtb_u_u518 : t_LwSt) (dtb_u_u519 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u520 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u521 : t_LamParam B_dData_dList.t_List) (dtb_u_u522 : Core_dTerm.t_Term) (dtb_u_u523 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u516 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let dtb_u_u524 = (((((v_bindersOfParamsHint dtb_u_u517) dtb_u_u519) dtb_u_u520) (dtb_u_u518).f_LwSt_lwBinder) dtb_u_u521) in (let dtb_u_u525 = (B_dData_dPair.v_firstOf dtb_u_u524) in (let dtb_u_u526 = { f_LwSt_lwNext = (dtb_u_u518).f_LwSt_lwNext; f_LwSt_lwBinder = (B_dData_dPair.v_secondOf dtb_u_u524) } in (let dtb_u_u527 = ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u525)) dtb_u_u519) in (let dtb_u_u528 = (match dtb_u_u523 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u535) -> (match (((Lowering_dTy.v_annotTyOf dtb_u_u517) dtb_u_u527) dtb_u_u535) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u536) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u536))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effResultTyOf dtb_u_u535)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u516 - 1)) dtb_u_u517) dtb_u_u526) dtb_u_u527) dtb_u_u522)) (fun (dtb_u_u529 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u529 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u530; B_dData_dPair.f_Pair_second = dtb_u_u531 } -> (let dtb_u_u532 = (match dtb_u_u528 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u534) -> dtb_u_u528
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_irResultTyOf dtb_u_u530)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_filter (fun (dtb_u_u533 : Vuna_dIr_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErasedOf dtb_u_u533)))) dtb_u_u525), (v_justTy dtb_u_u532), dtb_u_u530)); B_dData_dPair.f_Pair_second = dtb_u_u531 })))
  | _ -> failwith "DT: impossible branch"
))))))))))
# 496 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFuel = (fun (dtb_u_u537 : int) (dtb_u_u538 : Lowering_dEnv.t_LwEnv) (dtb_u_u539 : t_LwSt) (dtb_u_u540 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u541 : Core_dTerm.t_Term) (dtb_u_u542 : Core_dTerm.t_Term) (dtb_u_u543 : Core_dTerm.t_Rig) -> (if (dtb_u_u537 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb_u_u543) then (((((v_lowerTermFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) dtb_u_u541) else (let dtb_u_u544 = (Lowering_dChecks.v_flattenConApp (Core_dTerm.C_Term_TApp (dtb_u_u541, dtb_u_u542, dtb_u_u543))) in (match dtb_u_u544 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_effFieldAppIn dtb_u_u538) (Core_dTerm.C_Term_TApp (dtb_u_u541, dtb_u_u542, dtb_u_u543))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u545) -> (((((v_lowerTermFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) dtb_u_u545)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_flattenConcatChainIn (Core_dTerm.C_Term_TApp (dtb_u_u541, dtb_u_u542, dtb_u_u543))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u546) -> (if ((Lowering_dEnv.v_listLength dtb_u_u546) >= 3) then ((Base_dCommon.v_bind (((((v_lowerTermsFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) dtb_u_u546)) (fun (dtb_u_u547 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u547 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u548; B_dData_dPair.f_Pair_second = dtb_u_u549 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u548)); B_dData_dPair.f_Pair_second = dtb_u_u549 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_lowerPlainAppFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) (Core_dTerm.C_Term_TApp (dtb_u_u541, dtb_u_u542, dtb_u_u543))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerPlainAppFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) (Core_dTerm.C_Term_TApp (dtb_u_u541, dtb_u_u542, dtb_u_u543)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u550) -> (match dtb_u_u550 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u551; B_dData_dPair.f_Pair_second = dtb_u_u552 } -> ((((((v_lowerConAppFuel (dtb_u_u537 - 1)) dtb_u_u538) dtb_u_u539) dtb_u_u540) dtb_u_u551) dtb_u_u552)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 521 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerPlainAppFuel = (fun (dtb_u_u553 : int) (dtb_u_u554 : Lowering_dEnv.t_LwEnv) (dtb_u_u555 : t_LwSt) (dtb_u_u556 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u557 : Core_dTerm.t_Term) -> (if (dtb_u_u553 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match dtb_u_u557 with
  | Core_dTerm.C_Term_TApp (dtb_u_u558, dtb_u_u559, dtb_u_u560) -> (let dtb_u_u561 = (v_flattenIntrinsicAppIn dtb_u_u557) in (match dtb_u_u561 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_lowerAppFallbackFuel (dtb_u_u553 - 1)) dtb_u_u554) dtb_u_u555) dtb_u_u556) dtb_u_u558) dtb_u_u559) dtb_u_u560)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u562) -> (match dtb_u_u562 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u563; B_dData_dPair.f_Pair_second = dtb_u_u564 } -> (if ((v_inlineArityMatchesIn dtb_u_u563) dtb_u_u564) then ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (dtb_u_u553 - 1)) dtb_u_u554) dtb_u_u555) dtb_u_u556) dtb_u_u564)) (fun (dtb_u_u565 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u565 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u566; B_dData_dPair.f_Pair_second = dtb_u_u567 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u563, dtb_u_u566)); B_dData_dPair.f_Pair_second = dtb_u_u567 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_lowerAppFallbackFuel (dtb_u_u553 - 1)) dtb_u_u554) dtb_u_u555) dtb_u_u556) dtb_u_u558) dtb_u_u559) dtb_u_u560))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dDiag.v_icInternal "lowerPlainApp expects an application")
)))
# 564 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFallbackFuel = (fun (dtb_u_u568 : int) (dtb_u_u569 : Lowering_dEnv.t_LwEnv) (dtb_u_u570 : t_LwSt) (dtb_u_u571 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u572 : Core_dTerm.t_Term) (dtb_u_u573 : Core_dTerm.t_Term) (dtb_u_u574 : Core_dTerm.t_Rig) -> (if (dtb_u_u568 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u568 - 1)) dtb_u_u569) dtb_u_u570) dtb_u_u571) dtb_u_u572)) (fun (dtb_u_u575 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u575 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u576; B_dData_dPair.f_Pair_second = dtb_u_u577 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u568 - 1)) dtb_u_u569) dtb_u_u577) dtb_u_u571) dtb_u_u573)) (fun (dtb_u_u578 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u578 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u579; B_dData_dPair.f_Pair_second = dtb_u_u580 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy ((((v_appTyFrom dtb_u_u569) dtb_u_u571) dtb_u_u572) dtb_u_u576)), dtb_u_u576, dtb_u_u579)); B_dData_dPair.f_Pair_second = dtb_u_u580 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 580 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerInlineArgsFuel = (fun (dtb_u_u581 : int) (dtb_u_u582 : Lowering_dEnv.t_LwEnv) (dtb_u_u583 : t_LwSt) (dtb_u_u584 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u585 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u585 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u586, dtb_u_u587) -> (match dtb_u_u586 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u588; B_dData_dPair.f_Pair_second = dtb_u_u589 } -> (if (dtb_u_u581 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb_u_u589) then (Base_dDiag.v_icInternal "erased argument in inlined builtin application") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u581 - 1)) dtb_u_u582) dtb_u_u583) dtb_u_u584) dtb_u_u588)) (fun (dtb_u_u590 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u590 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u591; B_dData_dPair.f_Pair_second = dtb_u_u592 } -> ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (dtb_u_u581 - 1)) dtb_u_u582) dtb_u_u592) dtb_u_u584) dtb_u_u587)) (fun (dtb_u_u593 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u593 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u594; B_dData_dPair.f_Pair_second = dtb_u_u595 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u591, dtb_u_u594)); B_dData_dPair.f_Pair_second = dtb_u_u595 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u581 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u583 })))
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerTermsFuel = (fun (dtb_u_u596 : int) (dtb_u_u597 : Lowering_dEnv.t_LwEnv) (dtb_u_u598 : t_LwSt) (dtb_u_u599 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u600 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u600 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u601, dtb_u_u602) -> (if (dtb_u_u596 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u596 - 1)) dtb_u_u597) dtb_u_u598) dtb_u_u599) dtb_u_u601)) (fun (dtb_u_u603 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u603 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u604; B_dData_dPair.f_Pair_second = dtb_u_u605 } -> ((Base_dCommon.v_bind (((((v_lowerTermsFuel (dtb_u_u596 - 1)) dtb_u_u597) dtb_u_u605) dtb_u_u599) dtb_u_u602)) (fun (dtb_u_u606 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u606 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u607; B_dData_dPair.f_Pair_second = dtb_u_u608 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u604, dtb_u_u607)); B_dData_dPair.f_Pair_second = dtb_u_u608 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u596 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u598 })))
  | _ -> failwith "DT: impossible branch"
))
# 690 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConArgsFuel = (fun (dtb_u_u609 : int) (dtb_u_u610 : Lowering_dEnv.t_LwEnv) (dtb_u_u611 : t_LwSt) (dtb_u_u612 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u613 : bool B_dData_dList.t_List) (dtb_u_u614 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u613 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u615, dtb_u_u616) -> (match dtb_u_u614 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u617, dtb_u_u618) -> (match dtb_u_u617 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u619; B_dData_dPair.f_Pair_second = dtb_u_u620 } -> (if (dtb_u_u609 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u609 - 1)) dtb_u_u610) dtb_u_u611) dtb_u_u612) dtb_u_u619)) (fun (dtb_u_u621 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u621 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u622; B_dData_dPair.f_Pair_second = dtb_u_u623 } -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (dtb_u_u609 - 1)) dtb_u_u610) dtb_u_u623) dtb_u_u612) dtb_u_u616) dtb_u_u618)) (fun (dtb_u_u624 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u624 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u625; B_dData_dPair.f_Pair_second = dtb_u_u626 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((((v_ctorArgIr (((Lowering_dTy.v_annotRunTyOf dtb_u_u610) dtb_u_u612) dtb_u_u619)) dtb_u_u615) dtb_u_u622), dtb_u_u625)); B_dData_dPair.f_Pair_second = dtb_u_u626 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u609 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u611 })))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u614 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u627, dtb_u_u628) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than runtime arguments")
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u609 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u611 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 721 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppFuel = (fun (dtb_u_u629 : int) (dtb_u_u630 : Lowering_dEnv.t_LwEnv) (dtb_u_u631 : t_LwSt) (dtb_u_u632 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u633 : string) (dtb_u_u634 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u629 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (Core_dTerm.v_natChainValue (Core_dTerm.C_Term_TCon (dtb_u_u633, dtb_u_u634))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u635) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u635)); B_dData_dPair.f_Pair_second = dtb_u_u631 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_lowerConAppNonChainFuel (dtb_u_u629 - 1)) dtb_u_u630) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u634)
  | _ -> failwith "DT: impossible branch"
)))
# 730 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppNonChainFuel = (fun (dtb_u_u636 : int) (dtb_u_u637 : Lowering_dEnv.t_LwEnv) (dtb_u_u638 : t_LwSt) (dtb_u_u639 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u640 : string) (dtb_u_u641 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u636 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (dtb_u_u640 = Base_dIntrinsics.v_natZeroCtor) then (match (((v_alignCtorArgs dtb_u_u640) B_dData_dList.C_List_Nil) dtb_u_u641) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u642) -> (Base_dDiag.C_Check_ErrC (dtb_u_u642))
  | Base_dDiag.C_Check_OkC (dtb_u_u643) -> (match dtb_u_u643 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = dtb_u_u638 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u640 = Base_dIntrinsics.v_natSuccCtor) then (match (((v_alignCtorArgs dtb_u_u640) (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))) dtb_u_u641) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u644) -> (Base_dDiag.C_Check_ErrC (dtb_u_u644))
  | Base_dDiag.C_Check_OkC (dtb_u_u645) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (dtb_u_u636 - 1)) dtb_u_u637) dtb_u_u638) dtb_u_u639) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb_u_u645)) (fun (dtb_u_u646 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u646 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u647; B_dData_dPair.f_Pair_second = dtb_u_u648 } -> (match dtb_u_u647 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u649, dtb_u_u650) -> (match dtb_u_u650 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb_u_u649)); B_dData_dPair.f_Pair_second = dtb_u_u648 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u640 = Base_dIntrinsics.v_finZeroCtor) then (match (((v_alignCtorArgs dtb_u_u640) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb_u_u641) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u651) -> (Base_dDiag.C_Check_ErrC (dtb_u_u651))
  | Base_dDiag.C_Check_OkC (dtb_u_u652) -> (match dtb_u_u652 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = dtb_u_u638 }))
  | _ -> (Base_dDiag.v_icInternal "Fin FZero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u640 = Base_dIntrinsics.v_finSuccCtor) then (match (((v_alignCtorArgs dtb_u_u640) (B_dData_dList.C_List__x58__x58_ (false, (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))))) dtb_u_u641) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u653) -> (Base_dDiag.C_Check_ErrC (dtb_u_u653))
  | Base_dDiag.C_Check_OkC (dtb_u_u654) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (dtb_u_u636 - 1)) dtb_u_u637) dtb_u_u638) dtb_u_u639) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb_u_u654)) (fun (dtb_u_u655 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u655 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u656; B_dData_dPair.f_Pair_second = dtb_u_u657 } -> (match dtb_u_u656 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u658, dtb_u_u659) -> (match dtb_u_u659 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb_u_u658)); B_dData_dPair.f_Pair_second = dtb_u_u657 }))
  | _ -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (let dtb_u_u660 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u640) (dtb_u_u637).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u660 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u661) -> (match dtb_u_u661 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u662; B_dData_dPair.f_Pair_second = dtb_u_u663 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u640) (dtb_u_u637).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ dtb_u_u640))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u664) -> ((Base_dCommon.v_bind (((v_alignCtorArgs dtb_u_u640) dtb_u_u663) dtb_u_u641)) (fun (dtb_u_u665 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (dtb_u_u636 - 1)) dtb_u_u637) dtb_u_u638) dtb_u_u639) ((v_ctorOpaqueKeptFlags dtb_u_u663) dtb_u_u664)) dtb_u_u665)) (fun (dtb_u_u666 : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u666 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u667; B_dData_dPair.f_Pair_second = dtb_u_u668 } -> ((((((v_lowerConAppFinish dtb_u_u637) dtb_u_u668) dtb_u_u662) dtb_u_u640) dtb_u_u641) dtb_u_u667)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ dtb_u_u640))
  | _ -> failwith "DT: impossible branch"
))))))))
# 955 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmBodyFuel = (fun (dtb_u_u669 : int) (dtb_u_u670 : Lowering_dEnv.t_LwEnv) (dtb_u_u671 : t_AltEnvIn) (dtb_u_u672 : Core_dTerm.t_Term) -> (((((v_lowerTermFuel dtb_u_u669) dtb_u_u670) (v_aeStOf dtb_u_u671)) (v_aeEnvOf dtb_u_u671)) dtb_u_u672))
# 1028 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmFuel = (fun (dtb_u_u673 : int) (dtb_u_u674 : Lowering_dEnv.t_LwEnv) (dtb_u_u675 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u676 : t_LwSt) (dtb_u_u677 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u678 : Core_dTerm.t_CaseAlt) -> (if (dtb_u_u673 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName dtb_u_u678) = "") then (let dtb_u_u679 = (((v_altEnvIn dtb_u_u676) dtb_u_u677) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb_u_u678))) in (let dtb_u_u680 = ((v_typedPatsAll dtb_u_u675) (v_aePatsOf dtb_u_u679)) in (let dtb_u_u681 = ((v_retagAltEnv dtb_u_u679) dtb_u_u680) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u681) (Core_dTerm.v_caseAltBody dtb_u_u678))) (fun (dtb_u_u682 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u682 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u683; B_dData_dPair.f_Pair_second = dtb_u_u684 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u680; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u683 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf dtb_u_u674) dtb_u_u681) dtb_u_u683) (Core_dTerm.v_caseAltBody dtb_u_u678)); B_dData_dPair.f_Pair_second = dtb_u_u684 } }))
  | _ -> failwith "DT: impossible branch"
)))))) else (let dtb_u_u685 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Core_dTerm.v_caseAltName dtb_u_u678)) (dtb_u_u674).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u685 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u686) -> (match dtb_u_u686 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u687; B_dData_dPair.f_Pair_second = dtb_u_u688 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb_u_u676) (Core_dTerm.v_caseAltName dtb_u_u678)) dtb_u_u677) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb_u_u678))) dtb_u_u688)) (fun (dtb_u_u689 : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys dtb_u_u674) (Core_dTerm.v_caseAltName dtb_u_u678))) (fun (dtb_u_u690 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let dtb_u_u691 = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf dtb_u_u675))) dtb_u_u690) in (let dtb_u_u692 = ((v_typedPats dtb_u_u691) (v_aePatsOf dtb_u_u689)) in (let dtb_u_u693 = ((v_retagAltEnv dtb_u_u689) dtb_u_u692) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u693) (Core_dTerm.v_caseAltBody dtb_u_u678))) (fun (dtb_u_u694 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u694 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u695; B_dData_dPair.f_Pair_second = dtb_u_u696 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u687; B_dData_dPair.f_Pair_second = (Core_dTerm.v_caseAltName dtb_u_u678) })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u692; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u695 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf dtb_u_u674) dtb_u_u693) dtb_u_u695) (Core_dTerm.v_caseAltBody dtb_u_u678)); B_dData_dPair.f_Pair_second = dtb_u_u696 } }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ (Core_dTerm.v_caseAltName dtb_u_u678)))
  | _ -> failwith "DT: impossible branch"
)))))
# 1062 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmsFuel = (fun (dtb_u_u697 : int) (dtb_u_u698 : Lowering_dEnv.t_LwEnv) (dtb_u_u699 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u700 : t_LwSt) (dtb_u_u701 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u702 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u702 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u703, dtb_u_u704) -> (if (dtb_u_u697 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind ((((((v_lowerArmFuel (dtb_u_u697 - 1)) dtb_u_u698) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u703)) (fun (dtb_u_u705 : (Vuna_dIr_dModel.t_IrAlt, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u706 = dtb_u_u705 in (match dtb_u_u706 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u707; B_dData_dPair.f_Pair_second = dtb_u_u708 } -> (match dtb_u_u708 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u709; B_dData_dPair.f_Pair_second = dtb_u_u710 } -> ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (dtb_u_u697 - 1)) dtb_u_u698) dtb_u_u699) dtb_u_u710) dtb_u_u701) dtb_u_u704)) (fun (dtb_u_u711 : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u712 = dtb_u_u711 in (match dtb_u_u712 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u713; B_dData_dPair.f_Pair_second = dtb_u_u714 } -> (match dtb_u_u714 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u715; B_dData_dPair.f_Pair_second = dtb_u_u716 } -> (let dtb_u_u717 = (match dtb_u_u709 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u718) -> dtb_u_u709
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u715
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u707, dtb_u_u713)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u717; B_dData_dPair.f_Pair_second = dtb_u_u716 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u697 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u700 } })))
  | _ -> failwith "DT: impossible branch"
))
# 1125 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatAltFuel = (fun (dtb_u_u719 : int) (dtb_u_u720 : Lowering_dEnv.t_LwEnv) (dtb_u_u721 : t_LwSt) (dtb_u_u722 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u723 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u723 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u724) -> (if (dtb_u_u719 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let dtb_u_u725 = (((v_altEnvIn dtb_u_u721) dtb_u_u722) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb_u_u724))) in (let dtb_u_u726 = ((v_typedPatsAll (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))) (v_aePatsOf dtb_u_u725)) in (let dtb_u_u727 = ((v_retagAltEnv dtb_u_u725) dtb_u_u726) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (dtb_u_u719 - 1)) dtb_u_u720) dtb_u_u727) (Core_dTerm.v_caseAltBody dtb_u_u724))) (fun (dtb_u_u728 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u728 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u729; B_dData_dPair.f_Pair_second = dtb_u_u730 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u726; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u729 })); B_dData_dPair.f_Pair_second = dtb_u_u730 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u721 }))
  | _ -> failwith "DT: impossible branch"
))
# 1141 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatCaseFuel = (fun (dtb_u_u731 : int) (dtb_u_u732 : Lowering_dEnv.t_LwEnv) (dtb_u_u733 : t_LwSt) (dtb_u_u734 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u735 : Core_dTerm.t_Term) (dtb_u_u736 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (dtb_u_u731 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u733) dtb_u_u734) dtb_u_u735)) (fun (dtb_u_u737 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u737 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u738; B_dData_dPair.f_Pair_second = dtb_u_u739 } -> (let dtb_u_u740 = (dtb_u_u739).f_LwSt_lwNext in (let dtb_u_u741 = { f_LwSt_lwNext = (dtb_u_u740 + 1); f_LwSt_lwBinder = (dtb_u_u739).f_LwSt_lwBinder } in (let dtb_u_u742 = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natZeroCtor) dtb_u_u736)) ((v_findAltBy Base_dIntrinsics.v_finZeroCtor) dtb_u_u736)) in (let dtb_u_u743 = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natSuccCtor) dtb_u_u736)) ((v_findAltBy Base_dIntrinsics.v_finSuccCtor) dtb_u_u736)) in (let dtb_u_u744 = (v_findCatchAllAlt dtb_u_u736) in ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u741) dtb_u_u734) dtb_u_u742)) (fun (dtb_u_u745 : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u745 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u746; B_dData_dPair.f_Pair_second = dtb_u_u747 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u747) dtb_u_u734) dtb_u_u743)) (fun (dtb_u_u748 : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u748 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u749; B_dData_dPair.f_Pair_second = dtb_u_u750 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (dtb_u_u731 - 1)) dtb_u_u732) dtb_u_u750) dtb_u_u734) dtb_u_u744)) (fun (dtb_u_u751 : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u751 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u752; B_dData_dPair.f_Pair_second = dtb_u_u753 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u738, dtb_u_u740, dtb_u_u746, dtb_u_u749, dtb_u_u752)); B_dData_dPair.f_Pair_second = dtb_u_u753 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1176 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerCaseFuel = (fun (dtb_u_u754 : int) (dtb_u_u755 : Lowering_dEnv.t_LwEnv) (dtb_u_u756 : t_LwSt) (dtb_u_u757 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u758 : Core_dTerm.t_Term) (dtb_u_u759 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (dtb_u_u754 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (v_natCaseApplies dtb_u_u759) then ((((((v_lowerNatCaseFuel (dtb_u_u754 - 1)) dtb_u_u755) dtb_u_u756) dtb_u_u757) dtb_u_u758) dtb_u_u759) else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u754 - 1)) dtb_u_u755) dtb_u_u756) dtb_u_u757) dtb_u_u758)) (fun (dtb_u_u760 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u760 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u761; B_dData_dPair.f_Pair_second = dtb_u_u762 } -> (let dtb_u_u763 = (((Lowering_dTy.v_annotRunTyOf dtb_u_u755) dtb_u_u757) dtb_u_u758) in ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (dtb_u_u754 - 1)) dtb_u_u755) dtb_u_u763) dtb_u_u762) dtb_u_u757) dtb_u_u759)) (fun (dtb_u_u764 : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u765 = dtb_u_u764 in (match dtb_u_u765 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u766; B_dData_dPair.f_Pair_second = dtb_u_u767 } -> (match dtb_u_u767 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u768; B_dData_dPair.f_Pair_second = dtb_u_u769 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase ((v_justTy dtb_u_u763), (v_justTy dtb_u_u768), dtb_u_u761, dtb_u_u766)); B_dData_dPair.f_Pair_second = dtb_u_u769 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1197 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerProjAsCaseFuel = (fun (dtb_u_u770 : int) (dtb_u_u771 : Lowering_dEnv.t_LwEnv) (dtb_u_u772 : t_LwSt) (dtb_u_u773 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u774 : Core_dTerm.t_Term) (dtb_u_u775 : string) (dtb_u_u776 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u777 : int) (dtb_u_u778 : int) -> (if (dtb_u_u770 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let dtb_u_u779 = (Lowering_dEnv.v_listLength dtb_u_u776) in (let dtb_u_u780 = ((dtb_u_u779 - 1) - dtb_u_u778) in (match ((v_runtimeIndexInPairs dtb_u_u780) dtb_u_u776) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u781) -> (((((v_lowerTermFuel (dtb_u_u770 - 1)) dtb_u_u771) dtb_u_u772) dtb_u_u773) (Core_dTerm.C_Term_TCase (dtb_u_u774, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u775; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs ((v_projBindersIn dtb_u_u776) 0)); Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TVar ((v_recordProjVarIn dtb_u_u778), dtb_u_u781, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "projection of an erased binder")
  | _ -> failwith "DT: impossible branch"
)))))
# 1250 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateFuel = (fun (dtb_u_u782 : int) (dtb_u_u783 : Lowering_dEnv.t_LwEnv) (dtb_u_u784 : t_LwSt) (dtb_u_u785 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u786 : Core_dTerm.t_Term) (dtb_u_u787 : string) (dtb_u_u788 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u789 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u790 : int B_dData_dList.t_List) (dtb_u_u791 : Core_dTerm.t_Term) -> (if (dtb_u_u782 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u782 - 1)) dtb_u_u783) dtb_u_u784) dtb_u_u785) dtb_u_u786)) (fun (dtb_u_u792 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u792 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u793; B_dData_dPair.f_Pair_second = dtb_u_u794 } -> (let dtb_u_u795 = (((Lowering_dTy.v_annotRunTyOf dtb_u_u783) dtb_u_u785) dtb_u_u786) in (match dtb_u_u791 with
  | Core_dTerm.C_Term_TMk (dtb_u_u796, dtb_u_u797) -> ((((((((((v_lowerRecordUpdateArgsFuel (dtb_u_u782 - 1)) dtb_u_u783) dtb_u_u794) ((v_recordAltBindersIn dtb_u_u788) dtb_u_u785)) dtb_u_u793) dtb_u_u795) dtb_u_u787) dtb_u_u789) dtb_u_u790) dtb_u_u797)
  | Core_dTerm.C_Term_TCon (dtb_u_u798, dtb_u_u799) -> ((((((((((v_lowerRecordUpdateArgsFuel (dtb_u_u782 - 1)) dtb_u_u783) dtb_u_u794) ((v_recordAltBindersIn dtb_u_u788) dtb_u_u785)) dtb_u_u793) dtb_u_u795) dtb_u_u787) dtb_u_u789) dtb_u_u790) dtb_u_u799)
  | _ -> (Base_dDiag.v_icInternal "record update body is not a constructor application")
))
  | _ -> failwith "DT: impossible branch"
)))))
# 1267 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateArgsFuel = (fun (dtb_u_u800 : int) (dtb_u_u801 : Lowering_dEnv.t_LwEnv) (dtb_u_u802 : t_LwSt) (dtb_u_u803 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u804 : Vuna_dIr_dModel.t_Ir) (dtb_u_u805 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u806 : string) (dtb_u_u807 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u808 : int B_dData_dList.t_List) (dtb_u_u809 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u800 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let dtb_u_u810 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u806) (dtb_u_u801).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u810 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u811) -> (match dtb_u_u811 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u812; B_dData_dPair.f_Pair_second = dtb_u_u813 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u806) (dtb_u_u801).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ dtb_u_u806))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u814) -> ((Base_dCommon.v_bind (((v_alignCtorArgs dtb_u_u806) dtb_u_u813) dtb_u_u809)) (fun (dtb_u_u815 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn dtb_u_u807) dtb_u_u808)) (fun (dtb_u_u816 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (dtb_u_u800 - 1)) dtb_u_u801) dtb_u_u802) dtb_u_u803) dtb_u_u807) ((v_ctorOpaqueKeptFlags dtb_u_u813) dtb_u_u814)) dtb_u_u816) dtb_u_u815)) (fun (dtb_u_u817 : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u817 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u818; B_dData_dPair.f_Pair_second = dtb_u_u819 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u804, dtb_u_u806, dtb_u_u818, (v_justTy dtb_u_u805))); B_dData_dPair.f_Pair_second = dtb_u_u819 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ dtb_u_u806))
  | _ -> failwith "DT: impossible branch"
))))
# 1290 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerUpdFieldsFuel = (fun (dtb_u_u820 : int) (dtb_u_u821 : Lowering_dEnv.t_LwEnv) (dtb_u_u822 : t_LwSt) (dtb_u_u823 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u824 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u825 : bool B_dData_dList.t_List) (dtb_u_u826 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u827 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u826 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u828, dtb_u_u829) -> (if (dtb_u_u820 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (((v_nthOpqArgIn (B_dData_dPair.v_secondOf dtb_u_u828)) dtb_u_u825) dtb_u_u827) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position out of range")
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u830) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u820 - 1)) dtb_u_u821) dtb_u_u822) dtb_u_u823) dtb_u_u830)) (fun (dtb_u_u831 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u831 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u832; B_dData_dPair.f_Pair_second = dtb_u_u833 } -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (dtb_u_u820 - 1)) dtb_u_u821) dtb_u_u833) dtb_u_u823) dtb_u_u824) dtb_u_u825) dtb_u_u829) dtb_u_u827)) (fun (dtb_u_u834 : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u834 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u835; B_dData_dPair.f_Pair_second = dtb_u_u836 } -> (match ((v_lookupRtLabelIn (B_dData_dPair.v_firstOf dtb_u_u828)) dtb_u_u824) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u837) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u837; B_dData_dPair.f_Pair_second = dtb_u_u832 }, dtb_u_u835)); B_dData_dPair.f_Pair_second = dtb_u_u836 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position has no runtime field")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u820 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u822 })))
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerTerm = (fun (dtb_u_u838 : Lowering_dEnv.t_LwEnv) (dtb_u_u839 : t_LwSt) (dtb_u_u840 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u841 : Core_dTerm.t_Term) -> (((((v_lowerTermFuel (v_lowerBudgetFor (Core_dTerm.v_termSize dtb_u_u841))) dtb_u_u838) dtb_u_u839) dtb_u_u840) dtb_u_u841))

# 294 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDefBodyTerm = (fun (dtb_u_u842 : Lowering_dEnv.t_LwEnv) (dtb_u_u843 : t_LwSt) (dtb_u_u844 : Core_dTerm.t_Term) (dtb_u_u845 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (let dtb_u_u846 = (v_collectLamChainIn dtb_u_u844) in (match dtb_u_u846 with
  | { f_LamChainIn_lamChainBinders = dtb_u_u847; f_LamChainIn_lamChainBody = dtb_u_u848; f_LamChainIn_lamChainResultTy = dtb_u_u849 } -> (match dtb_u_u847 with
  | B_dData_dList.C_List_Nil -> ((((v_lowerTerm dtb_u_u842) dtb_u_u843) B_dData_dList.C_List_Nil) dtb_u_u844)
  | _ -> (match dtb_u_u845 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm dtb_u_u842) dtb_u_u843) B_dData_dList.C_List_Nil) dtb_u_u844)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u850) -> (match ((v_sigArrowTys 256) dtb_u_u850) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm dtb_u_u842) dtb_u_u843) B_dData_dList.C_List_Nil) dtb_u_u844)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u851) -> (if ((Lowering_dEnv.v_listLength dtb_u_u851) = (v_countRuntimeParams dtb_u_u847)) then ((((((((v_lowerLamChainFuel (v_lowerBudgetFor (Core_dTerm.v_termSize dtb_u_u844))) dtb_u_u842) dtb_u_u843) B_dData_dList.C_List_Nil) dtb_u_u851) dtb_u_u847) dtb_u_u848) dtb_u_u849) else ((((v_lowerTerm dtb_u_u842) dtb_u_u843) B_dData_dList.C_List_Nil) dtb_u_u844))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 981 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseFuel = (fun (dtb_u_u852 : int) (dtb_u_u853 : Lowering_dEnv.t_LwEnv) (dtb_u_u854 : t_LwSt) (dtb_u_u855 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u856 : Core_dTerm.t_Term) (dtb_u_u857 : Core_dTerm.t_CaseAlt) -> (if (dtb_u_u852 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName dtb_u_u857) = "") then (Base_dDiag.v_icInternal "unboxed case arm has no constructor") else (let dtb_u_u858 = (Core_dTerm.v_caseAltName dtb_u_u857) in (let dtb_u_u859 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u858) (dtb_u_u853).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u859 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u860) -> (match dtb_u_u860 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u861; B_dData_dPair.f_Pair_second = dtb_u_u862 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (dtb_u_u852 - 1)) dtb_u_u853) dtb_u_u854) dtb_u_u855) dtb_u_u856)) (fun (dtb_u_u863 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u863 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u864; B_dData_dPair.f_Pair_second = dtb_u_u865 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb_u_u865) dtb_u_u858) dtb_u_u855) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb_u_u857))) dtb_u_u862)) (fun (dtb_u_u866 : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys dtb_u_u853) dtb_u_u858)) (fun (dtb_u_u867 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let dtb_u_u868 = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf dtb_u_u853) dtb_u_u855) dtb_u_u856)))) dtb_u_u867) in (let dtb_u_u869 = ((v_typedPats dtb_u_u868) (v_aePatsOf dtb_u_u866)) in (let dtb_u_u870 = ((v_retagAltEnv dtb_u_u866) dtb_u_u869) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (dtb_u_u852 - 1)) dtb_u_u853) dtb_u_u870) (Core_dTerm.v_caseAltBody dtb_u_u857))) (fun (dtb_u_u871 : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u871 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u872; B_dData_dPair.f_Pair_second = dtb_u_u873 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u869, dtb_u_u864, dtb_u_u872)); B_dData_dPair.f_Pair_second = dtb_u_u873 }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ dtb_u_u858))
  | _ -> failwith "DT: impossible branch"
))))))

# 1318 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeArityIn = (fun (dtb_u_u874 : Core_dTerm.t_Term) -> (match dtb_u_u874 with
  | Core_dTerm.C_Term_TLam (dtb_u_u875, dtb_u_u876, dtb_u_u877, dtb_u_u878, dtb_u_u879) -> (if (Core_dTerm.v_rigIsErased dtb_u_u876) then (v_runtimeArityIn dtb_u_u879) else (1 + (v_runtimeArityIn dtb_u_u879)))
  | _ -> 0
))

# 1323 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recursiveValueAllowedIn = (fun (dtb_u_u880 : Core_dTerm.t_Term) -> (match dtb_u_u880 with
  | Core_dTerm.C_Term_TCon (dtb_u_u881, dtb_u_u882) -> true
  | Core_dTerm.C_Term_TLam (dtb_u_u883, dtb_u_u884, dtb_u_u885, dtb_u_u886, dtb_u_u887) -> (if (Core_dTerm.v_rigIsErased dtb_u_u884) then (v_recursiveValueAllowedIn dtb_u_u887) else true)
  | _ -> false
))

# 1330 "Vuna/Compiler/Lowering/Program.vuna"
let v_initGuardOf = (fun (dtb_u_u888 : Lowering_dEnv.t_LwEnv) (dtb_u_u889 : bool) (dtb_u_u890 : string) (dtb_u_u891 : Core_dTerm.t_Term) -> (if dtb_u_u889 then false else (if (if (if ((dtb_u_u888).Lowering_dEnv.f_LwEnv_lwUnit = "Main") then (dtb_u_u890 = "main") else false) then ((v_runtimeArityIn dtb_u_u891) = 0) else false) then true else false)))

# 1383 "Vuna/Compiler/Lowering/Program.vuna"
let v_externBasicIr = (fun (dtb_u_u892 : Core_dTerm.t_Value) -> (match dtb_u_u892 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u893) -> (match dtb_u_u893 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u894, dtb_u_u895) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb_u_u894) then (match (Lowering_dTy.v_reprTyIr dtb_u_u894) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u896) -> (Base_dDiag.C_Check_OkC (dtb_u_u896))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("extern type has no runtime representation: " ^ dtb_u_u894))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.v_icInternal ("extern type is not basic: " ^ dtb_u_u894)))
  | _ -> (Base_dDiag.v_icInternal "extern type is not a global type")
)
  | _ -> (Base_dDiag.v_icInternal "extern type is not basic")
))

# 1377 "Vuna/Compiler/Lowering/Program.vuna"
let v_externDomIr = (fun (dtb_u_u897 : Core_dTerm.t_Value) -> (match dtb_u_u897 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u898) -> (match dtb_u_u898 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u899, dtb_u_u900) -> (if (dtb_u_u899 = "Array") then (match dtb_u_u900 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u901, dtb_u_u902) -> (match dtb_u_u902 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (v_externBasicIr dtb_u_u901)) (fun (dtb_u_u903 : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u903))))))
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
)
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
) else (if (dtb_u_u899 = "Array") then (Base_dDiag.v_icInternal "extern Array needs one type argument") else (v_externBasicIr dtb_u_u897)))
  | _ -> (v_externBasicIr dtb_u_u897)
)
  | _ -> (v_externBasicIr dtb_u_u897)
))

# 1365 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_externTyIr = (fun (dtb_u_u904 : int) (dtb_u_u905 : int) (dtb_u_u906 : Core_dTerm.t_Value) -> (match dtb_u_u906 with
  | Core_dTerm.C_Value_VPi (dtb_u_u907, dtb_u_u908, dtb_u_u909, dtb_u_u910, dtb_u_u911) -> (if (dtb_u_u904 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (if dtb_u_u908 then (Base_dDiag.v_icInternal "extern has an implicit parameter") else ((Base_dCommon.v_bind (v_externDomIr dtb_u_u910)) (fun (dtb_u_u912 : Vuna_dIr_dModel.t_IrTy) -> ((Base_dCommon.v_bind (((v_externTyIr (dtb_u_u904 - 1)) (dtb_u_u905 + 1)) ((Core_dEval.v_applyClosure dtb_u_u911) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u907, dtb_u_u905, B_dData_dList.C_List_Nil))))))) (fun (dtb_u_u913 : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u912, dtb_u_u913))))))))))
  | _ -> (if (dtb_u_u904 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (v_externDomIr dtb_u_u906))
))

# 1362 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerExternTy = (fun (dtb_u_u914 : Core_dTerm.t_Term) -> (((v_externTyIr 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u914)))

# 1339 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDef = (fun (dtb_u_u915 : Lowering_dEnv.t_LwEnv) (dtb_u_u916 : t_LwSt) (dtb_u_u917 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern dtb_u_u917) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u918) -> (match (v_lowerExternTy (Elab_dTypes.v_dtDefType dtb_u_u917)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u919) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan dtb_u_u917)) (Elab_dTypes.v_dtDefName dtb_u_u917)) dtb_u_u919)))
  | Base_dDiag.C_Check_OkC (dtb_u_u920) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef ((Elab_dTypes.v_dtDefName dtb_u_u917), dtb_u_u920, dtb_u_u918, (Elab_dTypes.v_dtDefSpan dtb_u_u917))); B_dData_dPair.f_Pair_second = dtb_u_u916 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody dtb_u_u917) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u921) -> (let dtb_u_u922 = (B_dData_dMaybe.C_Maybe_Just ((((((Lowering_dTy.v_renderPiTy B_dData_dList.C_List_Nil) (dtb_u_u915).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u915).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb_u_u917))))) in (let dtb_u_u923 = ((((v_lowerDefBodyTerm dtb_u_u915) dtb_u_u916) dtb_u_u921) dtb_u_u922) in (match dtb_u_u923 with
  | Base_dDiag.C_Check_OkC (dtb_u_u924) -> (match dtb_u_u924 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u925; B_dData_dPair.f_Pair_second = dtb_u_u926 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef ((Elab_dTypes.v_dtDefName dtb_u_u917), (v_runtimeArityIn dtb_u_u921), ((Lowering_dEnv.v_factsDepsOf dtb_u_u915) (Elab_dTypes.v_dtDefName dtb_u_u917)), dtb_u_u922, dtb_u_u925, (v_recursiveValueAllowedIn dtb_u_u921), ((((v_initGuardOf dtb_u_u915) false) (Elab_dTypes.v_dtDefName dtb_u_u917)) dtb_u_u921), (Elab_dTypes.v_dtDefSpan dtb_u_u917))); B_dData_dPair.f_Pair_second = dtb_u_u926 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u927) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan dtb_u_u917)) (Elab_dTypes.v_dtDefName dtb_u_u917)) dtb_u_u927)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan dtb_u_u917)) (Elab_dTypes.v_dtDefName dtb_u_u917)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1394 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerDefs = (fun (dtb_u_u928 : Lowering_dEnv.t_LwEnv) (dtb_u_u929 : t_LwSt) (dtb_u_u930 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u930 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u931, dtb_u_u932) -> ((Base_dCommon.v_bind (((v_lowerDef dtb_u_u928) dtb_u_u929) dtb_u_u931)) (fun (dtb_u_u933 : (Vuna_dIr_dModel.t_IrDef, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u933 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u934; B_dData_dPair.f_Pair_second = dtb_u_u935 } -> ((Base_dCommon.v_bind (((v_lowerDefs dtb_u_u928) dtb_u_u935) dtb_u_u932)) (fun (dtb_u_u936 : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u936 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u937; B_dData_dPair.f_Pair_second = dtb_u_u938 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u934, dtb_u_u937)); B_dData_dPair.f_Pair_second = dtb_u_u938 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u929 }))
  | _ -> failwith "DT: impossible branch"
))

# 1413 "Vuna/Compiler/Lowering/Program.vuna"
let v_nameKey = (fun (dtb_u_u939 : string) (dtb_u_u940 : string) -> { B_dData_dPair.f_Pair_first = (Base_dSource.v_prefixOfName dtb_u_u939); B_dData_dPair.f_Pair_second = dtb_u_u940 })

# 1419 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_checkNoDupOcamlNamesGo = (fun (dtb_u_u941 : string) (dtb_u_u942 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u943 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u942 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u944, dtb_u_u945) -> (match dtb_u_u944 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u946; B_dData_dPair.f_Pair_second = dtb_u_u947 } -> (let dtb_u_u948 = (String.concat "" [dtb_u_u946; "\t"; dtb_u_u947]) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u948) dtb_u_u943) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml name collision among "; dtb_u_u941; "s in module `"; dtb_u_u946; "`: `"; dtb_u_u947; "`"])) else (((v_checkNoDupOcamlNamesGo dtb_u_u941) dtb_u_u945) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u948) true) dtb_u_u943))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1416 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkNoDupOcamlNames = (fun (dtb_u_u949 : string) (dtb_u_u950 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkNoDupOcamlNamesGo dtb_u_u949) dtb_u_u950) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 1429 "Vuna/Compiler/Lowering/Program.vuna"
let v_ensureUniqueOcamlNamesIn = (fun (dtb_u_u951 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u952 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u953 = (Lowering_dEnv.v_rtDatasOf dtb_u_u951) in (let dtb_u_u954 = (Elab_dRepresentation.v_unboxedFamilySet dtb_u_u953) in (let dtb_u_u955 = ((B_dData_dList.v_map (fun (dtb_u_u963 : Elab_dTypes.t_DtDef) -> ((v_nameKey (Elab_dTypes.v_dtDefName dtb_u_u963)) (Vuna_dTarget_dOcaml_dDecl.v_valueName (Elab_dTypes.v_dtDefName dtb_u_u963))))) dtb_u_u952) in (let dtb_u_u956 = ((B_dData_dList.v_map (fun (dtb_u_u962 : Elab_dTypes.t_DtData) -> ((v_nameKey (Elab_dTypes.v_dtDataName dtb_u_u962)) (Vuna_dTarget_dOcaml_dDecl.v_typeName (Elab_dTypes.v_dtDataName dtb_u_u962))))) dtb_u_u953) in (let dtb_u_u957 = ((B_dData_dList.v_concatMap (fun (dtb_u_u960 : Elab_dTypes.t_DtData) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName dtb_u_u960)) dtb_u_u954) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_map (fun (dtb_u_u961 : Elab_dTypes.t_DtCtor) -> ((v_nameKey (Elab_dTypes.v_dtCtorFamily dtb_u_u961)) ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Elab_dTypes.v_dtCtorFamily dtb_u_u961)) (Elab_dTypes.v_dtCtorName dtb_u_u961))))) (Elab_dTypes.v_dtDataCtors dtb_u_u960))))) dtb_u_u953) in ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "value") dtb_u_u955)) (fun (dtb_u_u958 : int) -> ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "type") dtb_u_u956)) (fun (dtb_u_u959 : int) -> ((v_checkNoDupOcamlNames "constructor") dtb_u_u957)))))))))))

# 1446 "Vuna/Compiler/Lowering/Program.vuna"
let v_prepareProgram = (fun (dtb_u_u964 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u965 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u966 = (Lowering_dChecks.v_defTable dtb_u_u965) in (let dtb_u_u967 = ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) dtb_u_u964) in (let dtb_u_u968 = (Lowering_dChecks.v_axiomNamesOf dtb_u_u965) in (match ((Lowering_dChecks.v_partitionDefs dtb_u_u966) dtb_u_u965) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u969; B_dData_dPair.f_Pair_second = dtb_u_u970 } -> (let dtb_u_u971 = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb_u_u969) in (let dtb_u_u972 = ((B_dData_dList.v_filter (fun (dtb_u_u978 : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u978) dtb_u_u971)))) dtb_u_u967) in (let dtb_u_u973 = ((B_dData_dList.v_append dtb_u_u970) dtb_u_u972) in ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkNoAxiomRuntime dtb_u_u968) dtb_u_u969)) (fun (dtb_u_u974 : int) -> ((Base_dCommon.v_bind (Lowering_dChecks.v_checkAllDefScopes dtb_u_u965)) (fun (dtb_u_u975 : int) -> ((Base_dCommon.v_bind ((v_ensureUniqueOcamlNamesIn dtb_u_u964) dtb_u_u969)) (fun (dtb_u_u976 : int) -> ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkAllErasure dtb_u_u973) dtb_u_u969)) (fun (dtb_u_u977 : int) -> (Base_dDiag.C_Check_OkC (dtb_u_u969)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1488 "Vuna/Compiler/Lowering/Program.vuna"
let v_tblLookup = (fun (dtb_u_u979 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u980 : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u980) dtb_u_u979))

# 1491 "Vuna/Compiler/Lowering/Program.vuna"
let v_recOkOfTbl = (fun (dtb_u_u981 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u982 : string) -> (match ((v_tblLookup dtb_u_u981) dtb_u_u982) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u983) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u983) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u984) -> (v_recursiveValueAllowedIn dtb_u_u984)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1500 "Vuna/Compiler/Lowering/Program.vuna"
let v_spanOfTbl = (fun (dtb_u_u985 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u986 : string) -> (match ((v_tblLookup dtb_u_u985) dtb_u_u986) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u987) -> (Elab_dTypes.v_dtDefSpan dtb_u_u987)
  | _ -> failwith "DT: impossible branch"
))

# 1529 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_mapMaybeDef = (fun (dtb_u_u988 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (dtb_u_u989 : string B_dData_dList.t_List) -> (match dtb_u_u989 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u990, dtb_u_u991) -> (match ((v_tblLookup dtb_u_u988) dtb_u_u990) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybeDef dtb_u_u988) dtb_u_u991)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u992) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u992, ((v_mapMaybeDef dtb_u_u988) dtb_u_u991)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1506 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appendGroups = (fun (dtb_u_u993 : Lowering_dEnv.t_LwEnv) (dtb_u_u994 : t_LwSt) (dtb_u_u995 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u995 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u996, dtb_u_u997) -> (let dtb_u_u998 = (B_dData_dPair.v_firstOf dtb_u_u996) in (let dtb_u_u999 = (B_dData_dPair.v_secondOf dtb_u_u996) in (let dtb_u_u1000 = ((v_mapMaybeDef (dtb_u_u993).Lowering_dEnv.f_LwEnv_lwDefTbl) dtb_u_u999) in ((Base_dCommon.v_bind (((v_lowerDefs dtb_u_u993) dtb_u_u994) dtb_u_u1000)) (fun (dtb_u_u1001 : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u1001 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1002; B_dData_dPair.f_Pair_second = dtb_u_u1003 } -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb_u_u1002)) (fun (dtb_u_u1004 : int) -> ((Base_dCommon.v_bind (((v_appendGroups dtb_u_u993) dtb_u_u1003) dtb_u_u997)) (fun (dtb_u_u1005 : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u1005 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1006; B_dData_dPair.f_Pair_second = dtb_u_u1007 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u998; B_dData_dPair.f_Pair_second = dtb_u_u1002 }, dtb_u_u1006)); B_dData_dPair.f_Pair_second = dtb_u_u1007 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u994 }))
  | _ -> failwith "DT: impossible branch"
))

# 1548 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ivarBound = (fun (dtb_u_u1008 : string B_dData_dList.t_List) (dtb_u_u1009 : Base_dIntrinsics.t_IType) -> (match dtb_u_u1009 with
  | Base_dIntrinsics.C_IType_IPi (dtb_u_u1010, dtb_u_u1011) -> ((v_ivarBound (B_dData_dList.C_List__x58__x58_ (dtb_u_u1010, dtb_u_u1008))) dtb_u_u1011)
  | Base_dIntrinsics.C_IType_IVar (dtb_u_u1012) -> ((B_dData_dList.v_memName dtb_u_u1012) dtb_u_u1008)
  | Base_dIntrinsics.C_IType_IFun1 (dtb_u_u1013, dtb_u_u1014) -> (if ((v_ivarBound dtb_u_u1008) dtb_u_u1013) then ((v_ivarBound dtb_u_u1008) dtb_u_u1014) else false)
  | Base_dIntrinsics.C_IType_IFun (dtb_u_u1015, dtb_u_u1016) -> (if ((v_ivarBound dtb_u_u1008) dtb_u_u1015) then ((v_ivarBound dtb_u_u1008) dtb_u_u1016) else false)
  | Base_dIntrinsics.C_IType_IEffHost (dtb_u_u1017) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1017)
  | Base_dIntrinsics.C_IType_IEff (dtb_u_u1018) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1018)
  | Base_dIntrinsics.C_IType_IAtomic -> true
  | Base_dIntrinsics.C_IType_ICondvar -> true
  | Base_dIntrinsics.C_IType_IMutex -> true
  | Base_dIntrinsics.C_IType_IThread (dtb_u_u1019) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1019)
  | Base_dIntrinsics.C_IType_IMBuffer -> true
  | Base_dIntrinsics.C_IType_IMDynArray (dtb_u_u1020) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1020)
  | Base_dIntrinsics.C_IType_IMArray (dtb_u_u1021) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1021)
  | Base_dIntrinsics.C_IType_ICell (dtb_u_u1022) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1022)
  | Base_dIntrinsics.C_IType_IArray (dtb_u_u1023) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1023)
  | Base_dIntrinsics.C_IType_IList (dtb_u_u1024) -> ((v_ivarBound dtb_u_u1008) dtb_u_u1024)
  | Base_dIntrinsics.C_IType_IGlobal (dtb_u_u1025) -> true
  | Base_dIntrinsics.C_IType_IFloat -> true
  | Base_dIntrinsics.C_IType_INat -> true
  | Base_dIntrinsics.C_IType_IBool -> true
  | Base_dIntrinsics.C_IType_IStr -> true
  | Base_dIntrinsics.C_IType_IInt -> true
  | Base_dIntrinsics.C_IType_ITy -> true
  | _ -> failwith "DT: impossible branch"
))

# 1573 "Vuna/Compiler/Lowering/Program.vuna"
let v_intrinsicWithUnboundIvar = (fun (dtb_u_u1026 : Base_dIntrinsics.t_Intrinsic B_dData_dList.t_List) -> ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) ((B_dData_dList.v_filter (fun (dtb_u_u1027 : Base_dIntrinsics.t_Intrinsic) -> (B_dData_dBool.v_not ((v_ivarBound B_dData_dList.C_List_Nil) (Base_dIntrinsics.v_intrinsicSignature dtb_u_u1027))))) dtb_u_u1026)))

# 1607 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstOfList = (fun (dtb_u_u1028 : string B_dData_dList.t_List) -> (match dtb_u_u1028 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1029, dtb_u_u1030) -> dtb_u_u1029
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1580 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkRuntimeContract = (let dtb_u_u1031 = ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) Base_dIntrinsics.v_allIntrinsics) in (let dtb_u_u1032 = Vuna_dIr_dRuntime.v_irRtNames in (let dtb_u_u1033 = (v_intrinsicWithUnboundIvar Base_dIntrinsics.v_allIntrinsics) in (let dtb_u_u1034 = ((B_dData_dList.v_filter (fun (dtb_u_u1037 : string) -> (if (dtb_u_u1037 = Base_dIntrinsics.v_primEffBind1Name) then false else (if ((B_dData_dList.v_memName dtb_u_u1037) dtb_u_u1032) then false else true)))) dtb_u_u1031) in (let dtb_u_u1035 = ((B_dData_dList.v_filter (fun (dtb_u_u1036 : string) -> (if ((B_dData_dList.v_memName dtb_u_u1036) dtb_u_u1031) then false else (if ((B_dData_dList.v_memName dtb_u_u1036) Vuna_dIr_dRuntime.v_irRtSyntheticNames) then false else true)))) dtb_u_u1032) in (if ((Lowering_dEnv.v_listLength dtb_u_u1033) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["intrinsic `"; (v_firstOfList dtb_u_u1033); "` has an unbound type variable in its signature"])) else (if ((Lowering_dEnv.v_listLength dtb_u_u1034) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_firstOfList dtb_u_u1034); "`"])) else (if ((Lowering_dEnv.v_listLength dtb_u_u1035) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_firstOfList dtb_u_u1035); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras); "`"])) else (Base_dDiag.C_Check_OkC (0))))))))))))

# 1540 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkProgramOf = (fun (dtb_u_u1038 : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((v_prepareProgram (dtb_u_u1038).Lowering_dEnv.f_LwEnv_lwDatas) (dtb_u_u1038).Lowering_dEnv.f_LwEnv_lwOrigDefs)) (fun (dtb_u_u1039 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> v_checkRuntimeContract)))

# 1661 "Vuna/Compiler/Lowering/Program.vuna"
let v_adjOfDef = (fun (dtb_u_u1040 : Lowering_dEnv.t_LwEnv) (dtb_u_u1041 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u1041); B_dData_dPair.f_Pair_second = ((Lowering_dEnv.v_factsDepsOf dtb_u_u1040) (Elab_dTypes.v_dtDefName dtb_u_u1041)) })

# 1469 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupDefs = (fun (dtb_u_u1042 : Lowering_dEnv.t_LwEnv) (dtb_u_u1043 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1044 = ((B_dData_dList.v_map (v_adjOfDef dtb_u_u1042)) dtb_u_u1043) in (let dtb_u_u1045 = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb_u_u1043) in (let dtb_u_u1046 = (Lowering_dEnv.v_defTblOf dtb_u_u1043) in ((Base_dCommon.v_bind ((((Vuna_dIr_dAnalysis.v_assembleGroupNames dtb_u_u1044) dtb_u_u1045) (v_recOkOfTbl dtb_u_u1046)) (v_spanOfTbl dtb_u_u1046))) (fun (dtb_u_u1047 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_appendGroups dtb_u_u1042) { f_LwSt_lwNext = 0; f_LwSt_lwBinder = 1 }) dtb_u_u1047)) (fun (dtb_u_u1048 : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match dtb_u_u1048 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1049; B_dData_dPair.f_Pair_second = dtb_u_u1050 } -> (Base_dDiag.C_Check_OkC (dtb_u_u1049))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1664 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupOfPair = (fun (dtb_u_u1051 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1051 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1052; B_dData_dPair.f_Pair_second = dtb_u_u1053 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb_u_u1052; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u1053 }
  | _ -> failwith "DT: impossible branch"
))

# 1687 "Vuna/Compiler/Lowering/Program.vuna"
let v_partitionRuntimeDefs = (fun (dtb_u_u1054 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable dtb_u_u1054)) dtb_u_u1054) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1055; B_dData_dPair.f_Pair_second = dtb_u_u1056 } -> dtb_u_u1055
  | _ -> failwith "DT: impossible branch"
))

# 1645 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitPrepared = (fun (dtb_u_u1057 : Lowering_dEnv.t_LwEnv) (dtb_u_u1058 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1059 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1060 = (dtb_u_u1057).Lowering_dEnv.f_LwEnv_lwDatas in (let dtb_u_u1061 = (v_partitionRuntimeDefs dtb_u_u1059) in ((Base_dCommon.v_bind ((v_groupDefs dtb_u_u1057) dtb_u_u1061)) (fun (dtb_u_u1062 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((Lowering_dTy.v_tyDeclsOf (dtb_u_u1057).Lowering_dEnv.f_LwEnv_lwDataTbl) (dtb_u_u1057).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u1057).Lowering_dEnv.f_LwEnv_lwUnboxedInfo) dtb_u_u1060) dtb_u_u1058)) (fun (dtb_u_u1063 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (let dtb_u_u1064 = ((B_dData_dList.v_map v_groupOfPair) dtb_u_u1062) in (let dtb_u_u1065 = ((Lowering_dEnv.v_hasDataNamed Base_dIntrinsics.v_listFamilyName) dtb_u_u1058) in (Base_dDiag.C_Check_OkC ((Vuna_dIr_dDispatch.v_dispatchIdsUnit ((Vuna_dIr_dRepresent.v_representUnit (Lowering_dEnv.v_lwEnvShared dtb_u_u1057)) { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = dtb_u_u1063; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = dtb_u_u1064; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = dtb_u_u1065; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (Lowering_dTy.v_tyDeclRefs dtb_u_u1063); Vuna_dIr_dModel.f_IrUnit_irUnitEntry = B_dData_dMaybe.C_Maybe_Nothing })))))))))))))

# 1622 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitCheckedFrom = (fun (dtb_u_u1066 : Lowering_dEnv.t_LwEnv) (dtb_u_u1067 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1068 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerUnitPrepared dtb_u_u1066) dtb_u_u1067) dtb_u_u1068)) (fun (dtb_u_u1069 : Vuna_dIr_dModel.t_IrUnit) -> (let dtb_u_u1070 = (if ((dtp_log_on 2) "Vuna.Compiler.Lowering.Program") then (((dtp_log_emit 2) "Vuna.Compiler.Lowering.Program") "cg-unit-validate-start") else 0) in ((Base_dCommon.v_bind ((Vuna_dIr_dValidate.v_validateUnit (Lowering_dEnv.v_lwEnvShared dtb_u_u1066)) dtb_u_u1069)) (fun (dtb_u_u1071 : int) -> (Base_dDiag.C_Check_OkC (dtb_u_u1069))))))))

# 1634 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitAfterChecks = (fun (dtb_u_u1072 : Lowering_dEnv.t_LwEnv) (dtb_u_u1073 : string B_dData_dList.t_List) (dtb_u_u1074 : string B_dData_dList.t_List) -> (let dtb_u_u1075 = (B_dContainer_dHashMap.v_ofNames dtb_u_u1073) in (let dtb_u_u1076 = ((B_dData_dList.v_filter (fun (dtb_u_u1080 : Elab_dTypes.t_DtDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb_u_u1080)) dtb_u_u1075))) (dtb_u_u1072).Lowering_dEnv.f_LwEnv_lwDefs) in (let dtb_u_u1077 = (B_dContainer_dHashMap.v_ofNames dtb_u_u1074) in (let dtb_u_u1078 = ((B_dData_dList.v_filter (fun (dtb_u_u1079 : Elab_dTypes.t_DtData) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName dtb_u_u1079)) dtb_u_u1077))) (dtb_u_u1072).Lowering_dEnv.f_LwEnv_lwDatas) in (((v_lowerUnitPrepared dtb_u_u1072) dtb_u_u1078) dtb_u_u1076))))))

# 1614 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitOf = (fun (dtb_u_u1081 : Lowering_dEnv.t_LwEnv) (dtb_u_u1082 : string B_dData_dList.t_List) (dtb_u_u1083 : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkProgramOf dtb_u_u1081)) (fun (dtb_u_u1084 : int) -> (((v_lowerUnitAfterChecks dtb_u_u1081) dtb_u_u1082) dtb_u_u1083))))

# 1672 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramOf = (fun (dtb_u_u1085 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1086 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u1087 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.env") (fun (dtb_u_u1088 : int) -> ((((Lowering_dEnv.v_mkLwEnv dtb_u_u1085) dtb_u_u1086) dtb_u_u1087) "")))) (fun (dtb_u_u1089 : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.prepare") (fun (dtb_u_u1090 : int) -> (v_checkProgramOf dtb_u_u1089)))) (fun (dtb_u_u1091 : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.unit") (fun (dtb_u_u1092 : int) -> (((v_lowerUnitAfterChecks dtb_u_u1089) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb_u_u1086)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) dtb_u_u1085))))) (fun (dtb_u_u1093 : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.entry") (fun (dtb_u_u1094 : int) -> (Lowering_dEntry.v_lowerEntryOf (dtb_u_u1089).Lowering_dEnv.f_LwEnv_lwDefs)))) (fun (dtb_u_u1095 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrProgram_irProgShared = (Lowering_dEnv.v_lwEnvShared dtb_u_u1089); Vuna_dIr_dModel.f_IrProgram_irProgUnit = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (dtb_u_u1093).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = (dtb_u_u1093).Vuna_dIr_dModel.f_IrUnit_irUnitGroups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (dtb_u_u1093).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (dtb_u_u1093).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = dtb_u_u1095 } })))))))))))

# 1679 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramCheckedOf = (fun (dtb_u_u1096 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u1097 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u1098 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerProgramOf dtb_u_u1096) dtb_u_u1097) dtb_u_u1098)) (fun (dtb_u_u1099 : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind (Vuna_dIr_dValidate.v_validateProgram dtb_u_u1099)) (fun (dtb_u_u1100 : int) -> (Base_dDiag.C_Check_OkC (dtb_u_u1099)))))))

# 51 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwNext = (fun (dtb_u_u1101 : t_LwSt) -> (match dtb_u_u1101 with
  | { f_LwSt_lwNext = dtb_u_u1102; f_LwSt_lwBinder = dtb_u_u1103 } -> dtb_u_u1102
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwBinder = (fun (dtb_u_u1104 : t_LwSt) -> (match dtb_u_u1104 with
  | { f_LwSt_lwNext = dtb_u_u1105; f_LwSt_lwBinder = dtb_u_u1106 } -> dtb_u_u1106
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamName = (fun (dtb_u_u1107 : t_LamParam) -> (match dtb_u_u1107 with
  | { f_LamParam_lamParamName = dtb_u_u1108; f_LamParam_lamParamRig = dtb_u_u1109; f_LamParam_lamParamTy = dtb_u_u1110 } -> dtb_u_u1108
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamRig = (fun (dtb_u_u1111 : t_LamParam) -> (match dtb_u_u1111 with
  | { f_LamParam_lamParamName = dtb_u_u1112; f_LamParam_lamParamRig = dtb_u_u1113; f_LamParam_lamParamTy = dtb_u_u1114 } -> dtb_u_u1113
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamTy = (fun (dtb_u_u1115 : t_LamParam) -> (match dtb_u_u1115 with
  | { f_LamParam_lamParamName = dtb_u_u1116; f_LamParam_lamParamRig = dtb_u_u1117; f_LamParam_lamParamTy = dtb_u_u1118 } -> dtb_u_u1118
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBinders = (fun (dtb_u_u1119 : t_LamChainIn) -> (match dtb_u_u1119 with
  | { f_LamChainIn_lamChainBinders = dtb_u_u1120; f_LamChainIn_lamChainBody = dtb_u_u1121; f_LamChainIn_lamChainResultTy = dtb_u_u1122 } -> dtb_u_u1120
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBody = (fun (dtb_u_u1123 : t_LamChainIn) -> (match dtb_u_u1123 with
  | { f_LamChainIn_lamChainBinders = dtb_u_u1124; f_LamChainIn_lamChainBody = dtb_u_u1125; f_LamChainIn_lamChainResultTy = dtb_u_u1126 } -> dtb_u_u1125
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainResultTy = (fun (dtb_u_u1127 : t_LamChainIn) -> (match dtb_u_u1127 with
  | { f_LamChainIn_lamChainBinders = dtb_u_u1128; f_LamChainIn_lamChainBody = dtb_u_u1129; f_LamChainIn_lamChainResultTy = dtb_u_u1130 } -> dtb_u_u1130
  | _ -> failwith "DT: impossible branch"
))

# 826 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnv = (fun (dtb_u_u1131 : t_AltEnvIn) -> (match dtb_u_u1131 with
  | { f_AltEnvIn_aeEnv = dtb_u_u1132; f_AltEnvIn_aePats = dtb_u_u1133; f_AltEnvIn_aeSt = dtb_u_u1134 } -> dtb_u_u1132
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePats = (fun (dtb_u_u1135 : t_AltEnvIn) -> (match dtb_u_u1135 with
  | { f_AltEnvIn_aeEnv = dtb_u_u1136; f_AltEnvIn_aePats = dtb_u_u1137; f_AltEnvIn_aeSt = dtb_u_u1138 } -> dtb_u_u1137
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeSt = (fun (dtb_u_u1139 : t_AltEnvIn) -> (match dtb_u_u1139 with
  | { f_AltEnvIn_aeEnv = dtb_u_u1140; f_AltEnvIn_aePats = dtb_u_u1141; f_AltEnvIn_aeSt = dtb_u_u1142 } -> dtb_u_u1142
  | _ -> failwith "DT: impossible branch"
))
