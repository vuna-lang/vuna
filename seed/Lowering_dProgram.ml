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

# 217 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBridgeGuard = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) (ir : Vuna_dIr_dModel.t_Ir) -> (if (Vuna_dIr_dRuntime.v_irRtBridgesList name) then (if (env).Lowering_dEnv.f_LwEnv_lwHasListFamily then (Base_dDiag.C_Check_OkC (ir)) else ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_ListBridgeRequired (name))) name)) else (Base_dDiag.C_Check_OkC (ir))))

# 224 "Vuna/Compiler/Lowering/Program.vuna"
let v_effUnitTyIn = (Vuna_dIr_dModel.C_IrTy_IrTyData (Base_dIntrinsics.v_effUnitTypeName, B_dData_dList.C_List_Nil))

# 192 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerGlobalRef = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) -> (if (name = Base_dIntrinsics.v_natZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (name = Base_dIntrinsics.v_finZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (name = "strFromFloat") then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (Lowering_dEnv.v_floatRenderRefName)))) else (if (name = Base_dIntrinsics.v_natSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (if (name = Base_dIntrinsics.v_finSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (if (name = Base_dIntrinsics.v_finToNatName) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt ("natToInt")))) else (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
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
)))))))))

# 240 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_collectLamChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (let p = (v_collectLamChainIn dtb__23) in (let result = (match (p).f_LamChainIn_lamChainResultTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (p).f_LamChainIn_lamChainResultTy
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_lamResultTyOf dtb__21)
  | _ -> failwith "DT: impossible branch"
) in { f_LamChainIn_lamChainBinders = (B_dData_dList.C_List__x58__x58_ ({ f_LamParam_lamParamName = dtb__19; f_LamParam_lamParamRig = dtb__20; f_LamParam_lamParamTy = (Core_dTerm.v_lamBinderTyOf dtb__21) }, (p).f_LamChainIn_lamChainBinders)); f_LamChainIn_lamChainBody = (p).f_LamChainIn_lamChainBody; f_LamChainIn_lamChainResultTy = result }))
  | _ -> { f_LamChainIn_lamChainBinders = B_dData_dList.C_List_Nil; f_LamChainIn_lamChainBody = mc0; f_LamChainIn_lamChainResultTy = B_dData_dMaybe.C_Maybe_Nothing }
))

# 318 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countRuntimeParams = (fun (mc0 : t_LamParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if (Core_dTerm.v_rigIsErased (dtb__25).f_LamParam_lamParamRig) then (v_countRuntimeParams dtb__26) else (1 + (v_countRuntimeParams dtb__26)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_sigArrowTys = (fun (fuel : int) (ty : Vuna_dIr_dModel.t_IrTy) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ty with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__27, dtb__28) -> (match ((v_sigArrowTys (fuel - 1)) dtb__28) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__29))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
)))

# 342 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_headGlobalOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__30, dtb__31) -> (B_dData_dMaybe.C_Maybe_Just (dtb__30))
  | Core_dTerm.C_Term_TApp (dtb__32, dtb__33, dtb__34) -> (v_headGlobalOf dtb__32)
  | Core_dTerm.C_Term_TGlobal (dtb__35) -> (B_dData_dMaybe.C_Maybe_Just (dtb__35))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 336 "Vuna/Compiler/Lowering/Program.vuna"
let v_effResultTyOf = (fun (t : Core_dTerm.t_Term) -> (match (v_headGlobalOf t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (if (dtb__36 = Vuna_dIr_dModel.v_irEffTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (Vuna_dIr_dModel.v_irEffTypeName, (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, B_dData_dList.C_List_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderOfParam = (fun (env : Lowering_dEnv.t_LwEnv) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (id : int) (p : t_LamParam) -> (if (Core_dTerm.v_rigIsErased (p).f_LamParam_lamParamRig) then Vuna_dIr_dModel.v_mkIrBinderErased else (match (p).f_LamParam_lamParamTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Vuna_dIr_dModel.v_mkIrBinderOpaque id) (p).f_LamParam_lamParamName)
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (((Vuna_dIr_dModel.v_mkIrBinderTyped id) (p).f_LamParam_lamParamName) (((Lowering_dTy.v_annotTyOfTotal env) outer) dtb__37))
  | _ -> failwith "DT: impossible branch"
)))

# 361 "Vuna/Compiler/Lowering/Program.vuna"
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

# 430 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) -> (let nd_uscrut3 = (((Lowering_dTy.v_annotRunCalleeTy env) binders) f) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> (match dtb__45 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__46, dtb__47) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__47 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 437 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOfIr = (fun (ir : Vuna_dIr_dModel.t_Ir) -> (let nd_uscrut1 = (Vuna_dIr_dModel.v_irResultTyOf ir) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match dtb__48 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__49, dtb__50) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__50 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 443 "Vuna/Compiler/Lowering/Program.vuna"
let v_justAppTy = (fun (mc0 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__51) -> (B_dData_dMaybe.C_Maybe_Just (dtb__51))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque }))
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyFrom = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (irF : Vuna_dIr_dModel.t_Ir) -> (match (((v_appTyOf env) binders) f) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dMaybe.C_Maybe_Just (dtb__52))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_appTyOfIr irF)
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Lowering/Program.vuna"
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

# 516 "Vuna/Compiler/Lowering/Program.vuna"
let v_concatLeavesIn = (fun (t : Core_dTerm.t_Term) -> ((v_concatLeavesGo t) B_dData_dList.C_List_Nil))

# 506 "Vuna/Compiler/Lowering/Program.vuna"
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

# 544 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__70)) then (v_allRuntimeArgs dtb__68) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenIntrinsicAppIn = (fun (t : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> (if (v_allRuntimeArgs dtb__72) then (match dtb__71 with
  | Core_dTerm.C_Term_TGlobal (dtb__73) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb__73) > 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__72 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Lowering/Program.vuna"
let v_inlineArityMatchesIn = (fun (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((Vuna_dIr_dModel.v_irInlineArity name) <= 0) then false else ((Lowering_dEnv.v_listLength args) = (Vuna_dIr_dModel.v_irInlineArity name))))

# 557 "Vuna/Compiler/Lowering/Program.vuna"
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

# 599 "Vuna/Compiler/Lowering/Program.vuna"
let v_ctorArgIr = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc1 : bool) (mc2 : Vuna_dIr_dModel.t_Ir) -> (if mc1 then (Vuna_dIr_dModel.C_Ir_IrCast (mc0, (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)), mc2)) else mc2))

