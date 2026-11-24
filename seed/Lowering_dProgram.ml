open Vuna_runtime
type t_LwSt = { f_LwSt_lwNext : int; f_LwSt_lwBinder : int }
and t_LamParam = { f_LamParam_lamParamName : string; f_LamParam_lamParamRig : Core_dTerm.t_Rig; f_LamParam_lamParamTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_LamChainIn = { f_LamChainIn_lamChainBinders : t_LamParam B_dData_dList.t_List; f_LamChainIn_lamChainBody : Core_dTerm.t_Term; f_LamChainIn_lamChainResultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_AltEnvIn = { f_AltEnvIn_aeEnv : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aePats : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aeSt : t_LwSt }

# 57 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderErasedOf = (fun (b : Vuna_dIr_dModel.t_IrBinder) -> (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased)

# 74 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBudgetFor = (fun (size : int) -> (512 + (8 * size)))

# 150 "Vuna/Compiler/Lowering/Program.vuna"
let v_justTy = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just (dtb__0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_binderAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__1)) else ((v_binderAtIn (mc0 - 1)) dtb__2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeBinderAt = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (v_binderErasedOf dtb__3) then ((v_runtimeBinderAt mc0) dtb__4) else (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_runtimeBinderAt (mc0 - 1)) dtb__4)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimePairGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (let erased = (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__5)) in (if (mc2 <= 0) then (if erased then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (mc0))) else (((v_runtimePairGo (if erased then mc0 else (mc0 + 1))) dtb__6) (mc2 - 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Lowering/Program.vuna"
let v_runtimeIndexInPairs = (fun (i : int) (ctx : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_runtimePairGo 0) ctx) i))

# 180 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordFieldNameAt = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (if (dtb__9 = mc0) then (Base_dDiag.C_Check_OkC (dtb__10)) else ((v_recordFieldNameAt mc0) dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordTermAsAppIn = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = dtb__14 } -> ((v_recordTermAsAppIn (Core_dTerm.C_Term_TApp (mc0, dtb__13, dtb__14))) dtb__12)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBridgeGuard = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) (ir : Vuna_dIr_dModel.t_Ir) -> (if (Vuna_dIr_dRuntime.v_irRtBridgesList name) then (if (env).Lowering_dEnv.f_LwEnv_lwHasListFamily then (Base_dDiag.C_Check_OkC (ir)) else ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_ListBridgeRequired (name))) name)) else (Base_dDiag.C_Check_OkC (ir))))

# 218 "Vuna/Compiler/Lowering/Program.vuna"
let v_effUnitTyIn = (Vuna_dIr_dModel.C_IrTy_IrTyData (Base_dIntrinsics.v_effUnitTypeName, B_dData_dList.C_List_Nil))

# 192 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerGlobalRef = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) -> (if (name = Base_dIntrinsics.v_natZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (name = "strFromFloat") then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (Lowering_dEnv.v_floatRenderRefName)))) else (if (name = Base_dIntrinsics.v_natSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Base_dIntrinsics.v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (if (name = Base_dIntrinsics.v_primEffBind1Name) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrEffBind (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn)))) else (if (Base_dIntrinsics.v_intrinsicReturnsEff dtb__15) then (((v_lowerBridgeGuard env) name) (Vuna_dIr_dModel.C_Ir_IrEffThunk (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn, (Base_dIntrinsics.v_intrinsicArity dtb__15), (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb__15)))))) else (((v_lowerBridgeGuard env) name) (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb__15))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrCtor (dtb__17, name, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 234 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_collectLamChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (let p = (v_collectLamChainIn dtb__23) in (let result = (match (p).f_LamChainIn_lamChainResultTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (p).f_LamChainIn_lamChainResultTy
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_lamResultTyOf dtb__21)
  | _ -> failwith "DT: impossible branch"
) in { f_LamChainIn_lamChainBinders = (B_dData_dList.C_List__x58__x58_ ({ f_LamParam_lamParamName = dtb__19; f_LamParam_lamParamRig = dtb__20; f_LamParam_lamParamTy = (Core_dTerm.v_lamBinderTyOf dtb__21) }, (p).f_LamChainIn_lamChainBinders)); f_LamChainIn_lamChainBody = (p).f_LamChainIn_lamChainBody; f_LamChainIn_lamChainResultTy = result }))
  | _ -> { f_LamChainIn_lamChainBinders = B_dData_dList.C_List_Nil; f_LamChainIn_lamChainBody = mc0; f_LamChainIn_lamChainResultTy = B_dData_dMaybe.C_Maybe_Nothing }
))

# 312 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countRuntimeParams = (fun (mc0 : t_LamParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if (Core_dTerm.v_rigIsErased (dtb__25).f_LamParam_lamParamRig) then (v_countRuntimeParams dtb__26) else (1 + (v_countRuntimeParams dtb__26)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_sigArrowTys = (fun (fuel : int) (ty : Vuna_dIr_dModel.t_IrTy) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ty with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__27, dtb__28) -> (match ((v_sigArrowTys (fuel - 1)) dtb__28) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__29))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
)))

# 336 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_headGlobalOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__30, dtb__31) -> (B_dData_dMaybe.C_Maybe_Just (dtb__30))
  | Core_dTerm.C_Term_TApp (dtb__32, dtb__33, dtb__34) -> (v_headGlobalOf dtb__32)
  | Core_dTerm.C_Term_TGlobal (dtb__35) -> (B_dData_dMaybe.C_Maybe_Just (dtb__35))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 330 "Vuna/Compiler/Lowering/Program.vuna"
