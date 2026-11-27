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

# 394 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_peelLams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (v_peelLams dtb__49)
  | _ -> mc0
))

# 398 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_stripEraseHead = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Core_dTerm.C_Term_TGlobal (dtb__53) -> (if (dtb__53 = Base_dIntrinsics.v_primEraseName) then (v_stripEraseHead dtb__51) else (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb__53)), dtb__51, Core_dTerm.C_Rig_Rig1)))
  | _ -> mc0
)
  | _ -> mc0
))

# 403 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_conHeadOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__54, dtb__55, dtb__56) -> (v_conHeadOf dtb__54)
  | Core_dTerm.C_Term_TCon (dtb__57, dtb__58) -> (B_dData_dMaybe.C_Maybe_Just (dtb__57))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 408 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appHeadVarIdx = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__59, dtb__60, dtb__61) -> (match dtb__59 with
  | Core_dTerm.C_Term_TGlobal (dtb__62) -> (if (dtb__62 = Base_dIntrinsics.v_primEraseName) then (v_appHeadVarIdx dtb__60) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (v_appHeadVarIdx dtb__59)
)
  | Core_dTerm.C_Term_TVar (dtb__63, dtb__64, dtb__65) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 417 "Vuna/Compiler/Lowering/Program.vuna"
let v_projFieldOf = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (let nd_uscrut3 = (v_peelLams dtb__66) in (match nd_uscrut3 with
  | Core_dTerm.C_Term_TCase (dtb__67, dtb__68) -> (match dtb__68 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = (v_appHeadVarIdx (Core_dTerm.v_caseAltBody dtb__69)) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (match dtb__71 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (let n = (B_dData_dList.v_length (dtb__69).Core_dTerm.f_CaseAlt_caseAltBinders) in (let k = ((bi_natSub n 1) - dtb__73) in (if (if (dtb__73 >= 0) then (dtb__73 < n) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__69).Core_dTerm.f_CaseAlt_caseAltName; B_dData_dPair.f_Pair_second = k })) else B_dData_dMaybe.C_Maybe_Nothing)))
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
let rec v_nthTerm = (fun (k : int) (xs : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (k < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if (k = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__74)) else ((v_nthTerm (k - 1)) dtb__75))
  | _ -> failwith "DT: impossible branch"
)))