# 604 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_ctorOpaqueKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if dtb__82 then (B_dData_dList.C_List__x58__x58_ (dtb__84, ((v_ctorOpaqueKeptFlags dtb__83) dtb__85))) else ((v_ctorOpaqueKeptFlags dtb__83) dtb__85))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 701 "Vuna/Compiler/Lowering/Program.vuna"
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

# 685 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerConAppFinish = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (family : string) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (irs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) family) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (let recTy = (match (((Lowering_dTy.v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (family, dtb__93))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind ((v_zipFieldNames dtb__92) irs)) (fun (pairs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (family, recTy, pairs)); B_dData_dPair.f_Pair_second = st })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (family, c, (((Lowering_dTy.v_ctorTypeArgsOf env) c) args), irs)); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnvOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__94; f_AltEnvIn_aePats = dtb__95; f_AltEnvIn_aeSt = dtb__96 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePatsOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__97; f_AltEnvIn_aePats = dtb__98; f_AltEnvIn_aeSt = dtb__99 } -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeStOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__100; f_AltEnvIn_aePats = dtb__101; f_AltEnvIn_aeSt = dtb__102 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countKept = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if dtb__103 then (1 + (v_countKept dtb__104)) else (v_countKept dtb__104))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvGo = (fun (mc0 : t_LwSt) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> (if (Core_dTerm.v_rigIsErased dtb__108) then ((((v_altEnvGo mc0) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc1))) dtb__106) mc3) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in ((((v_altEnvGo { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) (B_dData_dList.C_List__x58__x58_ (b, mc1))) dtb__106) (B_dData_dList.C_List__x58__x58_ (b, mc3)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_AltEnvIn_aeEnv = mc1; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc3); f_AltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvIn = (fun (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_altEnvGo st) outer) tele) B_dData_dList.C_List_Nil))

# 760 "Vuna/Compiler/Lowering/Program.vuna"
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

# 781 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvKeptIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (if (Core_dTerm.v_rigIsErased dtb__120) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in (((((v_altEnvKeptIn { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__118) (B_dData_dList.C_List__x58__x58_ (b, mc4)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc4); f_AltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvCheckedIn = (fun (st : t_LwSt) (label : string) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (flags : bool B_dData_dList.t_List) -> (if ((Lowering_dEnv.v_listLength binders) = (Lowering_dEnv.v_listLength flags)) then ((((((v_altEnvFullIn st) label) outer) binders) flags) B_dData_dList.C_List_Nil) else (if ((Lowering_dEnv.v_listLength binders) = (v_countKept flags)) then (((((v_altEnvKeptIn st) label) outer) binders) B_dData_dList.C_List_Nil) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 794 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderWithTy = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (b : Vuna_dIr_dModel.t_IrBinder) -> (if (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased then { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = true; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing } else { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (v_justTy ty) }))

# 801 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_typedPats = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (B_dData_dList.C_List__x58__x58_ (((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__121))) dtb__123), ((v_typedPats dtb__122) dtb__124)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Lowering/Program.vuna"
let v_typedPatsAll = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (b : Vuna_dIr_dModel.t_IrBinder) -> ((v_binderWithTy ty) b))) bs))

# 811 "Vuna/Compiler/Lowering/Program.vuna"
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

# 832 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupArmTy = (fun (mc0 : int) (mc1 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (if (dtb__131 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__132)) else ((v_lookupArmTy mc0) dtb__130))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 823 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagArmBinder = (fun (tbl : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Vuna_dIr_dModel.t_IrBinder) -> (match (b).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__133) -> (match ((v_lookupArmTy dtb__133) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> ((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__134))) b)
  | B_dData_dMaybe.C_Maybe_Nothing -> b
  | _ -> failwith "DT: impossible branch"
)
  | _ -> b
))

# 836 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_retagArmEnv = (fun (mc0 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (B_dData_dList.C_List__x58__x58_ (((v_retagArmBinder mc0) dtb__135), ((v_retagArmEnv mc0) dtb__136)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagAltEnv = (fun (mc0 : t_AltEnvIn) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__137; f_AltEnvIn_aePats = dtb__138; f_AltEnvIn_aeSt = dtb__139 } -> { f_AltEnvIn_aeEnv = ((v_retagArmEnv (v_armTyTblOf mc1)) dtb__137); f_AltEnvIn_aePats = mc1; f_AltEnvIn_aeSt = dtb__139 }
  | _ -> failwith "DT: impossible branch"
))

# 847 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_hasFallbackAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (if ((Core_dTerm.v_caseAltName dtb__140) = "") then true else (v_hasFallbackAlt dtb__141))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allCatchAll = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if ((Core_dTerm.v_caseAltName dtb__142) = "") then (v_allCatchAll dtb__143) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Lowering/Program.vuna"
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

# 904 "Vuna/Compiler/Lowering/Program.vuna"
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

# 978 "Vuna/Compiler/Lowering/Program.vuna"
let v_isNatCtorName = (fun (name : string) -> (if (if (if (name = Base_dIntrinsics.v_natZeroCtor) then true else (name = Base_dIntrinsics.v_natSuccCtor)) then true else (name = Base_dIntrinsics.v_finZeroCtor)) then true else (name = Base_dIntrinsics.v_finSuccCtor)))

# 986 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseAllCtors = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if ((Core_dTerm.v_caseAltName dtb__152) = "") then (v_natCaseAllCtors dtb__153) else (let name = (Core_dTerm.v_caseAltName dtb__152) in (if (v_isNatCtorName name) then (v_natCaseAllCtors dtb__153) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseHasCtor = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if ((Core_dTerm.v_caseAltName dtb__154) = "") then (v_natCaseHasCtor dtb__155) else true)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 982 "Vuna/Compiler/Lowering/Program.vuna"
let v_natCaseApplies = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> (if (v_natCaseAllCtors mc0) then (v_natCaseHasCtor mc0) else false)
))

