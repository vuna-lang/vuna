open Vuna_runtime
type t_LwSt = int
and t_LamParam = { f_LamParam_lamParamName : string; f_LamParam_lamParamRig : Core_dTerm.t_Rig; f_LamParam_lamParamTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_LamChainIn = { f_LamChainIn_lamChainBinders : t_LamParam B_dData_dList.t_List; f_LamChainIn_lamChainBody : Core_dTerm.t_Term; f_LamChainIn_lamChainResultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe }
and t_AltEnvIn = { f_AltEnvIn_aeEnv : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aePats : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List; f_AltEnvIn_aeSt : t_LwSt }

# 55 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderErasedOf = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder) -> (match mc0 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb__0; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb__1; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBudgetFor = (fun (size : int) -> (512 + (8 * size)))

# 147 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_binderAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_binderAtIn (mc0 - 1)) dtb__4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordFieldNameAt = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (if (dtb__7 = mc0) then (Base_dDiag.C_Check_OkC (dtb__8)) else ((v_recordFieldNameAt mc0) dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record field position out of range")
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recordTermAsAppIn = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | { B_dData_dPair.f_Pair_first = dtb__11; B_dData_dPair.f_Pair_second = dtb__12 } -> ((v_recordTermAsAppIn (Core_dTerm.C_Term_TApp (mc0, dtb__11, dtb__12))) dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerBridgeGuard = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) (ir : Vuna_dIr_dModel.t_Ir) -> (if (Vuna_dIr_dRuntime.v_irRtBridgesList name) then (if (env).Lowering_dEnv.f_LwEnv_lwHasListFamily then (Base_dDiag.C_Check_OkC (ir)) else ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_ListBridgeRequired (name))) name)) else (Base_dDiag.C_Check_OkC (ir))))

# 190 "Vuna/Compiler/Lowering/Program.vuna"
let v_effUnitTyIn = (Vuna_dIr_dModel.C_IrTy_IrTyData (Base_dIntrinsics.v_effUnitTypeName, B_dData_dList.C_List_Nil))

# 164 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerGlobalRef = (fun (env : Lowering_dEnv.t_LwEnv) (name : string) -> (if (name = Base_dIntrinsics.v_natZeroCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrInt (0)))) else (if (name = "strFromFloat") then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (Lowering_dEnv.v_floatRenderRefName)))) else (if (name = Base_dIntrinsics.v_natSuccCtor) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)))) else (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Base_dIntrinsics.v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> (if (name = Base_dIntrinsics.v_primEffBind1Name) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrEffBind (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn)))) else (if (Base_dIntrinsics.v_intrinsicReturnsEff dtb__13) then (((v_lowerBridgeGuard env) name) (Vuna_dIr_dModel.C_Ir_IrEffThunk (Base_dIntrinsics.v_effTypeName, Base_dIntrinsics.v_effMkCtor, v_effUnitTyIn, (Base_dIntrinsics.v_intrinsicArity dtb__13), (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb__13)))))) else (((v_lowerBridgeGuard env) name) (Vuna_dIr_dModel.C_Ir_IrRt ((Base_dIntrinsics.v_intrinsicName dtb__13))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_Ir_IrCtor (dtb__15, name, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 206 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_collectLamChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (let p = (v_collectLamChainIn dtb__21) in (let result = (match (p).f_LamChainIn_lamChainResultTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (p).f_LamChainIn_lamChainResultTy
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.v_lamResultTyOf dtb__19)
  | _ -> failwith "DT: impossible branch"
) in { f_LamChainIn_lamChainBinders = (B_dData_dList.C_List__x58__x58_ ({ f_LamParam_lamParamName = dtb__17; f_LamParam_lamParamRig = dtb__18; f_LamParam_lamParamTy = (Core_dTerm.v_lamBinderTyOf dtb__19) }, (p).f_LamChainIn_lamChainBinders)); f_LamChainIn_lamChainBody = (p).f_LamChainIn_lamChainBody; f_LamChainIn_lamChainResultTy = result }))
  | _ -> { f_LamChainIn_lamChainBinders = B_dData_dList.C_List_Nil; f_LamChainIn_lamChainBody = mc0; f_LamChainIn_lamChainResultTy = B_dData_dMaybe.C_Maybe_Nothing }
))

# 282 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countRuntimeParams = (fun (mc0 : t_LamParam B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (Core_dTerm.v_rigIsErased (dtb__23).f_LamParam_lamParamRig) then (v_countRuntimeParams dtb__24) else (1 + (v_countRuntimeParams dtb__24)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_sigArrowTys = (fun (fuel : int) (ty : Vuna_dIr_dModel.t_IrTy) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ty with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__25, dtb__26) -> (match ((v_sigArrowTys (fuel - 1)) dtb__26) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__27))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
)))

# 306 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_headGlobalOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__28, dtb__29) -> (B_dData_dMaybe.C_Maybe_Just (dtb__28))
  | Core_dTerm.C_Term_TApp (dtb__30, dtb__31, dtb__32) -> (v_headGlobalOf dtb__30)
  | Core_dTerm.C_Term_TGlobal (dtb__33) -> (B_dData_dMaybe.C_Maybe_Just (dtb__33))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 300 "Vuna/Compiler/Lowering/Program.vuna"
let v_effResultTyOf = (fun (t : Core_dTerm.t_Term) -> (match (v_headGlobalOf t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (if (dtb__34 = Vuna_dIr_dModel.v_irEffTypeName) then (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (Vuna_dIr_dModel.v_irEffTypeName, (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, B_dData_dList.C_List_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderOfParam = (fun (env : Lowering_dEnv.t_LwEnv) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (p : t_LamParam) -> (if (Core_dTerm.v_rigIsErased (p).f_LamParam_lamParamRig) then Vuna_dIr_dModel.v_mkIrBinderErased else (match (p).f_LamParam_lamParamTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_mkIrBinder (p).f_LamParam_lamParamName)
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> ((Vuna_dIr_dModel.v_mkIrBinderTyped (p).f_LamParam_lamParamName) (((Lowering_dTy.v_annotTyOfTotal env) outer) dtb__35))
  | _ -> failwith "DT: impossible branch"
)))

# 313 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_bindersOfParams = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : t_LamParam B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (let b = (((v_binderOfParam mc0) mc1) dtb__36) in (B_dData_dList.C_List__x58__x58_ (b, (((v_bindersOfParams mc0) (B_dData_dList.C_List__x58__x58_ (b, mc1))) dtb__37))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_bindersOfParamsHint = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc3 : t_LamParam B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (let erased = (Core_dTerm.v_rigIsErased (dtb__38).f_LamParam_lamParamRig) in (let hint = (if erased then B_dData_dMaybe.C_Maybe_Nothing else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (B_dData_dMaybe.C_Maybe_Just (dtb__43))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (let restHints = (if erased then mc2 else (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> dtb__42
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in (let b = (match hint with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> ((Vuna_dIr_dModel.v_mkIrBinderTyped (dtb__38).f_LamParam_lamParamName) dtb__40)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_binderOfParam mc0) mc1) dtb__38)
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dList.C_List__x58__x58_ (b, ((((v_bindersOfParamsHint mc0) (B_dData_dList.C_List__x58__x58_ (b, mc1))) restHints) dtb__39)))))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) -> (let nd_uscrut3 = (((Lowering_dTy.v_annotCalleeTy env) binders) f) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> (match dtb__45 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__46, dtb__47) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__47 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 407 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyOfIr = (fun (ir : Vuna_dIr_dModel.t_Ir) -> (let nd_uscrut1 = (Vuna_dIr_dModel.v_irResultTyOf ir) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match dtb__48 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__49, dtb__50) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__50 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 413 "Vuna/Compiler/Lowering/Program.vuna"
let v_appTyFrom = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (irF : Vuna_dIr_dModel.t_Ir) -> (match (((v_appTyOf env) binders) f) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__51) -> (B_dData_dMaybe.C_Maybe_Just (dtb__51))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_appTyOfIr irF)
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_concatLeavesGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__52, dtb__53, dtb__54) -> (match dtb__52 with
  | Core_dTerm.C_Term_TApp (dtb__55, dtb__56, dtb__57) -> (let whole = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp (dtb__55, dtb__56, dtb__57)), dtb__53, dtb__54)) in (if (if (Core_dTerm.v_rigIsErased dtb__57) then true else (Core_dTerm.v_rigIsErased dtb__54)) then (B_dData_dList.C_List__x58__x58_ (whole, mc1)) else (match dtb__55 with
  | Core_dTerm.C_Term_TGlobal (dtb__58) -> (if (dtb__58 = "++") then ((v_concatLeavesGo dtb__56) ((v_concatLeavesGo dtb__53) mc1)) else (B_dData_dList.C_List__x58__x58_ (whole, mc1)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (whole, mc1))
)))
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (mc0, mc1))
))

