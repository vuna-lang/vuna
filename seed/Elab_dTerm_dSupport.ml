open Vuna_runtime
# 50 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_fieldSelectorOf = (fun (dtb_u_u1 : string) -> (let dtb_u_u2 = (Frontend_dReserved.v_classify dtb_u_u1) in (match dtb_u_u2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3) -> (match dtb_u_u3 with
  | Frontend_dReserved.C_Reserved_RsFieldSel (dtb_u_u4, dtb_u_u5) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u4; B_dData_dPair.f_Pair_second = dtb_u_u5 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 57 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_isFieldSelectorName = (fun (dtb_u_u6 : string) -> (Frontend_dReserved.v_isFieldSelText dtb_u_u6))

# 79 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_fieldMetaOf = (fun (dtb_u_u7 : string) (dtb_u_u8 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match dtb_u_u8 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (if ((dtb_u_u9).Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb_u_u7) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9)) else ((v_fieldMetaOf dtb_u_u7) dtb_u_u10))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_recordTypeAppGo = (fun (dtb_u_u11 : int) (dtb_u_u12 : int) (dtb_u_u13 : Core_dTerm.t_Term) (dtb_u_u14 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (match dtb_u_u15 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u17; B_dData_dPair.f_Pair_second = dtb_u_u18 } -> ((((v_recordTypeAppGo (dtb_u_u11 + 1)) dtb_u_u12) (Core_dTerm.C_Term_TApp (dtb_u_u13, (Core_dTerm.C_Term_TVar (dtb_u_u17, ((dtb_u_u12 - 1) - dtb_u_u11), Base_dSource.v_spanEmpty)), Core_dTerm.C_Rig_Rig0))) dtb_u_u16)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u13
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_recordTypeApp = (fun (dtb_u_u19 : Elab_dTypes.t_DtData) -> ((((v_recordTypeAppGo 0) (B_dData_dList.v_length (dtb_u_u19).Elab_dTypes.f_DtData_dtDataParams)) (Core_dTerm.C_Term_TGlobal ((dtb_u_u19).Elab_dTypes.f_DtData_dtDataName))) (dtb_u_u19).Elab_dTypes.f_DtData_dtDataParams))