# 1000 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findAltBy = (fun (mc0 : string) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if ((Core_dTerm.v_caseAltName dtb__156) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__156)) else ((v_findAltBy mc0) dtb__157))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstAltOf = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) (mc1 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (B_dData_dMaybe.C_Maybe_Just (dtb__158))
  | _ -> failwith "DT: impossible branch"
))

# 1009 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findCatchAllAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (if ((Core_dTerm.v_caseAltName dtb__159) = "") then (B_dData_dMaybe.C_Maybe_Just (dtb__159)) else (v_findCatchAllAlt dtb__160))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1098 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordProjVarIn = (fun (i : int) -> ("@vuna@record@proj" ^ (string_of_int i)))

# 1101 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_projBindersIn = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_recordProjVarIn mc1); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__161) }, ((v_projBindersIn dtb__162) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1108 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (if (dtb__165 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__166)) else ((v_lookupRtLabelIn mc0) dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__167 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (if (dtb__169 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_lookupRtPosIn mc0) dtb__168) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPositionsIn = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match (((v_lookupRtPosIn dtb__171) mc0) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn mc0) dtb__172)) (fun (ps : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__173 }, ps))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["record update targets field index "; (string_of_int dtb__171); ", which has no runtime field"]))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1125 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthOpqArgIn = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (match dtb__176 with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__178)) else (((v_nthOpqArgIn (mc0 - 1)) dtb__175) dtb__177))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1136 "Vuna/Compiler/Lowering/Program.vuna"
let v_eraseTele = (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> Vuna_dIr_dModel.v_mkIrBinderErased)

# 1133 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordAltBindersIn = (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_eraseTele) tele))) binders))