# 483 "Vuna/Compiler/Lowering/Program.vuna"
let v_concatLeavesIn = (fun (t : Core_dTerm.t_Term) -> ((v_concatLeavesGo t) B_dData_dList.C_List_Nil))

# 473 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenConcatChainIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__59, dtb__60, dtb__61) -> (match dtb__59 with
  | Core_dTerm.C_Term_TApp (dtb__62, dtb__63, dtb__64) -> (if (if (Core_dTerm.v_rigIsErased dtb__64) then true else (Core_dTerm.v_rigIsErased dtb__61)) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb__62 with
  | Core_dTerm.C_Term_TGlobal (dtb__65) -> (if (dtb__65 = "++") then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append (v_concatLeavesIn dtb__63)) (v_concatLeavesIn dtb__60)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 511 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__69)) then (v_allRuntimeArgs dtb__67) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Lowering/Program.vuna"
let v_flattenIntrinsicAppIn = (fun (t : Core_dTerm.t_Term) -> (match (Lowering_dChecks.v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> (if (v_allRuntimeArgs dtb__71) then (match dtb__70 with
  | Core_dTerm.C_Term_TGlobal (dtb__72) -> (if ((Vuna_dIr_dModel.v_irInlineArity dtb__72) > 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__71 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Lowering/Program.vuna"
let v_inlineArityMatchesIn = (fun (name : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if ((Vuna_dIr_dModel.v_irInlineArity name) <= 0) then false else ((Lowering_dEnv.v_listLength args) = (Vuna_dIr_dModel.v_irInlineArity name))))

# 524 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_alignCtorArgs = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (match dtb__75 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (if dtb__73 then (if (Core_dTerm.v_rigIsErased dtb__78) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Base_dCommon.v_bind (((v_alignCtorArgs mc0) dtb__74) dtb__76)) (fun (ts : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 }, ts))))))) else (if (Core_dTerm.v_rigIsErased dtb__78) then (((v_alignCtorArgs mc0) dtb__74) dtb__76) else (((v_alignCtorArgs mc0) dtb__74) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 }, dtb__76)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if dtb__73 then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_alignCtorArgs mc0) dtb__74) B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Lowering/Program.vuna"
let v_ctorArgIr = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc1 : bool) (mc2 : Vuna_dIr_dModel.t_Ir) -> (if mc1 then (Vuna_dIr_dModel.C_Ir_IrCast (mc0, (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)), mc2)) else mc2))

# 572 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ctorOpaqueKeptFlags = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (if dtb__81 then (B_dData_dList.C_List__x58__x58_ (dtb__83, ((v_ctorOpaqueKeptFlags dtb__82) dtb__84))) else ((v_ctorOpaqueKeptFlags dtb__82) dtb__84))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_zipFieldNames = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> ((Base_dCommon.v_bind ((v_zipFieldNames dtb__86) dtb__88)) (fun (rest : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_secondOf dtb__85); B_dData_dPair.f_Pair_second = dtb__87 }, rest))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "record construction has fewer runtime arguments than its runtime field table")
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (Base_dDiag.v_icInternal "record construction has more runtime arguments than its runtime field table")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerConAppFinish = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (family : string) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (irs : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) family) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (let recTy = (match (((Lowering_dTy.v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (family, dtb__92))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind ((v_zipFieldNames dtb__91) irs)) (fun (pairs : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecord (family, recTy, pairs)); B_dData_dPair.f_Pair_second = st })))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCtor (family, c, (((Lowering_dTy.v_ctorTypeArgsOf env) c) args), irs)); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeEnvOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__93; f_AltEnvIn_aePats = dtb__94; f_AltEnvIn_aeSt = dtb__95 } -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Lowering/Program.vuna"
let v_aePatsOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__96; f_AltEnvIn_aePats = dtb__97; f_AltEnvIn_aeSt = dtb__98 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Lowering/Program.vuna"
let v_aeStOf = (fun (mc0 : t_AltEnvIn) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__99; f_AltEnvIn_aePats = dtb__100; f_AltEnvIn_aeSt = dtb__101 } -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

# 677 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_countKept = (fun (mc0 : bool B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (if dtb__102 then (1 + (v_countKept dtb__103)) else (v_countKept dtb__103))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvGo = (fun (mc0 : t_LwSt) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (if (Core_dTerm.v_rigIsErased dtb__107) then ((((v_altEnvGo mc0) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc1))) dtb__105) mc3) else (let fresh = (let dtb__108 = mc0 in dtb__108) in (let b = (Vuna_dIr_dModel.v_mkIrBinderArm fresh) in ((((v_altEnvGo (fresh + 1)) (B_dData_dList.C_List__x58__x58_ (b, mc1))) dtb__105) (B_dData_dList.C_List__x58__x58_ (b, mc3))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_AltEnvIn_aeEnv = mc1; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc3); f_AltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 692 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvIn = (fun (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_altEnvGo st) outer) tele) B_dData_dList.C_List_Nil))

# 707 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvFullIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if ((Lowering_dTy.v_flagMatchesRigIn dtb__113) dtb__112) then (if dtb__113 then (let fresh = (let dtb__115 = mc0 in dtb__115) in (let b = (Vuna_dIr_dModel.v_mkIrBinderArm fresh) in ((((((v_altEnvFullIn (fresh + 1)) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__110) dtb__114) (B_dData_dList.C_List__x58__x58_ (b, mc5))))) else ((((((v_altEnvFullIn mc0) mc1) (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.v_mkIrBinderErased, mc2))) dtb__110) dtb__114) mc5)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc5); f_AltEnvIn_aeSt = mc0 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_altEnvKeptIn = (fun (mc0 : t_LwSt) (mc1 : string) (mc2 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (if (Core_dTerm.v_rigIsErased dtb__121) then (Base_dDiag.v_icInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else (let fresh = (let dtb__122 = mc0 in dtb__122) in (let b = (Vuna_dIr_dModel.v_mkIrBinderArm fresh) in (((((v_altEnvKeptIn (fresh + 1)) mc1) (B_dData_dList.C_List__x58__x58_ (b, mc2))) dtb__119) (B_dData_dList.C_List__x58__x58_ (b, mc4))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_AltEnvIn_aeEnv = mc2; f_AltEnvIn_aePats = (B_dData_dList.v_reverse mc4); f_AltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Lowering/Program.vuna"
let v_altEnvCheckedIn = (fun (st : t_LwSt) (label : string) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (flags : bool B_dData_dList.t_List) -> (if ((Lowering_dEnv.v_listLength binders) = (Lowering_dEnv.v_listLength flags)) then ((((((v_altEnvFullIn st) label) outer) binders) flags) B_dData_dList.C_List_Nil) else (if ((Lowering_dEnv.v_listLength binders) = (v_countKept flags)) then (((((v_altEnvKeptIn st) label) outer) binders) B_dData_dList.C_List_Nil) else (Base_dDiag.v_icInternal (String.concat "" ["constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 739 "Vuna/Compiler/Lowering/Program.vuna"
let v_binderWithTy = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (b : Vuna_dIr_dModel.t_IrBinder) -> { Vuna_dIr_dModel.f_IrBinder_irBinderName = (b).Vuna_dIr_dModel.f_IrBinder_irBinderName; Vuna_dIr_dModel.f_IrBinder_irBinderErased = (b).Vuna_dIr_dModel.f_IrBinder_irBinderErased; Vuna_dIr_dModel.f_IrBinder_irBinderTy = ty })

# 742 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_typedPats = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (B_dData_dList.C_List__x58__x58_ (((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__123))) dtb__125), ((v_typedPats dtb__124) dtb__126)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Lowering/Program.vuna"
let v_typedPatsAll = (fun (ty : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (bs : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (b : Vuna_dIr_dModel.t_IrBinder) -> ((v_binderWithTy ty) b))) bs))

# 752 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_armTyTblOf = (fun (mc0 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (let tail = (v_armTyTblOf dtb__128) in (match (dtb__127).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__129) -> (match (dtb__127).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 }, tail))
  | B_dData_dMaybe.C_Maybe_Nothing -> tail
  | _ -> failwith "DT: impossible branch"
)
  | _ -> tail
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 773 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupArmTy = (fun (mc0 : int) (mc1 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__133; B_dData_dPair.f_Pair_second = dtb__134 } -> (if (dtb__133 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__134)) else ((v_lookupArmTy mc0) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagArmBinder = (fun (tbl : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (b : Vuna_dIr_dModel.t_IrBinder) -> (match (b).Vuna_dIr_dModel.f_IrBinder_irBinderName with
  | Vuna_dIr_dModel.C_IrBName_IrBArm (dtb__135) -> (match ((v_lookupArmTy dtb__135) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> ((v_binderWithTy (B_dData_dMaybe.C_Maybe_Just (dtb__136))) b)
  | B_dData_dMaybe.C_Maybe_Nothing -> b
  | _ -> failwith "DT: impossible branch"
)
  | _ -> b
))

# 777 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_retagArmEnv = (fun (mc0 : (int, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (B_dData_dList.C_List__x58__x58_ (((v_retagArmBinder mc0) dtb__137), ((v_retagArmEnv mc0) dtb__138)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Lowering/Program.vuna"
let v_retagAltEnv = (fun (mc0 : t_AltEnvIn) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc0 with
  | { f_AltEnvIn_aeEnv = dtb__139; f_AltEnvIn_aePats = dtb__140; f_AltEnvIn_aeSt = dtb__141 } -> { f_AltEnvIn_aeEnv = ((v_retagArmEnv (v_armTyTblOf mc1)) dtb__139); f_AltEnvIn_aePats = mc1; f_AltEnvIn_aeSt = dtb__141 }
  | _ -> failwith "DT: impossible branch"
))

# 788 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_hasFallbackAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if ((Core_dTerm.v_caseAltName dtb__142) = "") then true else (v_hasFallbackAlt dtb__143))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_allCatchAll = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (if ((Core_dTerm.v_caseAltName dtb__144) = "") then (v_allCatchAll dtb__145) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseAlt = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (if ((Core_dTerm.v_caseAltName dtb__146) = "") then B_dData_dMaybe.C_Maybe_Nothing else (let name = (Core_dTerm.v_caseAltName dtb__146) in (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (mc0).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__149) (mc0).Lowering_dEnv.f_LwEnv_lwUnboxed) then (if (v_allCatchAll dtb__147) then (B_dData_dMaybe.C_Maybe_Just (dtb__146)) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 845 "Vuna/Compiler/Lowering/Program.vuna"
let v_armResultTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (bodyIr : Vuna_dIr_dModel.t_Ir) (coreBody : Core_dTerm.t_Term) -> (match (Vuna_dIr_dModel.v_irResultTyOf bodyIr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (B_dData_dMaybe.C_Maybe_Just (dtb__151))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match bodyIr with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__152) -> (match (((Lowering_dTy.v_annotGlobalTy env) (v_aeEnvOf bound)) dtb__152) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (B_dData_dMaybe.C_Maybe_Just (dtb__153))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Lowering_dTy.v_annotTyOf env) (v_aeEnvOf bound)) coreBody)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((Lowering_dTy.v_annotTyOf env) (v_aeEnvOf bound)) coreBody)
)
  | _ -> failwith "DT: impossible branch"
))

# 919 "Vuna/Compiler/Lowering/Program.vuna"
let v_isNatCtorName = (fun (name : string) -> (if (name = Base_dIntrinsics.v_natZeroCtor) then true else (name = Base_dIntrinsics.v_natSuccCtor)))

# 926 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseAllCtors = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if ((Core_dTerm.v_caseAltName dtb__154) = "") then (v_natCaseAllCtors dtb__155) else (let name = (Core_dTerm.v_caseAltName dtb__154) in (if (v_isNatCtorName name) then (v_natCaseAllCtors dtb__155) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_natCaseHasCtor = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if ((Core_dTerm.v_caseAltName dtb__156) = "") then (v_natCaseHasCtor dtb__157) else true)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 922 "Vuna/Compiler/Lowering/Program.vuna"
let v_natCaseApplies = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> false
  | _ -> (if (v_natCaseAllCtors mc0) then (v_natCaseHasCtor mc0) else false)
))

