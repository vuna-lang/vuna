open Vuna_runtime
type t_RecordFieldMeta = { f_RecordFieldMeta_recordFieldName : string; f_RecordFieldMeta_recordFieldType : Frontend_dAst.t_Expr; f_RecordFieldMeta_recordFieldIndex : int }
and t_RecordMeta = { f_RecordMeta_recordMetaName : string; f_RecordMeta_recordMetaParams : string B_dData_dList.t_List; f_RecordMeta_recordMetaFields : t_RecordFieldMeta B_dData_dList.t_List; f_RecordMeta_recordMetaDerivings : string B_dData_dList.t_List; f_RecordMeta_recordMetaDerivingVia : bool; f_RecordMeta_recordMetaRepr : Frontend_dAst.t_ReprTier; f_RecordMeta_recordMetaCtor : string; f_RecordMeta_recordMetaLinear : bool }

# 42 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldPairs = (fun (mc0 : t_RecordFieldMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__0).f_RecordFieldMeta_recordFieldName; B_dData_dPair.f_Pair_second = (dtb__0).f_RecordFieldMeta_recordFieldType }, (v_recordFieldPairs dtb__1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldNames = (fun (mc0 : t_RecordFieldMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (B_dData_dList.C_List__x58__x58_ ((dtb__2).f_RecordFieldMeta_recordFieldName, (v_recordFieldNames dtb__3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupRecord = (fun (mc0 : string) (mc1 : t_RecordMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if ((dtb__4).f_RecordMeta_recordMetaName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__4)) else ((v_lookupRecord mc0) dtb__5))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Records.vuna"
let rec v_fieldNamesOf = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (B_dData_dList.C_List__x58__x58_ (dtb__8, (v_fieldNamesOf dtb__7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupProvided = (fun (mc0 : string) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (dtb__12 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__13)) else ((v_lookupProvided mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Elab/Records.vuna"
let rec v_hasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> (match ((v_lookupProvided dtb__16) dtb__15) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_hasDuplicateFieldNames dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Records.vuna"
let v_missingFieldMsg = (fun (sp : Base_dSource.t_Span) (fname : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordMissingField (fname))) (B_dData_dVec.C_Vec__x58__x58_ (fname, B_dData_dVec.C_Vec_Nil)))))

# 74 "Vuna/Compiler/Elab/Records.vuna"
let v_unknownFieldMsg = (fun (sp : Base_dSource.t_Span) (fname : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordUnknownField (fname))) (B_dData_dVec.C_Vec__x58__x58_ (fname, B_dData_dVec.C_Vec_Nil)))))

# 77 "Vuna/Compiler/Elab/Records.vuna"
let v_duplicateFieldMsg = (fun (sp : Base_dSource.t_Span) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_RecordDuplicateField) B_dData_dVec.C_Vec_Nil)))

# 80 "Vuna/Compiler/Elab/Records.vuna"
let rec v_hasUnknownFields = (fun (mc0 : string B_dData_dList.t_List) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (if ((B_dData_dList.v_memName dtb__21) mc0) then ((v_hasUnknownFields mc0) dtb__20) else true)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Records.vuna"
let rec v_firstUnknownFieldMsg = (fun (mc0 : Base_dSource.t_Span) (mc1 : string B_dData_dList.t_List) mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__23 with
  | { B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = dtb__26 } -> (if ((B_dData_dList.v_memName dtb__25) mc1) then (((v_firstUnknownFieldMsg mc0) mc1) dtb__24) else ((v_unknownFieldMsg mc0) dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((v_unknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldsOf = (fun (mc0 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordFieldMeta_recordFieldName = (Frontend_dAst.v_fieldName dtb__27); f_RecordFieldMeta_recordFieldType = (Frontend_dAst.v_fieldType dtb__27); f_RecordFieldMeta_recordFieldIndex = mc1 }, ((v_recordFieldsOf dtb__28) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Records.vuna"
let v_recordParamVarExprs = (fun (params : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EVar (p, (Frontend_dAst.v_detachedNodeRef sp))))) params))

# 110 "Vuna/Compiler/Elab/Records.vuna"
let v_recordRetType = (fun (dname : string) (params : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dname, (Frontend_dAst.v_detachedNodeRef sp))), ((v_recordParamVarExprs params) sp), (Frontend_dAst.v_detachedNodeRef sp))))

# 121 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordArrowTypeGo = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Field B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (Frontend_dAst.C_Expr_EPi ((Frontend_dReserved.v_recordArgBinderName mc0), false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.v_fieldType dtb__29), ((((v_recordArrowTypeGo (mc0 + 1)) dtb__30) mc2) mc3), (Frontend_dAst.v_detachedNodeRef mc3)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Records.vuna"
let v_recordArrowType = (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (ret : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_recordArrowTypeGo 0) fields) ret) sp))