let v_effResultTyOf = (fun (t : Core_dTerm.t_Term) -> (match (v_headGlobalOf t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (if (dtb__36 = Vuna_dIr_dModel.v_irEffTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (Vuna_dIr_dModel.v_irEffTypeName, (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, B_dData_dList.C_List_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderOfParam = (fun (env : Lowering_dEnv.t_LwEnv) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (id : int) (p : t_LamParam) -> (if (Core_dTerm.v_rigIsErased (p).f_LamParam_lamParamRig) then Vuna_dIr_dModel.v_mkIrBinderErased else (match (p).f_LamParam_lamParamTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Vuna_dIr_dModel.v_mkIrBinderOpaque id) (p).f_LamParam_lamParamName)
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (((Vuna_dIr_dModel.v_mkIrBinderTyped id) (p).f_LamParam_lamParamName) (((Lowering_dTy.v_annotTyOfTotal env) outer) dtb__37))
  | _ -> failwith "DT: impossible branch"
)))

# 355 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_bindersOfParamsHint = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc3 : int) (mc4 : t_LamParam B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (let erased = (Core_dTerm.v_rigIsErased (dtb__38).f_LamParam_lamParamRig) in (let hint = (if erased then B_dData_dMaybe.C_Maybe_Nothing else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (B_dData_dMaybe.C_Maybe_Just (dtb__43))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (let restHints = (if erased then mc2 else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> dtb__42
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in (let b = (match hint with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (((Vuna_dIr_dModel.v_mkIrBinderTyped mc3) (dtb__38).f_LamParam_lamParamName) dtb__40)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_binderOfParam mc0) mc1) mc3) dtb__38)
  | _ -> failwith "DT: impossible branch"
) in (let tail = (((((v_bindersOfParamsHint mc0) (B_dData_dList.C_List__x58__x58_ (b, mc1))) restHints) (mc3 + 1)) dtb__39) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (b, (B_dData_dPair.v_firstOf tail))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tail) })))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) -> (let nd_uscrut3 = (((Lowering_dTy.v_annotRunCalleeTy env) binders) f) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> (match dtb__45 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__46, dtb__47) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__47 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 431 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOfIr = (fun (ir : Vuna_dIr_dModel.t_Ir) -> (let nd_uscrut1 = (Vuna_dIr_dModel.v_irResultTyOf ir) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match dtb__48 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__49, dtb__50) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__50 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 437 "Vuna/Compiler/Lowering/Program.vuna"
let v_justAppTy = (fun (mc0 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__51) -> (B_dData_dMaybe.C_Maybe_Just (dtb__51))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque }))
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyFrom = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (irF : Vuna_dIr_dModel.t_Ir) -> (match (((v_appTyOf env) binders) f) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dMaybe.C_Maybe_Just (dtb__52))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_appTyOfIr irF)
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_concatLeavesGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__53, dtb__54, dtb__55) -> (match dtb__53 with
  | Core_dTerm.C_Term_TApp (dtb__56, dtb__57, dtb__58) -> (let whole = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp (dtb__56, dtb__57, dtb__58)), dtb__54, dtb__55)) in (if (if (Core_dTerm.v_rigIsErased dtb__58) then true else (Core_dTerm.v_rigIsErased dtb__55)) then (B_dData_dList.C_List__x58__x58_ (whole, mc1)) else (match dtb__56 with
  | Core_dTerm.C_Term_TGlobal (dtb__59) -> (if (dtb__59 = "++") then ((v_concatLeavesGo dtb__57) ((v_concatLeavesGo dtb__54) mc1)) else (B_dData_dList.C_List__x58__x58_ (whole, mc1)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (whole, mc1))
)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
))

# 510 "Vuna/Compiler/Lowering/Program.vuna"
let v_concatLeavesIn = (fun (t : Core_dTerm.t_Term) -> ((v_concatLeavesGo t) B_dData_dList.C_List_Nil))

# 500 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenConcatChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__60, dtb__61, dtb__62) -> (match dtb__60 with
  | Core_dTerm.C_Term_TApp (dtb__63, dtb__64, dtb__65) -> (if (if (Core_dTerm.v_rigIsErased dtb__65) then true else (Core_dTerm.v_rigIsErased dtb__62)) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__63 with
  | Core_dTerm.C_Term_TGlobal (dtb__66) -> (if (dtb__66 = "++") then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append (v_concatLeavesIn dtb__64)) (v_concatLeavesIn dtb__61)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 538 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__70)) then (v_allRuntimeArgs dtb__68) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenIntrinsicAppIn = (fun (t : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> (if (v_allRuntimeArgs dtb__72) then (match dtb__71 with
  | Core_dTerm.C_Term_TGlobal (dtb__73) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb__73) > 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__72 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Lowering/Program.vuna"
let v_inlineArityMatchesIn = (fun (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((Vuna_dIr_dModel.v_irInlineArity name) <= 0) then false else ((Lowering_dEnv.v_listLength args) = (Vuna_dIr_dModel.v_irInlineArity name))))

# 551 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_alignCtorArgs = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 } -> (if dtb__74 then (if (Core_dTerm.v_rigIsErased dtb__79) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Base_dCommon.v_bind (((v_alignCtorArgs mc0) dtb__75) dtb__77)) (fun (ts : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 }, ts))))))) else (if (Core_dTerm.v_rigIsErased dtb__79) then (((v_alignCtorArgs mc0) dtb__75) dtb__77) else (((v_alignCtorArgs mc0) dtb__75) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 }, dtb__77)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if dtb__74 then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_alignCtorArgs mc0) dtb__75) B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Lowering/Program.vuna"
let v_ctorArgIr = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc1 : bool) (mc2 : Vuna_dIr_dModel.t_Ir) -> (if mc1 then (Vuna_dIr_dModel.C_Ir_IrCast (mc0, (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)), mc2)) else mc2))

# 598 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ctorOpaqueKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if dtb__82 then (B_dData_dList.C_List__x58__x58_ (dtb__84, ((v_ctorOpaqueKeptFlags dtb__83) dtb__85))) else ((v_ctorOpaqueKeptFlags dtb__83) dtb__85))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_zipFieldNames = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> ((Base_dCommon.v_bind ((v_zipFieldNames dtb__87) dtb__89)) (fun (rest : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_secondOf dtb__86); B_dData_dPair.f_Pair_second = dtb__88 }, rest))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record construction has fewer runtime arguments than its runtime field table")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (Base_dDiag.v_icInternal "record construction has more runtime arguments than its runtime field table")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 657 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerConAppFinish = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (family : string) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (irs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) family) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (let recTy = (match (((Lowering_dTy.v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (family, dtb__93))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind ((v_zipFieldNames dtb__92) irs)) (fun (pairs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (family, recTy, pairs)); B_dData_dPair.f_Pair_second = st })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (family, c, (((Lowering_dTy.v_ctorTypeArgsOf env) c) args), irs)); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 692 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnvOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__94; f_AltEnvIn_aePats = dtb__95; f_AltEnvIn_aeSt = dtb__96 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 695 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePatsOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__97; f_AltEnvIn_aePats = dtb__98; f_AltEnvIn_aeSt = dtb__99 } -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

# 698 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeStOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__100; f_AltEnvIn_aePats = dtb__101; f_AltEnvIn_aeSt = dtb__102 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countKept = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if dtb__103 then (1 + (v_countKept dtb__104)) else (v_countKept dtb__104))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvGo = (fun (mc0 : t_LwSt) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> (if (Core_dTerm.v_rigIsErased dtb__108) then ((((v_altEnvGo mc0) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc1))) dtb__106) mc3) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in ((((v_altEnvGo { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) (B_dData_dList.C_List__x58__x58_ (b, mc1))) dtb__106) (B_dData_dList.C_List__x58__x58_ (b, mc3)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_AltEnvIn_aeEnv = mc1; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc3); f_AltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvIn = (fun (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_altEnvGo st) outer) tele) B_dData_dList.C_List_Nil))