# 940 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findAltBy = (fun (mc0 : string) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if ((Core_dTerm.v_caseAltName dtb__158) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__158)) else ((v_findAltBy mc0) dtb__159))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_findCatchAllAlt = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (if ((Core_dTerm.v_caseAltName dtb__160) = "") then (B_dData_dMaybe.C_Maybe_Just (dtb__160)) else (v_findCatchAllAlt dtb__161))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1030 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordProjVarIn = (fun (i : int) -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 1033 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_projBindersIn = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_recordProjVarIn mc1); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__162) }, ((v_projBindersIn dtb__163) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1040 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtLabelIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if (dtb__166 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__167)) else ((v_lookupRtLabelIn mc0) dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1045 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPosIn = (fun (mc0 : int) (mc1 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (if (dtb__170 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_lookupRtPosIn mc0) dtb__169) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1050 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lookupRtPositionsIn = (fun (mc0 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (match (((v_lookupRtPosIn dtb__172) mc0) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn mc0) dtb__173)) (fun (ps : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__174 }, ps))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["record update targets field index "; (bi_strFromInt dtb__172); ", which has no runtime field"]))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_nthOpqArgIn = (fun (mc0 : int) (mc1 : bool B_dData_dList.t_List) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__177, dtb__178) -> (match dtb__177 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__179)) else (((v_nthOpqArgIn (mc0 - 1)) dtb__176) dtb__178))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1072 "Vuna/Compiler/Lowering/Program.vuna"
let v_eraseTele = (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> Vuna_dIr_dModel.v_mkIrBinderErased)

