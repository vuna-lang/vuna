open Vuna_runtime
let v_Vuna_dCompiler_dElab_dPrelude_dintTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dstrTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dfloatTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dboolTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dfun2 = (fun a b c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) b), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 2) c))))))

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName = (fun v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1, dtb__2) -> (if ((Base_dList.v_Base_dList_dlength dtb__2) = 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName = (fun mc0 mc1 -> (if (mc1 = "Int") then (if (mc0 = "eq") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_eq_int")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_neq_int"))) else (if (mc1 = "String") then (if (mc0 = "eq") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_eq_str")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_neq_str"))) else (if (mc1 = "Float") then (if (mc0 = "eq") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_eq_float")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_neq_float"))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OpOnlyIntString (mc0, mc1))) (Base_dVec.C_Base_dVec_dVec_Cons (mc0, (Base_dVec.C_Base_dVec_dVec_Cons (mc1, Base_dVec.C_Base_dVec_dVec_Nil)))))))))))

let rec v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (if (dtb__3 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo mc0) dtb__4) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dindexOfName = (fun name env -> (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo name) env) 0))

let rec v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IPi (dtb__5, dtb__6) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__5, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dList.C_Base_dList_dList_Cons (dtb__5, mc0))) dtb__6)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IRef (dtb__7) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("IORef")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__7), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IArray (dtb__8) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Array")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__8), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IVar (dtb__9) -> (match ((v_Vuna_dCompiler_dElab_dPrelude_dindexOfName dtb__9) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__9, dtb__10, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IFun1 (dtb__11, dtb__12) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__11), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dList.C_Base_dList_dList_Cons ("_", mc0))) dtb__12)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IFun (dtb__13, dtb__14) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__13), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dList.C_Base_dList_dList_Cons ("_", mc0))) dtb__14)))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IEff (dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor, Base_dList.C_Base_dList_dList_Nil)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__15), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IList (dtb__16) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__16), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_INat -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IBool -> v_Vuna_dCompiler_dElab_dPrelude_dboolTy
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IFloat -> v_Vuna_dCompiler_dElab_dPrelude_dfloatTy
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IStr -> v_Vuna_dCompiler_dElab_dPrelude_dstrTy
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_IInt -> v_Vuna_dCompiler_dElab_dPrelude_dintTy
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIType_ITy -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dityToTerm = (fun ty -> ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv Base_dList.C_Base_dList_dList_Nil) ty))

let rec v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm = (fun arity -> (if (arity <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (arity - 1))))))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) })) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames)) ((Base_dList.v_Base_dList_dmap (fun t -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorName t); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorArity t)) })) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicArities))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals = ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName i); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicSignature i)) })) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_duserIntrinsics)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals = ((Base_dList.v_Base_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals) v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames = ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames)

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> (if (dtb__17 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if (dtb__17 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else (if (dtb__17 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (if (dtb__18 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if (dtb__18 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else (if (dtb__18 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName)) else (if (dtb__18 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dprependParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__19, false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__20) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (if ((v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__23)) = mc0) then (Base_dPair.v_Base_dPair_dfirstOf dtb__23) else (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo mc0) dtb__24) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection = (fun methods short -> (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo short) methods) short))