# 732 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvFullIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if ((Lowering_dTy.v_flagMatchesRigIn dtb__113) dtb__112) then (if dtb__113 then (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in ((((((v_altEnvFullIn { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__110) dtb__114) (B_dData_dList.C_List__x58__x58_ (b, mc5)))))) else ((((((v_altEnvFullIn mc0) mc1) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc2))) dtb__110) dtb__114) mc5)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc5); f_AltEnvIn_aeSt = mc0 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvKeptIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (if (Core_dTerm.v_rigIsErased dtb__120) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in (((((v_altEnvKeptIn { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__118) (B_dData_dList.C_List__x58__x58_ (b, mc4)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc4); f_AltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvCheckedIn = (fun (st : t_LwSt) (label : string) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (flags : bool B_dData_dList.t_List) -> (if ((Lowering_dEnv.v_listLength binders) = (Lowering_dEnv.v_listLength flags)) then ((((((v_altEnvFullIn st) label) outer) binders) flags) B_dData_dList.C_List_Nil) else (if ((Lowering_dEnv.v_listLength binders) = (v_countKept flags)) then (((((v_altEnvKeptIn st) label) outer) binders) B_dData_dList.C_List_Nil) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 766 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderWithTy = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (b : Vuna_dIr_dModel.t_IrBinder) -> (if (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased then { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = true; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing } else { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (v_justTy ty) }))

# 773 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_typedPats = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (B_dData_dList.C_List__x58__x58_ (((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__121))) dtb__123), ((v_typedPats dtb__122) dtb__124)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Lowering/Program.vuna"
let v_typedPatsAll = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (b : Vuna_dIr_dModel.t_IrBinder) -> ((v_binderWithTy ty) b))) bs))

# 783 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_armTyTblOf = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (let tail = (v_armTyTblOf dtb__126) in (match (dtb__125).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__127) -> (match (dtb__125).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 }, tail))
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | _ -> tail
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupArmTy = (fun (mc0 : int) (mc1 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (if (dtb__131 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__132)) else ((v_lookupArmTy mc0) dtb__130))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 795 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagArmBinder = (fun (tbl : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Vuna_dIr_dModel.t_IrBinder) -> (match (b).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__133) -> (match ((v_lookupArmTy dtb__133) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> ((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__134))) b)
  | B_dData_dMaybe.C_Maybe_Nothing -> b
  | _ -> failwith "DT: impossible branch"
)
  | _ -> b
))

# 808 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_retagArmEnv = (fun (mc0 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (B_dData_dList.C_List__x58__x58_ (((v_retagArmBinder mc0) dtb__135), ((v_retagArmEnv mc0) dtb__136)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagAltEnv = (fun (mc0 : t_AltEnvIn) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__137; f_AltEnvIn_aePats = dtb__138; f_AltEnvIn_aeSt = dtb__139 } -> { f_AltEnvIn_aeEnv = ((v_retagArmEnv (v_armTyTblOf mc1)) dtb__137); f_AltEnvIn_aePats = mc1; f_AltEnvIn_aeSt = dtb__139 }
  | _ -> failwith "DT: impossible branch"
))

# 819 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_hasFallbackAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (if ((Core_dTerm.v_caseAltName dtb__140) = "") then true else (v_hasFallbackAlt dtb__141))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 823 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allCatchAll = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if ((Core_dTerm.v_caseAltName dtb__142) = "") then (v_allCatchAll dtb__143) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseAlt = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (if ((Core_dTerm.v_caseAltName dtb__144) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let name = (Core_dTerm.v_caseAltName dtb__144) in (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (mc0).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__147) (mc0).Lowering_dEnv.f_LwEnv_lwUnboxed) then (if (v_allCatchAll dtb__145) then (B_dData_dMaybe.C_Maybe_Just (dtb__144)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 876 "Vuna/Compiler/Lowering/Program.vuna"
let v_armResultTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (bodyIr : Vuna_dIr_dModel.t_Ir) (coreBody : Core_dTerm.t_Term) -> (match (Vuna_dIr_dModel.v_irResultTyOf bodyIr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (B_dData_dMaybe.C_Maybe_Just (dtb__149))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match bodyIr with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__150) -> (match (((Lowering_dTy.v_annotGlobalTy env) (v_aeEnvOf bound)) dtb__150) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (B_dData_dMaybe.C_Maybe_Just (dtb__151))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Lowering_dTy.v_annotRunTyOf env) (v_aeEnvOf bound)) coreBody)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((Lowering_dTy.v_annotRunTyOf env) (v_aeEnvOf bound)) coreBody)
)
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Lowering/Program.vuna"
let v_isNatCtorName = (fun (name : string) -> (if (name = Base_dIntrinsics.v_natZeroCtor) then true else (name = Base_dIntrinsics.v_natSuccCtor)))

# 957 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseAllCtors = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if ((Core_dTerm.v_caseAltName dtb__152) = "") then (v_natCaseAllCtors dtb__153) else (let name = (Core_dTerm.v_caseAltName dtb__152) in (if (v_isNatCtorName name) then (v_natCaseAllCtors dtb__153) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseHasCtor = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if ((Core_dTerm.v_caseAltName dtb__154) = "") then (v_natCaseHasCtor dtb__155) else true)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 953 "Vuna/Compiler/Lowering/Program.vuna"
let v_natCaseApplies = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> (if (v_natCaseAllCtors mc0) then (v_natCaseHasCtor mc0) else false)
))