# 1069 "Vuna/Compiler/Lowering/Program.vuna"
let v_recordAltBindersIn = (fun (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((B_dData_dList.v_append (B_dData_dList.v_reverse ((B_dData_dList.v_map v_eraseTele) tele))) binders))

# 78 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerTermFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__181, dtb__182, dtb__183) -> (match ((v_binderAtIn dtb__182) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (if (v_binderErasedOf dtb__184) then ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_TypeLevelBindingRuntime (dtb__181))) dtb__181) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrVar (dtb__184)); B_dData_dPair.f_Pair_second = st })))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__185) -> ((Base_dCommon.v_bind ((v_lowerGlobalRef env) dtb__185)) (fun (ir : Vuna_dIr_dModel.t_Ir) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ir; B_dData_dPair.f_Pair_second = st }))))
  | Core_dTerm.C_Term_TInt (dtb__186) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__186)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TStr (dtb__187) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrStr (dtb__187)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TFloat (dtb__188) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__188)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TBool (dtb__189) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrBool (dtb__189)); B_dData_dPair.f_Pair_second = st }))
  | Core_dTerm.C_Term_TIf (dtb__190, dtb__191, dtb__192) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__190)) (fun (pc : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__194) binders) dtb__191)) (fun (pt : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pt with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__196) binders) dtb__192)) (fun (pe : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pe with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrIf (dtb__193, dtb__195, dtb__197)); B_dData_dPair.f_Pair_second = dtb__198 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Core_dTerm.C_Term_TLam (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (((((((((v_lowerLamFuel (fuel - 1)) env) st) binders) dtb__199) dtb__200) dtb__201) dtb__202) dtb__203)
  | Core_dTerm.C_Term_TApp (dtb__204, dtb__205, dtb__206) -> (((((((v_lowerAppFuel (fuel - 1)) env) st) binders) dtb__204) dtb__205) dtb__206)
  | Core_dTerm.C_Term_TCon (dtb__207, dtb__208) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__207) dtb__208)
  | Core_dTerm.C_Term_TMk (dtb__209, dtb__210) -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__209) dtb__210)
  | Core_dTerm.C_Term_TRecord (dtb__211, dtb__212) -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) ((v_recordTermAsAppIn (Core_dTerm.C_Term_TGlobal (dtb__211))) dtb__212))
  | Core_dTerm.C_Term_TCase (dtb__213, dtb__214) -> ((((((v_lowerCaseFuel (fuel - 1)) env) st) binders) dtb__213) dtb__214)
  | Core_dTerm.C_Term_TRecUpd (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__216) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> ((((((((((v_lowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__215) dtb__216) dtb__217) dtb__220) dtb__218) dtb__219)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerTermFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TCase (dtb__215, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__216; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__217); Core_dTerm.f_CaseAlt_caseAltBody = dtb__219 }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TProj (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__222) (env).Lowering_dEnv.f_LwEnv_lwRecordFields) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> ((Base_dCommon.v_bind ((v_recordFieldNameAt dtb__225) dtb__226)) (fun (label : string) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) dtb__221)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) dtb__222)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let args = (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotTyOf env) binders) dtb__221)) in (let resTy = (match (((v_lookupRtPosIn dtb__225) dtb__226) 0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> ((Vuna_dIr_dModel.v_irTyAt ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars args)) fieldTys)) dtb__229)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrProj (dtb__227, dtb__222, label, resTy)); B_dData_dPair.f_Pair_second = dtb__228 }))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_lowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__221) dtb__222) dtb__223) dtb__224) dtb__225)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TPi (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TType (dtb__235) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb__236) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((Lowering_dChecks.v_showMetaHint dtb__236)))) (Lowering_dChecks.v_showMetaHint dtb__236))
  | _ -> failwith "DT: impossible branch"
)))
# 217 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (name : string) (rig : Core_dTerm.t_Rig) (slot : (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (sp : Base_dSource.t_Span) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (v_collectLamChainIn (Core_dTerm.C_Term_TLam (name, rig, slot, sp, body))) with
  | { f_LamChainIn_lamChainBinders = dtb__237; f_LamChainIn_lamChainBody = dtb__238; f_LamChainIn_lamChainResultTy = dtb__239 } -> ((((((((v_lowerLamChainFuel fuel) env) st) binders) B_dData_dList.C_List_Nil) dtb__237) dtb__238) dtb__239)
  | _ -> failwith "DT: impossible branch"
)))
# 227 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerLamChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (hints : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (params : t_LamParam B_dData_dList.t_List) (inner : Core_dTerm.t_Term) (resultTy : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let bs = ((((v_bindersOfParamsHint env) binders) hints) params) in (let envB = ((B_dData_dList.v_append (B_dData_dList.v_reverse bs)) binders) in (let resultIr = (match resultTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match (((Lowering_dTy.v_annotTyOf env) envB) dtb__243) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (B_dData_dMaybe.C_Maybe_Just (dtb__244))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_effResultTyOf dtb__243)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) envB) inner)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = dtb__241 } -> (let resultIr2 = (match resultIr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> resultIr
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.v_irResultTyOf dtb__240)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLam (bs, resultIr2, dtb__240)); B_dData_dPair.f_Pair_second = dtb__241 })))
  | _ -> failwith "DT: impossible branch"
))))))))
# 358 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased rig) then (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f) else (let nd_uscrut7 = (Lowering_dChecks.v_flattenConApp (Core_dTerm.C_Term_TApp (f, a, rig))) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_flattenConcatChainIn (Core_dTerm.C_Term_TApp (f, a, rig))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> (if ((Lowering_dEnv.v_listLength dtb__245) >= 3) then ((Base_dCommon.v_bind (((((v_lowerTermsFuel (fuel - 1)) env) st) binders) dtb__245)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = dtb__247 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__246)); B_dData_dPair.f_Pair_second = dtb__247 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_lowerPlainAppFuel (fuel - 1)) env) st) binders) (Core_dTerm.C_Term_TApp (f, a, rig)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__248) -> (match dtb__248 with
  | { B_dData_dPair.f_Pair_first = dtb__249; B_dData_dPair.f_Pair_second = dtb__250 } -> ((((((v_lowerConAppFuel (fuel - 1)) env) st) binders) dtb__249) dtb__250)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 380 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerPlainAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match t with
  | Core_dTerm.C_Term_TApp (dtb__251, dtb__252, dtb__253) -> (let nd_uscrut8 = (v_flattenIntrinsicAppIn t) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__251) dtb__252) dtb__253)
  | B_dData_dMaybe.C_Maybe_Just (dtb__254) -> (match dtb__254 with
  | { B_dData_dPair.f_Pair_first = dtb__255; B_dData_dPair.f_Pair_second = dtb__256 } -> (if ((v_inlineArityMatchesIn dtb__255) dtb__256) then ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (fuel - 1)) env) st) binders) dtb__256)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__257; B_dData_dPair.f_Pair_second = dtb__258 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__255, dtb__257)); B_dData_dPair.f_Pair_second = dtb__258 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((v_lowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__251) dtb__252) dtb__253))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (Base_dDiag.v_icInternal "lowerPlainApp expects an application")
)))
# 419 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerAppFallbackFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (f : Core_dTerm.t_Term) (a : Core_dTerm.t_Term) (rig : Core_dTerm.t_Rig) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) binders) f)) (fun (pf : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pf with
  | { B_dData_dPair.f_Pair_first = dtb__259; B_dData_dPair.f_Pair_second = dtb__260 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) dtb__260) binders) a)) (fun (pa : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match pa with
  | { B_dData_dPair.f_Pair_first = dtb__261; B_dData_dPair.f_Pair_second = dtb__262 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp (((((v_appTyFrom env) binders) f) dtb__259), dtb__259, dtb__261)); B_dData_dPair.f_Pair_second = dtb__262 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 435 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerInlineArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__263 with
  | { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (Core_dTerm.v_rigIsErased dtb__266) then (Base_dDiag.v_icInternal "erased argument in inlined builtin application") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__265)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> ((Base_dCommon.v_bind (((((v_lowerInlineArgsFuel (mc0 - 1)) mc1) dtb__268) mc3) dtb__264)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__269)); B_dData_dPair.f_Pair_second = dtb__270 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 455 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerTermsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__271)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__273; B_dData_dPair.f_Pair_second = dtb__274 } -> ((Base_dCommon.v_bind (((((v_lowerTermsFuel (mc0 - 1)) mc1) dtb__274) mc3) dtb__272)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = dtb__276 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__275)); B_dData_dPair.f_Pair_second = dtb__276 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 546 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConArgsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__279, dtb__280) -> (match dtb__279 with
  | { B_dData_dPair.f_Pair_first = dtb__281; B_dData_dPair.f_Pair_second = dtb__282 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__281)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (mc0 - 1)) mc1) dtb__284) mc3) dtb__278) dtb__280)) (fun (q : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__285; B_dData_dPair.f_Pair_second = dtb__286 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((((v_ctorArgIr (((Lowering_dTy.v_annotTyOf mc1) mc3) dtb__281)) dtb__277) dtb__283), dtb__285)); B_dData_dPair.f_Pair_second = dtb__286 }))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than runtime arguments")
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 578 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (Core_dTerm.v_natChainValue (Core_dTerm.C_Term_TCon (c, args))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (dtb__289)); B_dData_dPair.f_Pair_second = st }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_lowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 587 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerConAppNonChainFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (c = Base_dIntrinsics.v_natZeroCtor) then (match (((v_alignCtorArgs c) B_dData_dList.C_List_Nil) args) with
  | Base_dDiag.C_Check_ErrC (dtb__290) -> (Base_dDiag.C_Check_ErrC (dtb__290))
  | Base_dDiag.C_Check_OkC (dtb__291) -> (match dtb__291 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrInt (0)); B_dData_dPair.f_Pair_second = st }))
  | _ -> (Base_dDiag.v_icInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (match (((v_alignCtorArgs c) (B_dData_dList.C_List__x58__x58_ (true, B_dData_dList.C_List_Nil))) args) with
  | Base_dDiag.C_Check_ErrC (dtb__292) -> (Base_dDiag.C_Check_ErrC (dtb__292))
  | Base_dDiag.C_Check_OkC (dtb__293) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) (B_dData_dList.C_List__x58__x58_ (false, B_dData_dList.C_List_Nil))) dtb__293)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 } -> (match dtb__294 with
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (match dtb__297 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrRt (Vuna_dIr_dRuntime.v_irRtNatSucc)), dtb__296)); B_dData_dPair.f_Pair_second = dtb__295 }))
  | _ -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (match dtb__298 with
  | { B_dData_dPair.f_Pair_first = dtb__299; B_dData_dPair.f_Pair_second = dtb__300 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__300) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_lowerConArgsFuel (fuel - 1)) env) st) binders) ((v_ctorOpaqueKeptFlags dtb__300) dtb__301)) runtimeArgs)) (fun (p : (Vuna_dIr_dModel.t_Ir B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> ((((((v_lowerConAppFinish env) dtb__303) dtb__299) c) args) dtb__302)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))))
