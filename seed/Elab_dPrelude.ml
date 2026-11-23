open Vuna_runtime
# 22 "Vuna/Compiler/Elab/Prelude.vuna"
let v_intTy = (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_intTypeName))

# 25 "Vuna/Compiler/Elab/Prelude.vuna"
let v_strTy = (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_strTypeName))

# 29 "Vuna/Compiler/Elab/Prelude.vuna"
let v_floatTy = (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_floatTypeName))

# 33 "Vuna/Compiler/Elab/Prelude.vuna"
let v_boolTy = (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_boolTypeName))

# 37 "Vuna/Compiler/Elab/Prelude.vuna"
let v_boolTyValue = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_boolTypeName, B_dData_dList.C_List_Nil))))

# 41 "Vuna/Compiler/Elab/Prelude.vuna"
let v_fun2 = (fun (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) (c : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, a, (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) 1) b), (((Core_dTerm.v_shift 0) 2) c))))))

# 50 "Vuna/Compiler/Elab/Prelude.vuna"
let v_builtinTyName = (fun (v : Core_dTerm.t_Value) -> (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__0) -> (match dtb__0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1, dtb__2) -> (if ((B_dData_dList.v_length dtb__2) = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__1)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 60 "Vuna/Compiler/Elab/Prelude.vuna"
let v_isEqShort = (fun (m : string) -> (if (m = "==") then true else (m = "eq")))

# 65 "Vuna/Compiler/Elab/Prelude.vuna"
let v_eqRuntimeName = (fun (mc0 : string) (mc1 : string) -> (if (mc1 = "Int") then (if (v_isEqShort mc0) then (Base_dDiag.C_Check_OkC ("bi_eq_int")) else (Base_dDiag.C_Check_OkC ("bi_neq_int"))) else (if (mc1 = "String") then (if (v_isEqShort mc0) then (Base_dDiag.C_Check_OkC ("bi_eq_str")) else (Base_dDiag.C_Check_OkC ("bi_neq_str"))) else (if (mc1 = "Float") then (if (v_isEqShort mc0) then (Base_dDiag.C_Check_OkC ("bi_eq_float")) else (Base_dDiag.C_Check_OkC ("bi_neq_float"))) else (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_OpOnlyIntString (mc0, mc1))) (B_dData_dVec.C_Vec_VCons (mc0, (B_dData_dVec.C_Vec_VCons (mc1, B_dData_dVec.C_Vec_Nil)))))))))))

# 76 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_indexOfNameGo = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if (dtb__3 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_indexOfNameGo mc0) dtb__4) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Prelude.vuna"
let v_indexOfName = (fun (name : string) (env : string B_dData_dList.t_List) -> (((v_indexOfNameGo name) env) 0))

# 86 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_ityToTermEnv = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dIntrinsics.t_IType) -> (match mc1 with
  | Base_dIntrinsics.C_IType_IPi (dtb__5, dtb__6) -> (Core_dTerm.C_Term_TPi (dtb__5, true, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ (dtb__5, mc0))) dtb__6)))
  | Base_dIntrinsics.C_IType_IRef (dtb__7) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("IORef")), ((v_ityToTermEnv mc0) dtb__7), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IArray (dtb__8) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ("Array")), ((v_ityToTermEnv mc0) dtb__8), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IVar (dtb__9) -> (match ((v_indexOfName dtb__9) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (Core_dTerm.C_Term_TVar (dtb__9, dtb__10, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dIntrinsics.C_IType_IFun1 (dtb__11, dtb__12) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig1, ((v_ityToTermEnv mc0) dtb__11), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ ("_", mc0))) dtb__12)))
  | Base_dIntrinsics.C_IType_IFun (dtb__13, dtb__14) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, ((v_ityToTermEnv mc0) dtb__13), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ ("_", mc0))) dtb__14)))
  | Base_dIntrinsics.C_IType_IGlobal (dtb__15) -> (Core_dTerm.C_Term_TGlobal (dtb__15))
  | Base_dIntrinsics.C_IType_IEff (dtb__16) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effTypeName)), (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)), Core_dTerm.C_Rig_Rig0)), ((v_ityToTermEnv mc0) dtb__16), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IList (dtb__17) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_listFamilyName)), ((v_ityToTermEnv mc0) dtb__17), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_INat -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_natTypeName))
  | Base_dIntrinsics.C_IType_IBool -> v_boolTy
  | Base_dIntrinsics.C_IType_IFloat -> v_floatTy
  | Base_dIntrinsics.C_IType_IStr -> v_strTy
  | Base_dIntrinsics.C_IType_IInt -> v_intTy
  | Base_dIntrinsics.C_IType_ITy -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Prelude.vuna"