# 80 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerTermFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__180, dtb__181, dtb__182) -> (match ((v_runtimeBinderAt dtb__181) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (if (v_binderErasedOf dtb__183) then (Base_dDiag.v_icInternal (String.concat "" ["erased binder "; dtb__180; ": runtime idx "; (string_of_int dtb__181); " of "; (string_of_int (Lowering_dEnv.v_listLength binders)); " binders"])) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb__183)); B_dData_dPair.f_Pair_second = st })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__184) -> ((Base_dCommon.v_bind ((v_lowerGlobalRef env) dtb__184)) (fun (ir : Vuna_dIr_dModel.t_Ir) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = st }))))
  | Core_dTerm.C_Term_TInt (dtb__185) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__185)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TStr (dtb__186) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb__186)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TFloat (dtb__187) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__187)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TBool (dtb__188) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb__188)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TIf (dtb__189, dtb__190, dtb__191) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__189)) (fun (pc : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__193) binders) dtb__190)) (fun (pt : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__195) binders) dtb__191)) (fun (pe : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb__192, dtb__194, dtb__196)); B_dData_dPair.f_Pair_second = dtb__197 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Core_dTerm.C_Term_TLam (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (((((((((v_lowerLamFuel (fuel - 1)) env) st) binders) dtb__198) dtb__199) dtb__200) dtb__201) dtb__202)
  | Core_dTerm.C_Term_TApp (dtb__203, dtb__204, dtb__205) -> (((((((v_lowerAppFuel (fuel - 1)) env) st) binders) dtb__203) dtb__204) dtb__205)
  | Core_dTerm.C_Term_TCon (dtb__206, dtb__207) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__206) dtb__207)
  | Core_dTerm.C_Term_TMk (dtb__208, dtb__209) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__208) dtb__209)
  | Core_dTerm.C_Term_TRecord (dtb__210, dtb__211) -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) ((v_recordTermAsAppIn (Core_dTerm.C_Term_TGlobal (dtb__210))) dtb__211))
  | Core_dTerm.C_Term_TCase (dtb__212, dtb__213) -> ((((((v_lowerCaseFuel (fuel - 1)) env) st) binders) dtb__212) dtb__213)
  | Core_dTerm.C_Term_TRecUpd (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__215) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__219) -> ((((((((((v_lowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__214) dtb__215) dtb__216) dtb__219) dtb__217) dtb__218)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TCase (dtb__214, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__215; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__216); Core_dTerm.f_CaseAlt_caseAltBody = dtb__218 }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TProj (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__221) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> ((Base_dCommon.v_bind ((v_recordFieldNameAt dtb__224) dtb__225)) (fun (label : string) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__220)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) dtb__221)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let args = (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) binders) dtb__220)) in (let resTy = (match (((v_lookupRtPosIn dtb__224) dtb__225) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> ((Vuna_dIr_dModel.v_irTyAt ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars args)) fieldTys)) dtb__228)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb__226, dtb__221, label, (v_justTy resTy))); B_dData_dPair.f_Pair_second = dtb__227 }))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_lowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__220) dtb__221) dtb__222) dtb__223) dtb__224)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TType (dtb__234) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb__235) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((Lowering_dChecks.v_showMetaHint dtb__235)))) (Lowering_dChecks.v_showMetaHint dtb__235))
  | _ -> failwith "DT: impossible branch"
)))
# 251 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (name : string) (rig : Core_dTerm.t_Rig) (slot : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (sp : Base_dSource.t_Span) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (v_collectLamChainIn (Core_dTerm.C_Term_TLam (name, rig, slot, sp, body))) with
  | { f_LamChainIn_lamChainBinders = dtb__236; f_LamChainIn_lamChainBody = dtb__237; f_LamChainIn_lamChainResultTy = dtb__238 } -> ((((((((v_lowerLamChainFuel fuel) env) st) binders) B_dData_dList.C_List_Nil) dtb__236) dtb__237) dtb__238)
  | _ -> failwith "DT: impossible branch"
)))
# 261 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (hints : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (params : t_LamParam B_dData_dList.t_List) (inner : Core_dTerm.t_Term) (resultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let pb = (((((v_bindersOfParamsHint env) binders) hints) (st).f_LwSt_lwBinder) params) in (let bs = (B_dData_dPair.v_firstOf pb) in (let stIds = { f_LwSt_lwNext = (st).f_LwSt_lwNext; f_LwSt_lwBinder = (B_dData_dPair.v_secondOf pb) } in (let envB = ((B_dData_dList.v_append (B_dData_dList.v_reverse bs)) binders) in (let resultIr = (match resultTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> (match (((Lowering_dTy.v_annotTyOf env) envB) dtb__242) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (B_dData_dMaybe.C_Maybe_Just (dtb__243))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effResultTyOf dtb__242)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) stIds) envB) inner)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__239; B_dData_dPair.f_Pair_second = dtb__240 } -> (let resultIr2 = (match resultIr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__241) -> resultIr
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_irResultTyOf dtb__239)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_filter (fun (x : Vuna_dIr_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErasedOf x)))) bs), (v_justTy resultIr2), dtb__239)); B_dData_dPair.f_Pair_second = dtb__240 })))
  | _ -> failwith "DT: impossible branch"
))))))))))
# 388 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased rig) then (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f) else (let nd_uscrut7 = (Lowering_dChecks.v_flattenConApp (Core_dTerm.C_Term_TApp (f, a, rig))) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_flattenConcatChainIn (Core_dTerm.C_Term_TApp (f, a, rig))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (if ((Lowering_dEnv.v_listLength dtb__244) >= 3) then ((Base_dCommon.v_bind (((((v_lowerTermsFuel (fuel - 1)) env) st) binders) dtb__244)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__245)); B_dData_dPair.f_Pair_second = dtb__246 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match dtb__247 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__248) dtb__249)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 410 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerPlainAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TApp (dtb__250, dtb__251, dtb__252) -> (let nd_uscrut8 = (v_flattenIntrinsicAppIn t) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__250) dtb__251) dtb__252)
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (match dtb__253 with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> (if ((v_inlineArityMatchesIn dtb__254) dtb__255) then ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__255)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__257 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__254, dtb__256)); B_dData_dPair.f_Pair_second = dtb__257 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__250) dtb__251) dtb__252))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dDiag.v_icInternal "lowerPlainApp expects an application")
)))
# 453 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFallbackFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pf with
  | { B_dData_dPair.f_Pair_first = dtb__258; B_dData_dPair.f_Pair_second = dtb__259 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__259) binders) a)) (fun (pa : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__260; B_dData_dPair.f_Pair_second = dtb__261 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy ((((v_appTyFrom env) binders) f) dtb__258)), dtb__258, dtb__260)); B_dData_dPair.f_Pair_second = dtb__261 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 469 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb__265) then (Base_dDiag.v_icInternal "erased argument in inlined builtin application") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__264)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (mc0 - 1)) mc1) dtb__267) mc3) dtb__263)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__268)); B_dData_dPair.f_Pair_second = dtb__269 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 488 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerTermsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__270, dtb__271) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__270)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__272; B_dData_dPair.f_Pair_second = dtb__273 } -> ((Base_dCommon.v_bind (((((v_lowerTermsFuel (mc0 - 1)) mc1) dtb__273) mc3) dtb__271)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__274)); B_dData_dPair.f_Pair_second = dtb__275 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (match dtb__278 with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__280)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (mc0 - 1)) mc1) dtb__283) mc3) dtb__277) dtb__279)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((((v_ctorArgIr (((Lowering_dTy.v_annotRunTyOf mc1) mc3) dtb__280)) dtb__276) dtb__282), dtb__284)); B_dData_dPair.f_Pair_second = dtb__285 }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__286, dtb__287) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than runtime arguments")
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 610 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (Core_dTerm.v_natChainValue (Core_dTerm.C_Term_TCon (c, args))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__288) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__288)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_lowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 619 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppNonChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (c = Base_dIntrinsics.v_natZeroCtor) then (match (((v_alignCtorArgs c) B_dData_dList.C_List_Nil) args) with
  | Base_dDiag.C_Check_ErrC (dtb__289) -> (Base_dDiag.C_Check_ErrC (dtb__289))
  | Base_dDiag.C_Check_OkC (dtb__290) -> (match dtb__290 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__291) -> (Base_dDiag.C_Check_ErrC (dtb__291))
  | Base_dDiag.C_Check_OkC (dtb__292) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__292)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (match dtb__293 with
  | B_dData_dList.C_List__x58__x58_ (dtb__295, dtb__296) -> (match dtb__296 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__295)); B_dData_dPair.f_Pair_second = dtb__294 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_finZeroCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__297) -> (Base_dDiag.C_Check_ErrC (dtb__297))
  | Base_dDiag.C_Check_OkC (dtb__298) -> (match dtb__298 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Fin FZero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_finSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (false, (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__299) -> (Base_dDiag.C_Check_ErrC (dtb__299))
  | Base_dDiag.C_Check_OkC (dtb__300) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__300)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__301; B_dData_dPair.f_Pair_second = dtb__302 } -> (match dtb__301 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (match dtb__304 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__303)); B_dData_dPair.f_Pair_second = dtb__302 }))
  | _ -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (match dtb__305 with
  | { B_dData_dPair.f_Pair_first = dtb__306; B_dData_dPair.f_Pair_second = dtb__307 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__307) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) ((v_ctorOpaqueKeptFlags dtb__307) dtb__308)) runtimeArgs)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = dtb__310 } -> ((((((v_lowerConAppFinish env) dtb__310) dtb__306) c) args) dtb__309)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))))))