# 971 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findAltBy = (fun (mc0 : string) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if ((Core_dTerm.v_caseAltName dtb__156) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__156)) else ((v_findAltBy mc0) dtb__157))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 975 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findCatchAllAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if ((Core_dTerm.v_caseAltName dtb__158) = "") then (B_dData_dMaybe.C_Maybe_Just (dtb__158)) else (v_findCatchAllAlt dtb__159))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1064 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordProjVarIn = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 1067 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_projBindersIn = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_recordProjVarIn mc1); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__160) }, ((v_projBindersIn dtb__161) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1074 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (if (dtb__164 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__165)) else ((v_lookupRtLabelIn mc0) dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1078 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match dtb__166 with
  | { B_dData_dPair.f_Pair_first = dtb__168; B_dData_dPair.f_Pair_second = dtb__169 } -> (if (dtb__168 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_lookupRtPosIn mc0) dtb__167) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPositionsIn = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (match (((v_lookupRtPosIn dtb__170) mc0) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn mc0) dtb__171)) (fun (ps : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__172 }, ps))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["record update targets field index "; (bi_strFromInt dtb__170); ", which has no runtime field"]))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1091 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthOpqArgIn = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__177)) else (((v_nthOpqArgIn (mc0 - 1)) dtb__174) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1102 "Vuna/Compiler/Lowering/Program.vuna"
let v_eraseTele = (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> Vuna_dIr_dModel.v_mkIrBinderErased)

# 1099 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordAltBindersIn = (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_eraseTele) tele))) binders))

# 80 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerTermFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__179, dtb__180, dtb__181) -> (match ((v_runtimeBinderAt dtb__180) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (if (v_binderErasedOf dtb__182) then (Base_dDiag.v_icInternal (String.concat "" ["erased binder "; dtb__179; ": runtime idx "; (bi_strFromInt dtb__180); " of "; (bi_strFromInt (Lowering_dEnv.v_listLength binders)); " binders"])) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb__182)); B_dData_dPair.f_Pair_second = st })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__183) -> ((Base_dCommon.v_bind ((v_lowerGlobalRef env) dtb__183)) (fun (ir : Vuna_dIr_dModel.t_Ir) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = st }))))
  | Core_dTerm.C_Term_TInt (dtb__184) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__184)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TStr (dtb__185) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb__185)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TFloat (dtb__186) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__186)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TBool (dtb__187) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb__187)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TIf (dtb__188, dtb__189, dtb__190) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__188)) (fun (pc : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__192) binders) dtb__189)) (fun (pt : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__194) binders) dtb__190)) (fun (pe : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb__191, dtb__193, dtb__195)); B_dData_dPair.f_Pair_second = dtb__196 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Core_dTerm.C_Term_TLam (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> (((((((((v_lowerLamFuel (fuel - 1)) env) st) binders) dtb__197) dtb__198) dtb__199) dtb__200) dtb__201)
  | Core_dTerm.C_Term_TApp (dtb__202, dtb__203, dtb__204) -> (((((((v_lowerAppFuel (fuel - 1)) env) st) binders) dtb__202) dtb__203) dtb__204)
  | Core_dTerm.C_Term_TCon (dtb__205, dtb__206) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__205) dtb__206)
  | Core_dTerm.C_Term_TMk (dtb__207, dtb__208) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__207) dtb__208)
  | Core_dTerm.C_Term_TRecord (dtb__209, dtb__210) -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) ((v_recordTermAsAppIn (Core_dTerm.C_Term_TGlobal (dtb__209))) dtb__210))
  | Core_dTerm.C_Term_TCase (dtb__211, dtb__212) -> ((((((v_lowerCaseFuel (fuel - 1)) env) st) binders) dtb__211) dtb__212)
  | Core_dTerm.C_Term_TRecUpd (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__214) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> ((((((((((v_lowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__213) dtb__214) dtb__215) dtb__218) dtb__216) dtb__217)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TCase (dtb__213, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__214; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__215); Core_dTerm.f_CaseAlt_caseAltBody = dtb__217 }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TProj (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__220) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> ((Base_dCommon.v_bind ((v_recordFieldNameAt dtb__223) dtb__224)) (fun (label : string) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__219)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 } -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) dtb__220)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let args = (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) binders) dtb__219)) in (let resTy = (match (((v_lookupRtPosIn dtb__223) dtb__224) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> ((Vuna_dIr_dModel.v_irTyAt ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars args)) fieldTys)) dtb__227)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb__225, dtb__220, label, (v_justTy resTy))); B_dData_dPair.f_Pair_second = dtb__226 }))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_lowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__219) dtb__220) dtb__221) dtb__222) dtb__223)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TType (dtb__233) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb__234) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((Lowering_dChecks.v_showMetaHint dtb__234)))) (Lowering_dChecks.v_showMetaHint dtb__234))
  | _ -> failwith "DT: impossible branch"
)))
# 245 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (name : string) (rig : Core_dTerm.t_Rig) (slot : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (sp : Base_dSource.t_Span) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (v_collectLamChainIn (Core_dTerm.C_Term_TLam (name, rig, slot, sp, body))) with
  | { f_LamChainIn_lamChainBinders = dtb__235; f_LamChainIn_lamChainBody = dtb__236; f_LamChainIn_lamChainResultTy = dtb__237 } -> ((((((((v_lowerLamChainFuel fuel) env) st) binders) B_dData_dList.C_List_Nil) dtb__235) dtb__236) dtb__237)
  | _ -> failwith "DT: impossible branch"
)))
# 255 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (hints : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (params : t_LamParam B_dData_dList.t_List) (inner : Core_dTerm.t_Term) (resultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let pb = (((((v_bindersOfParamsHint env) binders) hints) (st).f_LwSt_lwBinder) params) in (let bs = (B_dData_dPair.v_firstOf pb) in (let stIds = { f_LwSt_lwNext = (st).f_LwSt_lwNext; f_LwSt_lwBinder = (B_dData_dPair.v_secondOf pb) } in (let envB = ((B_dData_dList.v_append (B_dData_dList.v_reverse bs)) binders) in (let resultIr = (match resultTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> (match (((Lowering_dTy.v_annotTyOf env) envB) dtb__241) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (B_dData_dMaybe.C_Maybe_Just (dtb__242))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effResultTyOf dtb__241)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) stIds) envB) inner)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__238; B_dData_dPair.f_Pair_second = dtb__239 } -> (let resultIr2 = (match resultIr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> resultIr
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_irResultTyOf dtb__238)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_filter (fun (x : Vuna_dIr_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErasedOf x)))) bs), (v_justTy resultIr2), dtb__238)); B_dData_dPair.f_Pair_second = dtb__239 })))
  | _ -> failwith "DT: impossible branch"
))))))))))
# 382 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased rig) then (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f) else (let nd_uscrut7 = (Lowering_dChecks.v_flattenConApp (Core_dTerm.C_Term_TApp (f, a, rig))) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_flattenConcatChainIn (Core_dTerm.C_Term_TApp (f, a, rig))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (if ((Lowering_dEnv.v_listLength dtb__243) >= 3) then ((Base_dCommon.v_bind (((((v_lowerTermsFuel (fuel - 1)) env) st) binders) dtb__243)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__244; B_dData_dPair.f_Pair_second = dtb__245 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__244)); B_dData_dPair.f_Pair_second = dtb__245 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (match dtb__246 with
  | { B_dData_dPair.f_Pair_first = dtb__247; B_dData_dPair.f_Pair_second = dtb__248 } -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__247) dtb__248)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 404 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerPlainAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TApp (dtb__249, dtb__250, dtb__251) -> (let nd_uscrut8 = (v_flattenIntrinsicAppIn t) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__249) dtb__250) dtb__251)
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (match dtb__252 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> (if ((v_inlineArityMatchesIn dtb__253) dtb__254) then ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__254)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__253, dtb__255)); B_dData_dPair.f_Pair_second = dtb__256 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__249) dtb__250) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dDiag.v_icInternal "lowerPlainApp expects an application")
)))
# 447 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFallbackFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pf with
  | { B_dData_dPair.f_Pair_first = dtb__257; B_dData_dPair.f_Pair_second = dtb__258 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__258) binders) a)) (fun (pa : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy ((((v_appTyFrom env) binders) f) dtb__257)), dtb__257, dtb__259)); B_dData_dPair.f_Pair_second = dtb__260 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 463 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (match dtb__261 with
  | { B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb__264) then (Base_dDiag.v_icInternal "erased argument in inlined builtin application") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__263)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } -> ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (mc0 - 1)) mc1) dtb__266) mc3) dtb__262)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__267)); B_dData_dPair.f_Pair_second = dtb__268 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 482 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerTermsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__269, dtb__270) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__269)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> ((Base_dCommon.v_bind (((((v_lowerTermsFuel (mc0 - 1)) mc1) dtb__272) mc3) dtb__270)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__273)); B_dData_dPair.f_Pair_second = dtb__274 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 573 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (match dtb__277 with
  | { B_dData_dPair.f_Pair_first = dtb__279; B_dData_dPair.f_Pair_second = dtb__280 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__279)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__281; B_dData_dPair.f_Pair_second = dtb__282 } -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (mc0 - 1)) mc1) dtb__282) mc3) dtb__276) dtb__278)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((((v_ctorArgIr (((Lowering_dTy.v_annotRunTyOf mc1) mc3) dtb__279)) dtb__275) dtb__281), dtb__283)); B_dData_dPair.f_Pair_second = dtb__284 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__285, dtb__286) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than runtime arguments")
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 604 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (Core_dTerm.v_natChainValue (Core_dTerm.C_Term_TCon (c, args))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__287)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_lowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 613 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppNonChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (c = Base_dIntrinsics.v_natZeroCtor) then (match (((v_alignCtorArgs c) B_dData_dList.C_List_Nil) args) with
  | Base_dDiag.C_Check_ErrC (dtb__288) -> (Base_dDiag.C_Check_ErrC (dtb__288))
  | Base_dDiag.C_Check_OkC (dtb__289) -> (match dtb__289 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__290) -> (Base_dDiag.C_Check_ErrC (dtb__290))
  | Base_dDiag.C_Check_OkC (dtb__291) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__291)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__292; B_dData_dPair.f_Pair_second = dtb__293 } -> (match dtb__292 with
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (match dtb__295 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__294)); B_dData_dPair.f_Pair_second = dtb__293 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (match dtb__296 with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__298) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) ((v_ctorOpaqueKeptFlags dtb__298) dtb__299)) runtimeArgs)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> ((((((v_lowerConAppFinish env) dtb__301) dtb__297) c) args) dtb__300)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))))
# 816 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmBodyFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (body : Core_dTerm.t_Term) -> (((((v_lowerTermFuel fuel) env) (v_aeStOf bound)) (v_aeEnvOf bound)) body))
# 889 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (let bound = (((v_altEnvIn st) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) in (let typed = ((v_typedPatsAll scrutTy) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__302 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__302) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__303 } }))
  | _ -> failwith "DT: impossible branch"
)))))) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Core_dTerm.v_caseAltName alt)) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (match dtb__304 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn st) (Core_dTerm.v_caseAltName alt)) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__306)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) (Core_dTerm.v_caseAltName alt))) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf scrutTy))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = dtb__308 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = (Core_dTerm.v_caseAltName alt) })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__307 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__307) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__308 } }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ (Core_dTerm.v_caseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
# 923 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc3 : t_LwSt) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc5 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind ((((((v_lowerArmFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__309)) (fun (p : (Vuna_dIr_dModel.t_IrAlt, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (match dtb__312 with
  | { B_dData_dPair.f_Pair_first = dtb__313; B_dData_dPair.f_Pair_second = dtb__314 } -> ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (mc0 - 1)) mc1) mc2) dtb__314) mc4) dtb__310)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__315; B_dData_dPair.f_Pair_second = dtb__316 } -> (match dtb__316 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (let resultTy = (match dtb__313 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__319) -> dtb__313
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__317
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__315)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__318 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 980 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatAltFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let bound = (((v_altEnvIn mc2) mc3) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb__320))) in (let typed = ((v_typedPatsAll (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (mc0 - 1)) mc1) bound2) (Core_dTerm.v_caseAltBody dtb__320))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__321 })); B_dData_dPair.f_Pair_second = dtb__322 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 996 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (let fresh = (dtb__324).f_LwSt_lwNext in (let st2 = { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (dtb__324).f_LwSt_lwBinder } in (let zeroAlt = ((v_findAltBy Base_dIntrinsics.v_natZeroCtor) alts) in (let succAlt = ((v_findAltBy Base_dIntrinsics.v_natSuccCtor) alts) in (let catchAlt = (v_findCatchAllAlt alts) in ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pz with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__326) outer) succAlt)) (fun (ps : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match ps with
  | { B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = dtb__328 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__328) outer) catchAlt)) (fun (pc : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__329; B_dData_dPair.f_Pair_second = dtb__330 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__323, fresh, dtb__325, dtb__327, dtb__329)); B_dData_dPair.f_Pair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1031 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (v_natCaseApplies alts) then ((((((v_lowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> (let scrutTy = (((Lowering_dTy.v_annotRunTyOf env) outer) scrut) in ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (fuel - 1)) env) scrutTy) dtb__332) outer) alts)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = q in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__333; B_dData_dPair.f_Pair_second = dtb__334 } -> (match dtb__334 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase ((v_justTy scrutTy), (v_justTy dtb__335), dtb__331, dtb__333)); B_dData_dPair.f_Pair_second = dtb__336 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1052 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerProjAsCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let n = (Lowering_dEnv.v_listLength tele) in (let srcIdx = ((n - 1) - fi) in (match ((v_runtimeIndexInPairs srcIdx) tele) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> (((((v_lowerTermFuel (fuel - 1)) env) st) outer) (Core_dTerm.C_Term_TCase (base, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = c; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs ((v_projBindersIn tele) 0)); Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TVar ((v_recordProjVarIn fi), dtb__337, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "projection of an erased binder")
  | _ -> failwith "DT: impossible branch"
)))))
# 1105 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (let baseTy = (((Lowering_dTy.v_annotRunTyOf env) outer) base) in (match body with
  | Core_dTerm.C_Term_TMk (dtb__340, dtb__341) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__339) ((v_recordAltBindersIn tele) outer)) dtb__338) baseTy) c) fields) idxs) dtb__341)
  | Core_dTerm.C_Term_TCon (dtb__342, dtb__343) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__339) ((v_recordAltBindersIn tele) outer)) dtb__338) baseTy) c) fields) idxs) dtb__343)
  | _ -> (Base_dDiag.v_icInternal "record update body is not a constructor application")
))
  | _ -> failwith "DT: impossible branch"
)))))
# 1122 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateArgsFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (baseIr : Vuna_dIr_dModel.t_Ir) (baseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c : string) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let nd_uscrut10 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__344) -> (match dtb__344 with
  | { B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__346 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__347) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__346) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn fields) idxs)) (fun (positions : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_ctorOpaqueKeptFlags dtb__346) dtb__347)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (baseIr, c, dtb__348, (v_justTy baseTy))); B_dData_dPair.f_Pair_second = dtb__349 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))
