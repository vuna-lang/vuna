open Vuna_runtime
# 50 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_fieldSelectorOf = (fun (name : string) -> (let nd_uscrut1 = (Frontend_dReserved.v_classify name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | Frontend_dReserved.C_Reserved_RsFieldSel (dtb__1, dtb__2) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 57 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_isFieldSelectorName = (fun (name : string) -> (Frontend_dReserved.v_isFieldSelText name))

# 79 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_fieldMetaOf = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if ((dtb__3).Elab_dTypes.f_DtFieldMeta_dtFieldName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_fieldMetaOf mc0) dtb__4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_recordTypeAppGo = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term) (mc3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> ((((v_recordTypeAppGo (mc0 + 1)) mc1) (Core_dTerm.C_Term_TApp (mc2, (Core_dTerm.C_Term_TVar (dtb__7, ((mc1 - 1) - mc0), Base_dSource.v_spanEmpty)), Core_dTerm.C_Rig_Rig0))) dtb__6)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_recordTypeApp = (fun (dd : Elab_dTypes.t_DtData) -> ((((v_recordTypeAppGo 0) (B_dData_dList.v_length (dd).Elab_dTypes.f_DtData_dtDataParams)) (Core_dTerm.C_Term_TGlobal ((dd).Elab_dTypes.f_DtData_dtDataName))) (dd).Elab_dTypes.f_DtData_dtDataParams))

# 87 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_selectorPiTail = (fun (mc0 : Elab_dTypes.t_DtData) (mc1 : Elab_dTypes.t_DtFieldMeta) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> (Core_dTerm.C_Term_TPi (dtb__9, true, dtb__11, dtb__12, (((v_selectorPiTail mc0) mc1) dtb__13)))
  | _ -> (Core_dTerm.C_Term_TPi ("p", false, Core_dTerm.C_Rig_RigOmega, (v_recordTypeApp mc0), (((Core_dTerm.v_shift 0) 1) (mc1).Elab_dTypes.f_DtFieldMeta_dtFieldType)))
))

# 84 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_selectorType = (fun (dd : Elab_dTypes.t_DtData) (fm : Elab_dTypes.t_DtFieldMeta) -> (((v_selectorPiTail dd) fm) (Elab_dTypes.v_dtDataKind dd)))

# 109 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_selectorParamLams = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (Core_dTerm.C_Term_TLam (dtb__16, dtb__17, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_selectorParamLams dtb__15) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_selectorTerm = (fun (dd : Elab_dTypes.t_DtData) (ctor : Elab_dTypes.t_DtCtor) (fm : Elab_dTypes.t_DtFieldMeta) -> ((v_selectorParamLams (dd).Elab_dTypes.f_DtData_dtDataParams) (Core_dTerm.C_Term_TLam ("p", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (Core_dTerm.C_Term_TProj ((Core_dTerm.C_Term_TVar ("p", 0, Base_dSource.v_spanEmpty)), (Elab_dTypes.v_dtCtorName ctor), ((B_dData_dList.v_drop (B_dData_dList.v_length (dd).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtCtorTelescope ctor)), ((B_dData_dList.v_length (dd).Elab_dTypes.f_DtData_dtDataParams) + (fm).Elab_dTypes.f_DtFieldMeta_dtFieldIndex), (fm).Elab_dTypes.f_DtFieldMeta_dtFieldIndex))))))