let v_ityToTerm = (fun (ty : Base_dIntrinsics.t_IType) -> ((v_ityToTermEnv B_dData_dList.C_List_Nil) ty))

# 115 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_typeCtorKindTerm = (fun (arity : int) -> (if (arity <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_typeCtorKindTerm (arity - 1))))))

# 123 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeTypeGlobals = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) })) Base_dIntrinsics.v_typeIntrinsicNames)) ((B_dData_dList.v_map (fun (t : Base_dIntrinsics.t_TypeIntrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_typeIntrinsicCtorName t); B_dData_dPair.f_Pair_second = (v_typeCtorKindTerm (Base_dIntrinsics.v_typeIntrinsicCtorArity t)) })) Base_dIntrinsics.v_typeIntrinsicArities))

# 129 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeValueGlobals = ((B_dData_dList.v_map (fun (i : Base_dIntrinsics.t_Intrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_intrinsicName i); B_dData_dPair.f_Pair_second = (v_ityToTerm (Base_dIntrinsics.v_intrinsicSignature i)) })) Base_dIntrinsics.v_userIntrinsics)

# 134 "Vuna/Compiler/Elab/Prelude.vuna"
let v_internalValueGlobals = ((B_dData_dList.v_map (fun (i : Base_dIntrinsics.t_Intrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_intrinsicName i); B_dData_dPair.f_Pair_second = (v_ityToTerm (Base_dIntrinsics.v_intrinsicSignature i)) })) Base_dIntrinsics.v_internalIntrinsics)

# 138 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeGlobals = ((B_dData_dList.v_append v_preludeTypeGlobals) ((B_dData_dList.v_append v_preludeValueGlobals) v_internalValueGlobals))

# 143 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeNames = ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames)

# 147 "Vuna/Compiler/Elab/Prelude.vuna"
let v_builtinEqTyName = (fun (v : Core_dTerm.t_Value) -> (match (v_builtinTyName v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (if (dtb__18 = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_intTypeName)) else (if (dtb__18 = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_strTypeName)) else (if (dtb__18 = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_floatTypeName)) else B_dData_dMaybe.C_Maybe_Nothing)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Elab/Prelude.vuna"
let v_cmpBuiltinTyName = (fun (v : Core_dTerm.t_Value) -> (match (v_builtinTyName v) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (if ((B_dData_dList.v_memName dtb__19) Base_dIntrinsics.v_cmpSpecializedTyNames) then (B_dData_dMaybe.C_Maybe_Just (dtb__19)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_prependParams = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (Core_dTerm.C_Term_TPi (dtb__20, false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_prependParams dtb__21) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Elab/Prelude.vuna"
let v_baseNameOf = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 183 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_classMethodProjectionGo = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if ((v_baseNameOf (B_dData_dPair.v_firstOf dtb__22)) = mc0) then (B_dData_dPair.v_firstOf dtb__22) else (((v_classMethodProjectionGo mc0) dtb__23) mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Elab/Prelude.vuna"
let v_classMethodProjection = (fun (methods : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (short : string) -> (((v_classMethodProjectionGo short) methods) short))
