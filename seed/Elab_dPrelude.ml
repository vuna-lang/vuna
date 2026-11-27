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
let v_fun2 = (fun (dtb_u_u1 : Core_dTerm.t_Term) (dtb_u_u2 : Core_dTerm.t_Term) (dtb_u_u3 : Core_dTerm.t_Term) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb_u_u1, (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) 1) dtb_u_u2), (((Core_dTerm.v_shift 0) 2) dtb_u_u3))))))

# 50 "Vuna/Compiler/Elab/Prelude.vuna"
let v_builtinTyName = (fun (dtb_u_u4 : Core_dTerm.t_Value) -> (match dtb_u_u4 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u5) -> (match dtb_u_u5 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u6, dtb_u_u7) -> (if ((B_dData_dList.v_length dtb_u_u7) = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u6)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 60 "Vuna/Compiler/Elab/Prelude.vuna"
let v_isEqShort = (fun (dtb_u_u8 : string) -> (if (dtb_u_u8 = "==") then true else (dtb_u_u8 = "eq")))

# 65 "Vuna/Compiler/Elab/Prelude.vuna"
let v_eqRuntimeName = (fun (dtb_u_u9 : string) (dtb_u_u10 : string) -> (if (dtb_u_u10 = "Int") then (if (v_isEqShort dtb_u_u9) then (Base_dDiag.C_Check_OkC ("bi_eq_int")) else (Base_dDiag.C_Check_OkC ("bi_neq_int"))) else (if (dtb_u_u10 = "String") then (if (v_isEqShort dtb_u_u9) then (Base_dDiag.C_Check_OkC ("bi_eq_str")) else (Base_dDiag.C_Check_OkC ("bi_neq_str"))) else (if (dtb_u_u10 = "Float") then (if (v_isEqShort dtb_u_u9) then (Base_dDiag.C_Check_OkC ("bi_eq_float")) else (Base_dDiag.C_Check_OkC ("bi_neq_float"))) else (Base_dDiag.C_Check_ErrC (((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_OpOnlyIntString (dtb_u_u9, dtb_u_u10))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u9, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u10, B_dData_dVec.C_Vec_Nil)))))))))))

# 76 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_indexOfNameGo = (fun (dtb_u_u11 : string) (dtb_u_u12 : string B_dData_dList.t_List) (dtb_u_u13 : int) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (if (dtb_u_u14 = dtb_u_u11) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u13)) else (((v_indexOfNameGo dtb_u_u11) dtb_u_u15) (dtb_u_u13 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Elab/Prelude.vuna"
let v_indexOfName = (fun (dtb_u_u16 : string) (dtb_u_u17 : string B_dData_dList.t_List) -> (((v_indexOfNameGo dtb_u_u16) dtb_u_u17) 0))

# 86 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_ityToTermEnv = (fun (dtb_u_u18 : string B_dData_dList.t_List) (dtb_u_u19 : Base_dIntrinsics.t_IType) -> (match dtb_u_u19 with
  | Base_dIntrinsics.C_IType_IPi (dtb_u_u20, dtb_u_u21) -> (Core_dTerm.C_Term_TPi (dtb_u_u20, true, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u18))) dtb_u_u21)))
  | Base_dIntrinsics.C_IType_IAtomic -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_atomicTypeName))
  | Base_dIntrinsics.C_IType_ICondvar -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_condvarTypeName))
  | Base_dIntrinsics.C_IType_IMutex -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_mutexTypeName))
  | Base_dIntrinsics.C_IType_IThread (dtb_u_u22) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_threadTypeName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u22), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IMBuffer -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_mbufferTypeName))
  | Base_dIntrinsics.C_IType_IMDynArray (dtb_u_u23) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_mdynArrayTypeName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u23), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IMArray (dtb_u_u24) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_marrayTypeName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u24), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_ICell (dtb_u_u25) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_cellTypeName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u25), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IArray (dtb_u_u26) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_arrayTypeName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u26), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IVar (dtb_u_u27) -> (match ((v_indexOfName dtb_u_u27) dtb_u_u18) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u28) -> (Core_dTerm.C_Term_TVar (dtb_u_u27, dtb_u_u28, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TGlobal (dtb_u_u27))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dIntrinsics.C_IType_IFun1 (dtb_u_u29, dtb_u_u30) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig1, ((v_ityToTermEnv dtb_u_u18) dtb_u_u29), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ ("_", dtb_u_u18))) dtb_u_u30)))
  | Base_dIntrinsics.C_IType_IFun (dtb_u_u31, dtb_u_u32) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, ((v_ityToTermEnv dtb_u_u18) dtb_u_u31), ((v_ityToTermEnv (B_dData_dList.C_List__x58__x58_ ("_", dtb_u_u18))) dtb_u_u32)))
  | Base_dIntrinsics.C_IType_IGlobal (dtb_u_u33) -> (Core_dTerm.C_Term_TGlobal (dtb_u_u33))
  | Base_dIntrinsics.C_IType_IEffHost (dtb_u_u34) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effTypeName)), (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_effRowConsCtor, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effNamedName)), (Core_dTerm.C_Term_TStr (Base_dIntrinsics.v_effDefaultInstance)), Core_dTerm.C_Rig_Rig0)), (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effHostOpName)), Core_dTerm.C_Rig_Rig0)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 }, B_dData_dList.C_List_Nil)))))), Core_dTerm.C_Rig_Rig0)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u34), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IEff (dtb_u_u35) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_effTypeName)), (Core_dTerm.C_Term_TCon (Base_dIntrinsics.v_effRowNilCtor, B_dData_dList.C_List_Nil)), Core_dTerm.C_Rig_Rig0)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u35), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_IList (dtb_u_u36) -> (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_listFamilyName)), ((v_ityToTermEnv dtb_u_u18) dtb_u_u36), Core_dTerm.C_Rig_Rig0))
  | Base_dIntrinsics.C_IType_INat -> (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_natTypeName))
  | Base_dIntrinsics.C_IType_IBool -> v_boolTy
  | Base_dIntrinsics.C_IType_IFloat -> v_floatTy
  | Base_dIntrinsics.C_IType_IStr -> v_strTy
  | Base_dIntrinsics.C_IType_IInt -> v_intTy
  | Base_dIntrinsics.C_IType_ITy -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Prelude.vuna"