# 440 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_foldAppTerm = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> ((v_foldAppTerm (Core_dTerm.C_Term_TApp (mc0, (B_dData_dPair.v_firstOf dtb__76), (B_dData_dPair.v_secondOf dtb__76)))) dtb__77)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Lowering/Program.vuna"
let v_isEffBuilder = (fun (field : Core_dTerm.t_Term) -> (match (v_conHeadOf (v_peelLams (v_stripEraseHead field))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (dtb__78 = Vuna_dIr_dModel.v_irEffMkCtor)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Lowering/Program.vuna"
let v_dictFieldOf = (fun (env : Lowering_dEnv.t_LwEnv) (defName : string) (ctor : string) (k : int) -> (match ((Lowering_dEnv.v_lwDefBodyOf defName) env) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (match (v_stripEraseHead (v_peelLams dtb__79)) with
  | Core_dTerm.C_Term_TCon (dtb__80, dtb__81) -> (if (dtb__80 = ctor) then (match ((v_nthTerm k) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__81)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (if (v_isEffBuilder dtb__82) then (B_dData_dMaybe.C_Maybe_Just (dtb__82)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Lowering/Program.vuna"
let v_runtimeArg = (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf p))))

# 469 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_dictNameOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__83, dtb__84, dtb__85) -> (if (Core_dTerm.v_rigIsErased dtb__85) then (v_dictNameOf dtb__83) else B_dData_dMaybe.C_Maybe_Nothing)
  | Core_dTerm.C_Term_TGlobal (dtb__86) -> (B_dData_dMaybe.C_Maybe_Just (dtb__86))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 475 "Vuna/Compiler/Lowering/Program.vuna"
let v_effFieldAppIn = (fun (env : Lowering_dEnv.t_LwEnv) (t : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> (match dtb__87 with
  | Core_dTerm.C_Term_TGlobal (dtb__89) -> (let nd_uscrut7 = (v_projFieldOf ((Lowering_dEnv.v_lwDefBodyOf dtb__89) env)) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (let nd_uscrut14 = ((B_dData_dList.v_filter v_runtimeArg) dtb__88) in (match nd_uscrut14 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (match (v_dictNameOf dtb__95) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (match ((((v_dictFieldOf env) dtb__97) dtb__91) dtb__92) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just (((v_foldAppTerm dtb__98) dtb__94)))
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
let v_appTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) -> (let nd_uscrut3 = (((Lowering_dTy.v_annotRunCalleeTy env) binders) f) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (match dtb__99 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__100, dtb__101) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__101 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 548 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOfIr = (fun (ir : Vuna_dIr_dModel.t_Ir) -> (let nd_uscrut1 = (Vuna_dIr_dModel.v_irResultTyOf ir) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (match dtb__102 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__103, dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__104 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 554 "Vuna/Compiler/Lowering/Program.vuna"
let v_justAppTy = (fun (mc0 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (B_dData_dMaybe.C_Maybe_Just (dtb__105))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque }))
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyFrom = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (irF : Vuna_dIr_dModel.t_Ir) -> (match (((v_appTyOf env) binders) f) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (B_dData_dMaybe.C_Maybe_Just (dtb__106))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_appTyOfIr irF)
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_concatLeavesGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__107, dtb__108, dtb__109) -> (match dtb__107 with
  | Core_dTerm.C_Term_TApp (dtb__110, dtb__111, dtb__112) -> (let whole = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp (dtb__110, dtb__111, dtb__112)), dtb__108, dtb__109)) in (if (if (Core_dTerm.v_rigIsErased dtb__112) then true else (Core_dTerm.v_rigIsErased dtb__109)) then (B_dData_dList.C_List__x58__x58_ (whole, mc1)) else (match dtb__110 with
  | Core_dTerm.C_Term_TGlobal (dtb__113) -> (if (dtb__113 = "++") then ((v_concatLeavesGo dtb__111) ((v_concatLeavesGo dtb__108) mc1)) else (B_dData_dList.C_List__x58__x58_ (whole, mc1)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (whole, mc1))
)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
))

# 627 "Vuna/Compiler/Lowering/Program.vuna"
let v_concatLeavesIn = (fun (t : Core_dTerm.t_Term) -> ((v_concatLeavesGo t) B_dData_dList.C_List_Nil))

# 617 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenConcatChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__114, dtb__115, dtb__116) -> (match dtb__114 with
  | Core_dTerm.C_Term_TApp (dtb__117, dtb__118, dtb__119) -> (if (if (Core_dTerm.v_rigIsErased dtb__119) then true else (Core_dTerm.v_rigIsErased dtb__116)) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__117 with
  | Core_dTerm.C_Term_TGlobal (dtb__120) -> (if (dtb__120 = "++") then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append (v_concatLeavesIn dtb__118)) (v_concatLeavesIn dtb__115)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 655 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (match dtb__121 with
  | { B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = dtb__124 } -> (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__124)) then (v_allRuntimeArgs dtb__122) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenIntrinsicAppIn = (fun (t : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (if (v_allRuntimeArgs dtb__126) then (match dtb__125 with
  | Core_dTerm.C_Term_TGlobal (dtb__127) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb__127) > 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__126 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 659 "Vuna/Compiler/Lowering/Program.vuna"
let v_inlineArityMatchesIn = (fun (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((Vuna_dIr_dModel.v_irInlineArity name) <= 0) then false else ((Lowering_dEnv.v_listLength args) = (Vuna_dIr_dModel.v_irInlineArity name))))

# 668 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_alignCtorArgs = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (if dtb__128 then (if (Core_dTerm.v_rigIsErased dtb__133) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Base_dCommon.v_bind (((v_alignCtorArgs mc0) dtb__129) dtb__131)) (fun (ts : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 }, ts))))))) else (if (Core_dTerm.v_rigIsErased dtb__133) then (((v_alignCtorArgs mc0) dtb__129) dtb__131) else (((v_alignCtorArgs mc0) dtb__129) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 }, dtb__131)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if dtb__128 then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_alignCtorArgs mc0) dtb__129) B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Lowering/Program.vuna"
let v_ctorArgIr = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc1 : bool) (mc2 : Vuna_dIr_dModel.t_Ir) -> (if mc1 then (Vuna_dIr_dModel.C_Ir_IrCast (mc0, (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)), mc2)) else mc2))

# 715 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_ctorOpaqueKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (if dtb__136 then (B_dData_dList.C_List__x58__x58_ (dtb__138, ((v_ctorOpaqueKeptFlags dtb__137) dtb__139))) else ((v_ctorOpaqueKeptFlags dtb__137) dtb__139))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_zipFieldNames = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> ((Base_dCommon.v_bind ((v_zipFieldNames dtb__141) dtb__143)) (fun (rest : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_secondOf dtb__140); B_dData_dPair.f_Pair_second = dtb__142 }, rest))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record construction has fewer runtime arguments than its runtime field table")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (Base_dDiag.v_icInternal "record construction has more runtime arguments than its runtime field table")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 796 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerConAppFinish = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (family : string) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (irs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) family) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (let recTy = (match (((Lowering_dTy.v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (family, dtb__147))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind ((v_zipFieldNames dtb__146) irs)) (fun (pairs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (family, recTy, pairs)); B_dData_dPair.f_Pair_second = st })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (family, c, (((Lowering_dTy.v_ctorTypeArgsOf env) c) args), irs)); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnvOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__148; f_AltEnvIn_aePats = dtb__149; f_AltEnvIn_aeSt = dtb__150 } -> dtb__148
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePatsOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__151; f_AltEnvIn_aePats = dtb__152; f_AltEnvIn_aeSt = dtb__153 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

# 837 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeStOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__154; f_AltEnvIn_aePats = dtb__155; f_AltEnvIn_aeSt = dtb__156 } -> dtb__156
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countKept = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (if dtb__157 then (1 + (v_countKept dtb__158)) else (v_countKept dtb__158))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 844 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvGo = (fun (mc0 : t_LwSt) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__159 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (if (Core_dTerm.v_rigIsErased dtb__162) then ((((v_altEnvGo mc0) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc1))) dtb__160) mc3) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in ((((v_altEnvGo { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) (B_dData_dList.C_List__x58__x58_ (b, mc1))) dtb__160) (B_dData_dList.C_List__x58__x58_ (b, mc3)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_AltEnvIn_aeEnv = mc1; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc3); f_AltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvIn = (fun (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_altEnvGo st) outer) tele) B_dData_dList.C_List_Nil))

# 871 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvFullIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (if ((Lowering_dTy.v_flagMatchesRigIn dtb__167) dtb__166) then (if dtb__167 then (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in ((((((v_altEnvFullIn { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__164) dtb__168) (B_dData_dList.C_List__x58__x58_ (b, mc5)))))) else ((((((v_altEnvFullIn mc0) mc1) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc2))) dtb__164) dtb__168) mc5)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc5); f_AltEnvIn_aeSt = mc0 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 892 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvKeptIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match dtb__171 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> (if (Core_dTerm.v_rigIsErased dtb__174) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else (let fresh = (mc0).f_LwSt_lwNext in (let bid = (mc0).f_LwSt_lwBinder in (let b = ((Vuna_dIr_dModel.v_mkIrBinderArm bid) fresh) in (((((v_altEnvKeptIn { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (bid + 1) }) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__172) (B_dData_dList.C_List__x58__x58_ (b, mc4)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc4); f_AltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 861 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvCheckedIn = (fun (st : t_LwSt) (label : string) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (flags : bool B_dData_dList.t_List) -> (if ((Lowering_dEnv.v_listLength binders) = (Lowering_dEnv.v_listLength flags)) then ((((((v_altEnvFullIn st) label) outer) binders) flags) B_dData_dList.C_List_Nil) else (if ((Lowering_dEnv.v_listLength binders) = (v_countKept flags)) then (((((v_altEnvKeptIn st) label) outer) binders) B_dData_dList.C_List_Nil) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 905 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderWithTy = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (b : Vuna_dIr_dModel.t_IrBinder) -> (if (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased then { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = true; Vuna_dIr_dModel.f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing } else { Vuna_dIr_dModel.f_IrBinder_irBinderId = (b).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = false; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (v_justTy ty) }))

# 912 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_typedPats = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__177, dtb__178) -> (B_dData_dList.C_List__x58__x58_ (((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__175))) dtb__177), ((v_typedPats dtb__176) dtb__178)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 917 "Vuna/Compiler/Lowering/Program.vuna"
let v_typedPatsAll = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (b : Vuna_dIr_dModel.t_IrBinder) -> ((v_binderWithTy ty) b))) bs))

# 922 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_armTyTblOf = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__179, dtb__180) -> (let tail = (v_armTyTblOf dtb__180) in (match (dtb__179).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__181) -> (match (dtb__179).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 }, tail))
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | _ -> tail
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupArmTy = (fun (mc0 : int) (mc1 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (if (dtb__185 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__186)) else ((v_lookupArmTy mc0) dtb__184))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagArmBinder = (fun (tbl : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Vuna_dIr_dModel.t_IrBinder) -> (match (b).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__187) -> (match ((v_lookupArmTy dtb__187) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> ((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__188))) b)
  | B_dData_dMaybe.C_Maybe_Nothing -> b
  | _ -> failwith "DT: impossible branch"
)
  | _ -> b
))

# 947 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_retagArmEnv = (fun (mc0 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (B_dData_dList.C_List__x58__x58_ (((v_retagArmBinder mc0) dtb__189), ((v_retagArmEnv mc0) dtb__190)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagAltEnv = (fun (mc0 : t_AltEnvIn) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__191; f_AltEnvIn_aePats = dtb__192; f_AltEnvIn_aeSt = dtb__193 } -> { f_AltEnvIn_aeEnv = ((v_retagArmEnv (v_armTyTblOf mc1)) dtb__191); f_AltEnvIn_aePats = mc1; f_AltEnvIn_aeSt = dtb__193 }
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_hasFallbackAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (if ((Core_dTerm.v_caseAltName dtb__194) = "") then true else (v_hasFallbackAlt dtb__195))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allCatchAll = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (if ((Core_dTerm.v_caseAltName dtb__196) = "") then (v_allCatchAll dtb__197) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 967 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseAlt = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (if ((Core_dTerm.v_caseAltName dtb__198) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let name = (Core_dTerm.v_caseAltName dtb__198) in (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (mc0).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (match dtb__200 with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__201) (mc0).Lowering_dEnv.f_LwEnv_lwUnboxed) then (if (v_allCatchAll dtb__199) then (B_dData_dMaybe.C_Maybe_Just (dtb__198)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Lowering/Program.vuna"
let v_armResultTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (bodyIr : Vuna_dIr_dModel.t_Ir) (coreBody : Core_dTerm.t_Term) -> (match (Vuna_dIr_dModel.v_irResultTyOf bodyIr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (B_dData_dMaybe.C_Maybe_Just (dtb__203))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match bodyIr with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__204) -> (match (((Lowering_dTy.v_annotGlobalTy env) (v_aeEnvOf bound)) dtb__204) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (B_dData_dMaybe.C_Maybe_Just (dtb__205))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Lowering_dTy.v_annotRunTyOf env) (v_aeEnvOf bound)) coreBody)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((Lowering_dTy.v_annotRunTyOf env) (v_aeEnvOf bound)) coreBody)
)
  | _ -> failwith "DT: impossible branch"
))

# 1089 "Vuna/Compiler/Lowering/Program.vuna"
let v_isNatCtorName = (fun (name : string) -> (if (if (if (name = Base_dIntrinsics.v_natZeroCtor) then true else (name = Base_dIntrinsics.v_natSuccCtor)) then true else (name = Base_dIntrinsics.v_finZeroCtor)) then true else (name = Base_dIntrinsics.v_finSuccCtor)))

# 1097 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseAllCtors = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> (if ((Core_dTerm.v_caseAltName dtb__206) = "") then (v_natCaseAllCtors dtb__207) else (let name = (Core_dTerm.v_caseAltName dtb__206) in (if (v_isNatCtorName name) then (v_natCaseAllCtors dtb__207) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseHasCtor = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (if ((Core_dTerm.v_caseAltName dtb__208) = "") then (v_natCaseHasCtor dtb__209) else true)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1093 "Vuna/Compiler/Lowering/Program.vuna"
let v_natCaseApplies = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> (if (v_natCaseAllCtors mc0) then (v_natCaseHasCtor mc0) else false)
))

# 1111 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findAltBy = (fun (mc0 : string) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (if ((Core_dTerm.v_caseAltName dtb__210) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__210)) else ((v_findAltBy mc0) dtb__211))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstAltOf = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) (mc1 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (B_dData_dMaybe.C_Maybe_Just (dtb__212))
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findCatchAllAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (if ((Core_dTerm.v_caseAltName dtb__213) = "") then (B_dData_dMaybe.C_Maybe_Just (dtb__213)) else (v_findCatchAllAlt dtb__214))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1209 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordProjVarIn = (fun (i : int) -> ("@vuna@record@proj" ^ (string_of_int i)))

# 1212 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_projBindersIn = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_recordProjVarIn mc1); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__215) }, ((v_projBindersIn dtb__216) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> (match dtb__217 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (if (dtb__219 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__220)) else ((v_lookupRtLabelIn mc0) dtb__218))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1223 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__221 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (if (dtb__223 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_lookupRtPosIn mc0) dtb__222) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1227 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPositionsIn = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match (((v_lookupRtPosIn dtb__225) mc0) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn mc0) dtb__226)) (fun (ps : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__227 }, ps))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["record update targets field index "; (string_of_int dtb__225); ", which has no runtime field"]))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1236 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthOpqArgIn = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__232)) else (((v_nthOpqArgIn (mc0 - 1)) dtb__229) dtb__231))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1247 "Vuna/Compiler/Lowering/Program.vuna"
let v_eraseTele = (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> Vuna_dIr_dModel.v_mkIrBinderErased)

# 1244 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordAltBindersIn = (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_eraseTele) tele))) binders))

# 80 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerTermFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__234, dtb__235, dtb__236) -> (match ((v_runtimeBinderAt dtb__235) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (if (v_binderErasedOf dtb__237) then (Base_dDiag.v_icInternal (String.concat "" ["erased binder "; dtb__234; ": runtime idx "; (string_of_int dtb__235); " of "; (string_of_int (Lowering_dEnv.v_listLength binders)); " binders"])) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb__237)); B_dData_dPair.f_Pair_second = st })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__238) -> ((Base_dCommon.v_bind ((v_lowerGlobalRef env) dtb__238)) (fun (ir : Vuna_dIr_dModel.t_Ir) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = st }))))
  | Core_dTerm.C_Term_TInt (dtb__239) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__239)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TStr (dtb__240) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb__240)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TFloat (dtb__241) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__241)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TBool (dtb__242) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb__242)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TIf (dtb__243, dtb__244, dtb__245) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__243)) (fun (pc : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = dtb__247 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__247) binders) dtb__244)) (fun (pt : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__249) binders) dtb__245)) (fun (pe : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__250; B_dData_dPair.f_Pair_second = dtb__251 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb__246, dtb__248, dtb__250)); B_dData_dPair.f_Pair_second = dtb__251 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Core_dTerm.C_Term_TLam (dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> (((((((((v_lowerLamFuel (fuel - 1)) env) st) binders) dtb__252) dtb__253) dtb__254) dtb__255) dtb__256)
  | Core_dTerm.C_Term_TApp (dtb__257, dtb__258, dtb__259) -> (((((((v_lowerAppFuel (fuel - 1)) env) st) binders) dtb__257) dtb__258) dtb__259)
  | Core_dTerm.C_Term_TCon (dtb__260, dtb__261) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__260) dtb__261)
  | Core_dTerm.C_Term_TMk (dtb__262, dtb__263) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__262) dtb__263)
  | Core_dTerm.C_Term_TRecord (dtb__264, dtb__265) -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) ((v_recordTermAsAppIn (Core_dTerm.C_Term_TGlobal (dtb__264))) dtb__265))
  | Core_dTerm.C_Term_TCase (dtb__266, dtb__267) -> ((((((v_lowerCaseFuel (fuel - 1)) env) st) binders) dtb__266) dtb__267)
  | Core_dTerm.C_Term_TRecUpd (dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__269) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> ((((((((((v_lowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__268) dtb__269) dtb__270) dtb__273) dtb__271) dtb__272)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TCase (dtb__268, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__269; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__270); Core_dTerm.f_CaseAlt_caseAltBody = dtb__272 }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TProj (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__275) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> ((Base_dCommon.v_bind ((v_recordFieldNameAt dtb__278) dtb__279)) (fun (label : string) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__274)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) dtb__275)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let args = (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) binders) dtb__274)) in (let resTy = (match (((v_lookupRtPosIn dtb__278) dtb__279) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> ((Vuna_dIr_dModel.v_irTyAt ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars args)) fieldTys)) dtb__282)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb__280, dtb__275, label, (v_justTy resTy))); B_dData_dPair.f_Pair_second = dtb__281 }))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_lowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__274) dtb__275) dtb__276) dtb__277) dtb__278)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TType (dtb__288) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb__289) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((Lowering_dChecks.v_showMetaHint dtb__289)))) (Lowering_dChecks.v_showMetaHint dtb__289))
  | _ -> failwith "DT: impossible branch"
)))
# 251 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (name : string) (rig : Core_dTerm.t_Rig) (slot : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (sp : Base_dSource.t_Span) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (v_collectLamChainIn (Core_dTerm.C_Term_TLam (name, rig, slot, sp, body))) with
  | { f_LamChainIn_lamChainBinders = dtb__290; f_LamChainIn_lamChainBody = dtb__291; f_LamChainIn_lamChainResultTy = dtb__292 } -> ((((((((v_lowerLamChainFuel fuel) env) st) binders) B_dData_dList.C_List_Nil) dtb__290) dtb__291) dtb__292)
  | _ -> failwith "DT: impossible branch"
)))
# 261 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (hints : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (params : t_LamParam B_dData_dList.t_List) (inner : Core_dTerm.t_Term) (resultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let pb = (((((v_bindersOfParamsHint env) binders) hints) (st).f_LwSt_lwBinder) params) in (let bs = (B_dData_dPair.v_firstOf pb) in (let stIds = { f_LwSt_lwNext = (st).f_LwSt_lwNext; f_LwSt_lwBinder = (B_dData_dPair.v_secondOf pb) } in (let envB = ((B_dData_dList.v_append (B_dData_dList.v_reverse bs)) binders) in (let resultIr = (match resultTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (match (((Lowering_dTy.v_annotTyOf env) envB) dtb__296) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (B_dData_dMaybe.C_Maybe_Just (dtb__297))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effResultTyOf dtb__296)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) stIds) envB) inner)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (let resultIr2 = (match resultIr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> resultIr
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_irResultTyOf dtb__293)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (((B_dData_dList.v_filter (fun (x : Vuna_dIr_dModel.t_IrBinder) -> (B_dData_dBool.v_not (v_binderErasedOf x)))) bs), (v_justTy resultIr2), dtb__293)); B_dData_dPair.f_Pair_second = dtb__294 })))
  | _ -> failwith "DT: impossible branch"
))))))))))
# 496 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased rig) then (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f) else (let nd_uscrut7 = (Lowering_dChecks.v_flattenConApp (Core_dTerm.C_Term_TApp (f, a, rig))) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_effFieldAppIn env) (Core_dTerm.C_Term_TApp (f, a, rig))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__298)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_flattenConcatChainIn (Core_dTerm.C_Term_TApp (f, a, rig))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (if ((Lowering_dEnv.v_listLength dtb__299) >= 3) then ((Base_dCommon.v_bind (((((v_lowerTermsFuel (fuel - 1)) env) st) binders) dtb__299)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__300)); B_dData_dPair.f_Pair_second = dtb__301 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (match dtb__302 with
  | { B_dData_dPair.f_Pair_first = dtb__303; B_dData_dPair.f_Pair_second = dtb__304 } -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__303) dtb__304)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 521 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerPlainAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TApp (dtb__305, dtb__306, dtb__307) -> (let nd_uscrut8 = (v_flattenIntrinsicAppIn t) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__305) dtb__306) dtb__307)
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match dtb__308 with
  | { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = dtb__310 } -> (if ((v_inlineArityMatchesIn dtb__309) dtb__310) then ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__310)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__309, dtb__311)); B_dData_dPair.f_Pair_second = dtb__312 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__305) dtb__306) dtb__307))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dDiag.v_icInternal "lowerPlainApp expects an application")
)))
# 564 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFallbackFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pf with
  | { B_dData_dPair.f_Pair_first = dtb__313; B_dData_dPair.f_Pair_second = dtb__314 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__314) binders) a)) (fun (pa : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__315; B_dData_dPair.f_Pair_second = dtb__316 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy ((((v_appTyFrom env) binders) f) dtb__313)), dtb__313, dtb__315)); B_dData_dPair.f_Pair_second = dtb__316 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 580 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__317, dtb__318) -> (match dtb__317 with
  | { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = dtb__320 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb__320) then (Base_dDiag.v_icInternal "erased argument in inlined builtin application") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__319)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (mc0 - 1)) mc1) dtb__322) mc3) dtb__318)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__323)); B_dData_dPair.f_Pair_second = dtb__324 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerTermsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__325, dtb__326) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__325)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = dtb__328 } -> ((Base_dCommon.v_bind (((((v_lowerTermsFuel (mc0 - 1)) mc1) dtb__328) mc3) dtb__326)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__329; B_dData_dPair.f_Pair_second = dtb__330 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__327, dtb__329)); B_dData_dPair.f_Pair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 690 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__331, dtb__332) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (match dtb__333 with
  | { B_dData_dPair.f_Pair_first = dtb__335; B_dData_dPair.f_Pair_second = dtb__336 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__335)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = dtb__338 } -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (mc0 - 1)) mc1) dtb__338) mc3) dtb__332) dtb__334)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__339; B_dData_dPair.f_Pair_second = dtb__340 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((((v_ctorArgIr (((Lowering_dTy.v_annotRunTyOf mc1) mc3) dtb__335)) dtb__331) dtb__337), dtb__339)); B_dData_dPair.f_Pair_second = dtb__340 }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than runtime arguments")
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 721 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (Core_dTerm.v_natChainValue (Core_dTerm.C_Term_TCon (c, args))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__343)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_lowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 730 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppNonChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (c = Base_dIntrinsics.v_natZeroCtor) then (match (((v_alignCtorArgs c) B_dData_dList.C_List_Nil) args) with
  | Base_dDiag.C_Check_ErrC (dtb__344) -> (Base_dDiag.C_Check_ErrC (dtb__344))
  | Base_dDiag.C_Check_OkC (dtb__345) -> (match dtb__345 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__346) -> (Base_dDiag.C_Check_ErrC (dtb__346))
  | Base_dDiag.C_Check_OkC (dtb__347) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__347)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> (match dtb__348 with
  | B_dData_dList.C_List__x58__x58_ (dtb__350, dtb__351) -> (match dtb__351 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__350)); B_dData_dPair.f_Pair_second = dtb__349 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_finZeroCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__352) -> (Base_dDiag.C_Check_ErrC (dtb__352))
  | Base_dDiag.C_Check_OkC (dtb__353) -> (match dtb__353 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Fin FZero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_finSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (false, (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__354) -> (Base_dDiag.C_Check_ErrC (dtb__354))
  | Base_dDiag.C_Check_OkC (dtb__355) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__355)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (match dtb__356 with
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (match dtb__359 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp ((v_justAppTy B_dData_dMaybe.C_Maybe_Nothing), (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__358)); B_dData_dPair.f_Pair_second = dtb__357 }))
  | _ -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Fin FSucc must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__362) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) ((v_ctorOpaqueKeptFlags dtb__362) dtb__363)) runtimeArgs)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__365 } -> ((((((v_lowerConAppFinish env) dtb__365) dtb__361) c) args) dtb__364)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))))))