# 134 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordParamPis = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (Frontend_dAst.C_Expr_EPi (dtb__31, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef mc2))), (((v_recordParamPis dtb__32) mc1) mc2), (Frontend_dAst.v_detachedNodeRef mc2)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Elab/Records.vuna"
let v_recordCtorType = (fun (params : string B_dData_dList.t_List) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (ret : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (((v_recordParamPis params) (((v_recordArrowType fields) ret) sp)) sp))

# 176 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarPatternFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match pat with
  | Frontend_dAst.C_Pat_PWild (dtb__33) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb__33))))
  | Frontend_dAst.C_Pat_PVar (dtb__34, dtb__35) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb__34, dtb__35))))
  | Frontend_dAst.C_Pat_PAs (dtb__36, dtb__37, dtb__38) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__37)) (fun (p : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb__36, p, dtb__38))))))
  | Frontend_dAst.C_Pat_PInt (dtb__39, dtb__40) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb__39, dtb__40))))
  | Frontend_dAst.C_Pat_PStr (dtb__41, dtb__42) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb__41, dtb__42))))
  | Frontend_dAst.C_Pat_PCon (dtb__43, dtb__44, dtb__45) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dAst.t_Pat) -> (((v_desugarPatternFuel (fuel - 1)) records) x))) dtb__44)) (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb__43, ps, dtb__45))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__46, dtb__47, dtb__48) -> (match ((v_lookupRecord dtb__46) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__48)) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord (dtb__46))) dtb__46)
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (if (v_hasDuplicateFieldNames dtb__47) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg (Frontend_dAst.v_nodeRefSpan dtb__48)))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb__49).f_RecordMeta_recordMetaFields)) dtb__47) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg (Frontend_dAst.v_nodeRefSpan dtb__48)) (v_recordFieldNames (dtb__49).f_RecordMeta_recordMetaFields)) dtb__47))) else ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) (dtb__49).f_RecordMeta_recordMetaFields) dtb__47) (Frontend_dAst.v_nodeRefSpan dtb__48))) (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon ((dtb__49).f_RecordMeta_recordMetaCtor, ps, dtb__48))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 193 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordPatternFieldsFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (fdefs : t_RecordFieldMeta B_dData_dList.t_List) (provided : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match fdefs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (match ((v_lookupProvided (dtb__50).f_RecordFieldMeta_recordFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef sp))), ps))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__52)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun (ps : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 173 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarPattern = (fun (records : t_RecordMeta B_dData_dList.t_List) (pat : Frontend_dAst.t_Pat) -> (((v_desugarPatternFuel ((Frontend_dAstQuery.v_patBudget 64) pat)) records) pat))

# 333 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordInstancePatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((Frontend_dReserved.v_recordHiddenFieldBinderName i), (Frontend_dAst.v_detachedNodeRef sp))), (((v_recordInstancePatsFrom (i + 1)) (remaining - 1)) sp)))))

# 329 "Vuna/Compiler/Elab/Records.vuna"
let v_recordInstancePats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordInstancePatsFrom 0) n) sp))

