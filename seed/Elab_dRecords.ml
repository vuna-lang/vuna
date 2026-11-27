open Vuna_runtime
type t_RecordFieldMeta = { f_RecordFieldMeta_recordFieldName : string; f_RecordFieldMeta_recordFieldType : Frontend_dAst.t_Expr; f_RecordFieldMeta_recordFieldIndex : int }
and t_RecordMeta = { f_RecordMeta_recordMetaName : string; f_RecordMeta_recordMetaParams : string B_dData_dList.t_List; f_RecordMeta_recordMetaFields : t_RecordFieldMeta B_dData_dList.t_List; f_RecordMeta_recordMetaDerivings : string B_dData_dList.t_List; f_RecordMeta_recordMetaDerivingVia : bool; f_RecordMeta_recordMetaRepr : Frontend_dAst.t_ReprTier; f_RecordMeta_recordMetaCtor : string; f_RecordMeta_recordMetaLinear : bool }

# 42 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordFieldPairs = (fun (dtb_u_u1 : t_RecordFieldMeta B_dData_dList.t_List) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2, dtb_u_u3) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u2).f_RecordFieldMeta_recordFieldName; B_dData_dPair.f_Pair_second = (dtb_u_u2).f_RecordFieldMeta_recordFieldType }, (v_recordFieldPairs dtb_u_u3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordFieldNames = (fun (dtb_u_u4 : t_RecordFieldMeta B_dData_dList.t_List) -> (match dtb_u_u4 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u5).f_RecordFieldMeta_recordFieldName, (v_recordFieldNames dtb_u_u6)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupRecord = (fun (dtb_u_u7 : string) (dtb_u_u8 : t_RecordMeta B_dData_dList.t_List) -> (match dtb_u_u8 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u9, dtb_u_u10) -> (if ((dtb_u_u9).f_RecordMeta_recordMetaName = dtb_u_u7) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u9)) else ((v_lookupRecord dtb_u_u7) dtb_u_u10))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_fieldNamesOf = (fun dtb_u_u13 -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u14 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u16; B_dData_dPair.f_Pair_second = dtb_u_u17 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u16, (v_fieldNamesOf dtb_u_u15)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Records.vuna"
let rec v_lookupProvided = (fun (dtb_u_u19 : string) dtb_u_u20 -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (match dtb_u_u21 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u23; B_dData_dPair.f_Pair_second = dtb_u_u24 } -> (if (dtb_u_u23 = dtb_u_u19) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u24)) else ((v_lookupProvided dtb_u_u19) dtb_u_u22))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Elab/Records.vuna"
let rec v_hasDuplicateFieldNames = (fun dtb_u_u26 -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u27, dtb_u_u28) -> (match dtb_u_u27 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u29; B_dData_dPair.f_Pair_second = dtb_u_u30 } -> (match ((v_lookupProvided dtb_u_u29) dtb_u_u28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_hasDuplicateFieldNames dtb_u_u28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Records.vuna"
let v_missingFieldMsg = (fun (dtb_u_u32 : Base_dSource.t_Span) (dtb_u_u33 : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan dtb_u_u32) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordMissingField (dtb_u_u33))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u33, B_dData_dVec.C_Vec_Nil)))))

# 74 "Vuna/Compiler/Elab/Records.vuna"
let v_unknownFieldMsg = (fun (dtb_u_u34 : Base_dSource.t_Span) (dtb_u_u35 : string) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan dtb_u_u34) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_RecordUnknownField (dtb_u_u35))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u35, B_dData_dVec.C_Vec_Nil)))))

# 77 "Vuna/Compiler/Elab/Records.vuna"
let v_duplicateFieldMsg = (fun (dtb_u_u36 : Base_dSource.t_Span) -> ((Base_dDiagnostics_dCommon.v_withDiagSpan dtb_u_u36) ((Base_dDiagnostics_dTc.v_tcMsg Base_dDiagnostics_dTc.C_TcErr_RecordDuplicateField) B_dData_dVec.C_Vec_Nil)))