# 955 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmBodyFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (body : Core_dTerm.t_Term) -> (((((v_lowerTermFuel fuel) env) (v_aeStOf bound)) (v_aeEnvOf bound)) body))
# 1028 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (let bound = (((v_altEnvIn st) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) in (let typed = ((v_typedPatsAll scrutTy) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__366 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__366) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__367 } }))
  | _ -> failwith "DT: impossible branch"
)))))) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Core_dTerm.v_caseAltName alt)) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__368) -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn st) (Core_dTerm.v_caseAltName alt)) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__370)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) (Core_dTerm.v_caseAltName alt))) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf scrutTy))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__371; B_dData_dPair.f_Pair_second = dtb__372 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = (Core_dTerm.v_caseAltName alt) })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__371 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__371) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__372 } }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ (Core_dTerm.v_caseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
# 1062 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc3 : t_LwSt) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc5 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind ((((((v_lowerArmFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__373)) (fun (p : (Vuna_dIr_dModel.t_IrAlt, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (match dtb__376 with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (mc0 - 1)) mc1) mc2) dtb__378) mc4) dtb__374)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__379; B_dData_dPair.f_Pair_second = dtb__380 } -> (match dtb__380 with
  | { B_dData_dPair.f_Pair_first = dtb__381; B_dData_dPair.f_Pair_second = dtb__382 } -> (let resultTy = (match dtb__377 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__383) -> dtb__377
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__381
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__379)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__382 } })))
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
# 1125 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatAltFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let bound = (((v_altEnvIn mc2) mc3) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb__384))) in (let typed = ((v_typedPatsAll (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (mc0 - 1)) mc1) bound2) (Core_dTerm.v_caseAltBody dtb__384))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = dtb__386 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__385 })); B_dData_dPair.f_Pair_second = dtb__386 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 1141 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__387; B_dData_dPair.f_Pair_second = dtb__388 } -> (let fresh = (dtb__388).f_LwSt_lwNext in (let st2 = { f_LwSt_lwNext = (fresh + 1); f_LwSt_lwBinder = (dtb__388).f_LwSt_lwBinder } in (let zeroAlt = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natZeroCtor) alts)) ((v_findAltBy Base_dIntrinsics.v_finZeroCtor) alts)) in (let succAlt = ((v_firstAltOf ((v_findAltBy Base_dIntrinsics.v_natSuccCtor) alts)) ((v_findAltBy Base_dIntrinsics.v_finSuccCtor) alts)) in (let catchAlt = (v_findCatchAllAlt alts) in ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pz with
  | { B_dData_dPair.f_Pair_first = dtb__389; B_dData_dPair.f_Pair_second = dtb__390 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__390) outer) succAlt)) (fun (ps : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match ps with
  | { B_dData_dPair.f_Pair_first = dtb__391; B_dData_dPair.f_Pair_second = dtb__392 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__392) outer) catchAlt)) (fun (pc : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__393; B_dData_dPair.f_Pair_second = dtb__394 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__387, fresh, dtb__389, dtb__391, dtb__393)); B_dData_dPair.f_Pair_second = dtb__394 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1176 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (v_natCaseApplies alts) then ((((((v_lowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__395; B_dData_dPair.f_Pair_second = dtb__396 } -> (let scrutTy = (((Lowering_dTy.v_annotRunTyOf env) outer) scrut) in ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (fuel - 1)) env) scrutTy) dtb__396) outer) alts)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = q in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> (match dtb__398 with
  | { B_dData_dPair.f_Pair_first = dtb__399; B_dData_dPair.f_Pair_second = dtb__400 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase ((v_justTy scrutTy), (v_justTy dtb__399), dtb__395, dtb__397)); B_dData_dPair.f_Pair_second = dtb__400 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1197 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerProjAsCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let n = (Lowering_dEnv.v_listLength tele) in (let srcIdx = ((n - 1) - fi) in (match ((v_runtimeIndexInPairs srcIdx) tele) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__401) -> (((((v_lowerTermFuel (fuel - 1)) env) st) outer) (Core_dTerm.C_Term_TCase (base, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = c; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs ((v_projBindersIn tele) 0)); Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TVar ((v_recordProjVarIn fi), dtb__401, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "projection of an erased binder")
  | _ -> failwith "DT: impossible branch"
)))))
# 1250 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = dtb__403 } -> (let baseTy = (((Lowering_dTy.v_annotRunTyOf env) outer) base) in (match body with
  | Core_dTerm.C_Term_TMk (dtb__404, dtb__405) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__403) ((v_recordAltBindersIn tele) outer)) dtb__402) baseTy) c) fields) idxs) dtb__405)
  | Core_dTerm.C_Term_TCon (dtb__406, dtb__407) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__403) ((v_recordAltBindersIn tele) outer)) dtb__402) baseTy) c) fields) idxs) dtb__407)
  | _ -> (Base_dDiag.v_icInternal "record update body is not a constructor application")
))
  | _ -> failwith "DT: impossible branch"
)))))
# 1267 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateArgsFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (baseIr : Vuna_dIr_dModel.t_Ir) (baseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c : string) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let nd_uscrut10 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (match dtb__408 with
  | { B_dData_dPair.f_Pair_first = dtb__409; B_dData_dPair.f_Pair_second = dtb__410 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__411) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__410) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn fields) idxs)) (fun (positions : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_ctorOpaqueKeptFlags dtb__410) dtb__411)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__412; B_dData_dPair.f_Pair_second = dtb__413 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (baseIr, c, dtb__412, (v_justTy baseTy))); B_dData_dPair.f_Pair_second = dtb__413 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))
