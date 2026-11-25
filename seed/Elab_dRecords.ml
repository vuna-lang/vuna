open Vuna_runtime
type t_RecordFieldMeta = { f_RecordFieldMeta_recordFieldName : string; f_RecordFieldMeta_recordFieldType : Frontend_dRast.t_Expr; f_RecordFieldMeta_recordFieldIndex : int }
and t_RecordMeta = { f_RecordMeta_recordMetaName : string; f_RecordMeta_recordMetaParams : string B_dData_dList.t_List; f_RecordMeta_recordMetaFields : t_RecordFieldMeta B_dData_dList.t_List; f_RecordMeta_recordMetaDerivings : string B_dData_dList.t_List; f_RecordMeta_recordMetaDerivingVia : bool; f_RecordMeta_recordMetaRepr : Frontend_dAst.t_ReprTier; f_RecordMeta_recordMetaCtor : string; f_RecordMeta_recordMetaLinear : bool }

# 41 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldPairs = (fun (mc0 : t_RecordFieldMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__0).f_RecordFieldMeta_recordFieldName; B_dData_dPair.f_Pair_second = (dtb__0).f_RecordFieldMeta_recordFieldType }, (v_recordFieldPairs dtb__1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldNames = (fun (mc0 : t_RecordFieldMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (B_dData_dList.C_List__x58__x58_ ((dtb__2).f_RecordFieldMeta_recordFieldName, (v_recordFieldNames dtb__3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupRecord = (fun (mc0 : string) (mc1 : t_RecordMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if ((dtb__4).f_RecordMeta_recordMetaName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__4)) else ((v_lookupRecord mc0) dtb__5))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Records.vuna"
let rec v_fieldNamesOf = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (B_dData_dList.C_List__x58__x58_ (dtb__8, (v_fieldNamesOf dtb__7)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupProvided = (fun (mc0 : string) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> (if (dtb__12 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__13)) else ((v_lookupProvided mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Elab/Records.vuna"
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

# 70 "Vuna/Compiler/Elab/Records.vuna"
let v_missingFieldMsg = (fun (sp : Base_dSource.t_Span) (fname : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordMissingField (fname))) (B_dData_dVec.C_Vec_VCons (fname, B_dData_dVec.C_Vec_Nil)))))

# 73 "Vuna/Compiler/Elab/Records.vuna"
let v_unknownFieldMsg = (fun (sp : Base_dSource.t_Span) (fname : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordUnknownField (fname))) (B_dData_dVec.C_Vec_VCons (fname, B_dData_dVec.C_Vec_Nil)))))

# 76 "Vuna/Compiler/Elab/Records.vuna"
let v_duplicateFieldMsg = (fun (sp : Base_dSource.t_Span) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan sp) ((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_RecordDuplicateField) B_dData_dVec.C_Vec_Nil)))

# 79 "Vuna/Compiler/Elab/Records.vuna"
let rec v_hasUnknownFields = (fun (mc0 : string B_dData_dList.t_List) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (if ((B_dData_dList.v_memName dtb__21) mc0) then ((v_hasUnknownFields mc0) dtb__20) else true)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Elab/Records.vuna"
let rec v_firstUnknownFieldMsg = (fun (mc0 : Base_dSource.t_Span) (mc1 : string B_dData_dList.t_List) mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__23 with
  | { B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = dtb__26 } -> (if ((B_dData_dList.v_memName dtb__25) mc1) then (((v_firstUnknownFieldMsg mc0) mc1) dtb__24) else ((v_unknownFieldMsg mc0) dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((v_unknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordFieldsOf = (fun (mc0 : Frontend_dRast.t_Field B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordFieldMeta_recordFieldName = (Frontend_dRast.v_fieldName dtb__27); f_RecordFieldMeta_recordFieldType = (Frontend_dRast.v_fieldType dtb__27); f_RecordFieldMeta_recordFieldIndex = mc1 }, ((v_recordFieldsOf dtb__28) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Elab/Records.vuna"
let v_recordParamVarExprs = (fun (params : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName p), sp)))) params))

# 109 "Vuna/Compiler/Elab/Records.vuna"
let v_recordRetType = (fun (dname : string) (params : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dname), sp)), ((v_recordParamVarExprs params) sp), sp)))