# 1145 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) (mc6 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__350, dtb__351) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (((v_nthOpqArgIn (B_dData_dPair.v_secondOf dtb__350)) mc5) mc7) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position out of range")
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__352)) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__354) mc3) mc4) mc5) dtb__351) mc7)) (fun (r : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> (match ((v_lookupRtLabelIn (B_dData_dPair.v_firstOf dtb__350)) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__357) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__353 }, dtb__355)); B_dData_dPair.f_Pair_second = dtb__356 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position has no runtime field")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerTerm = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_lowerTermFuel (v_lowerBudgetFor (Core_dTerm.v_termSize t))) env) st) binders) t))

# 288 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDefBodyTerm = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (body : Core_dTerm.t_Term) (defTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (let nd_uscrut4 = (v_collectLamChainIn body) in (match nd_uscrut4 with
  | { f_LamChainIn_lamChainBinders = dtb__358; f_LamChainIn_lamChainBody = dtb__359; f_LamChainIn_lamChainResultTy = dtb__360 } -> (match dtb__358 with
  | B_dData_dList.C_List_Nil -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | _ -> (match defTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (match ((v_sigArrowTys 256) dtb__361) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> (if ((Lowering_dEnv.v_listLength dtb__362) = (v_countRuntimeParams dtb__358)) then ((((((((v_lowerLamChainFuel (v_lowerBudgetFor (Core_dTerm.v_termSize body))) env) st) B_dData_dList.C_List_Nil) dtb__362) dtb__358) dtb__359) dtb__360) else ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 842 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (Base_dDiag.v_icInternal "unboxed case arm has no constructor") else (let name = (Core_dTerm.v_caseAltName alt) in (let nd_uscrut7 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__365 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb__367) name) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__365)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) name)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) outer) scrut)))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (typed, dtb__366, dtb__368)); B_dData_dPair.f_Pair_second = dtb__369 }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
))))))