# 87 "Vuna/Compiler/Elab/Term/Support.vuna"
let[@tail_mod_cons] rec v_selectorPiTail = (fun (dtb_u_u20 : Elab_dTypes.t_DtData) (dtb_u_u21 : Elab_dTypes.t_DtFieldMeta) (dtb_u_u22 : Core_dTerm.t_Term) -> (match dtb_u_u22 with
  | Core_dTerm.C_Term_TPi (dtb_u_u23, dtb_u_u24, dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (Core_dTerm.C_Term_TPi (dtb_u_u23, true, dtb_u_u25, dtb_u_u26, (((v_selectorPiTail dtb_u_u20) dtb_u_u21) dtb_u_u27)))
  | _ -> (Core_dTerm.C_Term_TPi ("p", false, Core_dTerm.C_Rig_RigOmega, (v_recordTypeApp dtb_u_u20), (((Core_dTerm.v_shift 0) 1) (dtb_u_u21).Elab_dTypes.f_DtFieldMeta_dtFieldType)))
))

# 84 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_selectorType = (fun (dtb_u_u28 : Elab_dTypes.t_DtData) (dtb_u_u29 : Elab_dTypes.t_DtFieldMeta) -> (((v_selectorPiTail dtb_u_u28) dtb_u_u29) (Elab_dTypes.v_dtDataKind dtb_u_u28)))

# 109 "Vuna/Compiler/Elab/Term/Support.vuna"
let[@tail_mod_cons] rec v_selectorParamLams = (fun (dtb_u_u30 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u31 : Core_dTerm.t_Term) -> (match dtb_u_u30 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (match dtb_u_u32 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u34; B_dData_dPair.f_Pair_second = dtb_u_u35 } -> (Core_dTerm.C_Term_TLam (dtb_u_u34, dtb_u_u35, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_selectorParamLams dtb_u_u33) dtb_u_u31)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u31
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_selectorTerm = (fun (dtb_u_u36 : Elab_dTypes.t_DtData) (dtb_u_u37 : Elab_dTypes.t_DtCtor) (dtb_u_u38 : Elab_dTypes.t_DtFieldMeta) -> ((v_selectorParamLams (dtb_u_u36).Elab_dTypes.f_DtData_dtDataParams) (Core_dTerm.C_Term_TLam ("p", Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (Core_dTerm.C_Term_TProj ((Core_dTerm.C_Term_TVar ("p", 0, Base_dSource.v_spanEmpty)), (Elab_dTypes.v_dtCtorName dtb_u_u37), ((B_dData_dList.v_drop (B_dData_dList.v_length (dtb_u_u36).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u37)), ((B_dData_dList.v_length (dtb_u_u36).Elab_dTypes.f_DtData_dtDataParams) + (dtb_u_u38).Elab_dTypes.f_DtFieldMeta_dtFieldIndex), (dtb_u_u38).Elab_dTypes.f_DtFieldMeta_dtFieldIndex))))))

# 61 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_elabFieldSelector = (fun (dtb_u_u39 : Elab_dTypes.t_Ctx) (dtb_u_u40 : Elab_dTypes.t_Ec) (dtb_u_u41 : string) (dtb_u_u42 : string) (dtb_u_u43 : Base_dSource.t_Span) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u41) (Elab_dTypes.v_ecDatas dtb_u_u40)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u43) ("field selector needs a record in scope: " ^ dtb_u_u41))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u44) -> (if (B_dData_dBool.v_not (Elab_dTypes.v_dtDataIsRecord dtb_u_u44)) then ((Elab_dTypes.v_errAt dtb_u_u43) (String.concat "" [dtb_u_u41; " is not a record; field selector "; dtb_u_u42; " is undefined"])) else (if (Elab_dTypes.v_dtDataLinear dtb_u_u44) then ((Elab_dTypes.v_errAt dtb_u_u43) (String.concat "" ["linear record "; dtb_u_u41; " has no field selectors; use pattern matching"])) else (let dtb_u_u45 = (Elab_dTypes.v_dtDataCtors dtb_u_u44) in (match dtb_u_u45 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u46, dtb_u_u47) -> (match dtb_u_u47 with
  | B_dData_dList.C_List_Nil -> (match ((v_fieldMetaOf dtb_u_u42) (Elab_dTypes.v_dtDataFields dtb_u_u44)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_errAt dtb_u_u43) (String.concat "" ["record "; dtb_u_u41; " has no field "; dtb_u_u42]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u48) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_selectorTerm dtb_u_u44) dtb_u_u46) dtb_u_u48); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u39)) ((v_selectorType dtb_u_u44) dtb_u_u48)); B_dData_dPair.f_Pair_second = dtb_u_u40 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Elab_dTypes.v_errAt dtb_u_u43) (String.concat "" ["record "; dtb_u_u41; " is malformed: expected exactly one constructor"]))
)
  | _ -> ((Elab_dTypes.v_errAt dtb_u_u43) (String.concat "" ["record "; dtb_u_u41; " is malformed: expected exactly one constructor"]))
))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_allImplicitPrefix = (fun (dtb_u_u49 : Core_dTerm.t_Term) -> (match dtb_u_u49 with
  | Core_dTerm.C_Term_TPi (dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53, dtb_u_u54) -> (if dtb_u_u51 then (v_allImplicitPrefix dtb_u_u54) else false)
  | _ -> true
))

# 123 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_instantiateAllImplicitFuel = (fun (dtb_u_u55 : int) (dtb_u_u56 : Elab_dTypes.t_Ctx) (dtb_u_u57 : Elab_dTypes.t_Ec) (dtb_u_u58 : Core_dTerm.t_Term) (dtb_u_u59 : Core_dTerm.t_Value) (dtb_u_u60 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u55 <= 0) then { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms dtb_u_u58) (B_dData_dList.v_reverse dtb_u_u60)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u59; B_dData_dPair.f_Pair_second = dtb_u_u57 } } else (match ((Elab_dTypes.v_forceVal dtb_u_u57) dtb_u_u59) with
  | Core_dTerm.C_Value_VPi (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65) -> (if dtb_u_u62 then (let dtb_u_u66 = (Elab_dTypes.v_ecNext dtb_u_u57) in (match ((Elab_dTypes.v_newMeta dtb_u_u56) dtb_u_u57) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u67; B_dData_dPair.f_Pair_second = dtb_u_u68 } -> ((((((v_instantiateAllImplicitFuel (dtb_u_u55 - 1)) dtb_u_u56) dtb_u_u68) dtb_u_u58) ((Core_dEval.v_applyClosure dtb_u_u65) (Core_dTerm.C_Value_VMeta (dtb_u_u66, B_dData_dList.C_List_Nil)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u67; B_dData_dPair.f_Pair_second = dtb_u_u63 }, dtb_u_u60)))
  | _ -> failwith "DT: impossible branch"
)) else { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms dtb_u_u58) (B_dData_dList.v_reverse dtb_u_u60)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u59; B_dData_dPair.f_Pair_second = dtb_u_u57 } })
  | _ -> { B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms dtb_u_u58) (B_dData_dList.v_reverse dtb_u_u60)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u59; B_dData_dPair.f_Pair_second = dtb_u_u57 } }
)))