# 342 "Vuna/Compiler/Elab/Records.vuna"
let v_hasFieldInstanceDecl = (fun (rname : string) (params : string B_dData_dList.t_List) (ctor : string) (n : int) (fi : int) (fname : string) (fty : Frontend_dAst.t_Expr) -> (let fsp = (Frontend_dAst.v_exprSpan fty) in (let fref = (Frontend_dAst.v_detachedNodeRef fsp) in (let recType = (match params with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (rname, fref))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (rname, fref)), ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EVar (p, fref)))) params), fref))
) in (let label = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldLabelName, fref)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (fname, fref)), B_dData_dList.C_List_Nil)), fref)) in (let head = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldTraitName, fref)), (B_dData_dList.C_List__x58__x58_ (label, (B_dData_dList.C_List__x58__x58_ (recType, (B_dData_dList.C_List__x58__x58_ (fty, B_dData_dList.C_List_Nil)))))), fref)) in (let pats = ((v_recordInstancePats n) fsp) in (let body = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("p", fref)), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (ctor, pats, fref)); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_recordHiddenFieldBinderName fi), fref)); Frontend_dAst.f_Alt_altRef = fref }, B_dData_dList.C_List_Nil)), fref)) in (let meth = (Frontend_dAst.C_Decl_DFun (Base_dIntrinsics.v_hasFieldMethodName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("p", fref)), B_dData_dList.C_List_Nil)), body, fref)) in (Frontend_dAst.C_Decl_DInstance (B_dData_dList.C_List_Nil, head, (B_dData_dList.C_List__x58__x58_ (meth, B_dData_dList.C_List_Nil)), fref)))))))))))

# 322 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordHasFieldInstancesGo = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : int) (mc4 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : int) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (B_dData_dList.C_List__x58__x58_ ((((((((v_hasFieldInstanceDecl mc0) mc1) mc2) mc3) mc5) dtb__55) dtb__56), ((((((v_recordHasFieldInstancesGo mc0) mc1) mc2) mc3) dtb__54) (mc5 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Records.vuna"
let v_recordHasFieldInstancesOf = (fun (r : t_RecordMeta) -> ((((((v_recordHasFieldInstancesGo (r).f_RecordMeta_recordMetaName) (r).f_RecordMeta_recordMetaParams) (r).f_RecordMeta_recordMetaCtor) (B_dData_dList.v_length (r).f_RecordMeta_recordMetaFields)) (v_recordFieldPairs (r).f_RecordMeta_recordMetaFields)) 0))

# 305 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordHasFieldInstances = (fun (mc0 : t_RecordMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> ((B_dData_dList.v_append (v_recordHasFieldInstancesOf dtb__57)) (v_recordHasFieldInstances dtb__58))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Records.vuna"
let v_ctorName = (fun (dname : string) -> dname)

# 91 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordsOfDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__59 with
  | Frontend_dAst.C_Decl_DRecord (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordMeta_recordMetaName = dtb__61; f_RecordMeta_recordMetaParams = dtb__62; f_RecordMeta_recordMetaFields = ((v_recordFieldsOf dtb__63) 0); f_RecordMeta_recordMetaDerivings = dtb__64; f_RecordMeta_recordMetaDerivingVia = dtb__65; f_RecordMeta_recordMetaRepr = dtb__66; f_RecordMeta_recordMetaCtor = (v_ctorName dtb__61); f_RecordMeta_recordMetaLinear = dtb__67 }, (v_recordsOfDecls dtb__60)))
  | _ -> (v_recordsOfDecls dtb__60)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Elab/Records.vuna"
let rec v_expandCaseAsGo = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Pat) (mc2 : Frontend_dAst.t_Expr) (mc3 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | Frontend_dAst.C_Pat_PAs (dtb__69, dtb__70, dtb__71) -> ((((v_expandCaseAsGo mc0) dtb__70) (Frontend_dAst.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__69, dtb__71)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (mc0)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = dtb__71 }, B_dData_dList.C_List_Nil)), mc2, false, dtb__71))) mc3)
  | _ -> { Frontend_dAst.f_Alt_altPat = mc1; Frontend_dAst.f_Alt_altBody = mc2; Frontend_dAst.f_Alt_altRef = mc3 }
))