# 1290 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) (mc6 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (((v_nthOpqArgIn (B_dData_dPair.v_secondOf dtb__414)) mc5) mc7) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position out of range")
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__416)) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__418) mc3) mc4) mc5) dtb__415) mc7)) (fun (r : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> (match ((v_lookupRtLabelIn (B_dData_dPair.v_firstOf dtb__414)) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__417 }, dtb__419)); B_dData_dPair.f_Pair_second = dtb__420 }))
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
  | { f_LamChainIn_lamChainBinders = dtb__422; f_LamChainIn_lamChainBody = dtb__423; f_LamChainIn_lamChainResultTy = dtb__424 } -> (match dtb__422 with
  | B_dData_dList.C_List_Nil -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | _ -> (match defTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (match ((v_sigArrowTys 256) dtb__425) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__426) -> (if ((Lowering_dEnv.v_listLength dtb__426) = (v_countRuntimeParams dtb__422)) then ((((((((v_lowerLamChainFuel (v_lowerBudgetFor (Core_dTerm.v_termSize body))) env) st) B_dData_dList.C_List_Nil) dtb__426) dtb__422) dtb__423) dtb__424) else ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 981 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (Base_dDiag.v_icInternal "unboxed case arm has no constructor") else (let name = (Core_dTerm.v_caseAltName alt) in (let nd_uscrut7 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__427) -> (match dtb__427 with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__430; B_dData_dPair.f_Pair_second = dtb__431 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb__431) name) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__429)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) name)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotRunTyOf env) outer) scrut)))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = dtb__433 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (typed, dtb__430, dtb__432)); B_dData_dPair.f_Pair_second = dtb__433 }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
))))))