# 80 "Vuna/Compiler/Elab/Records.vuna"
let rec v_hasUnknownFields = (fun (dtb_u_u38 : string B_dData_dList.t_List) dtb_u_u39 -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (match dtb_u_u40 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u42; B_dData_dPair.f_Pair_second = dtb_u_u43 } -> (if ((B_dData_dList.v_memName dtb_u_u42) dtb_u_u38) then ((v_hasUnknownFields dtb_u_u38) dtb_u_u41) else true)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Records.vuna"
let rec v_firstUnknownFieldMsg = (fun (dtb_u_u45 : Base_dSource.t_Span) (dtb_u_u46 : string B_dData_dList.t_List) dtb_u_u47 -> (match dtb_u_u47 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u48, dtb_u_u49) -> (match dtb_u_u48 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u50; B_dData_dPair.f_Pair_second = dtb_u_u51 } -> (if ((B_dData_dList.v_memName dtb_u_u50) dtb_u_u46) then (((v_firstUnknownFieldMsg dtb_u_u45) dtb_u_u46) dtb_u_u49) else ((v_unknownFieldMsg dtb_u_u45) dtb_u_u50))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((v_unknownFieldMsg dtb_u_u45) "")
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordFieldsOf = (fun (dtb_u_u52 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u53 : int) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordFieldMeta_recordFieldName = (Frontend_dAst.v_fieldName dtb_u_u54); f_RecordFieldMeta_recordFieldType = (Frontend_dAst.v_fieldType dtb_u_u54); f_RecordFieldMeta_recordFieldIndex = dtb_u_u53 }, ((v_recordFieldsOf dtb_u_u55) (dtb_u_u53 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Records.vuna"
let v_recordParamVarExprs = (fun (dtb_u_u56 : string B_dData_dList.t_List) (dtb_u_u57 : Base_dSource.t_Span) -> ((B_dData_dList.v_map (fun (dtb_u_u58 : string) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u58, (Frontend_dAst.v_detachedNodeRef dtb_u_u57))))) dtb_u_u56))

# 110 "Vuna/Compiler/Elab/Records.vuna"
let v_recordRetType = (fun (dtb_u_u59 : string) (dtb_u_u60 : string B_dData_dList.t_List) (dtb_u_u61 : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u59, (Frontend_dAst.v_detachedNodeRef dtb_u_u61))), ((v_recordParamVarExprs dtb_u_u60) dtb_u_u61), (Frontend_dAst.v_detachedNodeRef dtb_u_u61))))

# 121 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordArrowTypeGo = (fun (dtb_u_u62 : int) (dtb_u_u63 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u64 : Frontend_dAst.t_Expr) (dtb_u_u65 : Base_dSource.t_Span) -> (match dtb_u_u63 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (Frontend_dAst.C_Expr_EPi ((Frontend_dReserved.v_recordArgBinderName dtb_u_u62), false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.v_fieldType dtb_u_u66), ((((v_recordArrowTypeGo (dtb_u_u62 + 1)) dtb_u_u67) dtb_u_u64) dtb_u_u65), (Frontend_dAst.v_detachedNodeRef dtb_u_u65)))
  | B_dData_dList.C_List_Nil -> dtb_u_u64
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Elab/Records.vuna"
let v_recordArrowType = (fun (dtb_u_u68 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u69 : Frontend_dAst.t_Expr) (dtb_u_u70 : Base_dSource.t_Span) -> ((((v_recordArrowTypeGo 0) dtb_u_u68) dtb_u_u69) dtb_u_u70))

# 134 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordParamPis = (fun (dtb_u_u71 : string B_dData_dList.t_List) (dtb_u_u72 : Frontend_dAst.t_Expr) (dtb_u_u73 : Base_dSource.t_Span) -> (match dtb_u_u71 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u74, dtb_u_u75) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u74, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef dtb_u_u73))), (((v_recordParamPis dtb_u_u75) dtb_u_u72) dtb_u_u73), (Frontend_dAst.v_detachedNodeRef dtb_u_u73)))
  | B_dData_dList.C_List_Nil -> dtb_u_u72
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Elab/Records.vuna"
let v_recordCtorType = (fun (dtb_u_u76 : string B_dData_dList.t_List) (dtb_u_u77 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u78 : Frontend_dAst.t_Expr) (dtb_u_u79 : Base_dSource.t_Span) -> (((v_recordParamPis dtb_u_u76) (((v_recordArrowType dtb_u_u77) dtb_u_u78) dtb_u_u79)) dtb_u_u79))