# 120 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordArrowTypeGo = (fun (mc0 : int) (mc1 : Frontend_dRast.t_Field B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (Frontend_dRast.C_Expr_EPi ((Frontend_dReserved.v_recordArgBinderName mc0), false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.v_fieldType dtb__29), ((((v_recordArrowTypeGo (mc0 + 1)) dtb__30) mc2) mc3), mc3))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Records.vuna"
let v_recordArrowType = (fun (fields : Frontend_dRast.t_Field B_dData_dList.t_List) (ret : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_recordArrowTypeGo 0) fields) ret) sp))

# 127 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordParamPis = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (Frontend_dRast.C_Expr_EPi (dtb__31, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), mc2)), (((v_recordParamPis dtb__32) mc1) mc2), mc2))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Records.vuna"
let v_recordCtorType = (fun (params : string B_dData_dList.t_List) (fields : Frontend_dRast.t_Field B_dData_dList.t_List) (ret : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (((v_recordParamPis params) (((v_recordArrowType fields) ret) sp)) sp))

# 163 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarPatternFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (pat : Frontend_dRast.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match pat with
  | Frontend_dRast.C_Pat_PWild (dtb__33) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PWild (dtb__33))))
  | Frontend_dRast.C_Pat_PVar (dtb__34, dtb__35) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PVar (dtb__34, dtb__35))))
  | Frontend_dRast.C_Pat_PAs (dtb__36, dtb__37, dtb__38) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__37)) (fun (p : Frontend_dRast.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PAs (dtb__36, p, dtb__38))))))
  | Frontend_dRast.C_Pat_PInt (dtb__39, dtb__40) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PInt (dtb__39, dtb__40))))
  | Frontend_dRast.C_Pat_PStr (dtb__41, dtb__42) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PStr (dtb__41, dtb__42))))
  | Frontend_dRast.C_Pat_PCon (dtb__43, dtb__44, dtb__45) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (x : Frontend_dRast.t_Pat) -> (((v_desugarPatternFuel (fuel - 1)) records) x))) dtb__44)) (fun (ps : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PCon (dtb__43, ps, dtb__45))))))
  | Frontend_dRast.C_Pat_PRecord (dtb__46, dtb__47, dtb__48) -> (match ((v_lookupRecord (Frontend_dRast_dName.v_rnameKey dtb__46)) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__48) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord ((Frontend_dRast_dName.v_rnameKey dtb__46)))) (Frontend_dRast_dName.v_rnameKey dtb__46))
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (if (v_hasDuplicateFieldNames dtb__47) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg dtb__48))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb__49).f_RecordMeta_recordMetaFields)) dtb__47) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg dtb__48) (v_recordFieldNames (dtb__49).f_RecordMeta_recordMetaFields)) dtb__47))) else ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) (dtb__49).f_RecordMeta_recordMetaFields) dtb__47) dtb__48)) (fun (ps : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName (dtb__49).f_RecordMeta_recordMetaCtor), ps, dtb__48))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 180 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordPatternFieldsFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (fdefs : t_RecordFieldMeta B_dData_dList.t_List) (provided : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match fdefs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (match ((v_lookupProvided (dtb__50).f_RecordFieldMeta_recordFieldName) provided) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun (ps : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PWild (sp)), ps))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__52)) (fun (p2 : Frontend_dRast.t_Pat) -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun (ps : Frontend_dRast.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 160 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarPattern = (fun (records : t_RecordMeta B_dData_dList.t_List) (pat : Frontend_dRast.t_Pat) -> (((v_desugarPatternFuel ((Frontend_dRast.v_patBudget 64) pat)) records) pat))

# 309 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordInstancePatsFrom = (fun (i : int) (remaining : int) (sp : Base_dSource.t_Span) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ((Frontend_dReserved.v_recordHiddenFieldBinderName i), sp)), (((v_recordInstancePatsFrom (i + 1)) (remaining - 1)) sp)))))

# 305 "Vuna/Compiler/Elab/Records.vuna"
let v_recordInstancePats = (fun (n : int) (sp : Base_dSource.t_Span) -> (((v_recordInstancePatsFrom 0) n) sp))

# 317 "Vuna/Compiler/Elab/Records.vuna"
let v_hasFieldInstanceDecl = (fun (rname : string) (params : string B_dData_dList.t_List) (ctor : string) (n : int) (fi : int) (fname : string) (fty : Frontend_dRast.t_Expr) -> (let fsp = (Frontend_dRast.v_exprSpan fty) in (let recType = (match params with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName rname), fsp))
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName rname), fsp)), ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName p), fsp)))) params), fsp))
) in (let label = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_hasFieldLabelName), fsp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (fname, fsp)), B_dData_dList.C_List_Nil)), fsp)) in (let head = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_hasFieldTraitName), fsp)), (B_dData_dList.C_List__x58__x58_ (label, (B_dData_dList.C_List__x58__x58_ (recType, (B_dData_dList.C_List__x58__x58_ (fty, B_dData_dList.C_List_Nil)))))), fsp)) in (let pats = ((v_recordInstancePats n) fsp) in (let body = (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "p"), fsp)), (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName ctor), pats, fsp)); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (Frontend_dReserved.v_recordHiddenFieldBinderName fi)), fsp)) }, B_dData_dList.C_List_Nil)), fsp)) in (let meth = (Frontend_dRast.C_Decl_DFun (Base_dIntrinsics.v_hasFieldMethodName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("p", fsp)), B_dData_dList.C_List_Nil)), body, fsp)) in (Frontend_dRast.C_Decl_DInstance (B_dData_dList.C_List_Nil, head, (B_dData_dList.C_List__x58__x58_ (meth, B_dData_dList.C_List_Nil)), fsp))))))))))