# 1318 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeArityIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438) -> (if (Core_dTerm.v_rigIsErased dtb__435) then (v_runtimeArityIn dtb__438) else (1 + (v_runtimeArityIn dtb__438)))
  | _ -> 0
))

# 1323 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recursiveValueAllowedIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__439, dtb__440) -> true
  | Core_dTerm.C_Term_TLam (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445) -> (if (Core_dTerm.v_rigIsErased dtb__442) then (v_recursiveValueAllowedIn dtb__445) else true)
  | _ -> false
))

# 1330 "Vuna/Compiler/Lowering/Program.vuna"
let v_initGuardOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : bool) (mc2 : string) (mc3 : Core_dTerm.t_Term) -> (if mc1 then false else (if (if (if ((mc0).Lowering_dEnv.f_LwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_runtimeArityIn mc3) = 0) else false) then true else false)))

# 1383 "Vuna/Compiler/Lowering/Program.vuna"
let v_externBasicIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__446) -> (match dtb__446 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__447, dtb__448) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__447) then (match (Lowering_dTy.v_reprTyIr dtb__447) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> (Base_dDiag.C_Check_OkC (dtb__449))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("extern type has no runtime representation: " ^ dtb__447))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.v_icInternal ("extern type is not basic: " ^ dtb__447)))
  | _ -> (Base_dDiag.v_icInternal "extern type is not a global type")
)
  | _ -> (Base_dDiag.v_icInternal "extern type is not basic")
))

