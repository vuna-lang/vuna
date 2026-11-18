open Vuna_runtime
# 22 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dintTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName))

# 25 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dstrTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName))

# 29 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dfloatTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName))

# 33 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dboolTy = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName))

# 37 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 41 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dfun2 = (fun a b c -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) b), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 2) c))))))

# 50 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName = (fun v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1, dtb__2) -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__2) = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 60 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_disEqShort = (fun m -> (if (m = "==") then true else (m = "eq")))

# 65 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName = (fun (mc0 : string) (mc1 : string) -> (if (mc1 = "Int") then (if (v_Vuna_dCompiler_dElab_dPrelude_disEqShort mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_eq_int")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_neq_int"))) else (if (mc1 = "String") then (if (v_Vuna_dCompiler_dElab_dPrelude_disEqShort mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_eq_str")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_neq_str"))) else (if (mc1 = "Float") then (if (v_Vuna_dCompiler_dElab_dPrelude_disEqShort mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_eq_float")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_neq_float"))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OpOnlyIntString (mc0, mc1))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (mc0, (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (mc1, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))))))))))

# 76 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if (dtb__3 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo mc0) dtb__4) (mc2 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dindexOfName = (fun name env -> (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo name) env) 0))

# 86 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dBase_dIntrinsics.t_Vuna_dCompiler_dBase_dIntrinsics_dIType) -> (match mc1 with
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IPi (dtb__5, dtb__6) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__5, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, mc0))) dtb__6)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IRef (dtb__7) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("IORef")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__7), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IArray (dtb__8) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Array")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__8), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IVar (dtb__9) -> (match ((v_Vuna_dCompiler_dElab_dPrelude_dindexOfName dtb__9) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__10) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__9, dtb__10, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IFun1 (dtb__11, dtb__12) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__11), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("_", mc0))) dtb__12)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IFun (dtb__13, dtb__14) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__13), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("_", mc0))) dtb__14)))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IGlobal (dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__15))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IEff (dtb__16) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor, Base_dData_dList.C_Base_dData_dList_dList_Nil)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__16), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IList (dtb__17) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__17), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_INat -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IBool -> v_Vuna_dCompiler_dElab_dPrelude_dboolTy
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IFloat -> v_Vuna_dCompiler_dElab_dPrelude_dfloatTy
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IStr -> v_Vuna_dCompiler_dElab_dPrelude_dstrTy
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_IInt -> v_Vuna_dCompiler_dElab_dPrelude_dintTy
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dIType_ITy -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dityToTerm = (fun ty -> ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv Base_dData_dList.C_Base_dData_dList_dList_Nil) ty))

# 115 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm = (fun arity -> (if (arity <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (arity - 1))))))

# 123 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals = ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicNames)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dBase_dIntrinsics.t_Vuna_dCompiler_dBase_dIntrinsics_dTypeIntrinsic) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicCtorName t); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicCtorArity t)) })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicArities))

# 129 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals = ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : Vuna_dCompiler_dBase_dIntrinsics.t_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsic) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName i); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicSignature i)) })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_duserIntrinsics)

# 135 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dinternalValueGlobals = ((Base_dData_dList.v_Base_dData_dList_dmap (fun (i : Vuna_dCompiler_dBase_dIntrinsics.t_Vuna_dCompiler_dBase_dIntrinsics_dIntrinsic) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName i); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicSignature i)) })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinternalIntrinsics)

# 139 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals = ((Base_dData_dList.v_Base_dData_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals) ((Base_dData_dList.v_Base_dData_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals) v_Vuna_dCompiler_dElab_dPrelude_dinternalValueGlobals))

# 144 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames = ((Base_dData_dList.v_Base_dData_dList_dappend Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames)

# 148 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (if (dtb__18 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName)) else (if (dtb__18 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)) else (if (dtb__18 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__19) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcmpSpecializedTyNames) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__19)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_Vuna_dCompiler_dElab_dPrelude_dprependParams = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__20, false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__21) mc1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 184 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo = (fun (mc0 : string) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (if ((v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__22)) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__22) else (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo mc0) dtb__23) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Elab/Prelude.vuna"
let v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection = (fun methods short -> (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo short) methods) short))