# 176 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarPatternFuel = (fun (dtb_u_u80 : int) (dtb_u_u81 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u82 : Frontend_dAst.t_Pat) -> (if (dtb_u_u80 <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match dtb_u_u82 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u83) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PWild (dtb_u_u83))))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u84, dtb_u_u85) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PVar (dtb_u_u84, dtb_u_u85))))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u86, dtb_u_u87, dtb_u_u88) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (dtb_u_u80 - 1)) dtb_u_u81) dtb_u_u87)) (fun (dtb_u_u89 : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PAs (dtb_u_u86, dtb_u_u89, dtb_u_u88))))))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u90, dtb_u_u91) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PInt (dtb_u_u90, dtb_u_u91))))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u92, dtb_u_u93) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PStr (dtb_u_u92, dtb_u_u93))))
  | Frontend_dAst.C_Pat_PCon (dtb_u_u94, dtb_u_u95, dtb_u_u96) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u97 : Frontend_dAst.t_Pat) -> (((v_desugarPatternFuel (dtb_u_u80 - 1)) dtb_u_u81) dtb_u_u97))) dtb_u_u95)) (fun (dtb_u_u98 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon (dtb_u_u94, dtb_u_u98, dtb_u_u96))))))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u99, dtb_u_u100, dtb_u_u101) -> (match ((v_lookupRecord dtb_u_u99) dtb_u_u81) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u101)) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord (dtb_u_u99))) dtb_u_u99)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> (if (v_hasDuplicateFieldNames dtb_u_u100) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg (Frontend_dAst.v_nodeRefSpan dtb_u_u101)))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb_u_u102).f_RecordMeta_recordMetaFields)) dtb_u_u100) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg (Frontend_dAst.v_nodeRefSpan dtb_u_u101)) (v_recordFieldNames (dtb_u_u102).f_RecordMeta_recordMetaFields)) dtb_u_u100))) else ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (dtb_u_u80 - 1)) dtb_u_u81) (dtb_u_u102).f_RecordMeta_recordMetaFields) dtb_u_u100) (Frontend_dAst.v_nodeRefSpan dtb_u_u101))) (fun (dtb_u_u103 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Pat_PCon ((dtb_u_u102).f_RecordMeta_recordMetaCtor, dtb_u_u103, dtb_u_u101))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 193 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordPatternFieldsFuel = (fun (dtb_u_u104 : int) (dtb_u_u105 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u106 : t_RecordFieldMeta B_dData_dList.t_List) (dtb_u_u107 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u108 : Base_dSource.t_Span) -> (if (dtb_u_u104 <= 0) then (Base_dDiag.v_icFuel "record pattern desugar") else (match dtb_u_u106 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u109, dtb_u_u110) -> (match ((v_lookupProvided (dtb_u_u109).f_RecordFieldMeta_recordFieldName) dtb_u_u107) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u110) dtb_u_u107) dtb_u_u108)) (fun (dtb_u_u111 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef dtb_u_u108))), dtb_u_u111))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u112) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u112)) (fun (dtb_u_u113 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((((v_desugarRecordPatternFieldsFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u110) dtb_u_u107) dtb_u_u108)) (fun (dtb_u_u114 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u113, dtb_u_u114))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 173 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarPattern = (fun (dtb_u_u115 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u116 : Frontend_dAst.t_Pat) -> (((v_desugarPatternFuel ((Frontend_dAstQuery.v_patBudget 64) dtb_u_u116)) dtb_u_u115) dtb_u_u116))

# 333 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordInstancePatsFrom = (fun (dtb_u_u117 : int) (dtb_u_u118 : int) (dtb_u_u119 : Base_dSource.t_Span) -> (if (dtb_u_u118 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ((Frontend_dReserved.v_recordHiddenFieldBinderName dtb_u_u117), (Frontend_dAst.v_detachedNodeRef dtb_u_u119))), (((v_recordInstancePatsFrom (dtb_u_u117 + 1)) (dtb_u_u118 - 1)) dtb_u_u119)))))

# 329 "Vuna/Compiler/Elab/Records.vuna"
let v_recordInstancePats = (fun (dtb_u_u120 : int) (dtb_u_u121 : Base_dSource.t_Span) -> (((v_recordInstancePatsFrom 0) dtb_u_u120) dtb_u_u121))

# 342 "Vuna/Compiler/Elab/Records.vuna"
let v_hasFieldInstanceDecl = (fun (dtb_u_u122 : string) (dtb_u_u123 : string B_dData_dList.t_List) (dtb_u_u124 : string) (dtb_u_u125 : int) (dtb_u_u126 : int) (dtb_u_u127 : string) (dtb_u_u128 : Frontend_dAst.t_Expr) -> (let dtb_u_u129 = (Frontend_dAst.v_exprSpan dtb_u_u128) in (let dtb_u_u130 = (Frontend_dAst.v_detachedNodeRef dtb_u_u129) in (let dtb_u_u131 = (match dtb_u_u123 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar (dtb_u_u122, dtb_u_u130))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u122, dtb_u_u130)), ((B_dData_dList.v_map (fun (dtb_u_u137 : string) -> (Frontend_dAst.C_Expr_EVar (dtb_u_u137, dtb_u_u130)))) dtb_u_u123), dtb_u_u130))
) in (let dtb_u_u132 = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldLabelName, dtb_u_u130)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb_u_u127, dtb_u_u130)), B_dData_dList.C_List_Nil)), dtb_u_u130)) in (let dtb_u_u133 = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_hasFieldTraitName, dtb_u_u130)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u132, (B_dData_dList.C_List__x58__x58_ (dtb_u_u131, (B_dData_dList.C_List__x58__x58_ (dtb_u_u128, B_dData_dList.C_List_Nil)))))), dtb_u_u130)) in (let dtb_u_u134 = ((v_recordInstancePats dtb_u_u125) dtb_u_u129) in (let dtb_u_u135 = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("p", dtb_u_u130)), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb_u_u124, dtb_u_u134, dtb_u_u130)); Frontend_dAst.f_Alt_altBody = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_recordHiddenFieldBinderName dtb_u_u126), dtb_u_u130)); Frontend_dAst.f_Alt_altRef = dtb_u_u130 }, B_dData_dList.C_List_Nil)), dtb_u_u130)) in (let dtb_u_u136 = (Frontend_dAst.C_Decl_DFun (Base_dIntrinsics.v_hasFieldMethodName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("p", dtb_u_u130)), B_dData_dList.C_List_Nil)), dtb_u_u135, dtb_u_u130)) in (Frontend_dAst.C_Decl_DInstance (B_dData_dList.C_List_Nil, dtb_u_u133, (B_dData_dList.C_List__x58__x58_ (dtb_u_u136, B_dData_dList.C_List_Nil)), dtb_u_u130)))))))))))