# 1377 "Vuna/Compiler/Lowering/Program.vuna"
let v_externDomIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__450) -> (match dtb__450 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__451, dtb__452) -> (if (dtb__451 = "Array") then (match dtb__452 with
  | B_dData_dList.C_List__x58__x58_ (dtb__453, dtb__454) -> (match dtb__454 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (v_externBasicIr dtb__453)) (fun (e : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyArray (e))))))
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
)
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
) else (if (dtb__451 = "Array") then (Base_dDiag.v_icInternal "extern Array needs one type argument") else (v_externBasicIr mc0)))
  | _ -> (v_externBasicIr mc0)
)
  | _ -> (v_externBasicIr mc0)
))

# 1365 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_externTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc2 with
  | Core_dTerm.C_Value_VPi (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (if dtb__456 then (Base_dDiag.v_icInternal "extern has an implicit parameter") else ((Base_dCommon.v_bind (v_externDomIr dtb__458)) (fun (domIr : Vuna_dIr_dModel.t_IrTy) -> ((Base_dCommon.v_bind (((v_externTyIr (mc0 - 1)) (mc1 + 1)) ((Core_dEval.v_applyClosure dtb__459) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__455, mc1, B_dData_dList.C_List_Nil))))))) (fun (resIr : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (v_externDomIr mc2))
))

# 1362 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerExternTy = (fun (ty : Core_dTerm.t_Term) -> (((v_externTyIr 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) ty)))

# 1339 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDef = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__460) -> (match (v_lowerExternTy (Elab_dTypes.v_dtDefType d)) with
  | Base_dDiag.C_Check_ErrC (dtb__461) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__461)))
  | Base_dDiag.C_Check_OkC (dtb__462) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef ((Elab_dTypes.v_dtDefName d), dtb__462, dtb__460, (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__463) -> (let defTy = (B_dData_dMaybe.C_Maybe_Just ((((((Lowering_dTy.v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d))))) in (let nd_uscrut7 = ((((v_lowerDefBodyTerm env) st) dtb__463) defTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_OkC (dtb__464) -> (match dtb__464 with
  | { B_dData_dPair.f_Pair_first = dtb__465; B_dData_dPair.f_Pair_second = dtb__466 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef ((Elab_dTypes.v_dtDefName d), (v_runtimeArityIn dtb__463), ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)), defTy, dtb__465, (v_recursiveValueAllowedIn dtb__463), ((((v_initGuardOf env) false) (Elab_dTypes.v_dtDefName d)) dtb__463), (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = dtb__466 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__467) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__467)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1394 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerDefs = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__468, dtb__469) -> ((Base_dCommon.v_bind (((v_lowerDef mc0) mc1) dtb__468)) (fun (p : (Vuna_dIr_dModel.t_IrDef, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> ((Base_dCommon.v_bind (((v_lowerDefs mc0) dtb__471) dtb__469)) (fun (q : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__470, dtb__472)); B_dData_dPair.f_Pair_second = dtb__473 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1413 "Vuna/Compiler/Lowering/Program.vuna"
let v_nameKey = (fun (raw : string) (encoded : string) -> { B_dData_dPair.f_Pair_first = (Base_dSource.v_prefixOfName raw); B_dData_dPair.f_Pair_second = encoded })

# 1419 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_checkNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> (match dtb__474 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> (let key = (String.concat "" [dtb__476; "\t"; dtb__477]) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc2) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml name collision among "; mc0; "s in module `"; dtb__476; "`: `"; dtb__477; "`"])) else (((v_checkNoDupOcamlNamesGo mc0) dtb__475) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) true) mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1416 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkNoDupOcamlNames = (fun (kind : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkNoDupOcamlNamesGo kind) keys) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 1429 "Vuna/Compiler/Lowering/Program.vuna"
let v_ensureUniqueOcamlNamesIn = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtime = (Lowering_dEnv.v_rtDatasOf datas) in (let unboxed = (Elab_dRepresentation.v_unboxedFamilySet runtime) in (let valueKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> ((v_nameKey (Elab_dTypes.v_dtDefName d)) (Vuna_dTarget_dOcaml_dDecl.v_valueName (Elab_dTypes.v_dtDefName d))))) defs) in (let typeKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> ((v_nameKey (Elab_dTypes.v_dtDataName d)) (Vuna_dTarget_dOcaml_dDecl.v_typeName (Elab_dTypes.v_dtDataName d))))) runtime) in (let ctorKeys = ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) unboxed) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> ((v_nameKey (Elab_dTypes.v_dtCtorFamily c)) ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Elab_dTypes.v_dtCtorFamily c)) (Elab_dTypes.v_dtCtorName c))))) (Elab_dTypes.v_dtDataCtors d))))) runtime) in ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "value") valueKeys)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "type") typeKeys)) (fun (_u : int) -> ((v_checkNoDupOcamlNames "constructor") ctorKeys)))))))))))