# 844 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmBodyFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (body : Core_dTerm.t_Term) -> (((((v_lowerTermFuel fuel) env) (v_aeStOf bound)) (v_aeEnvOf bound)) body))
# 917 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (let bound = (((v_altEnvIn st) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) in (let typed = ((v_typedPatsAll scrutTy) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__311 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__311) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__312 } }))
  | _ -> failwith "DT: impossible branch"
)))))) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Core_dTerm.v_caseAltName alt)) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> (match dtb__313 with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn st) (Core_dTerm.v_caseAltName alt)) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__315)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) (Core_dTerm.v_caseAltName alt))) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf scrutTy))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = dtb__317 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = (Core_dTerm.v_caseAltName alt) })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__316 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__316) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__317 } }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ (Core_dTerm.v_caseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
# 951 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc3 : t_LwSt) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc5 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind ((((((v_lowerArmFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__318)) (fun (p : (Vuna_dIr_dModel.t_IrAlt, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> (match dtb__321 with
  | { B_dData_dPair.f_Pair_first = dtb__322; B_dData_dPair.f_Pair_second = dtb__323 } -> ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (mc0 - 1)) mc1) mc2) dtb__323) mc4) dtb__319)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__324; B_dData_dPair.f_Pair_second = dtb__325 } -> (match dtb__325 with
  | { B_dData_dPair.f_Pair_first = dtb__326; B_dData_dPair.f_Pair_second = dtb__327 } -> (let resultTy = (match dtb__322 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> dtb__322
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__326
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__324)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__327 } })))
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
# 1014 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatAltFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__329) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let bound = (((v_altEnvIn mc2) mc3) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb__329))) in (let typed = ((v_typedPatsAll (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (mc0 - 1)) mc1) bound2) (Core_dTerm.v_caseAltBody dtb__329))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__330; B_dData_dPair.f_Pair_second = dtb__331 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__330 })); B_dData_dPair.f_Pair_second = dtb__331 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 1030 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = dtb__333 } -> (let fresh = (dtb__333).f_LwSt_lwNext in (let st2 = { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (dtb__333).f_LwSt_lwBinder } in (let zeroAlt = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natZeroCtor) alts)) ((v_findAltBy Base_dIntrinsics.v_finZeroCtor) alts)) in (let succAlt = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natSuccCtor) alts)) ((v_findAltBy Base_dIntrinsics.v_finSuccCtor) alts)) in (let catchAlt = (v_findCatchAllAlt alts) in ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pz with
  | { B_dData_dPair.f_Pair_first = dtb__334; B_dData_dPair.f_Pair_second = dtb__335 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__335) outer) succAlt)) (fun (ps : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match ps with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__337) outer) catchAlt)) (fun (pc : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__332, fresh, dtb__334, dtb__336, dtb__338)); B_dData_dPair.f_Pair_second = dtb__339 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1065 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (v_natCaseApplies alts) then ((((((v_lowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__340; B_dData_dPair.f_Pair_second = dtb__341 } -> (let scrutTy = (((Lowering_dTy.v_annotRunTyOf env) outer) scrut) in ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (fuel - 1)) env) scrutTy) dtb__341) outer) alts)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = q in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 } -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase ((v_justTy scrutTy), (v_justTy dtb__344), dtb__340, dtb__342)); B_dData_dPair.f_Pair_second = dtb__345 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1086 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerProjAsCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let n = (Lowering_dEnv.v_listLength tele) in (let srcIdx = ((n - 1) - fi) in (match ((v_runtimeIndexInPairs srcIdx) tele) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (((((v_lowerTermFuel (fuel - 1)) env) st) outer) (Core_dTerm.C_Term_TCase (base, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = c; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs ((v_projBindersIn tele) 0)); Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TVar ((v_recordProjVarIn fi), dtb__346, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "projection of an erased binder")
  | _ -> failwith "DT: impossible branch"
)))))
# 1139 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (let baseTy = (((Lowering_dTy.v_annotRunTyOf env) outer) base) in (match body with
  | Core_dTerm.C_Term_TMk (dtb__349, dtb__350) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__348) ((v_recordAltBindersIn tele) outer)) dtb__347) baseTy) c) fields) idxs) dtb__350)
  | Core_dTerm.C_Term_TCon (dtb__351, dtb__352) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__348) ((v_recordAltBindersIn tele) outer)) dtb__347) baseTy) c) fields) idxs) dtb__352)
  | _ -> (Base_dDiag.v_icInternal "record update body is not a constructor application")
))
  | _ -> failwith "DT: impossible branch"
)))))
# 1156 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateArgsFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (baseIr : Vuna_dIr_dModel.t_Ir) (baseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c : string) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let nd_uscrut10 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__353) -> (match dtb__353 with
  | { B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__355 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__356) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__355) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn fields) idxs)) (fun (positions : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_ctorOpaqueKeptFlags dtb__355) dtb__356)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (baseIr, c, dtb__357, (v_justTy baseTy))); B_dData_dPair.f_Pair_second = dtb__358 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))
# 1179 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) (mc6 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (((v_nthOpqArgIn (B_dData_dPair.v_secondOf dtb__359)) mc5) mc7) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position out of range")
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__361)) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__363) mc3) mc4) mc5) dtb__360) mc7)) (fun (r : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__365 } -> (match ((v_lookupRtLabelIn (B_dData_dPair.v_firstOf dtb__359)) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__362 }, dtb__364)); B_dData_dPair.f_Pair_second = dtb__365 }))
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

# 294 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDefBodyTerm = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (body : Core_dTerm.t_Term) (defTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (let nd_uscrut4 = (v_collectLamChainIn body) in (match nd_uscrut4 with
  | { f_LamChainIn_lamChainBinders = dtb__367; f_LamChainIn_lamChainBody = dtb__368; f_LamChainIn_lamChainResultTy = dtb__369 } -> (match dtb__367 with
  | B_dData_dList.C_List_Nil -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | _ -> (match defTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (match ((v_sigArrowTys 256) dtb__370) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__371) -> (if ((Lowering_dEnv.v_listLength dtb__371) = (v_countRuntimeParams dtb__367)) then ((((((((v_lowerLamChainFuel (v_lowerBudgetFor (Core_dTerm.v_termSize body))) env) st) B_dData_dList.C_List_Nil) dtb__371) dtb__367) dtb__368) dtb__369) else ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 870 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (Base_dDiag.v_icInternal "unboxed case arm has no constructor") else (let name = (Core_dTerm.v_caseAltName alt) in (let nd_uscrut7 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (match dtb__372 with
  | { B_dData_dPair.f_Pair_first = dtb__373; B_dData_dPair.f_Pair_second = dtb__374 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb__376) name) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__374)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) name)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) outer) scrut)))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (typed, dtb__375, dtb__377)); B_dData_dPair.f_Pair_second = dtb__378 }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
))))))

# 1207 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeArityIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (if (Core_dTerm.v_rigIsErased dtb__380) then (v_runtimeArityIn dtb__383) else (1 + (v_runtimeArityIn dtb__383)))
  | _ -> 0
))

# 1212 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recursiveValueAllowedIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__384, dtb__385) -> true
  | Core_dTerm.C_Term_TLam (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390) -> (if (Core_dTerm.v_rigIsErased dtb__387) then (v_recursiveValueAllowedIn dtb__390) else true)
  | _ -> false
))