# 322 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordHasFieldInstancesGo = (fun (dtb_u_u138 : string) (dtb_u_u139 : string B_dData_dList.t_List) (dtb_u_u140 : string) (dtb_u_u141 : int) (dtb_u_u142 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u143 : int) -> (match dtb_u_u142 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u144, dtb_u_u145) -> (match dtb_u_u144 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u146; B_dData_dPair.f_Pair_second = dtb_u_u147 } -> (B_dData_dList.C_List__x58__x58_ ((((((((v_hasFieldInstanceDecl dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u143) dtb_u_u146) dtb_u_u147), ((((((v_recordHasFieldInstancesGo dtb_u_u138) dtb_u_u139) dtb_u_u140) dtb_u_u141) dtb_u_u145) (dtb_u_u143 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Elab/Records.vuna"
let v_recordHasFieldInstancesOf = (fun (dtb_u_u148 : t_RecordMeta) -> ((((((v_recordHasFieldInstancesGo (dtb_u_u148).f_RecordMeta_recordMetaName) (dtb_u_u148).f_RecordMeta_recordMetaParams) (dtb_u_u148).f_RecordMeta_recordMetaCtor) (B_dData_dList.v_length (dtb_u_u148).f_RecordMeta_recordMetaFields)) (v_recordFieldPairs (dtb_u_u148).f_RecordMeta_recordMetaFields)) 0))

# 305 "Vuna/Compiler/Elab/Records.vuna"
let rec v_recordHasFieldInstances = (fun (dtb_u_u149 : t_RecordMeta B_dData_dList.t_List) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u150, dtb_u_u151) -> ((B_dData_dList.v_append (v_recordHasFieldInstancesOf dtb_u_u150)) (v_recordHasFieldInstances dtb_u_u151))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Records.vuna"
let v_ctorName = (fun (dtb_u_u152 : string) -> dtb_u_u152)

# 91 "Vuna/Compiler/Elab/Records.vuna"
let[@tail_mod_cons] rec v_recordsOfDecls = (fun (dtb_u_u153 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u153 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (match dtb_u_u154 with
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u156, dtb_u_u157, dtb_u_u158, dtb_u_u159, dtb_u_u160, dtb_u_u161, dtb_u_u162, dtb_u_u163) -> (B_dData_dList.C_List__x58__x58_ ({ f_RecordMeta_recordMetaName = dtb_u_u156; f_RecordMeta_recordMetaParams = dtb_u_u157; f_RecordMeta_recordMetaFields = ((v_recordFieldsOf dtb_u_u158) 0); f_RecordMeta_recordMetaDerivings = dtb_u_u159; f_RecordMeta_recordMetaDerivingVia = dtb_u_u160; f_RecordMeta_recordMetaRepr = dtb_u_u161; f_RecordMeta_recordMetaCtor = (v_ctorName dtb_u_u156); f_RecordMeta_recordMetaLinear = dtb_u_u162 }, (v_recordsOfDecls dtb_u_u155)))
  | _ -> (v_recordsOfDecls dtb_u_u155)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Elab/Records.vuna"
let rec v_expandCaseAsGo = (fun (dtb_u_u164 : Frontend_dAst.t_Expr) (dtb_u_u165 : Frontend_dAst.t_Pat) (dtb_u_u166 : Frontend_dAst.t_Expr) (dtb_u_u167 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u165 with
  | Frontend_dAst.C_Pat_PAs (dtb_u_u168, dtb_u_u169, dtb_u_u170) -> ((((v_expandCaseAsGo dtb_u_u164) dtb_u_u169) (Frontend_dAst.C_Expr_ELet ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb_u_u168, dtb_u_u170)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u164)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = dtb_u_u170 }, B_dData_dList.C_List_Nil)), dtb_u_u166, false, dtb_u_u170))) dtb_u_u167)
  | _ -> { Frontend_dAst.f_Alt_altPat = dtb_u_u165; Frontend_dAst.f_Alt_altBody = dtb_u_u166; Frontend_dAst.f_Alt_altRef = dtb_u_u167 }
))

# 389 "Vuna/Compiler/Elab/Records.vuna"
let v_expandCaseAs = (fun (dtb_u_u171 : Frontend_dAst.t_Expr) (dtb_u_u172 : Frontend_dAst.t_Alt) -> ((((v_expandCaseAsGo dtb_u_u171) (dtb_u_u172).Frontend_dAst.f_Alt_altPat) (dtb_u_u172).Frontend_dAst.f_Alt_altBody) (dtb_u_u172).Frontend_dAst.f_Alt_altRef))