# 298 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordHasFieldInstancesGo = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : int) (mc4 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : int) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (B_dData_dList.C_List__x58__x58_ ((((((((v_hasFieldInstanceDecl mc0) mc1) mc2) mc3) mc5) dtb__55) dtb__56), ((((((v_recordHasFieldInstancesGo mc0) mc1) mc2) mc3) dtb__54) (mc5 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Elab/Records.vuna"
let v_recordHasFieldInstancesOf = (fun (r : t_RecordMeta) -> ((((((v_recordHasFieldInstancesGo (r).f_RecordMeta_recordMetaName) (r).f_RecordMeta_recordMetaParams) (r).f_RecordMeta_recordMetaCtor) (B_dData_dList.v_length (r).f_RecordMeta_recordMetaFields)) (v_recordFieldPairs (r).f_RecordMeta_recordMetaFields)) 0))

# 281 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordHasFieldInstances = (fun (mc0 : t_RecordMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> ((B_dData_dList.v_append (v_recordHasFieldInstancesOf dtb__57)) (v_recordHasFieldInstances dtb__58))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Elab/Records.vuna"
let v_ctorName = (fun (dname : string) -> dname)

# 90 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordsOfDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__59 with
  | Frontend_dRast.C_Decl_DRecord (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordMeta_recordMetaName = dtb__61; f_RecordMeta_recordMetaParams = dtb__62; f_RecordMeta_recordMetaFields = ((v_recordFieldsOf dtb__63) 0); f_RecordMeta_recordMetaDerivings = dtb__64; f_RecordMeta_recordMetaDerivingVia = dtb__65; f_RecordMeta_recordMetaRepr = dtb__66; f_RecordMeta_recordMetaCtor = (v_ctorName dtb__61); f_RecordMeta_recordMetaLinear = dtb__67 }, (v_recordsOfDecls dtb__60)))
  | _ -> (v_recordsOfDecls dtb__60)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Elab/Records.vuna"
let rec v_expandCaseAsGo = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : Frontend_dRast.t_Pat) (mc2 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Pat_PAs (dtb__69, dtb__70, dtb__71) -> (((v_expandCaseAsGo mc0) dtb__70) (Frontend_dRast.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PVar (dtb__69, dtb__71)); B_dData_dPair.f_Pair_second = mc0 }, B_dData_dList.C_List_Nil)), mc2, false, dtb__71)))
  | _ -> { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 }
))