# 1446 "Vuna/Compiler/Lowering/Program.vuna"
let v_prepareProgram = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let table = (Lowering_dChecks.v_defTable defs) in (let familyNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas) in (let axiomNames = (Lowering_dChecks.v_axiomNamesOf defs) in (match ((Lowering_dChecks.v_partitionDefs table) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__479 } -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb__478) in (let familyTypeNames = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) runtimeNames)))) familyNames) in (let allTypeNames = ((B_dData_dList.v_append dtb__479) familyTypeNames) in ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkNoAxiomRuntime axiomNames) dtb__478)) (fun (_u : int) -> ((Base_dCommon.v_bind (Lowering_dChecks.v_checkAllDefScopes defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_ensureUniqueOcamlNamesIn datas) dtb__478)) (fun (_u : int) -> ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkAllErasure allTypeNames) dtb__478)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (dtb__478)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1488 "Vuna/Compiler/Lowering/Program.vuna"
let v_tblLookup = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 1491 "Vuna/Compiler/Lowering/Program.vuna"
let v_recOkOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> (match (Elab_dTypes.v_dtDefBody dtb__480) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (v_recursiveValueAllowedIn dtb__481)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1500 "Vuna/Compiler/Lowering/Program.vuna"
let v_spanOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__482) -> (Elab_dTypes.v_dtDefSpan dtb__482)
  | _ -> failwith "DT: impossible branch"
))

# 1529 "Vuna/Compiler/Lowering/Program.vuna"
let[@tail_mod_cons] rec v_mapMaybeDef = (fun (mc0 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__483, dtb__484) -> (match ((v_tblLookup mc0) dtb__483) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybeDef mc0) dtb__484)
  | B_dData_dMaybe.C_Maybe_Just (dtb__485) -> (B_dData_dList.C_List__x58__x58_ (dtb__485, ((v_mapMaybeDef mc0) dtb__484)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1506 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appendGroups = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__486, dtb__487) -> (let isRec = (B_dData_dPair.v_firstOf dtb__486) in (let members = (B_dData_dPair.v_secondOf dtb__486) in (let defs = ((v_mapMaybeDef (mc0).Lowering_dEnv.f_LwEnv_lwDefTbl) members) in ((Base_dCommon.v_bind (((v_lowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__488; B_dData_dPair.f_Pair_second = dtb__489 } -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb__488)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_appendGroups mc0) dtb__489) dtb__487)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__490; B_dData_dPair.f_Pair_second = dtb__491 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isRec; B_dData_dPair.f_Pair_second = dtb__488 }, dtb__490)); B_dData_dPair.f_Pair_second = dtb__491 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1548 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ivarBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dIntrinsics.t_IType) -> (match mc1 with
  | Base_dIntrinsics.C_IType_IPi (dtb__492, dtb__493) -> ((v_ivarBound (B_dData_dList.C_List__x58__x58_ (dtb__492, mc0))) dtb__493)
  | Base_dIntrinsics.C_IType_IVar (dtb__494) -> ((B_dData_dList.v_memName dtb__494) mc0)
  | Base_dIntrinsics.C_IType_IFun1 (dtb__495, dtb__496) -> (if ((v_ivarBound mc0) dtb__495) then ((v_ivarBound mc0) dtb__496) else false)
  | Base_dIntrinsics.C_IType_IFun (dtb__497, dtb__498) -> (if ((v_ivarBound mc0) dtb__497) then ((v_ivarBound mc0) dtb__498) else false)
  | Base_dIntrinsics.C_IType_IEffHost (dtb__499) -> ((v_ivarBound mc0) dtb__499)
  | Base_dIntrinsics.C_IType_IEff (dtb__500) -> ((v_ivarBound mc0) dtb__500)
  | Base_dIntrinsics.C_IType_IAtomic -> true
  | Base_dIntrinsics.C_IType_ICondvar -> true
  | Base_dIntrinsics.C_IType_IMutex -> true
  | Base_dIntrinsics.C_IType_IThread (dtb__501) -> ((v_ivarBound mc0) dtb__501)
  | Base_dIntrinsics.C_IType_IMBuffer -> true
  | Base_dIntrinsics.C_IType_IMDynArray (dtb__502) -> ((v_ivarBound mc0) dtb__502)
  | Base_dIntrinsics.C_IType_IMArray (dtb__503) -> ((v_ivarBound mc0) dtb__503)
  | Base_dIntrinsics.C_IType_ICell (dtb__504) -> ((v_ivarBound mc0) dtb__504)
  | Base_dIntrinsics.C_IType_IArray (dtb__505) -> ((v_ivarBound mc0) dtb__505)
  | Base_dIntrinsics.C_IType_IList (dtb__506) -> ((v_ivarBound mc0) dtb__506)
  | Base_dIntrinsics.C_IType_IGlobal (dtb__507) -> true
  | Base_dIntrinsics.C_IType_IFloat -> true
  | Base_dIntrinsics.C_IType_INat -> true
  | Base_dIntrinsics.C_IType_IBool -> true
  | Base_dIntrinsics.C_IType_IStr -> true
  | Base_dIntrinsics.C_IType_IInt -> true
  | Base_dIntrinsics.C_IType_ITy -> true
  | _ -> failwith "DT: impossible branch"
))

# 1573 "Vuna/Compiler/Lowering/Program.vuna"
let v_intrinsicWithUnboundIvar = (fun (is : Base_dIntrinsics.t_Intrinsic B_dData_dList.t_List) -> ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) ((B_dData_dList.v_filter (fun (i : Base_dIntrinsics.t_Intrinsic) -> (B_dData_dBool.v_not ((v_ivarBound B_dData_dList.C_List_Nil) (Base_dIntrinsics.v_intrinsicSignature i))))) is)))

# 1607 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstOfList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__508, dtb__509) -> dtb__508
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1580 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkRuntimeContract = (let intrinsicNames = ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) Base_dIntrinsics.v_allIntrinsics) in (let contractNames = Vuna_dIr_dRuntime.v_irRtNames in (let badIvars = (v_intrinsicWithUnboundIvar Base_dIntrinsics.v_allIntrinsics) in (let missingFromContract = ((B_dData_dList.v_filter (fun (n : string) -> (if (n = Base_dIntrinsics.v_primEffBind1Name) then false else (if ((B_dData_dList.v_memName n) contractNames) then false else true)))) intrinsicNames) in (let extrasInContract = ((B_dData_dList.v_filter (fun (n : string) -> (if ((B_dData_dList.v_memName n) intrinsicNames) then false else (if ((B_dData_dList.v_memName n) Vuna_dIr_dRuntime.v_irRtSyntheticNames) then false else true)))) contractNames) in (if ((Lowering_dEnv.v_listLength badIvars) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["intrinsic `"; (v_firstOfList badIvars); "` has an unbound type variable in its signature"])) else (if ((Lowering_dEnv.v_listLength missingFromContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_firstOfList missingFromContract); "`"])) else (if ((Lowering_dEnv.v_listLength extrasInContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_firstOfList extrasInContract); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras); "`"])) else (Base_dDiag.C_Check_OkC (0))))))))))))