# 389 "Vuna/Compiler/Elab/Records.vuna"
let v_expandCaseAs = (fun (scrut : Frontend_dAst.t_Expr) (alt : Frontend_dAst.t_Alt) -> ((((v_expandCaseAsGo scrut) (alt).Frontend_dAst.f_Alt_altPat) (alt).Frontend_dAst.f_Alt_altBody) (alt).Frontend_dAst.f_Alt_altRef))

# 205 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarExprFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__72, dtb__73) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EInt (dtb__74, dtb__75) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EStr (dtb__76, dtb__77) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EFloat (dtb__78, dtb__79) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ELam (dtb__80, dtb__81, dtb__82) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__81)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__80, b2, dtb__82))))))
  | Frontend_dAst.C_Expr_EApp (dtb__83, dtb__84, dtb__85) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__83)) (fun (f2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarExprFuel (fuel - 1)) records)) dtb__84)) (fun (a2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (f2, a2, dtb__85))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__86, dtb__87, dtb__88, dtb__89) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (fuel - 1)) records)) dtb__86)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__87)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (b2, body2, dtb__88, dtb__89))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__90, dtb__91, dtb__92) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__90)) (fun (s2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarAltFuel (fuel - 1)) records)) dtb__91)) (fun (a2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (s2, ((B_dData_dList.v_map (v_expandCaseAs s2)) a2), dtb__92))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__93, dtb__94, dtb__95, dtb__96) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__93)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__94)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__95)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, e2, dtb__96))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__97, dtb__98, dtb__99) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__97)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__98, dtb__99))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__100, dtb__101, dtb__102) -> (match ((v_lookupRecord dtb__100) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__102)) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord (dtb__100))) dtb__100)
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (if (v_hasDuplicateFieldNames dtb__101) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg (Frontend_dAst.v_nodeRefSpan dtb__102)))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb__103).f_RecordMeta_recordMetaFields)) dtb__101) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg (Frontend_dAst.v_nodeRefSpan dtb__102)) (v_recordFieldNames (dtb__103).f_RecordMeta_recordMetaFields)) dtb__101))) else ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (fuel - 1)) records) (dtb__103).f_RecordMeta_recordMetaFields) dtb__101) (Frontend_dAst.v_nodeRefSpan dtb__102))) (fun (vs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((dtb__103).f_RecordMeta_recordMetaCtor, dtb__102)), vs, dtb__102))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__104, dtb__105, dtb__106) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__104)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarFieldValueFuel (fuel - 1)) records)) dtb__105)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__106))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__107, dtb__108) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarDoStmtFuel (fuel - 1)) records)) dtb__107)) (fun (s2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (s2, dtb__108))))))
  | Frontend_dAst.C_Expr_EPi (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__112)) (fun (d2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__113)) (fun (c2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__109, dtb__110, dtb__111, d2, c2, dtb__114))))))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
)))
# 232 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarDoStmtFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (stmt : Frontend_dAst.t_DoStmt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match stmt with
  | Frontend_dAst.C_DoStmt_DBind (dtb__115, dtb__116, dtb__117) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__115)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__116)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (p2, e2, dtb__117))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__118, dtb__119) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__118)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (e2, dtb__119))))))
  | Frontend_dAst.C_DoStmt_DLet (dtb__120, dtb__121) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (fuel - 1)) records)) dtb__120)) (fun (b2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (b2, dtb__121))))))
  | _ -> failwith "DT: impossible branch"
)))
# 242 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordValuesFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : t_RecordFieldMeta B_dData_dList.t_List) (mc3 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match ((v_lookupProvided (dtb__122).f_RecordFieldMeta_recordFieldName) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_missingFieldMsg mc4) (dtb__122).f_RecordFieldMeta_recordFieldName)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__124)) (fun (v2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (mc0 - 1)) mc1) dtb__123) mc3) mc4)) (fun (vs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 253 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarFieldValueFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__126)) (fun (v2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = v2 })))))
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (b : Frontend_dAst.t_Binding) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) (b).Frontend_dAst.f_Binding_bindPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarBindingValueFuel (fuel - 1)) records) (b).Frontend_dAst.f_Binding_bindValue)) (fun (v2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((v_desugarBindingSigFuel (fuel - 1)) records) (b).Frontend_dAst.f_Binding_bindSig)) (fun (s2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ b with Frontend_dAst.f_Binding_bindPat = p2; Frontend_dAst.f_Binding_bindValue = v2; Frontend_dAst.f_Binding_bindSig = s2 }))))))))))
# 269 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindingValueFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : Frontend_dAst.t_BindingValue) -> (match mc2 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__127) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarLocalClauseFuel mc0) mc1)) dtb__127)) (fun (c2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (c2))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__128) -> ((Base_dCommon.v_bind (((v_desugarExprFuel mc0) mc1) dtb__128)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 277 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindingSigFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> ((Base_dCommon.v_bind (((v_desugarExprFuel mc0) mc1) (dtb__129).Frontend_dAst.f_BindingSig_sigType)) (fun (t2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ dtb__129 with Frontend_dAst.f_BindingSig_sigType = t2 }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarLocalClauseFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarPatternFuel (fuel - 1)) records)) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (p2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ clause with Frontend_dAst.f_LocalClause_lcPats = p2; Frontend_dAst.f_LocalClause_lcBody = b2 }))))))))
# 294 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarAltFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p2 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) (alt).Frontend_dAst.f_Alt_altBody)) (fun (b2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ alt with Frontend_dAst.f_Alt_altPat = p2; Frontend_dAst.f_Alt_altBody = b2 }))))))))