let v_ityToTerm = (fun (dtb_u_u37 : Base_dIntrinsics.t_IType) -> ((v_ityToTermEnv B_dData_dList.C_List_Nil) dtb_u_u37))

# 128 "Vuna/Compiler/Elab/Prelude.vuna"
let[@tail_mod_cons] rec v_typeCtorKindTerm = (fun (dtb_u_u38 : int) -> (if (dtb_u_u38 <= 0) then (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_typeCtorKindTerm (dtb_u_u38 - 1))))))

# 136 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeTypeGlobals = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u39 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u39; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)) })) Base_dIntrinsics.v_typeIntrinsicNames)) ((B_dData_dList.v_map (fun (dtb_u_u40 : Base_dIntrinsics.t_TypeIntrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_typeIntrinsicCtorName dtb_u_u40); B_dData_dPair.f_Pair_second = (v_typeCtorKindTerm (Base_dIntrinsics.v_typeIntrinsicCtorArity dtb_u_u40)) })) Base_dIntrinsics.v_typeIntrinsicArities))

# 142 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeValueGlobals = ((B_dData_dList.v_map (fun (dtb_u_u41 : Base_dIntrinsics.t_Intrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_intrinsicName dtb_u_u41); B_dData_dPair.f_Pair_second = (v_ityToTerm (Base_dIntrinsics.v_intrinsicSignature dtb_u_u41)) })) Base_dIntrinsics.v_userIntrinsics)

# 147 "Vuna/Compiler/Elab/Prelude.vuna"
let v_internalValueGlobals = ((B_dData_dList.v_map (fun (dtb_u_u42 : Base_dIntrinsics.t_Intrinsic) -> { B_dData_dPair.f_Pair_first = (Base_dIntrinsics.v_intrinsicName dtb_u_u42); B_dData_dPair.f_Pair_second = (v_ityToTerm (Base_dIntrinsics.v_intrinsicSignature dtb_u_u42)) })) Base_dIntrinsics.v_internalIntrinsics)

# 151 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeGlobals = ((B_dData_dList.v_append v_preludeTypeGlobals) ((B_dData_dList.v_append v_preludeValueGlobals) v_internalValueGlobals))

# 156 "Vuna/Compiler/Elab/Prelude.vuna"
let v_preludeNames = ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames)

# 160 "Vuna/Compiler/Elab/Prelude.vuna"
let v_builtinEqTyName = (fun (dtb_u_u43 : Core_dTerm.t_Value) -> (match (v_builtinTyName dtb_u_u43) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u44) -> (if (dtb_u_u44 = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_intTypeName)) else (if (dtb_u_u44 = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_strTypeName)) else (if (dtb_u_u44 = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_floatTypeName)) else B_dData_dMaybe.C_Maybe_Nothing)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Elab/Prelude.vuna"
let v_cmpBuiltinTyName = (fun (dtb_u_u45 : Core_dTerm.t_Value) -> (match (v_builtinTyName dtb_u_u45) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u46) -> (if ((B_dData_dList.v_memName dtb_u_u46) Base_dIntrinsics.v_cmpSpecializedTyNames) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u46)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Elab/Prelude.vuna"
let[@tail_mod_cons] rec v_prependParams = (fun (dtb_u_u47 : string B_dData_dList.t_List) (dtb_u_u48 : Core_dTerm.t_Term) -> (match dtb_u_u47 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u49, dtb_u_u50) -> (Core_dTerm.C_Term_TPi (dtb_u_u49, false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_prependParams dtb_u_u50) dtb_u_u48)))
  | B_dData_dList.C_List_Nil -> dtb_u_u48
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Elab/Prelude.vuna"
let v_baseNameOf = (fun (dtb_u_u51 : string) -> (Base_dSource.v_lastSeg dtb_u_u51))

# 196 "Vuna/Compiler/Elab/Prelude.vuna"
let rec v_classMethodProjectionGo = (fun (dtb_u_u52 : string) (dtb_u_u53 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u54 : string) -> (match dtb_u_u53 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u55, dtb_u_u56) -> (if ((v_baseNameOf (B_dData_dPair.v_firstOf dtb_u_u55)) = dtb_u_u52) then (B_dData_dPair.v_firstOf dtb_u_u55) else (((v_classMethodProjectionGo dtb_u_u52) dtb_u_u56) dtb_u_u54))
  | B_dData_dList.C_List_Nil -> dtb_u_u54
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Prelude.vuna"
let v_classMethodProjection = (fun (dtb_u_u57 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u58 : string) -> (((v_classMethodProjectionGo dtb_u_u58) dtb_u_u57) dtb_u_u58))