# 205 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarExprFuel = (fun (dtb_u_u173 : int) (dtb_u_u174 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u175 : Frontend_dAst.t_Expr) -> (if (dtb_u_u173 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match dtb_u_u175 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u176, dtb_u_u177) -> (Base_dDiag.C_Check_OkC (dtb_u_u175))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u178, dtb_u_u179) -> (Base_dDiag.C_Check_OkC (dtb_u_u175))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u180, dtb_u_u181) -> (Base_dDiag.C_Check_OkC (dtb_u_u175))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u182, dtb_u_u183) -> (Base_dDiag.C_Check_OkC (dtb_u_u175))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u184, dtb_u_u185, dtb_u_u186) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u185)) (fun (dtb_u_u187 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u184, dtb_u_u187, dtb_u_u186))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u188, dtb_u_u189, dtb_u_u190) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u188)) (fun (dtb_u_u191 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174)) dtb_u_u189)) (fun (dtb_u_u192 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u191, dtb_u_u192, dtb_u_u190))))))))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (dtb_u_u173 - 1)) dtb_u_u174)) dtb_u_u193)) (fun (dtb_u_u197 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u194)) (fun (dtb_u_u198 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb_u_u197, dtb_u_u198, dtb_u_u195, dtb_u_u196))))))))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u199, dtb_u_u200, dtb_u_u201) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u199)) (fun (dtb_u_u202 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarAltFuel (dtb_u_u173 - 1)) dtb_u_u174)) dtb_u_u200)) (fun (dtb_u_u203 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (dtb_u_u202, ((B_dData_dList.v_map (v_expandCaseAs dtb_u_u202)) dtb_u_u203), dtb_u_u201))))))))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u204, dtb_u_u205, dtb_u_u206, dtb_u_u207) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u204)) (fun (dtb_u_u208 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u205)) (fun (dtb_u_u209 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u206)) (fun (dtb_u_u210 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (dtb_u_u208, dtb_u_u209, dtb_u_u210, dtb_u_u207))))))))))
  | Frontend_dAst.C_Expr_EField (dtb_u_u211, dtb_u_u212, dtb_u_u213) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u211)) (fun (dtb_u_u214 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (dtb_u_u214, dtb_u_u212, dtb_u_u213))))))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u215, dtb_u_u216, dtb_u_u217) -> (match ((v_lookupRecord dtb_u_u215) dtb_u_u174) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u217)) (Base_dDiagnostics_dTc.C_TcErr_UnknownRecord (dtb_u_u215))) dtb_u_u215)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u218) -> (if (v_hasDuplicateFieldNames dtb_u_u216) then (Base_dDiag.C_Check_ErrC ((v_duplicateFieldMsg (Frontend_dAst.v_nodeRefSpan dtb_u_u217)))) else (if ((v_hasUnknownFields (v_recordFieldNames (dtb_u_u218).f_RecordMeta_recordMetaFields)) dtb_u_u216) then (Base_dDiag.C_Check_ErrC ((((v_firstUnknownFieldMsg (Frontend_dAst.v_nodeRefSpan dtb_u_u217)) (v_recordFieldNames (dtb_u_u218).f_RecordMeta_recordMetaFields)) dtb_u_u216))) else ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (dtb_u_u173 - 1)) dtb_u_u174) (dtb_u_u218).f_RecordMeta_recordMetaFields) dtb_u_u216) (Frontend_dAst.v_nodeRefSpan dtb_u_u217))) (fun (dtb_u_u219 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((dtb_u_u218).f_RecordMeta_recordMetaCtor, dtb_u_u217)), dtb_u_u219, dtb_u_u217))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u220, dtb_u_u221, dtb_u_u222) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u220)) (fun (dtb_u_u223 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarFieldValueFuel (dtb_u_u173 - 1)) dtb_u_u174)) dtb_u_u221)) (fun (dtb_u_u224 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u223, dtb_u_u224, dtb_u_u222))))))))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u225, dtb_u_u226) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarDoStmtFuel (dtb_u_u173 - 1)) dtb_u_u174)) dtb_u_u225)) (fun (dtb_u_u227 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (dtb_u_u227, dtb_u_u226))))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231, dtb_u_u232, dtb_u_u233) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u231)) (fun (dtb_u_u234 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u173 - 1)) dtb_u_u174) dtb_u_u232)) (fun (dtb_u_u235 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u234, dtb_u_u235, dtb_u_u233))))))))
  | _ -> (Base_dDiag.v_icInternal "unreordered infix/paren in elaboration")
)))
# 232 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarDoStmtFuel = (fun (dtb_u_u236 : int) (dtb_u_u237 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u238 : Frontend_dAst.t_DoStmt) -> (if (dtb_u_u236 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match dtb_u_u238 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u239, dtb_u_u240, dtb_u_u241) -> ((Base_dCommon.v_bind (((v_desugarPatternFuel (dtb_u_u236 - 1)) dtb_u_u237) dtb_u_u239)) (fun (dtb_u_u242 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u236 - 1)) dtb_u_u237) dtb_u_u240)) (fun (dtb_u_u243 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DBind (dtb_u_u242, dtb_u_u243, dtb_u_u241))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u244, dtb_u_u245) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u236 - 1)) dtb_u_u237) dtb_u_u244)) (fun (dtb_u_u246 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DExpr (dtb_u_u246, dtb_u_u245))))))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u247, dtb_u_u248) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarBindFuel (dtb_u_u236 - 1)) dtb_u_u237)) dtb_u_u247)) (fun (dtb_u_u249 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_DoStmt_DLet (dtb_u_u249, dtb_u_u248))))))
  | _ -> failwith "DT: impossible branch"
)))
# 242 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarRecordValuesFuel = (fun (dtb_u_u250 : int) (dtb_u_u251 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u252 : t_RecordFieldMeta B_dData_dList.t_List) (dtb_u_u253 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u254 : Base_dSource.t_Span) -> (match dtb_u_u252 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u255, dtb_u_u256) -> (if (dtb_u_u250 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (match ((v_lookupProvided (dtb_u_u255).f_RecordFieldMeta_recordFieldName) dtb_u_u253) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_missingFieldMsg dtb_u_u254) (dtb_u_u255).f_RecordFieldMeta_recordFieldName)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u257) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u250 - 1)) dtb_u_u251) dtb_u_u257)) (fun (dtb_u_u258 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((v_desugarRecordValuesFuel (dtb_u_u250 - 1)) dtb_u_u251) dtb_u_u256) dtb_u_u253) dtb_u_u254)) (fun (dtb_u_u259 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u258, dtb_u_u259))))))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u250 <= 0) then (Base_dDiag.v_icFuel "record desugar") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 253 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarFieldValueFuel = (fun (dtb_u_u260 : int) (dtb_u_u261 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u262 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u262 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u263; B_dData_dPair.f_Pair_second = dtb_u_u264 } -> (if (dtb_u_u260 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u260 - 1)) dtb_u_u261) dtb_u_u264)) (fun (dtb_u_u265 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u263; B_dData_dPair.f_Pair_second = dtb_u_u265 })))))
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindFuel = (fun (dtb_u_u266 : int) (dtb_u_u267 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u268 : Frontend_dAst.t_Binding) -> (if (dtb_u_u266 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (dtb_u_u266 - 1)) dtb_u_u267) (dtb_u_u268).Frontend_dAst.f_Binding_bindPat)) (fun (dtb_u_u269 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarBindingValueFuel (dtb_u_u266 - 1)) dtb_u_u267) (dtb_u_u268).Frontend_dAst.f_Binding_bindValue)) (fun (dtb_u_u270 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((v_desugarBindingSigFuel (dtb_u_u266 - 1)) dtb_u_u267) (dtb_u_u268).Frontend_dAst.f_Binding_bindSig)) (fun (dtb_u_u271 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ({ dtb_u_u268 with Frontend_dAst.f_Binding_bindPat = dtb_u_u269; Frontend_dAst.f_Binding_bindValue = dtb_u_u270; Frontend_dAst.f_Binding_bindSig = dtb_u_u271 }))))))))))
# 269 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindingValueFuel = (fun (dtb_u_u272 : int) (dtb_u_u273 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u274 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u274 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u275) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarLocalClauseFuel dtb_u_u272) dtb_u_u273)) dtb_u_u275)) (fun (dtb_u_u276 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (dtb_u_u276))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u277) -> ((Base_dCommon.v_bind (((v_desugarExprFuel dtb_u_u272) dtb_u_u273) dtb_u_u277)) (fun (dtb_u_u278 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (dtb_u_u278))))))
  | _ -> failwith "DT: impossible branch"
))
# 277 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarBindingSigFuel = (fun (dtb_u_u279 : int) (dtb_u_u280 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u281 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u281 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u282) -> ((Base_dCommon.v_bind (((v_desugarExprFuel dtb_u_u279) dtb_u_u280) (dtb_u_u282).Frontend_dAst.f_BindingSig_sigType)) (fun (dtb_u_u283 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ dtb_u_u282 with Frontend_dAst.f_BindingSig_sigType = dtb_u_u283 }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 285 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarLocalClauseFuel = (fun (dtb_u_u284 : int) (dtb_u_u285 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u286 : Frontend_dAst.t_LocalClause) -> (if (dtb_u_u284 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((v_desugarPatternFuel (dtb_u_u284 - 1)) dtb_u_u285)) (dtb_u_u286).Frontend_dAst.f_LocalClause_lcPats)) (fun (dtb_u_u287 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u284 - 1)) dtb_u_u285) (dtb_u_u286).Frontend_dAst.f_LocalClause_lcBody)) (fun (dtb_u_u288 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ dtb_u_u286 with Frontend_dAst.f_LocalClause_lcPats = dtb_u_u287; Frontend_dAst.f_LocalClause_lcBody = dtb_u_u288 }))))))))
# 294 "Vuna/Compiler/Elab/Records.vuna"
and v_desugarAltFuel = (fun (dtb_u_u289 : int) (dtb_u_u290 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u291 : Frontend_dAst.t_Alt) -> (if (dtb_u_u289 <= 0) then (Base_dDiag.v_icFuel "record desugar") else ((Base_dCommon.v_bind (((v_desugarPatternFuel (dtb_u_u289 - 1)) dtb_u_u290) (dtb_u_u291).Frontend_dAst.f_Alt_altPat)) (fun (dtb_u_u292 : Frontend_dAst.t_Pat) -> ((Base_dCommon.v_bind (((v_desugarExprFuel (dtb_u_u289 - 1)) dtb_u_u290) (dtb_u_u291).Frontend_dAst.f_Alt_altBody)) (fun (dtb_u_u293 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ dtb_u_u291 with Frontend_dAst.f_Alt_altPat = dtb_u_u292; Frontend_dAst.f_Alt_altBody = dtb_u_u293 }))))))))