# 1173 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeArityIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> (if (Core_dTerm.v_rigIsErased dtb__371) then (v_runtimeArityIn dtb__374) else (1 + (v_runtimeArityIn dtb__374)))
  | _ -> 0
))

# 1178 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recursiveValueAllowedIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__375, dtb__376) -> true
  | Core_dTerm.C_Term_TLam (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (if (Core_dTerm.v_rigIsErased dtb__378) then (v_recursiveValueAllowedIn dtb__381) else true)
  | _ -> false
))

# 1185 "Vuna/Compiler/Lowering/Program.vuna"
let v_initGuardOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : bool) (mc2 : string) (mc3 : Core_dTerm.t_Term) -> (if mc1 then false else (if (if (if ((mc0).Lowering_dEnv.f_LwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_runtimeArityIn mc3) = 0) else false) then true else false)))

# 1238 "Vuna/Compiler/Lowering/Program.vuna"
let v_externBasicIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__382) -> (match dtb__382 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__383, dtb__384) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__383) then (match (Lowering_dTy.v_reprTyIr dtb__383) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (Base_dDiag.C_Check_OkC (dtb__385))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("extern type has no runtime representation: " ^ dtb__383))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.v_icInternal ("extern type is not basic: " ^ dtb__383)))
  | _ -> (Base_dDiag.v_icInternal "extern type is not a global type")
)
  | _ -> (Base_dDiag.v_icInternal "extern type is not basic")
))

# 1232 "Vuna/Compiler/Lowering/Program.vuna"
let v_externDomIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__386) -> (match dtb__386 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__387, dtb__388) -> (if (dtb__387 = "Array") then (match dtb__388 with
  | B_dData_dList.C_List__x58__x58_ (dtb__389, dtb__390) -> (match dtb__390 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (v_externBasicIr dtb__389)) (fun (e : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyArray (e))))))
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
)
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
) else (if (dtb__387 = "Array") then (Base_dDiag.v_icInternal "extern Array needs one type argument") else (v_externBasicIr mc0)))
  | _ -> (v_externBasicIr mc0)
)
  | _ -> (v_externBasicIr mc0)
))

# 1220 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_externTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc2 with
  | Core_dTerm.C_Value_VPi (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395) -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (if dtb__392 then (Base_dDiag.v_icInternal "extern has an implicit parameter") else ((Base_dCommon.v_bind (v_externDomIr dtb__394)) (fun (domIr : Vuna_dIr_dModel.t_IrTy) -> ((Base_dCommon.v_bind (((v_externTyIr (mc0 - 1)) (mc1 + 1)) ((Core_dEval.v_applyClosure dtb__395) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__391, mc1, B_dData_dList.C_List_Nil))))))) (fun (resIr : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (v_externDomIr mc2))
))

# 1217 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerExternTy = (fun (ty : Core_dTerm.t_Term) -> (((v_externTyIr 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) ty)))