# 384 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarExpr = (fun (a1 : t_RecordMeta B_dData_dList.t_List) (a2 : Frontend_dAst.t_Expr) -> (((v_desugarExprFuel ((Frontend_dAstQuery.v_exprBudget 512) a2)) a1) a2))

# 153 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarRecordDecl = (fun (records : t_RecordMeta B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DFun (dtb__130, dtb__131, dtb__132, dtb__133) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarPattern records)) dtb__131)) (fun (pats2 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_desugarExpr records) dtb__132)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__130, pats2, body2, dtb__133))))))))
  | Frontend_dAst.C_Decl_DData (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dAst.C_Decl_DRecord (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dAst.C_Decl_DTrait (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dAst.C_Decl_DInstance (dtb__156, dtb__157, dtb__158, dtb__159) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarRecordDecl records)) dtb__158)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb__156, dtb__157, ms, dtb__159))))))
  | Frontend_dAst.C_Decl_DSig (dtb__160, dtb__161, dtb__162, dtb__163) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dAst.C_Decl_DAxiom (dtb__164, dtb__165, dtb__166) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dAst.C_Decl_DExtern (dtb__167, dtb__168, dtb__169, dtb__170) -> (Base_dDiag.C_Check_OkC (d))
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarRecords = (fun (records : t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (v_desugarRecordDecl records)) decls))

# 371 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDeclsWith = (fun (auxDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let records = ((B_dData_dList.v_append (v_recordsOfDecls auxDecls)) (v_recordsOfDecls decls0)) in ((Base_dCommon.v_bind ((v_desugarRecords records) decls0)) (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = records; B_dData_dPair.f_Pair_second = ds }))))))

# 366 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDecls = (fun (decls0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_prepareDeclsWith B_dData_dList.C_List_Nil) decls0))