# 785 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmBodyFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (bound : t_AltEnvIn) (body : Core_dTerm.t_Term) -> (((((v_lowerTermFuel fuel) env) (v_aeStOf bound)) (v_aeEnvOf bound)) body))
# 858 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (scrutTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (let bound = (((v_altEnvIn st) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) in (let typed = ((v_typedPatsAll scrutTy) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__304; B_dData_dPair.f_Pair_second = dtb__305 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__304 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__304) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__305 } }))
  | _ -> failwith "DT: impossible branch"
)))))) else (let nd_uscrut6 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (Core_dTerm.v_caseAltName alt)) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (match dtb__306 with
  | { B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = dtb__308 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn st) (Core_dTerm.v_caseAltName alt)) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__308)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) (Core_dTerm.v_caseAltName alt))) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf scrutTy))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = dtb__310 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = (Core_dTerm.v_caseAltName alt) })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__309 }; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((((v_armResultTyOf env) bound2) dtb__309) (Core_dTerm.v_caseAltBody alt)); B_dData_dPair.f_Pair_second = dtb__310 } }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("unknown constructor " ^ (Core_dTerm.v_caseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
# 892 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerArmsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (mc3 : t_LwSt) (mc4 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc5 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind ((((((v_lowerArmFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__311)) (fun (p : (Vuna_dIr_dModel.t_IrAlt, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut10 = p in (match nd_uscrut10 with
  | { B_dData_dPair.f_Pair_first = dtb__313; B_dData_dPair.f_Pair_second = dtb__314 } -> (match dtb__314 with
  | { B_dData_dPair.f_Pair_first = dtb__315; B_dData_dPair.f_Pair_second = dtb__316 } -> ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (mc0 - 1)) mc1) mc2) dtb__316) mc4) dtb__312)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = q in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__317; B_dData_dPair.f_Pair_second = dtb__318 } -> (match dtb__318 with
  | { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = dtb__320 } -> (let resultTy = (match dtb__315 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__321) -> dtb__315
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__319
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__313, dtb__317)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = resultTy; B_dData_dPair.f_Pair_second = dtb__320 } })))
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
# 949 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatAltFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dMaybe.t_Maybe) -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let bound = (((v_altEnvIn mc2) mc3) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb__322))) in (let typed = ((v_typedPatsAll (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (mc0 - 1)) mc1) bound2) (Core_dTerm.v_caseAltBody dtb__322))) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = B_dData_dMaybe.C_Maybe_Nothing; Vuna_dIr_dModel.f_IrAlt_irAltBinders = typed; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__323 })); B_dData_dPair.f_Pair_second = dtb__324 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 965 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerNatCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> (let fresh = (let dtb__333 = dtb__326 in dtb__333) in (let st2 = (fresh + 1) in (let zeroAlt = ((v_findAltBy Base_dIntrinsics.v_natZeroCtor) alts) in (let succAlt = ((v_findAltBy Base_dIntrinsics.v_natSuccCtor) alts) in (let catchAlt = (v_findCatchAllAlt alts) in ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun (pz : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pz with
  | { B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = dtb__328 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__328) outer) succAlt)) (fun (ps : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match ps with
  | { B_dData_dPair.f_Pair_first = dtb__329; B_dData_dPair.f_Pair_second = dtb__330 } -> ((Base_dCommon.v_bind (((((v_lowerNatAltFuel (fuel - 1)) env) dtb__330) outer) catchAlt)) (fun (pc : (Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) -> (match pc with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__325, fresh, dtb__327, dtb__329, dtb__331)); B_dData_dPair.f_Pair_second = dtb__332 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1000 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if (v_natCaseApplies alts) then ((((((v_lowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__334; B_dData_dPair.f_Pair_second = dtb__335 } -> (let scrutTy = (((Lowering_dTy.v_annotTyOf env) outer) scrut) in ((Base_dCommon.v_bind ((((((v_lowerArmsFuel (fuel - 1)) env) scrutTy) dtb__335) outer) alts)) (fun (q : (Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List, (Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe, t_LwSt) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut13 = q in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> (match dtb__337 with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrCase (scrutTy, dtb__338, dtb__334, dtb__336)); B_dData_dPair.f_Pair_second = dtb__339 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1021 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerProjAsCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (i : int) (fi : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let n = (Lowering_dEnv.v_listLength tele) in (((((v_lowerTermFuel (fuel - 1)) env) st) outer) (Core_dTerm.C_Term_TCase (base, (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = c; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs ((v_projBindersIn tele) 0)); Core_dTerm.f_CaseAlt_caseAltBody = (Core_dTerm.C_Term_TVar ((v_recordProjVarIn fi), ((n - 1) - fi), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) }, B_dData_dList.C_List_Nil))))))))
# 1075 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (base : Core_dTerm.t_Term) (c : string) (tele : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (body : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) base)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__340; B_dData_dPair.f_Pair_second = dtb__341 } -> (let baseTy = (((Lowering_dTy.v_annotTyOf env) outer) base) in (match body with
  | Core_dTerm.C_Term_TMk (dtb__342, dtb__343) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__341) ((v_recordAltBindersIn tele) outer)) dtb__340) baseTy) c) fields) idxs) dtb__343)
  | Core_dTerm.C_Term_TCon (dtb__344, dtb__345) -> ((((((((((v_lowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__341) ((v_recordAltBindersIn tele) outer)) dtb__340) baseTy) c) fields) idxs) dtb__345)
  | _ -> (Base_dDiag.v_icInternal "record update body is not a constructor application")
))
  | _ -> failwith "DT: impossible branch"
)))))
# 1092 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerRecordUpdateArgsFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (baseIr : Vuna_dIr_dModel.t_Ir) (baseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (c : string) (fields : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (idxs : int B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (let nd_uscrut10 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (match dtb__346 with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) c) (env).Lowering_dEnv.f_LwEnv_lwOpaques) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no opaque shape for constructor " ^ c))
  | B_dData_dMaybe.C_Maybe_Just (dtb__349) -> ((Base_dCommon.v_bind (((v_alignCtorArgs c) dtb__348) args)) (fun (runtimeArgs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_lookupRtPositionsIn fields) idxs)) (fun (positions : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_ctorOpaqueKeptFlags dtb__348) dtb__349)) positions) runtimeArgs)) (fun (q : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrRecUpd (baseIr, c, dtb__350, baseTy)); B_dData_dPair.f_Pair_second = dtb__351 }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
))))
# 1115 "Vuna/Compiler/Lowering/Program.vuna"
and v_lowerUpdFieldsFuel = (fun (mc0 : int) (mc1 : Lowering_dEnv.t_LwEnv) (mc2 : t_LwSt) (mc3 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc4 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) (mc6 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc7 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__352, dtb__353) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (match (((v_nthOpqArgIn (B_dData_dPair.v_secondOf dtb__352)) mc5) mc7) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "record update position out of range")
  | B_dData_dMaybe.C_Maybe_Just (dtb__354) -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__354)) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> ((Base_dCommon.v_bind ((((((((v_lowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__356) mc3) mc4) mc5) dtb__353) mc7)) (fun (r : ((string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> (match ((v_lookupRtLabelIn (B_dData_dPair.v_firstOf dtb__352)) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__359) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__355 }, dtb__357)); B_dData_dPair.f_Pair_second = dtb__358 }))
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

# 75 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerTerm = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_lowerTermFuel (v_lowerBudgetFor (Core_dTerm.v_termSize t))) env) st) binders) t))

# 258 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDefBodyTerm = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (body : Core_dTerm.t_Term) (defTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (let nd_uscrut4 = (v_collectLamChainIn body) in (match nd_uscrut4 with
  | { f_LamChainIn_lamChainBinders = dtb__360; f_LamChainIn_lamChainBody = dtb__361; f_LamChainIn_lamChainResultTy = dtb__362 } -> (match dtb__360 with
  | B_dData_dList.C_List_Nil -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | _ -> (match defTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (match ((v_sigArrowTys 256) dtb__363) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body)
  | B_dData_dMaybe.C_Maybe_Just (dtb__364) -> (if ((Lowering_dEnv.v_listLength dtb__364) = (v_countRuntimeParams dtb__360)) then ((((((((v_lowerLamChainFuel (v_lowerBudgetFor (Core_dTerm.v_termSize body))) env) st) B_dData_dList.C_List_Nil) dtb__364) dtb__360) dtb__361) dtb__362) else ((((v_lowerTerm env) st) B_dData_dList.C_List_Nil) body))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 811 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnboxedCaseFuel = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (outer : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (scrut : Core_dTerm.t_Term) (alt : Core_dTerm.t_CaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "ir-lower") else (if ((Core_dTerm.v_caseAltName alt) = "") then (Base_dDiag.v_icInternal "unboxed case arm has no constructor") else (let name = (Core_dTerm.v_caseAltName alt) in (let nd_uscrut7 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (match dtb__365 with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> ((Base_dCommon.v_bind (((((v_lowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun (p : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> ((Base_dCommon.v_bind (((((v_altEnvCheckedIn dtb__369) name) outer) (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders alt))) dtb__367)) (fun (bound : t_AltEnvIn) -> ((Base_dCommon.v_bind ((Lowering_dTy.v_ctorKeptFieldTys env) name)) (fun (fieldTys : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (let argTys = ((B_dData_dList.v_map (Vuna_dIr_dModel.v_irTySubstVars (Vuna_dIr_dModel.v_irTyDataArgsOf (((Lowering_dTy.v_annotTyOf env) outer) scrut)))) fieldTys) in (let typed = ((v_typedPats argTys) (v_aePatsOf bound)) in (let bound2 = ((v_retagAltEnv bound) typed) in ((Base_dCommon.v_bind ((((v_lowerArmBodyFuel (fuel - 1)) env) bound2) (Core_dTerm.v_caseAltBody alt))) (fun (q : (Vuna_dIr_dModel.t_Ir, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__370; B_dData_dPair.f_Pair_second = dtb__371 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_Ir_IrLet (typed, dtb__368, dtb__370)); B_dData_dPair.f_Pair_second = dtb__371 }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
))))))

# 1143 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_runtimeArityIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TLam (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> (if (Core_dTerm.v_rigIsErased dtb__373) then (v_runtimeArityIn dtb__376) else (1 + (v_runtimeArityIn dtb__376)))
  | _ -> 0
))

# 1148 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_recursiveValueAllowedIn = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__377, dtb__378) -> true
  | Core_dTerm.C_Term_TLam (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (if (Core_dTerm.v_rigIsErased dtb__380) then (v_recursiveValueAllowedIn dtb__383) else true)
  | _ -> false
))

# 1155 "Vuna/Compiler/Lowering/Program.vuna"
let v_initGuardOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : bool) (mc2 : string) (mc3 : Core_dTerm.t_Term) -> (if mc1 then false else (if (if (if ((mc0).Lowering_dEnv.f_LwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_runtimeArityIn mc3) = 0) else false) then true else false)))

# 1208 "Vuna/Compiler/Lowering/Program.vuna"
let v_externBasicIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__384) -> (match dtb__384 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__385, dtb__386) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__385) then (match (Lowering_dTy.v_reprTyIr dtb__385) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__387) -> (Base_dDiag.C_Check_OkC (dtb__387))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("extern type has no runtime representation: " ^ dtb__385))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.v_icInternal ("extern type is not basic: " ^ dtb__385)))
  | _ -> (Base_dDiag.v_icInternal "extern type is not a global type")
)
  | _ -> (Base_dDiag.v_icInternal "extern type is not basic")
))

# 1202 "Vuna/Compiler/Lowering/Program.vuna"
let v_externDomIr = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__388) -> (match dtb__388 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__389, dtb__390) -> (if (dtb__389 = "Array") then (match dtb__390 with
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (match dtb__392 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (v_externBasicIr dtb__391)) (fun (e : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyArray (e))))))
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
)
  | _ -> (Base_dDiag.v_icInternal "extern Array needs one type argument")
) else (if (dtb__389 = "Array") then (Base_dDiag.v_icInternal "extern Array needs one type argument") else (v_externBasicIr mc0)))
  | _ -> (v_externBasicIr mc0)
)
  | _ -> (v_externBasicIr mc0)
))