# 384 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarExpr = (fun (dtb_u_u294 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u295 : Frontend_dAst.t_Expr) -> (((v_desugarExprFuel ((Frontend_dAstQuery.v_exprBudget 512) dtb_u_u295)) dtb_u_u294) dtb_u_u295))

# 153 "Vuna/Compiler/Elab/Records.vuna"
let rec v_desugarRecordDecl = (fun (dtb_u_u296 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u297 : Frontend_dAst.t_Decl) -> (match dtb_u_u297 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u298, dtb_u_u299, dtb_u_u300, dtb_u_u301) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarPattern dtb_u_u296)) dtb_u_u299)) (fun (dtb_u_u302 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_desugarExpr dtb_u_u296) dtb_u_u300)) (fun (dtb_u_u303 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u298, dtb_u_u302, dtb_u_u303, dtb_u_u301))))))))
  | Frontend_dAst.C_Decl_DData (dtb_u_u304, dtb_u_u305, dtb_u_u306, dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310, dtb_u_u311, dtb_u_u312) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u313, dtb_u_u314, dtb_u_u315, dtb_u_u316, dtb_u_u317, dtb_u_u318, dtb_u_u319, dtb_u_u320) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u321, dtb_u_u322, dtb_u_u323, dtb_u_u324, dtb_u_u325) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u326, dtb_u_u327, dtb_u_u328, dtb_u_u329) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_desugarRecordDecl dtb_u_u296)) dtb_u_u328)) (fun (dtb_u_u330 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u326, dtb_u_u327, dtb_u_u330, dtb_u_u329))))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u331, dtb_u_u332, dtb_u_u333, dtb_u_u334) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u335, dtb_u_u336, dtb_u_u337) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u338, dtb_u_u339, dtb_u_u340, dtb_u_u341) -> (Base_dDiag.C_Check_OkC (dtb_u_u297))
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Records.vuna"
let v_desugarRecords = (fun (dtb_u_u342 : t_RecordMeta B_dData_dList.t_List) (dtb_u_u343 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_traverse (v_desugarRecordDecl dtb_u_u342)) dtb_u_u343))