# 363 "Vuna/Compiler/Elab/Records.vuna"
let v_expandCaseAs = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (((v_expandCaseAsGo mc0) dtb__72) dtb__73)
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarExprFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (e : Frontend_dRast.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__74, dtb__75) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dRast.C_Expr_EInt (dtb__76, dtb__77) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dRast.C_Expr_EStr (dtb__78, dtb__79) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dRast.C_Expr_EFloat (dtb__80, dtb__81) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dRast.C_Expr_ELam (dtb__82, dtb__83, dtb__84) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__83)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELam (dtb__82, b2, dtb__84))))))
  | Frontend_dRast.C_Expr_EApp (dtb__85, dtb__86, dtb__87) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__85)) (fun (f2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarExprFuel (fuel - 1)) records)) dtb__86)) (fun (a2 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp (f2, a2, dtb__87))))))))
  | Frontend_dRast.C_Expr_ELet (dtb__88, dtb__89, dtb__90, dtb__91) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (fuel - 1)) records)) dtb__88)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__89)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELet (b2, body2, dtb__90, dtb__91))))))))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__92, dtb__93) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarLocalClauseFuel (fuel - 1)) records)) dtb__92)) (fun (c2 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ELocalFun (c2, dtb__93))))))
  | Frontend_dRast.C_Expr_ECase (dtb__94, dtb__95, dtb__96) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__94)) (fun (s2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarAltFuel (fuel - 1)) records)) dtb__95)) (fun (a2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ECase (s2, ((B_dData_dList.v_map (v_expandCaseAs s2)) a2), dtb__96))))))))
  | Frontend_dRast.C_Expr_EIf (dtb__97, dtb__98, dtb__99, dtb__100) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__97)) (fun (c2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__98)) (fun (t2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__99)) (fun (e2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EIf (c2, t2, e2, dtb__100))))))))))
  | Frontend_dRast.C_Expr_EField (dtb__101, dtb__102, dtb__103) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__101)) (fun (b : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EField (b, dtb__102, dtb__103))))))
  | Frontend_dRast.C_Expr_ERecord (dtb__104, dtb__105, dtb__106) -> (match ((v_lookupRecord (Frontend_dRast_dName.v_rnameKey dtb__104)) records) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__106) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord ((Frontend_dRast_dName.v_rnameKey dtb__104)))) (Frontend_dRast_dName.v_rnameKey dtb__104))
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (if (v_hasDuplicateFieldNames dtb__105) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg dtb__106))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb__107).f_RecordMeta_recordMetaFields)) dtb__105) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg dtb__106) (v_recordFieldNames (dtb__107).f_RecordMeta_recordMetaFields)) dtb__105))) else ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (fuel - 1)) records) (dtb__107).f_RecordMeta_recordMetaFields) dtb__105) dtb__106)) (fun (vs : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName (dtb__107).f_RecordMeta_recordMetaCtor), dtb__106)), vs, dtb__106))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__108, dtb__109, dtb__110) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__108)) (fun (b : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarFieldValueFuel (fuel - 1)) records)) dtb__109)) (fun (fs : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_ERecUpdate (b, fs, dtb__110))))))))
  | Frontend_dRast.C_Expr_EDo (dtb__111, dtb__112) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarDoStmtFuel (fuel - 1)) records)) dtb__111)) (fun (s2 : Frontend_dRast.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EDo (s2, dtb__112))))))
  | Frontend_dRast.C_Expr_EPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__116)) (fun (d2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__117)) (fun (c2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EPi (dtb__113, dtb__114, dtb__115, d2, c2, dtb__118))))))))
  | Frontend_dRast.C_Expr_EAnn (dtb__119, dtb__120, dtb__121) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__119)) (fun (v2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__120)) (fun (t2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Expr_EAnn (v2, t2, dtb__121))))))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
)))
# 223 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarDoStmtFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (stmt : Frontend_dRast.t_DoStmt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match stmt with
  | Frontend_dRast.C_DoStmt_DBind (dtb__122, dtb__123, dtb__124) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (fuel - 1)) records) dtb__122)) (fun (p2 : Frontend_dRast.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__123)) (fun (e2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DBind (p2, e2, dtb__124))))))))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__125, dtb__126) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) dtb__125)) (fun (e2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DExpr (e2, dtb__126))))))
  | Frontend_dRast.C_DoStmt_DLet (dtb__127, dtb__128) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (fuel - 1)) records)) dtb__127)) (fun (b2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_DoStmt_DLet (b2, dtb__128))))))
  | _ -> failwith "DT: impossible branch"
)))
# 233 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordValuesFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : t_RecordFieldMeta B_dData_dList.t_List) (mc3 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match ((v_lookupProvided (dtb__129).f_RecordFieldMeta_recordFieldName) mc3) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_missingFieldMsg mc4) (dtb__129).f_RecordFieldMeta_recordFieldName)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__131)) (fun (v2 : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (mc0 - 1)) mc1) dtb__130) mc3) mc4)) (fun (vs : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarFieldValueFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__133)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = v2 })))))
  | _ -> failwith "DT: impossible branch"
))
# 251 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (mc0 - 1)) mc1) dtb__134)) (fun (p2 : Frontend_dRast.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__135)) (fun (v2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p2; B_dData_dPair.f_Pair_second = v2 })))))))
  | _ -> failwith "DT: impossible branch"
))
# 261 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarLocalClauseFuel = (fun (fuel : int) (records : t_RecordMeta B_dData_dList.t_List) (clause : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarPatternFuel (fuel - 1)) records)) (B_dData_dPair.v_firstOf clause))) (fun (p2 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (fuel - 1)) records) (B_dData_dPair.v_secondOf clause))) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p2; B_dData_dPair.f_Pair_second = b2 }))))))))
# 270 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarAltFuel = (fun (mc0 : int) (mc1 : t_RecordMeta B_dData_dList.t_List) (mc2 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (mc0 - 1)) mc1) dtb__136)) (fun (p2 : Frontend_dRast.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (mc0 - 1)) mc1) dtb__137)) (fun (b2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p2; B_dData_dPair.f_Pair_second = b2 })))))))
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarExpr = (fun (a1 : t_RecordMeta B_dData_dList.t_List) (a2 : Frontend_dRast.t_Expr) -> (((v_desugarExprFuel ((Frontend_dRast.v_exprBudget 512) a2)) a1) a2))