# 1194 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDef = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__396) -> (match (v_lowerExternTy (Elab_dTypes.v_dtDefType d)) with
  | Base_dDiag.C_Check_ErrC (dtb__397) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__397)))
  | Base_dDiag.C_Check_OkC (dtb__398) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef ((Elab_dTypes.v_dtDefName d), dtb__398, dtb__396, (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> (let defTy = (B_dData_dMaybe.C_Maybe_Just ((((((Lowering_dTy.v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d))))) in (let nd_uscrut7 = ((((v_lowerDefBodyTerm env) st) dtb__399) defTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_OkC (dtb__400) -> (match dtb__400 with
  | { B_dData_dPair.f_Pair_first = dtb__401; B_dData_dPair.f_Pair_second = dtb__402 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef ((Elab_dTypes.v_dtDefName d), (v_runtimeArityIn dtb__399), ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)), defTy, dtb__401, (v_recursiveValueAllowedIn dtb__399), ((((v_initGuardOf env) false) (Elab_dTypes.v_dtDefName d)) dtb__399), (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = dtb__402 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__403) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__403)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1249 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerDefs = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> ((Base_dCommon.v_bind (((v_lowerDef mc0) mc1) dtb__404)) (fun (p : (Vuna_dIr_dModel.t_IrDef, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__406; B_dData_dPair.f_Pair_second = dtb__407 } -> ((Base_dCommon.v_bind (((v_lowerDefs mc0) dtb__407) dtb__405)) (fun (q : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__406, dtb__408)); B_dData_dPair.f_Pair_second = dtb__409 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Lowering/Program.vuna"
let v_nameKey = (fun (raw : string) (encoded : string) -> { B_dData_dPair.f_Pair_first = (Base_dSource.v_prefixOfName raw); B_dData_dPair.f_Pair_second = encoded })

# 1274 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_checkNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__410, dtb__411) -> (match dtb__410 with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (let key = (String.concat "" [dtb__412; "\t"; dtb__413]) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc2) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml name collision among "; mc0; "s in module `"; dtb__412; "`: `"; dtb__413; "`"])) else (((v_checkNoDupOcamlNamesGo mc0) dtb__411) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) true) mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkNoDupOcamlNames = (fun (kind : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkNoDupOcamlNamesGo kind) keys) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 1284 "Vuna/Compiler/Lowering/Program.vuna"
let v_ensureUniqueOcamlNamesIn = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtime = (Lowering_dEnv.v_rtDatasOf datas) in (let unboxed = (Elab_dRepresentation.v_unboxedFamilySet runtime) in (let valueKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> ((v_nameKey (Elab_dTypes.v_dtDefName d)) (Vuna_dTarget_dOcaml_dDecl.v_valueName (Elab_dTypes.v_dtDefName d))))) defs) in (let typeKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> ((v_nameKey (Elab_dTypes.v_dtDataName d)) (Vuna_dTarget_dOcaml_dDecl.v_typeName (Elab_dTypes.v_dtDataName d))))) runtime) in (let ctorKeys = ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) unboxed) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> ((v_nameKey (Elab_dTypes.v_dtCtorFamily c)) ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Elab_dTypes.v_dtCtorFamily c)) (Elab_dTypes.v_dtCtorName c))))) (Elab_dTypes.v_dtDataCtors d))))) runtime) in ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "value") valueKeys)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "type") typeKeys)) (fun (_u : int) -> ((v_checkNoDupOcamlNames "constructor") ctorKeys)))))))))))

# 1301 "Vuna/Compiler/Lowering/Program.vuna"
let v_prepareProgram = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let table = (Lowering_dChecks.v_defTable defs) in (let familyNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas) in (let axiomNames = (Lowering_dChecks.v_axiomNamesOf defs) in (match ((Lowering_dChecks.v_partitionDefs table) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__414; B_dData_dPair.f_Pair_second = dtb__415 } -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb__414) in (let familyTypeNames = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) runtimeNames)))) familyNames) in (let allTypeNames = ((B_dData_dList.v_append dtb__415) familyTypeNames) in ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkNoAxiomRuntime axiomNames) dtb__414)) (fun (_u : int) -> ((Base_dCommon.v_bind (Lowering_dChecks.v_checkAllDefScopes defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_ensureUniqueOcamlNamesIn datas) dtb__414)) (fun (_u : int) -> ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkAllErasure allTypeNames) dtb__414)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (dtb__414)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1343 "Vuna/Compiler/Lowering/Program.vuna"
let v_tblLookup = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 1346 "Vuna/Compiler/Lowering/Program.vuna"
let v_recOkOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match (Elab_dTypes.v_dtDefBody dtb__416) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__417) -> (v_recursiveValueAllowedIn dtb__417)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Lowering/Program.vuna"
let v_spanOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (Elab_dTypes.v_dtDefSpan dtb__418)
  | _ -> failwith "DT: impossible branch"
))

# 1384 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_mapMaybeDef = (fun (mc0 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__419, dtb__420) -> (match ((v_tblLookup mc0) dtb__419) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybeDef mc0) dtb__420)
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (B_dData_dList.C_List__x58__x58_ (dtb__421, ((v_mapMaybeDef mc0) dtb__420)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appendGroups = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__422, dtb__423) -> (let isRec = (B_dData_dPair.v_firstOf dtb__422) in (let members = (B_dData_dPair.v_secondOf dtb__422) in (let defs = ((v_mapMaybeDef (mc0).Lowering_dEnv.f_LwEnv_lwDefTbl) members) in ((Base_dCommon.v_bind (((v_lowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__424; B_dData_dPair.f_Pair_second = dtb__425 } -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb__424)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_appendGroups mc0) dtb__425) dtb__423)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__426; B_dData_dPair.f_Pair_second = dtb__427 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isRec; B_dData_dPair.f_Pair_second = dtb__424 }, dtb__426)); B_dData_dPair.f_Pair_second = dtb__427 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1403 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ivarBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dIntrinsics.t_IType) -> (match mc1 with
  | Base_dIntrinsics.C_IType_IPi (dtb__428, dtb__429) -> ((v_ivarBound (B_dData_dList.C_List__x58__x58_ (dtb__428, mc0))) dtb__429)
  | Base_dIntrinsics.C_IType_IVar (dtb__430) -> ((B_dData_dList.v_memName dtb__430) mc0)
  | Base_dIntrinsics.C_IType_IFun1 (dtb__431, dtb__432) -> (if ((v_ivarBound mc0) dtb__431) then ((v_ivarBound mc0) dtb__432) else false)
  | Base_dIntrinsics.C_IType_IFun (dtb__433, dtb__434) -> (if ((v_ivarBound mc0) dtb__433) then ((v_ivarBound mc0) dtb__434) else false)
  | Base_dIntrinsics.C_IType_IEff (dtb__435) -> ((v_ivarBound mc0) dtb__435)
  | Base_dIntrinsics.C_IType_IMBuffer -> true
  | Base_dIntrinsics.C_IType_IMArray (dtb__436) -> ((v_ivarBound mc0) dtb__436)
  | Base_dIntrinsics.C_IType_ICell (dtb__437) -> ((v_ivarBound mc0) dtb__437)
  | Base_dIntrinsics.C_IType_IRef (dtb__438) -> ((v_ivarBound mc0) dtb__438)
  | Base_dIntrinsics.C_IType_IArray (dtb__439) -> ((v_ivarBound mc0) dtb__439)
  | Base_dIntrinsics.C_IType_IList (dtb__440) -> ((v_ivarBound mc0) dtb__440)
  | Base_dIntrinsics.C_IType_IGlobal (dtb__441) -> true
  | Base_dIntrinsics.C_IType_IFloat -> true
  | Base_dIntrinsics.C_IType_INat -> true
  | Base_dIntrinsics.C_IType_IBool -> true
  | Base_dIntrinsics.C_IType_IStr -> true
  | Base_dIntrinsics.C_IType_IInt -> true
  | Base_dIntrinsics.C_IType_ITy -> true
  | _ -> failwith "DT: impossible branch"
))