# 1219 "Vuna/Compiler/Lowering/Program.vuna"
let v_initGuardOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : bool) (mc2 : string) (mc3 : Core_dTerm.t_Term) -> (if mc1 then false else (if (if (if ((mc0).Lowering_dEnv.f_LwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_runtimeArityIn mc3) = 0) else false) then true else false)))

# 1272 "Vuna/Compiler/Lowering/Program.vuna"
let v_externBasicIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__391) -> (match dtb__391 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__392, dtb__393) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__392) then (match (Lowering_dTy.v_reprTyIr dtb__392) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (Base_dDiag.C_Check_OkC (dtb__394))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("extern type has no runtime representation: " ^ dtb__392))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.v_icInternal ("extern type is not basic: " ^ dtb__392)))
  | _ -> (Base_dDiag.v_icInternal "extern type is not a global type")
)
  | _ -> (Base_dDiag.v_icInternal "extern type is not basic")
))

# 1266 "Vuna/Compiler/Lowering/Program.vuna"
let v_externDomIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__395) -> (match dtb__395 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__396, dtb__397) -> (if (dtb__396 = "Array") then (match dtb__397 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> (match dtb__399 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (v_externBasicIr dtb__398)) (fun (e : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyArray (e))))))
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
)
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
) else (if (dtb__396 = "Array") then (Base_dDiag.v_icInternal "extern Array needs one type argument") else (v_externBasicIr mc0)))
  | _ -> (v_externBasicIr mc0)
)
  | _ -> (v_externBasicIr mc0)
))

# 1254 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_externTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc2 with
  | Core_dTerm.C_Value_VPi (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (if dtb__401 then (Base_dDiag.v_icInternal "extern has an implicit parameter") else ((Base_dCommon.v_bind (v_externDomIr dtb__403)) (fun (domIr : Vuna_dIr_dModel.t_IrTy) -> ((Base_dCommon.v_bind (((v_externTyIr (mc0 - 1)) (mc1 + 1)) ((Core_dEval.v_applyClosure dtb__404) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__400, mc1, B_dData_dList.C_List_Nil))))))) (fun (resIr : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (v_externDomIr mc2))
))

# 1251 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerExternTy = (fun (ty : Core_dTerm.t_Term) -> (((v_externTyIr 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) ty)))

# 1228 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDef = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (match (v_lowerExternTy (Elab_dTypes.v_dtDefType d)) with
  | Base_dDiag.C_Check_ErrC (dtb__406) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__406)))
  | Base_dDiag.C_Check_OkC (dtb__407) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef ((Elab_dTypes.v_dtDefName d), dtb__407, dtb__405, (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (let defTy = (B_dData_dMaybe.C_Maybe_Just ((((((Lowering_dTy.v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d))))) in (let nd_uscrut7 = ((((v_lowerDefBodyTerm env) st) dtb__408) defTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_OkC (dtb__409) -> (match dtb__409 with
  | { B_dData_dPair.f_Pair_first = dtb__410; B_dData_dPair.f_Pair_second = dtb__411 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef ((Elab_dTypes.v_dtDefName d), (v_runtimeArityIn dtb__408), ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)), defTy, dtb__410, (v_recursiveValueAllowedIn dtb__408), ((((v_initGuardOf env) false) (Elab_dTypes.v_dtDefName d)) dtb__408), (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = dtb__411 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__412)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1283 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerDefs = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__413, dtb__414) -> ((Base_dCommon.v_bind (((v_lowerDef mc0) mc1) dtb__413)) (fun (p : (Vuna_dIr_dModel.t_IrDef, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> ((Base_dCommon.v_bind (((v_lowerDefs mc0) dtb__416) dtb__414)) (fun (q : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__415, dtb__417)); B_dData_dPair.f_Pair_second = dtb__418 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1302 "Vuna/Compiler/Lowering/Program.vuna"
let v_nameKey = (fun (raw : string) (encoded : string) -> { B_dData_dPair.f_Pair_first = (Base_dSource.v_prefixOfName raw); B_dData_dPair.f_Pair_second = encoded })

# 1308 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_checkNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__419, dtb__420) -> (match dtb__419 with
  | { B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__422 } -> (let key = (String.concat "" [dtb__421; "\t"; dtb__422]) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc2) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml name collision among "; mc0; "s in module `"; dtb__421; "`: `"; dtb__422; "`"])) else (((v_checkNoDupOcamlNamesGo mc0) dtb__420) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) true) mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1305 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkNoDupOcamlNames = (fun (kind : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkNoDupOcamlNamesGo kind) keys) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 1318 "Vuna/Compiler/Lowering/Program.vuna"
let v_ensureUniqueOcamlNamesIn = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtime = (Lowering_dEnv.v_rtDatasOf datas) in (let unboxed = (Elab_dRepresentation.v_unboxedFamilySet runtime) in (let valueKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> ((v_nameKey (Elab_dTypes.v_dtDefName d)) (Vuna_dTarget_dOcaml_dDecl.v_valueName (Elab_dTypes.v_dtDefName d))))) defs) in (let typeKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> ((v_nameKey (Elab_dTypes.v_dtDataName d)) (Vuna_dTarget_dOcaml_dDecl.v_typeName (Elab_dTypes.v_dtDataName d))))) runtime) in (let ctorKeys = ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) unboxed) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> ((v_nameKey (Elab_dTypes.v_dtCtorFamily c)) ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Elab_dTypes.v_dtCtorFamily c)) (Elab_dTypes.v_dtCtorName c))))) (Elab_dTypes.v_dtDataCtors d))))) runtime) in ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "value") valueKeys)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "type") typeKeys)) (fun (_u : int) -> ((v_checkNoDupOcamlNames "constructor") ctorKeys)))))))))))