# 1540 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkProgramOf = (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((v_prepareProgram (env).Lowering_dEnv.f_LwEnv_lwDatas) (env).Lowering_dEnv.f_LwEnv_lwOrigDefs)) (fun (_u : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> v_checkRuntimeContract)))

# 1661 "Vuna/Compiler/Lowering/Program.vuna"
let v_adjOfDef = (fun (env : Lowering_dEnv.t_LwEnv) (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)) })

# 1469 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupDefs = (fun (env : Lowering_dEnv.t_LwEnv) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let adj = ((B_dData_dList.v_map (v_adjOfDef env)) defs) in (let names = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs) in (let tbl = (Lowering_dEnv.v_defTblOf defs) in ((Base_dCommon.v_bind ((((Vuna_dIr_dAnalysis.v_assembleGroupNames adj) names) (v_recOkOfTbl tbl)) (v_spanOfTbl tbl))) (fun (groups : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_appendGroups env) { f_LwSt_lwNext = 0; f_LwSt_lwBinder = 1 }) groups)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__511 } -> (Base_dDiag.C_Check_OkC (dtb__510))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1664 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupOfPair = (fun (mc0 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = dtb__513 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__512; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__513 }
  | _ -> failwith "DT: impossible branch"
))

# 1687 "Vuna/Compiler/Lowering/Program.vuna"
let v_partitionRuntimeDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> dtb__514
  | _ -> failwith "DT: impossible branch"
))

# 1645 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitPrepared = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let datas = (env).Lowering_dEnv.f_LwEnv_lwDatas in (let runtime = (v_partitionRuntimeDefs defs) in ((Base_dCommon.v_bind ((v_groupDefs env) runtime)) (fun (groups : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((Lowering_dTy.v_tyDeclsOf (env).Lowering_dEnv.f_LwEnv_lwDataTbl) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (let groups2 = ((B_dData_dList.v_map v_groupOfPair) groups) in (let hasList = ((Lowering_dEnv.v_hasDataNamed Base_dIntrinsics.v_listFamilyName) unitDatas) in (Base_dDiag.C_Check_OkC ((Vuna_dIr_dDispatch.v_dispatchIdsUnit ((Vuna_dIr_dRepresent.v_representUnit (Lowering_dEnv.v_lwEnvShared env)) { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = decls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups2; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasList; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (Lowering_dTy.v_tyDeclRefs decls); Vuna_dIr_dModel.f_IrUnit_irUnitEntry = B_dData_dMaybe.C_Maybe_Nothing })))))))))))))

# 1622 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitCheckedFrom = (fun (env : Lowering_dEnv.t_LwEnv) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerUnitPrepared env) unitDatas) defs)) (fun (u : Vuna_dIr_dModel.t_IrUnit) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Lowering.Program") then (((dtp_log_emit 2) "Vuna.Compiler.Lowering.Program") "cg-unit-validate-start") else 0) in ((Base_dCommon.v_bind ((Vuna_dIr_dValidate.v_validateUnit (Lowering_dEnv.v_lwEnvShared env)) u)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (u))))))))

# 1634 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitAfterChecks = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> (let defNameTbl = (B_dContainer_dHashMap.v_ofNames defNames) in (let defs = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName d)) defNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDefs) in (let dataNameTbl = (B_dContainer_dHashMap.v_ofNames dataNames) in (let unitDatas = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDataName d)) dataNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDatas) in (((v_lowerUnitPrepared env) unitDatas) defs))))))

# 1614 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitOf = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkProgramOf env)) (fun (_u : int) -> (((v_lowerUnitAfterChecks env) defNames) dataNames))))

# 1672 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.env") (fun (_u : int) -> ((((Lowering_dEnv.v_mkLwEnv datas) defs) globals) "")))) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_checkProgramOf env)))) (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_lowerUnitAfterChecks env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.entry") (fun (_u : int) -> (Lowering_dEntry.v_lowerEntryOf (env).Lowering_dEnv.f_LwEnv_lwDefs)))) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrProgram_irProgShared = (Lowering_dEnv.v_lwEnvShared env); Vuna_dIr_dModel.f_IrProgram_irProgUnit = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry } })))))))))))

# 1679 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramCheckedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerProgramOf datas) defs) globals)) (fun (program : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind (Vuna_dIr_dValidate.v_validateProgram program)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (program)))))))

# 51 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwNext = (fun (p : t_LwSt) -> (match p with
  | { f_LwSt_lwNext = dtb__516; f_LwSt_lwBinder = dtb__517 } -> dtb__516
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Lowering/Program.vuna"
let v_lwBinder = (fun (p : t_LwSt) -> (match p with
  | { f_LwSt_lwNext = dtb__518; f_LwSt_lwBinder = dtb__519 } -> dtb__519
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamName = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__520; f_LamParam_lamParamRig = dtb__521; f_LamParam_lamParamTy = dtb__522 } -> dtb__520
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamRig = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__523; f_LamParam_lamParamRig = dtb__524; f_LamParam_lamParamTy = dtb__525 } -> dtb__524
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamParamTy = (fun (p : t_LamParam) -> (match p with
  | { f_LamParam_lamParamName = dtb__526; f_LamParam_lamParamRig = dtb__527; f_LamParam_lamParamTy = dtb__528 } -> dtb__528
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBinders = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__529; f_LamChainIn_lamChainBody = dtb__530; f_LamChainIn_lamChainResultTy = dtb__531 } -> dtb__529
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainBody = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__532; f_LamChainIn_lamChainBody = dtb__533; f_LamChainIn_lamChainResultTy = dtb__534 } -> dtb__533
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Lowering/Program.vuna"
let v_lamChainResultTy = (fun (p : t_LamChainIn) -> (match p with
  | { f_LamChainIn_lamChainBinders = dtb__535; f_LamChainIn_lamChainBody = dtb__536; f_LamChainIn_lamChainResultTy = dtb__537 } -> dtb__537
  | _ -> failwith "DT: impossible branch"
))

# 826 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnv = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__538; f_AltEnvIn_aePats = dtb__539; f_AltEnvIn_aeSt = dtb__540 } -> dtb__538
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePats = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__541; f_AltEnvIn_aePats = dtb__542; f_AltEnvIn_aeSt = dtb__543 } -> dtb__542
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeSt = (fun (p : t_AltEnvIn) -> (match p with
  | { f_AltEnvIn_aeEnv = dtb__544; f_AltEnvIn_aePats = dtb__545; f_AltEnvIn_aeSt = dtb__546 } -> dtb__546
  | _ -> failwith "DT: impossible branch"
))