# 1423 "Vuna/Compiler/Lowering/Program.vuna"
let v_intrinsicWithUnboundIvar = (fun (is : Base_dIntrinsics.t_Intrinsic B_dData_dList.t_List) -> ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) ((B_dData_dList.v_filter (fun (i : Base_dIntrinsics.t_Intrinsic) -> (B_dData_dBool.v_not ((v_ivarBound B_dData_dList.C_List_Nil) (Base_dIntrinsics.v_intrinsicSignature i))))) is)))

# 1457 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstOfList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__442, dtb__443) -> dtb__442
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1430 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkRuntimeContract = (let intrinsicNames = ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) Base_dIntrinsics.v_allIntrinsics) in (let contractNames = Vuna_dIr_dRuntime.v_irRtNames in (let badIvars = (v_intrinsicWithUnboundIvar Base_dIntrinsics.v_allIntrinsics) in (let missingFromContract = ((B_dData_dList.v_filter (fun (n : string) -> (if (n = Base_dIntrinsics.v_primEffBind1Name) then false else (if ((B_dData_dList.v_memName n) contractNames) then false else true)))) intrinsicNames) in (let extrasInContract = ((B_dData_dList.v_filter (fun (n : string) -> (if ((B_dData_dList.v_memName n) intrinsicNames) then false else (if ((B_dData_dList.v_memName n) Vuna_dIr_dRuntime.v_irRtSyntheticNames) then false else true)))) contractNames) in (if ((Lowering_dEnv.v_listLength badIvars) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["intrinsic `"; (v_firstOfList badIvars); "` has an unbound type variable in its signature"])) else (if ((Lowering_dEnv.v_listLength missingFromContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_firstOfList missingFromContract); "`"])) else (if ((Lowering_dEnv.v_listLength extrasInContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_firstOfList extrasInContract); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras); "`"])) else (Base_dDiag.C_Check_OkC (0))))))))))))

# 1395 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkProgramOf = (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((v_prepareProgram (env).Lowering_dEnv.f_LwEnv_lwDatas) (env).Lowering_dEnv.f_LwEnv_lwOrigDefs)) (fun (_u : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> v_checkRuntimeContract)))

# 1511 "Vuna/Compiler/Lowering/Program.vuna"
let v_adjOfDef = (fun (env : Lowering_dEnv.t_LwEnv) (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)) })

# 1324 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupDefs = (fun (env : Lowering_dEnv.t_LwEnv) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let adj = ((B_dData_dList.v_map (v_adjOfDef env)) defs) in (let names = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs) in (let tbl = (Lowering_dEnv.v_defTblOf defs) in ((Base_dCommon.v_bind ((((Vuna_dIr_dAnalysis.v_assembleGroupNames adj) names) (v_recOkOfTbl tbl)) (v_spanOfTbl tbl))) (fun (groups : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_appendGroups env) { f_LwSt_lwNext = 0; f_LwSt_lwBinder = 1 }) groups)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (Base_dDiag.C_Check_OkC (dtb__444))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1514 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupOfPair = (fun (mc0 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__446; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__447 }
  | _ -> failwith "DT: impossible branch"
))

# 1537 "Vuna/Compiler/Lowering/Program.vuna"
let v_partitionRuntimeDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> dtb__448
  | _ -> failwith "DT: impossible branch"
))

# 1495 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitPrepared = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let datas = (env).Lowering_dEnv.f_LwEnv_lwDatas in (let runtime = (v_partitionRuntimeDefs defs) in ((Base_dCommon.v_bind ((v_groupDefs env) runtime)) (fun (groups : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((Lowering_dTy.v_tyDeclsOf (env).Lowering_dEnv.f_LwEnv_lwDataTbl) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (let groups2 = ((B_dData_dList.v_map v_groupOfPair) groups) in (let hasList = ((Lowering_dEnv.v_hasDataNamed Base_dIntrinsics.v_listFamilyName) unitDatas) in (Base_dDiag.C_Check_OkC ((Vuna_dIr_dDispatch.v_dispatchIdsUnit ((Vuna_dIr_dRepresent.v_representUnit (Lowering_dEnv.v_lwEnvShared env)) { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = decls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups2; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasList; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (Lowering_dTy.v_tyDeclRefs decls); Vuna_dIr_dModel.f_IrUnit_irUnitEntry = B_dData_dMaybe.C_Maybe_Nothing })))))))))))))

# 1472 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitCheckedFrom = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerUnitPrepared env) unitDatas) defs)) (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Lowering.Program") then (((dtp_log_emit 2) "Vuna.Compiler.Lowering.Program") "cg-unit-validate-start") else 0) in ((Base_dCommon.v_bind ((Vuna_dIr_dValidate.v_validateUnit (Lowering_dEnv.v_lwEnvShared env)) u)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (u))))))))

# 1484 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitAfterChecks = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> (let defNameTbl = (B_dContainer_dHashMap.v_ofNames defNames) in (let defs = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName d)) defNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDefs) in (let dataNameTbl = (B_dContainer_dHashMap.v_ofNames dataNames) in (let unitDatas = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName d)) dataNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDatas) in (((v_lowerUnitPrepared env) unitDatas) defs))))))

# 1464 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitOf = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkProgramOf env)) (fun (_u : int) -> (((v_lowerUnitAfterChecks env) defNames) dataNames))))

# 1522 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.env") (fun (_u : int) -> ((((Lowering_dEnv.v_mkLwEnv datas) defs) globals) "")))) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_checkProgramOf env)))) (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_lowerUnitAfterChecks env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.entry") (fun (_u : int) -> (Lowering_dEntry.v_lowerEntryOf (env).Lowering_dEnv.f_LwEnv_lwDefs)))) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrProgram_irProgShared = (Lowering_dEnv.v_lwEnvShared env); Vuna_dIr_dModel.f_IrProgram_irProgUnit = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry } })))))))))))

# 1529 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramCheckedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerProgramOf datas) defs) globals)) (fun (program : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind (Vuna_dIr_dValidate.v_validateProgram program)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (program)))))))