# 140 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarRecordDecl = (fun (records : t_RecordMeta B_dData_dList.t_List) (d : Frontend_dRast.t_Decl) -> (match d with
  | Frontend_dRast.C_Decl_DFun (dtb__138, dtb__139, dtb__140, dtb__141) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarPattern records)) dtb__139)) (fun (pats2 : Frontend_dRast.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_desugarExpr records) dtb__140)) (fun (body2 : Frontend_dRast.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DFun (dtb__138, pats2, body2, dtb__141))))))))
  | Frontend_dRast.C_Decl_DData (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dRast.C_Decl_DRecord (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dRast.C_Decl_DTrait (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dRast.C_Decl_DInstance (dtb__164, dtb__165, dtb__166, dtb__167) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarRecordDecl records)) dtb__166)) (fun (ms : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (dtb__164, dtb__165, ms, dtb__167))))))
  | Frontend_dRast.C_Decl_DSig (dtb__168, dtb__169, dtb__170, dtb__171) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dRast.C_Decl_DAxiom (dtb__172, dtb__173, dtb__174) -> (Base_dDiag.C_Check_OkC (d))
  | Frontend_dRast.C_Decl_DExtern (dtb__175, dtb__176, dtb__177, dtb__178) -> (Base_dDiag.C_Check_OkC (d))
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarRecords = (fun (records : t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (v_desugarRecordDecl records)) decls))

# 345 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDeclsWith = (fun (auxDecls : Frontend_dRast.t_Decl B_dData_dList.t_List) (decls0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (let records = ((B_dData_dList.v_append (v_recordsOfDecls auxDecls)) (v_recordsOfDecls decls0)) in ((Base_dCommon.v_bind ((v_desugarRecords records) decls0)) (fun (ds : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = records; B_dData_dPair.f_Pair_second = ds }))))))

# 340 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDecls = (fun (decls0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_prepareDeclsWith B_dData_dList.C_List_Nil) decls0))