# 1190 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_externTyIr = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc2 with
  | Core_dTerm.C_Value_VPi (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (if dtb__394 then (Base_dDiag.v_icInternal "extern has an implicit parameter") else ((Base_dCommon.v_bind (v_externDomIr dtb__396)) (fun (domIr : Vuna_dIr_dModel.t_IrTy) -> ((Base_dCommon.v_bind (((v_externTyIr (mc0 - 1)) (mc1 + 1)) ((Core_dEval.v_applyClosure dtb__397) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__393, mc1, B_dData_dList.C_List_Nil))))))) (fun (resIr : Vuna_dIr_dModel.t_IrTy) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icInternal "extern type is too deep") else (v_externDomIr mc2))
))

# 1187 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerExternTy = (fun (ty : Core_dTerm.t_Term) -> (((v_externTyIr 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) ty)))

# 1164 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerDef = (fun (env : Lowering_dEnv.t_LwEnv) (st : t_LwSt) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (match (v_lowerExternTy (Elab_dTypes.v_dtDefType d)) with
  | Base_dDiag.C_Check_ErrC (dtb__399) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__399)))
  | Base_dDiag.C_Check_OkC (dtb__400) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrExternDef ((Elab_dTypes.v_dtDefName d), dtb__400, dtb__398, (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__401) -> (let defTy = (B_dData_dMaybe.C_Maybe_Just ((((((Lowering_dTy.v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDatas) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d))))) in (let nd_uscrut7 = ((((v_lowerDefBodyTerm env) st) dtb__401) defTy) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_OkC (dtb__402) -> (match dtb__402 with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrDef_IrDef ((Elab_dTypes.v_dtDefName d), (v_runtimeArityIn dtb__401), ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)), defTy, dtb__403, (v_recursiveValueAllowedIn dtb__401), ((((v_initGuardOf env) false) (Elab_dTypes.v_dtDefName d)) dtb__401), (Elab_dTypes.v_dtDefSpan d))); B_dData_dPair.f_Pair_second = dtb__404 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__405) -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) dtb__405)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_lowerDefs = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__406, dtb__407) -> ((Base_dCommon.v_bind (((v_lowerDef mc0) mc1) dtb__406)) (fun (p : (Vuna_dIr_dModel.t_IrDef, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__408; B_dData_dPair.f_Pair_second = dtb__409 } -> ((Base_dCommon.v_bind (((v_lowerDefs mc0) dtb__409) dtb__407)) (fun (q : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__410; B_dData_dPair.f_Pair_second = dtb__411 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__410)); B_dData_dPair.f_Pair_second = dtb__411 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1238 "Vuna/Compiler/Lowering/Program.vuna"
let v_nameKey = (fun (raw : string) (encoded : string) -> { B_dData_dPair.f_Pair_first = (Base_dSource.v_prefixOfName raw); B_dData_dPair.f_Pair_second = encoded })

# 1244 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_checkNoDupOcamlNamesGo = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__412, dtb__413) -> (match dtb__412 with
  | { B_dData_dPair.f_Pair_first = dtb__414; B_dData_dPair.f_Pair_second = dtb__415 } -> (let key = (String.concat "" [dtb__414; "\t"; dtb__415]) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) mc2) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml name collision among "; mc0; "s in module `"; dtb__414; "`: `"; dtb__415; "`"])) else (((v_checkNoDupOcamlNamesGo mc0) dtb__413) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) true) mc2))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1241 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkNoDupOcamlNames = (fun (kind : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_checkNoDupOcamlNamesGo kind) keys) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 1254 "Vuna/Compiler/Lowering/Program.vuna"
let v_ensureUniqueOcamlNamesIn = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtime = (Lowering_dEnv.v_rtDatasOf datas) in (let unboxed = (Elab_dRepresentation.v_unboxedFamilySet runtime) in (let valueKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> ((v_nameKey (Elab_dTypes.v_dtDefName d)) (Vuna_dTarget_dOcaml_dDecl.v_valueName (Elab_dTypes.v_dtDefName d))))) defs) in (let typeKeys = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> ((v_nameKey (Elab_dTypes.v_dtDataName d)) (Vuna_dTarget_dOcaml_dDecl.v_typeName (Elab_dTypes.v_dtDataName d))))) runtime) in (let ctorKeys = ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) unboxed) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> ((v_nameKey (Elab_dTypes.v_dtCtorFamily c)) ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Elab_dTypes.v_dtCtorFamily c)) (Elab_dTypes.v_dtCtorName c))))) (Elab_dTypes.v_dtDataCtors d))))) runtime) in ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "value") valueKeys)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkNoDupOcamlNames "type") typeKeys)) (fun (_u : int) -> ((v_checkNoDupOcamlNames "constructor") ctorKeys)))))))))))