# 1335 "Vuna/Compiler/Lowering/Program.vuna"
let v_prepareProgram = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let table = (Lowering_dChecks.v_defTable defs) in (let familyNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas) in (let axiomNames = (Lowering_dChecks.v_axiomNamesOf defs) in (match ((Lowering_dChecks.v_partitionDefs table) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__423; B_dData_dPair.f_Pair_second = dtb__424 } -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb__423) in (let familyTypeNames = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) runtimeNames)))) familyNames) in (let allTypeNames = ((B_dData_dList.v_append dtb__424) familyTypeNames) in ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkNoAxiomRuntime axiomNames) dtb__423)) (fun (_u : int) -> ((Base_dCommon.v_bind (Lowering_dChecks.v_checkAllDefScopes defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_ensureUniqueOcamlNamesIn datas) dtb__423)) (fun (_u : int) -> ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkAllErasure allTypeNames) dtb__423)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (dtb__423)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1377 "Vuna/Compiler/Lowering/Program.vuna"
let v_tblLookup = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 1380 "Vuna/Compiler/Lowering/Program.vuna"
let v_recOkOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (match (Elab_dTypes.v_dtDefBody dtb__425) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__426) -> (v_recursiveValueAllowedIn dtb__426)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1389 "Vuna/Compiler/Lowering/Program.vuna"
let v_spanOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__427) -> (Elab_dTypes.v_dtDefSpan dtb__427)
  | _ -> failwith "DT: impossible branch"
))

# 1418 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_mapMaybeDef = (fun (mc0 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__428, dtb__429) -> (match ((v_tblLookup mc0) dtb__428) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybeDef mc0) dtb__429)
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (B_dData_dList.C_List__x58__x58_ (dtb__430, ((v_mapMaybeDef mc0) dtb__429)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1395 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appendGroups = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (let isRec = (B_dData_dPair.v_firstOf dtb__431) in (let members = (B_dData_dPair.v_secondOf dtb__431) in (let defs = ((v_mapMaybeDef (mc0).Lowering_dEnv.f_LwEnv_lwDefTbl) members) in ((Base_dCommon.v_bind (((v_lowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__433; B_dData_dPair.f_Pair_second = dtb__434 } -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb__433)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_appendGroups mc0) dtb__434) dtb__432)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__435; B_dData_dPair.f_Pair_second = dtb__436 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isRec; B_dData_dPair.f_Pair_second = dtb__433 }, dtb__435)); B_dData_dPair.f_Pair_second = dtb__436 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1437 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ivarBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dIntrinsics.t_IType) -> (match mc1 with
  | Base_dIntrinsics.C_IType_IPi (dtb__437, dtb__438) -> ((v_ivarBound (B_dData_dList.C_List__x58__x58_ (dtb__437, mc0))) dtb__438)
  | Base_dIntrinsics.C_IType_IVar (dtb__439) -> ((B_dData_dList.v_memName dtb__439) mc0)
  | Base_dIntrinsics.C_IType_IFun1 (dtb__440, dtb__441) -> (if ((v_ivarBound mc0) dtb__440) then ((v_ivarBound mc0) dtb__441) else false)
  | Base_dIntrinsics.C_IType_IFun (dtb__442, dtb__443) -> (if ((v_ivarBound mc0) dtb__442) then ((v_ivarBound mc0) dtb__443) else false)
  | Base_dIntrinsics.C_IType_IEffHost (dtb__444) -> ((v_ivarBound mc0) dtb__444)
  | Base_dIntrinsics.C_IType_IEff (dtb__445) -> ((v_ivarBound mc0) dtb__445)
  | Base_dIntrinsics.C_IType_IAtomic -> true
  | Base_dIntrinsics.C_IType_ICondvar -> true
  | Base_dIntrinsics.C_IType_IMutex -> true
  | Base_dIntrinsics.C_IType_IThread (dtb__446) -> ((v_ivarBound mc0) dtb__446)
  | Base_dIntrinsics.C_IType_IMBuffer -> true
  | Base_dIntrinsics.C_IType_IMDynArray (dtb__447) -> ((v_ivarBound mc0) dtb__447)
  | Base_dIntrinsics.C_IType_IMArray (dtb__448) -> ((v_ivarBound mc0) dtb__448)
  | Base_dIntrinsics.C_IType_ICell (dtb__449) -> ((v_ivarBound mc0) dtb__449)
  | Base_dIntrinsics.C_IType_IArray (dtb__450) -> ((v_ivarBound mc0) dtb__450)
  | Base_dIntrinsics.C_IType_IList (dtb__451) -> ((v_ivarBound mc0) dtb__451)
  | Base_dIntrinsics.C_IType_IGlobal (dtb__452) -> true
  | Base_dIntrinsics.C_IType_IFloat -> true
  | Base_dIntrinsics.C_IType_INat -> true
  | Base_dIntrinsics.C_IType_IBool -> true
  | Base_dIntrinsics.C_IType_IStr -> true
  | Base_dIntrinsics.C_IType_IInt -> true
  | Base_dIntrinsics.C_IType_ITy -> true
  | _ -> failwith "DT: impossible branch"
))

# 1462 "Vuna/Compiler/Lowering/Program.vuna"
let v_intrinsicWithUnboundIvar = (fun (is : Base_dIntrinsics.t_Intrinsic B_dData_dList.t_List) -> ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) ((B_dData_dList.v_filter (fun (i : Base_dIntrinsics.t_Intrinsic) -> (B_dData_dBool.v_not ((v_ivarBound B_dData_dList.C_List_Nil) (Base_dIntrinsics.v_intrinsicSignature i))))) is)))

# 1496 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstOfList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__453, dtb__454) -> dtb__453
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1469 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkRuntimeContract = (let intrinsicNames = ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) Base_dIntrinsics.v_allIntrinsics) in (let contractNames = Vuna_dIr_dRuntime.v_irRtNames in (let badIvars = (v_intrinsicWithUnboundIvar Base_dIntrinsics.v_allIntrinsics) in (let missingFromContract = ((B_dData_dList.v_filter (fun (n : string) -> (if (n = Base_dIntrinsics.v_primEffBind1Name) then false else (if ((B_dData_dList.v_memName n) contractNames) then false else true)))) intrinsicNames) in (let extrasInContract = ((B_dData_dList.v_filter (fun (n : string) -> (if ((B_dData_dList.v_memName n) intrinsicNames) then false else (if ((B_dData_dList.v_memName n) Vuna_dIr_dRuntime.v_irRtSyntheticNames) then false else true)))) contractNames) in (if ((Lowering_dEnv.v_listLength badIvars) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["intrinsic `"; (v_firstOfList badIvars); "` has an unbound type variable in its signature"])) else (if ((Lowering_dEnv.v_listLength missingFromContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_firstOfList missingFromContract); "`"])) else (if ((Lowering_dEnv.v_listLength extrasInContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_firstOfList extrasInContract); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras); "`"])) else (Base_dDiag.C_Check_OkC (0))))))))))))