# 120 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_instantiateAllImplicit = (fun (dtb_u_u69 : Elab_dTypes.t_Ctx) (dtb_u_u70 : Elab_dTypes.t_Ec) (dtb_u_u71 : Core_dTerm.t_Term) (dtb_u_u72 : Core_dTerm.t_Value) (dtb_u_u73 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((((v_instantiateAllImplicitFuel 64) dtb_u_u69) dtb_u_u70) dtb_u_u71) dtb_u_u72) dtb_u_u73))

# 21 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_inferVarRef = (fun (dtb_u_u74 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u75 : Elab_dTypes.t_Ctx) (dtb_u_u76 : Elab_dTypes.t_Ec) (dtb_u_u77 : string) (dtb_u_u78 : Base_dSource.t_Span) -> (let dtb_u_u79 = (v_fieldSelectorOf dtb_u_u77) in (match dtb_u_u79 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u80 = ((Elab_dTypes.v_ctxLookup dtb_u_u77) dtb_u_u75) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u81 = (((Elab_dMeta.v_valueLookup dtb_u_u74) dtb_u_u76) dtb_u_u77) in (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u78) (Base_dDiagnostics_dTc.C_TcErr_UnknownName (dtb_u_u77))) dtb_u_u77)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u82) -> (match dtb_u_u82 with
  | Elab_dMeta.C_ValueEntry_VEDef (dtb_u_u83) -> (if (v_allImplicitPrefix dtb_u_u83) then (let dtb_u_u84 = (((((v_instantiateAllImplicit dtb_u_u75) dtb_u_u76) ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas dtb_u_u76)) dtb_u_u77)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u83)) B_dData_dList.C_List_Nil) in (Base_dDiag.C_Check_OkC (dtb_u_u84))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_ctorRefTerm (Elab_dTypes.v_ecDatas dtb_u_u76)) dtb_u_u77); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u83); B_dData_dPair.f_Pair_second = dtb_u_u76 } })))
  | Elab_dMeta.C_ValueEntry_VECtor (dtb_u_u85) -> ((((Elab_dMeta.v_inferCtorRef dtb_u_u76) dtb_u_u75) dtb_u_u77) (Elab_dTypes.v_dtCtorType dtb_u_u85))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (match dtb_u_u86 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u87; B_dData_dPair.f_Pair_second = dtb_u_u88 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u77, dtb_u_u87, dtb_u_u78)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (((Elab_dTypes.v_varTypeValue dtb_u_u75) dtb_u_u87) dtb_u_u88); B_dData_dPair.f_Pair_second = dtb_u_u76 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u89) -> (match dtb_u_u89 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u90; B_dData_dPair.f_Pair_second = dtb_u_u91 } -> (((((v_elabFieldSelector dtb_u_u75) dtb_u_u76) dtb_u_u90) dtb_u_u91) dtb_u_u78)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 156 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_whereBindingName = (fun (dtb_u_u92 : Frontend_dAst.t_Pat) -> (match dtb_u_u92 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u93, dtb_u_u94) -> dtb_u_u93
  | _ -> "_"
))

# 146 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_checkWhereSigs = (fun (dtb_u_u95 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u95 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u96, dtb_u_u97) -> (match (dtb_u_u96).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u98) -> (v_checkWhereSigs dtb_u_u97)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u99 = (v_whereBindingName (dtb_u_u96).Frontend_dAst.f_Binding_bindPat) in ((((Base_dDiagnostics_dTc.v_tcErr2 (Frontend_dAst.v_patSpan (dtb_u_u96).Frontend_dAst.f_Binding_bindPat)) (Base_dDiagnostics_dTc.C_TcErr_WhereNeedsSig (dtb_u_u99, dtb_u_u99))) dtb_u_u99) dtb_u_u99))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_checkBindingSigs = (fun (dtb_u_u100 : bool) (dtb_u_u101 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if dtb_u_u100 then (v_checkWhereSigs dtb_u_u101) else (Base_dDiag.C_Check_OkC (0))))

# 161 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_withEffectLabels = (fun (dtb_u_u102 : string B_dData_dList.t_List) (dtb_u_u103 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u102 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> ((v_withEffectLabels dtb_u_u105) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldEffect (("unhandled: " ^ dtb_u_u104)))) dtb_u_u103))
  | B_dData_dList.C_List_Nil -> dtb_u_u103
  | _ -> failwith "DT: impossible branch"
))