# 23 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldName = (fun (p : t_RecordFieldMeta) -> (match p with
  | { f_RecordFieldMeta_recordFieldName = dtb__171; f_RecordFieldMeta_recordFieldType = dtb__172; f_RecordFieldMeta_recordFieldIndex = dtb__173 } -> dtb__171
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldType = (fun (p : t_RecordFieldMeta) -> (match p with
  | { f_RecordFieldMeta_recordFieldName = dtb__174; f_RecordFieldMeta_recordFieldType = dtb__175; f_RecordFieldMeta_recordFieldIndex = dtb__176 } -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldIndex = (fun (p : t_RecordFieldMeta) -> (match p with
  | { f_RecordFieldMeta_recordFieldName = dtb__177; f_RecordFieldMeta_recordFieldType = dtb__178; f_RecordFieldMeta_recordFieldIndex = dtb__179 } -> dtb__179
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaName = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__180; f_RecordMeta_recordMetaParams = dtb__181; f_RecordMeta_recordMetaFields = dtb__182; f_RecordMeta_recordMetaDerivings = dtb__183; f_RecordMeta_recordMetaDerivingVia = dtb__184; f_RecordMeta_recordMetaRepr = dtb__185; f_RecordMeta_recordMetaCtor = dtb__186; f_RecordMeta_recordMetaLinear = dtb__187 } -> dtb__180
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaParams = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__188; f_RecordMeta_recordMetaParams = dtb__189; f_RecordMeta_recordMetaFields = dtb__190; f_RecordMeta_recordMetaDerivings = dtb__191; f_RecordMeta_recordMetaDerivingVia = dtb__192; f_RecordMeta_recordMetaRepr = dtb__193; f_RecordMeta_recordMetaCtor = dtb__194; f_RecordMeta_recordMetaLinear = dtb__195 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaFields = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__196; f_RecordMeta_recordMetaParams = dtb__197; f_RecordMeta_recordMetaFields = dtb__198; f_RecordMeta_recordMetaDerivings = dtb__199; f_RecordMeta_recordMetaDerivingVia = dtb__200; f_RecordMeta_recordMetaRepr = dtb__201; f_RecordMeta_recordMetaCtor = dtb__202; f_RecordMeta_recordMetaLinear = dtb__203 } -> dtb__198
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaDerivings = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__204; f_RecordMeta_recordMetaParams = dtb__205; f_RecordMeta_recordMetaFields = dtb__206; f_RecordMeta_recordMetaDerivings = dtb__207; f_RecordMeta_recordMetaDerivingVia = dtb__208; f_RecordMeta_recordMetaRepr = dtb__209; f_RecordMeta_recordMetaCtor = dtb__210; f_RecordMeta_recordMetaLinear = dtb__211 } -> dtb__207
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaDerivingVia = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__212; f_RecordMeta_recordMetaParams = dtb__213; f_RecordMeta_recordMetaFields = dtb__214; f_RecordMeta_recordMetaDerivings = dtb__215; f_RecordMeta_recordMetaDerivingVia = dtb__216; f_RecordMeta_recordMetaRepr = dtb__217; f_RecordMeta_recordMetaCtor = dtb__218; f_RecordMeta_recordMetaLinear = dtb__219 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaRepr = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__220; f_RecordMeta_recordMetaParams = dtb__221; f_RecordMeta_recordMetaFields = dtb__222; f_RecordMeta_recordMetaDerivings = dtb__223; f_RecordMeta_recordMetaDerivingVia = dtb__224; f_RecordMeta_recordMetaRepr = dtb__225; f_RecordMeta_recordMetaCtor = dtb__226; f_RecordMeta_recordMetaLinear = dtb__227 } -> dtb__225
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaCtor = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__228; f_RecordMeta_recordMetaParams = dtb__229; f_RecordMeta_recordMetaFields = dtb__230; f_RecordMeta_recordMetaDerivings = dtb__231; f_RecordMeta_recordMetaDerivingVia = dtb__232; f_RecordMeta_recordMetaRepr = dtb__233; f_RecordMeta_recordMetaCtor = dtb__234; f_RecordMeta_recordMetaLinear = dtb__235 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaLinear = (fun (p : t_RecordMeta) -> (match p with
  | { f_RecordMeta_recordMetaName = dtb__236; f_RecordMeta_recordMetaParams = dtb__237; f_RecordMeta_recordMetaFields = dtb__238; f_RecordMeta_recordMetaDerivings = dtb__239; f_RecordMeta_recordMetaDerivingVia = dtb__240; f_RecordMeta_recordMetaRepr = dtb__241; f_RecordMeta_recordMetaCtor = dtb__242; f_RecordMeta_recordMetaLinear = dtb__243 } -> dtb__243
  | _ -> failwith "DT: impossible branch"
))