# 371 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDeclsWith = (fun (dtb_u_u344 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u345 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u346 = ((B_dData_dList.v_append (v_recordsOfDecls dtb_u_u344)) (v_recordsOfDecls dtb_u_u345)) in ((Base_dCommon.v_bind ((v_desugarRecords dtb_u_u346) dtb_u_u345)) (fun (dtb_u_u347 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u346; B_dData_dPair.f_Pair_second = dtb_u_u347 }))))))

# 366 "Vuna/Compiler/Elab/Records.vuna"
let v_prepareDecls = (fun (dtb_u_u348 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_prepareDeclsWith B_dData_dList.C_List_Nil) dtb_u_u348))

# 23 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldName = (fun (dtb_u_u349 : t_RecordFieldMeta) -> (match dtb_u_u349 with
  | { f_RecordFieldMeta_recordFieldName = dtb_u_u350; f_RecordFieldMeta_recordFieldType = dtb_u_u351; f_RecordFieldMeta_recordFieldIndex = dtb_u_u352 } -> dtb_u_u350
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldType = (fun (dtb_u_u353 : t_RecordFieldMeta) -> (match dtb_u_u353 with
  | { f_RecordFieldMeta_recordFieldName = dtb_u_u354; f_RecordFieldMeta_recordFieldType = dtb_u_u355; f_RecordFieldMeta_recordFieldIndex = dtb_u_u356 } -> dtb_u_u355
  | _ -> failwith "DT: impossible branch"
))