# 1271 "Vuna/Compiler/Lowering/Program.vuna"
let v_prepareProgram = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let table = (Lowering_dChecks.v_defTable defs) in (let familyNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas) in (let axiomNames = (Lowering_dChecks.v_axiomNamesOf defs) in (match ((Lowering_dChecks.v_partitionDefs table) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb__416) in (let familyTypeNames = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) runtimeNames)))) familyNames) in (let allTypeNames = ((B_dData_dList.v_append dtb__417) familyTypeNames) in ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkNoAxiomRuntime axiomNames) dtb__416)) (fun (_u : int) -> ((Base_dCommon.v_bind (Lowering_dChecks.v_checkAllDefScopes defs)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_ensureUniqueOcamlNamesIn datas) dtb__416)) (fun (_u : int) -> ((Base_dCommon.v_bind ((Lowering_dChecks.v_checkAllErasure allTypeNames) dtb__416)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (dtb__416)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1313 "Vuna/Compiler/Lowering/Program.vuna"
let v_tblLookup = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl))

# 1316 "Vuna/Compiler/Lowering/Program.vuna"
let v_recOkOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (match (Elab_dTypes.v_dtDefBody dtb__418) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__419) -> (v_recursiveValueAllowedIn dtb__419)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1325 "Vuna/Compiler/Lowering/Program.vuna"
let v_spanOfTbl = (fun (tbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((v_tblLookup tbl) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__420) -> (Elab_dTypes.v_dtDefSpan dtb__420)
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_mapMaybeDef = (fun (mc0 : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> (match ((v_tblLookup mc0) dtb__421) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapMaybeDef mc0) dtb__422)
  | B_dData_dMaybe.C_Maybe_Just (dtb__423) -> (B_dData_dList.C_List__x58__x58_ (dtb__423, ((v_mapMaybeDef mc0) dtb__422)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1331 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_appendGroups = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : t_LwSt) (mc2 : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__424, dtb__425) -> (let isRec = (B_dData_dPair.v_firstOf dtb__424) in (let members = (B_dData_dPair.v_secondOf dtb__424) in (let defs = ((v_mapMaybeDef (mc0).Lowering_dEnv.f_LwEnv_lwDefTbl) members) in ((Base_dCommon.v_bind (((v_lowerDefs mc0) mc1) defs)) (fun (p : (Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__426; B_dData_dPair.f_Pair_second = dtb__427 } -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb__426)) (fun (_u : int) -> ((Base_dCommon.v_bind (((v_appendGroups mc0) dtb__427) dtb__425)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = isRec; B_dData_dPair.f_Pair_second = dtb__426 }, dtb__428)); B_dData_dPair.f_Pair_second = dtb__429 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1373 "Vuna/Compiler/Lowering/Program.vuna"
let rec v_ivarBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dIntrinsics.t_IType) -> (match mc1 with
  | Base_dIntrinsics.C_IType_IPi (dtb__430, dtb__431) -> ((v_ivarBound (B_dData_dList.C_List__x58__x58_ (dtb__430, mc0))) dtb__431)
  | Base_dIntrinsics.C_IType_IVar (dtb__432) -> ((B_dData_dList.v_memName dtb__432) mc0)
  | Base_dIntrinsics.C_IType_IFun1 (dtb__433, dtb__434) -> (if ((v_ivarBound mc0) dtb__433) then ((v_ivarBound mc0) dtb__434) else false)
  | Base_dIntrinsics.C_IType_IFun (dtb__435, dtb__436) -> (if ((v_ivarBound mc0) dtb__435) then ((v_ivarBound mc0) dtb__436) else false)
  | Base_dIntrinsics.C_IType_IEff (dtb__437) -> ((v_ivarBound mc0) dtb__437)
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

# 1390 "Vuna/Compiler/Lowering/Program.vuna"
let v_intrinsicWithUnboundIvar = (fun (is : Base_dIntrinsics.t_Intrinsic B_dData_dList.t_List) -> ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) ((B_dData_dList.v_filter (fun (i : Base_dIntrinsics.t_Intrinsic) -> (B_dData_dBool.v_not ((v_ivarBound B_dData_dList.C_List_Nil) (Base_dIntrinsics.v_intrinsicSignature i))))) is)))

# 1424 "Vuna/Compiler/Lowering/Program.vuna"
let v_firstOfList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__442, dtb__443) -> dtb__442
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1397 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkRuntimeContract = (let intrinsicNames = ((B_dData_dList.v_map Base_dIntrinsics.v_intrinsicName) Base_dIntrinsics.v_allIntrinsics) in (let contractNames = Vuna_dIr_dRuntime.v_irRtNames in (let badIvars = (v_intrinsicWithUnboundIvar Base_dIntrinsics.v_allIntrinsics) in (let missingFromContract = ((B_dData_dList.v_filter (fun (n : string) -> (if (n = Base_dIntrinsics.v_primEffBind1Name) then false else (if ((B_dData_dList.v_memName n) contractNames) then false else true)))) intrinsicNames) in (let extrasInContract = ((B_dData_dList.v_filter (fun (n : string) -> (if ((B_dData_dList.v_memName n) intrinsicNames) then false else (if ((B_dData_dList.v_memName n) Vuna_dIr_dRuntime.v_irRtSyntheticNames) then false else true)))) contractNames) in (if ((Lowering_dEnv.v_listLength badIvars) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["intrinsic `"; (v_firstOfList badIvars); "` has an unbound type variable in its signature"])) else (if ((Lowering_dEnv.v_listLength missingFromContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_firstOfList missingFromContract); "`"])) else (if ((Lowering_dEnv.v_listLength extrasInContract) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_firstOfList extrasInContract); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps); "`"])) else (if ((Lowering_dEnv.v_listLength Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras) > 0) then (Base_dDiag.v_icInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_firstOfList Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras); "`"])) else (Base_dDiag.C_Check_OkC (0))))))))))))