# 61 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_elabFieldSelector = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (recordName : string) (fieldName : string) (sp : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_dtDataLookup recordName) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) ("field selector needs a record in scope: " ^ recordName))
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (if (B_dData_dBool.v_not (Elab_dTypes.v_dtDataIsRecord dtb__18)) then ((Elab_dTypes.v_errAt sp) (String.concat "" [recordName; " is not a record; field selector "; fieldName; " is undefined"])) else (if (Elab_dTypes.v_dtDataLinear dtb__18) then ((Elab_dTypes.v_errAt sp) (String.concat "" ["linear record "; recordName; " has no field selectors; use pattern matching"])) else (let nd_uscrut7 = (Elab_dTypes.v_dtDataCtors dtb__18) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List_Nil -> (match ((v_fieldMetaOf fieldName) (Elab_dTypes.v_dtDataFields dtb__18)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["record "; recordName; " has no field "; fieldName]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_selectorTerm dtb__18) dtb__19) dtb__21); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv ctx)) ((v_selectorType dtb__18) dtb__21)); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["record "; recordName; " is malformed: expected exactly one constructor"]))
)
  | _ -> ((Elab_dTypes.v_errAt sp) (String.concat "" ["record "; recordName; " is malformed: expected exactly one constructor"]))
))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_allImplicitPrefix = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (if dtb__23 then (v_allImplicitPrefix dtb__26) else false)
  | _ -> true
))

# 123 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_instantiateAllImplicitFuel = (fun (fuel : int) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (head : Core_dTerm.t_Term) (ty : Core_dTerm.t_Value) (acc : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } } else (match ((Elab_dTypes.v_forceVal ec) ty) with
  | Core_dTerm.C_Value_VPi (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if dtb__28 then (let m = (Elab_dTypes.v_ecNext ec) in (match ((Elab_dTypes.v_newMeta ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> ((((((v_instantiateAllImplicitFuel (fuel - 1)) ctx) dtb__33) head) ((Core_dEval.v_applyClosure dtb__31) (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__29 }, acc)))
  | _ -> failwith "DT: impossible branch"
)) else { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } })
  | _ -> { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms head) (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ty; B_dData_dPair.f_Pair_second = ec } }
)))

# 120 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_instantiateAllImplicit = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (head : Core_dTerm.t_Term) (ty : Core_dTerm.t_Value) (acc : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))

# 21 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_inferVarRef = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (name : string) (sp : Base_dSource.t_Span) -> (let nd_uscrut5 = (v_fieldSelectorOf name) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut7 = ((Elab_dTypes.v_ctxLookup name) ctx) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = (((Elab_dMeta.v_valueLookup globals) ec) name) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (match dtb__34 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb__35) -> (if (v_allImplicitPrefix dtb__35) then (let inst = (((((v_instantiateAllImplicit ctx) ec) ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas ec)) name)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__35)) B_dData_dList.C_List_Nil) in (Base_dDiag.C_Check_OkC (inst))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas ec)) name); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__35); B_dData_dPair.f_Pair_second = ec } })))
  | Elab_dMeta.C_ValueEntry_VECtor (dtb__36) -> ((((Elab_dMeta.v_inferCtorRef ec) ctx) name) (Elab_dTypes.v_dtCtorType dtb__36))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (match dtb__37 with
  | { B_dData_dPair.f_Pair_first = dtb__38; B_dData_dPair.f_Pair_second = dtb__39 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (name, dtb__38, sp)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((Elab_dTypes.v_varTypeValue ctx) dtb__38) dtb__39); B_dData_dPair.f_Pair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (match dtb__40 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (((((v_elabFieldSelector ctx) ec) dtb__41) dtb__42) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 156 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_whereBindingName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__43, dtb__44) -> dtb__43
  | _ -> "_"
))

# 146 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_checkWhereSigs = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (match (dtb__45).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__47) -> (v_checkWhereSigs dtb__46)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let name = (v_whereBindingName (dtb__45).Frontend_dAst.f_Binding_bindPat) in ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_patSpan (dtb__45).Frontend_dAst.f_Binding_bindPat)) (Base_dDiagnostics_dTc.C_TcErr_WhereNeedsSig (name, name))) name) name))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_checkBindingSigs = (fun (mc0 : bool) (mc1 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if mc0 then (v_checkWhereSigs mc1) else (Base_dDiag.C_Check_OkC (0))))

# 161 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_withEffectLabels = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> ((v_withEffectLabels dtb__49) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("unhandled: " ^ dtb__48)))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