# 1429 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkProgramOf = (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((v_prepareProgram (env).Lowering_dEnv.f_LwEnv_lwDatas) (env).Lowering_dEnv.f_LwEnv_lwOrigDefs)) (fun (_u : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> v_checkRuntimeContract)))

# 1550 "Vuna/Compiler/Lowering/Program.vuna"
let v_adjOfDef = (fun (env : Lowering_dEnv.t_LwEnv) (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)) })

# 1358 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupDefs = (fun (env : Lowering_dEnv.t_LwEnv) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let adj = ((B_dData_dList.v_map (v_adjOfDef env)) defs) in (let names = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs) in (let tbl = (Lowering_dEnv.v_defTblOf defs) in ((Base_dCommon.v_bind ((((Vuna_dIr_dAnalysis.v_assembleGroupNames adj) names) (v_recOkOfTbl tbl)) (v_spanOfTbl tbl))) (fun (groups : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_appendGroups env) { f_LwSt_lwNext = 0; f_LwSt_lwBinder = 1 }) groups)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__455; B_dData_dPair.f_Pair_second = dtb__456 } -> (Base_dDiag.C_Check_OkC (dtb__455))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1553 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupOfPair = (fun (mc0 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__457; B_dData_dPair.f_Pair_second = dtb__458 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__457; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__458 }
  | _ -> failwith "DT: impossible branch"
))

# 1576 "Vuna/Compiler/Lowering/Program.vuna"
let v_partitionRuntimeDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__459; B_dData_dPair.f_Pair_second = dtb__460 } -> dtb__459
  | _ -> failwith "DT: impossible branch"
))

# 1534 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitPrepared = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let datas = (env).Lowering_dEnv.f_LwEnv_lwDatas in (let runtime = (v_partitionRuntimeDefs defs) in ((Base_dCommon.v_bind ((v_groupDefs env) runtime)) (fun (groups : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((Lowering_dTy.v_tyDeclsOf (env).Lowering_dEnv.f_LwEnv_lwDataTbl) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (let groups2 = ((B_dData_dList.v_map v_groupOfPair) groups) in (let hasList = ((Lowering_dEnv.v_hasDataNamed Base_dIntrinsics.v_listFamilyName) unitDatas) in (Base_dDiag.C_Check_OkC ((Vuna_dIr_dDispatch.v_dispatchIdsUnit ((Vuna_dIr_dRepresent.v_representUnit (Lowering_dEnv.v_lwEnvShared env)) { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = decls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups2; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasList; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (Lowering_dTy.v_tyDeclRefs decls); Vuna_dIr_dModel.f_IrUnit_irUnitEntry = B_dData_dMaybe.C_Maybe_Nothing })))))))))))))

# 1511 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitCheckedFrom = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerUnitPrepared env) unitDatas) defs)) (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Lowering.Program") then (((dtp_log_emit 2) "Vuna.Compiler.Lowering.Program") "cg-unit-validate-start") else 0) in ((Base_dCommon.v_bind ((Vuna_dIr_dValidate.v_validateUnit (Lowering_dEnv.v_lwEnvShared env)) u)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (u))))))))

# 1523 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitAfterChecks = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> (let defNameTbl = (B_dContainer_dHashMap.v_ofNames defNames) in (let defs = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName d)) defNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDefs) in (let dataNameTbl = (B_dContainer_dHashMap.v_ofNames dataNames) in (let unitDatas = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName d)) dataNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDatas) in (((v_lowerUnitPrepared env) unitDatas) defs))))))

# 1503 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitOf = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkProgramOf env)) (fun (_u : int) -> (((v_lowerUnitAfterChecks env) defNames) dataNames))))

# 1561 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.env") (fun (_u : int) -> ((((Lowering_dEnv.v_mkLwEnv datas) defs) globals) "")))) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_checkProgramOf env)))) (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_lowerUnitAfterChecks env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.entry") (fun (_u : int) -> (Lowering_dEntry.v_lowerEntryOf (env).Lowering_dEnv.f_LwEnv_lwDefs)))) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrProgram_irProgShared = (Lowering_dEnv.v_lwEnvShared env); Vuna_dIr_dModel.f_IrProgram_irProgUnit = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry } })))))))))))

# 1568 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramCheckedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerProgramOf datas) defs) globals)) (fun (program : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind (Vuna_dIr_dValidate.v_validateProgram program)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (program)))))))

# 51 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwNext = (fun (p : t_LwSt) -> (match p with
  | { f_LwSt_lwNext = dtb__461; f_LwSt_lwBinder = dtb__462 } -> dtb__461
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwBinder = (fun (p : t_LwSt) -> (match p with
  | { f_LwSt_lwNext = dtb__463; f_LwSt_lwBinder = dtb__464 } -> dtb__464
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamName = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__465; f_LamParam_lamParamRig = dtb__466; f_LamParam_lamParamTy = dtb__467 } -> dtb__465
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamRig = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__468; f_LamParam_lamParamRig = dtb__469; f_LamParam_lamParamTy = dtb__470 } -> dtb__469
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamTy = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__471; f_LamParam_lamParamRig = dtb__472; f_LamParam_lamParamTy = dtb__473 } -> dtb__473
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBinders = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__474; f_LamChainIn_lamChainBody = dtb__475; f_LamChainIn_lamChainResultTy = dtb__476 } -> dtb__474
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBody = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__477; f_LamChainIn_lamChainBody = dtb__478; f_LamChainIn_lamChainResultTy = dtb__479 } -> dtb__478
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainResultTy = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__480; f_LamChainIn_lamChainBody = dtb__481; f_LamChainIn_lamChainResultTy = dtb__482 } -> dtb__482
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnv = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__483; f_AltEnvIn_aePats = dtb__484; f_AltEnvIn_aeSt = dtb__485 } -> dtb__483
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePats = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__486; f_AltEnvIn_aePats = dtb__487; f_AltEnvIn_aeSt = dtb__488 } -> dtb__487
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeSt = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__489; f_AltEnvIn_aePats = dtb__490; f_AltEnvIn_aeSt = dtb__491 } -> dtb__491
  | _ -> failwith "DT: impossible branch"
))