# 1365 "Vuna/Compiler/Lowering/Program.vuna"
let v_checkProgramOf = (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((v_prepareProgram (env).Lowering_dEnv.f_LwEnv_lwDatas) (env).Lowering_dEnv.f_LwEnv_lwDefs)) (fun (_u : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> v_checkRuntimeContract)))

# 1469 "Vuna/Compiler/Lowering/Program.vuna"
let v_adjOfDef = (fun (env : Lowering_dEnv.t_LwEnv) (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((Lowering_dEnv.v_factsDepsOf env) (Elab_dTypes.v_dtDefName d)) })

# 1294 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupDefs = (fun (env : Lowering_dEnv.t_LwEnv) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let adj = ((B_dData_dList.v_map (v_adjOfDef env)) defs) in (let names = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs) in (let tbl = (Lowering_dEnv.v_defTblOf defs) in ((Base_dCommon.v_bind ((((Vuna_dIr_dAnalysis.v_assembleGroupNames adj) names) (v_recOkOfTbl tbl)) (v_spanOfTbl tbl))) (fun (groups : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_appendGroups env) 0) groups)) (fun (q : ((bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List, t_LwSt) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (Base_dDiag.C_Check_OkC (dtb__444))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1472 "Vuna/Compiler/Lowering/Program.vuna"
let v_groupOfPair = (fun (mc0 : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb__446; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb__447 }
  | _ -> failwith "DT: impossible branch"
))

# 1498 "Vuna/Compiler/Lowering/Program.vuna"
let v_partitionRuntimeDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs) with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> dtb__448
  | _ -> failwith "DT: impossible branch"
))

# 1447 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitAfterChecks = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> (let datas = (env).Lowering_dEnv.f_LwEnv_lwDatas in (let defNameTbl = (B_dContainer_dHashMap.v_ofNames defNames) in (let defs = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (Elab_dTypes.v_dtDefName d)) defNameTbl))) (env).Lowering_dEnv.f_LwEnv_lwDefs) in (let dataNameTbl = (B_dContainer_dHashMap.v_ofNames dataNames) in (let unitDatas = ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (Elab_dTypes.v_dtDataName d)) dataNameTbl))) datas) in (let runtime = (v_partitionRuntimeDefs defs) in ((Base_dCommon.v_bind ((v_groupDefs env) runtime)) (fun (groups : (bool, Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Lowering_dTy.v_tyDeclsOf (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwUnboxedInfo) datas) unitDatas)) (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (let groups2 = ((B_dData_dList.v_map v_groupOfPair) groups) in (let hasList = ((Lowering_dEnv.v_hasDataNamed Base_dIntrinsics.v_listFamilyName) unitDatas) in (Base_dDiag.C_Check_OkC ((Vuna_dIr_dDispatch.v_dispatchIdsUnit ((Vuna_dIr_dRepresent.v_representUnit (Lowering_dEnv.v_lwEnvShared env)) { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = decls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = groups2; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = hasList; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (Lowering_dTy.v_tyDeclRefs decls); Vuna_dIr_dModel.f_IrUnit_irUnitEntry = B_dData_dMaybe.C_Maybe_Nothing })))))))))))))))))

# 1431 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitOf = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkProgramOf env)) (fun (_u : int) -> (((v_lowerUnitAfterChecks env) defNames) dataNames))))

# 1438 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerUnitChecked = (fun (env : Lowering_dEnv.t_LwEnv) (defNames : string B_dData_dList.t_List) (dataNames : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_lowerUnitAfterChecks env) defNames) dataNames)) (fun (u : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Vuna_dIr_dValidate.v_validateUnit (Lowering_dEnv.v_lwEnvShared env)) u)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (u)))))))

# 1476 "Vuna/Compiler/Lowering/Program.vuna"
let v_lowerProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.env") (fun (_u : int) -> (Base_dDiag.C_Check_OkC (((((Lowering_dEnv.v_mkLwEnv datas) defs) globals) "")))))) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.prepare") (fun (_u : int) -> (v_checkProgramOf env)))) (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.unit") (fun (_u : int) -> (((v_lowerUnitAfterChecks env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.entry") (fun (_u : int) -> (Lowering_dEntry.v_lowerEntryOf defs)))) (fun (entry : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (let program = { Vuna_dIr_dModel.f_IrProgram_irProgShared = (Lowering_dEnv.v_lwEnvShared env); Vuna_dIr_dModel.f_IrProgram_irProgUnit = { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitGroups; Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (unitIr).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = entry } } in ((Base_dCommon.v_bind (Vuna_dIr_dValidate.v_validateProgram program)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (program))))))))))))))