# 25 "Vuna/Compiler/Elab/Records.vuna"
let v_recordFieldIndex = (fun (dtb_u_u357 : t_RecordFieldMeta) -> (match dtb_u_u357 with
  | { f_RecordFieldMeta_recordFieldName = dtb_u_u358; f_RecordFieldMeta_recordFieldType = dtb_u_u359; f_RecordFieldMeta_recordFieldIndex = dtb_u_u360 } -> dtb_u_u360
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaName = (fun (dtb_u_u361 : t_RecordMeta) -> (match dtb_u_u361 with
  | { f_RecordMeta_recordMetaName = dtb_u_u362; f_RecordMeta_recordMetaParams = dtb_u_u363; f_RecordMeta_recordMetaFields = dtb_u_u364; f_RecordMeta_recordMetaDerivings = dtb_u_u365; f_RecordMeta_recordMetaDerivingVia = dtb_u_u366; f_RecordMeta_recordMetaRepr = dtb_u_u367; f_RecordMeta_recordMetaCtor = dtb_u_u368; f_RecordMeta_recordMetaLinear = dtb_u_u369 } -> dtb_u_u362
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaParams = (fun (dtb_u_u370 : t_RecordMeta) -> (match dtb_u_u370 with
  | { f_RecordMeta_recordMetaName = dtb_u_u371; f_RecordMeta_recordMetaParams = dtb_u_u372; f_RecordMeta_recordMetaFields = dtb_u_u373; f_RecordMeta_recordMetaDerivings = dtb_u_u374; f_RecordMeta_recordMetaDerivingVia = dtb_u_u375; f_RecordMeta_recordMetaRepr = dtb_u_u376; f_RecordMeta_recordMetaCtor = dtb_u_u377; f_RecordMeta_recordMetaLinear = dtb_u_u378 } -> dtb_u_u372
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaFields = (fun (dtb_u_u379 : t_RecordMeta) -> (match dtb_u_u379 with
  | { f_RecordMeta_recordMetaName = dtb_u_u380; f_RecordMeta_recordMetaParams = dtb_u_u381; f_RecordMeta_recordMetaFields = dtb_u_u382; f_RecordMeta_recordMetaDerivings = dtb_u_u383; f_RecordMeta_recordMetaDerivingVia = dtb_u_u384; f_RecordMeta_recordMetaRepr = dtb_u_u385; f_RecordMeta_recordMetaCtor = dtb_u_u386; f_RecordMeta_recordMetaLinear = dtb_u_u387 } -> dtb_u_u382
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaDerivings = (fun (dtb_u_u388 : t_RecordMeta) -> (match dtb_u_u388 with
  | { f_RecordMeta_recordMetaName = dtb_u_u389; f_RecordMeta_recordMetaParams = dtb_u_u390; f_RecordMeta_recordMetaFields = dtb_u_u391; f_RecordMeta_recordMetaDerivings = dtb_u_u392; f_RecordMeta_recordMetaDerivingVia = dtb_u_u393; f_RecordMeta_recordMetaRepr = dtb_u_u394; f_RecordMeta_recordMetaCtor = dtb_u_u395; f_RecordMeta_recordMetaLinear = dtb_u_u396 } -> dtb_u_u392
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaDerivingVia = (fun (dtb_u_u397 : t_RecordMeta) -> (match dtb_u_u397 with
  | { f_RecordMeta_recordMetaName = dtb_u_u398; f_RecordMeta_recordMetaParams = dtb_u_u399; f_RecordMeta_recordMetaFields = dtb_u_u400; f_RecordMeta_recordMetaDerivings = dtb_u_u401; f_RecordMeta_recordMetaDerivingVia = dtb_u_u402; f_RecordMeta_recordMetaRepr = dtb_u_u403; f_RecordMeta_recordMetaCtor = dtb_u_u404; f_RecordMeta_recordMetaLinear = dtb_u_u405 } -> dtb_u_u402
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaRepr = (fun (dtb_u_u406 : t_RecordMeta) -> (match dtb_u_u406 with
  | { f_RecordMeta_recordMetaName = dtb_u_u407; f_RecordMeta_recordMetaParams = dtb_u_u408; f_RecordMeta_recordMetaFields = dtb_u_u409; f_RecordMeta_recordMetaDerivings = dtb_u_u410; f_RecordMeta_recordMetaDerivingVia = dtb_u_u411; f_RecordMeta_recordMetaRepr = dtb_u_u412; f_RecordMeta_recordMetaCtor = dtb_u_u413; f_RecordMeta_recordMetaLinear = dtb_u_u414 } -> dtb_u_u412
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaCtor = (fun (dtb_u_u415 : t_RecordMeta) -> (match dtb_u_u415 with
  | { f_RecordMeta_recordMetaName = dtb_u_u416; f_RecordMeta_recordMetaParams = dtb_u_u417; f_RecordMeta_recordMetaFields = dtb_u_u418; f_RecordMeta_recordMetaDerivings = dtb_u_u419; f_RecordMeta_recordMetaDerivingVia = dtb_u_u420; f_RecordMeta_recordMetaRepr = dtb_u_u421; f_RecordMeta_recordMetaCtor = dtb_u_u422; f_RecordMeta_recordMetaLinear = dtb_u_u423 } -> dtb_u_u422
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Records.vuna"
let v_recordMetaLinear = (fun (dtb_u_u424 : t_RecordMeta) -> (match dtb_u_u424 with
  | { f_RecordMeta_recordMetaName = dtb_u_u425; f_RecordMeta_recordMetaParams = dtb_u_u426; f_RecordMeta_recordMetaFields = dtb_u_u427; f_RecordMeta_recordMetaDerivings = dtb_u_u428; f_RecordMeta_recordMetaDerivingVia = dtb_u_u429; f_RecordMeta_recordMetaRepr = dtb_u_u430; f_RecordMeta_recordMetaCtor = dtb_u_u431; f_RecordMeta_recordMetaLinear = dtb_u_u432 } -> dtb_u_u432
  | _ -> failwith "DT: impossible branch"
))
