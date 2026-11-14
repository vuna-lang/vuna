open Vuna_runtime
type t_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta = { f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName : string; f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldType : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldIndex : int }
and t_Vuna_dCompiler_dElab_dRecords_dRecordMeta = { f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName : string; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaParams : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields : t_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivings : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivingVia : bool; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaRepr : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor : string; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaLinear : bool }

# 39 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordFieldPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__0).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName; Base_dPair.f_Base_dPair_dPair_second = (dtb__0).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldType }, (v_Vuna_dCompiler_dElab_dRecords_drecordFieldPairs dtb__1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (Base_dList.C_Base_dList_dList_Cons ((dtb__2).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName, (v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames dtb__3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dlookupRecord = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if ((dtb__4).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4)) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord mc0) dtb__5))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (Base_dList.C_Base_dList_dList_Cons (dtb__8, (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__7)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dlookupProvided = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (if (dtb__12 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__16) dtb__15) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg = (fun sp fname -> ((Vuna_dCompiler_dDiagnostics_dCommon.v_Vuna_dCompiler_dDiagnostics_dCommon_dwithDiagSpan sp) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RecordMissingField (fname))) (Base_dVec.C_Base_dVec_dVec_Cons (fname, Base_dVec.C_Base_dVec_dVec_Nil)))))

# 70 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg = (fun sp fname -> ((Vuna_dCompiler_dDiagnostics_dCommon.v_Vuna_dCompiler_dDiagnostics_dCommon_dwithDiagSpan sp) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RecordUnknownField (fname))) (Base_dVec.C_Base_dVec_dVec_Cons (fname, Base_dVec.C_Base_dVec_dVec_Nil)))))

# 73 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg = (fun sp -> ((Vuna_dCompiler_dDiagnostics_dCommon.v_Vuna_dCompiler_dDiagnostics_dCommon_dwithDiagSpan sp) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RecordDuplicateField) Base_dVec.C_Base_dVec_dVec_Nil)))

# 76 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (match dtb__19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__21) mc0) then ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields mc0) dtb__20) else true)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (match dtb__23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__25; Base_dPair.f_Base_dPair_dPair_second = dtb__26 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__25) mc1) then (((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc0) mc1) dtb__24) else ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordFieldsOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldName dtb__27); f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldType = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__27); f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldIndex = mc1 }, ((v_Vuna_dCompiler_dElab_dRecords_drecordFieldsOf dtb__28) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs = (fun params sp -> ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, sp)))) params))

# 106 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordRetType = (fun dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dname, sp)), ((v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs params) sp), sp)))

# 116 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordArrowTypeGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (("@vuna@record@arg" ^ (bi_strFromInt mc0)), false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__29), ((((v_Vuna_dCompiler_dElab_dRecords_drecordArrowTypeGo (mc0 + 1)) dtb__30) mc2) mc3), mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordArrowType = (fun fields ret sp -> ((((v_Vuna_dCompiler_dElab_dRecords_drecordArrowTypeGo 0) fields) ret) sp))

# 123 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordParamPis = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__31, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dRecords_drecordParamPis dtb__32) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordCtorType = (fun params fields ret sp -> (((v_Vuna_dCompiler_dElab_dRecords_drecordParamPis params) (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType fields) ret) sp)) sp))

# 156 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel = (fun fuel records pat -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (pat)) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__33) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__33))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__34, dtb__35) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__34, dtb__35))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__36, dtb__37, dtb__38) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__37)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__36, p, dtb__38))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__39, dtb__40) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__39, dtb__40))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__41, dtb__42) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__41, dtb__42))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__43, dtb__44, dtb__45) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun x -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) x))) dtb__44)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__43, ps, dtb__45))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__46, dtb__47, dtb__48) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__46) records) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__48) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownRecord (dtb__46))) dtb__46)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__47) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__48))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames (dtb__49).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) dtb__47) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__48) (v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames (dtb__49).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) dtb__47))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) (dtb__49).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields) dtb__47) dtb__48)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ((dtb__49).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor, ps, dtb__48))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 178 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel = (fun fuel records fdefs provided sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)) else (match fdefs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided (dtb__50).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (sp)), ps))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__52)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__51) provided) sp)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 153 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern = (fun records pat -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel 64) records) pat))

# 311 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordInstanceVar = (fun i -> ("@vuna@record@hf" ^ (bi_strFromInt i)))

# 319 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordInstancePatsFrom = (fun i remaining sp -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ((v_Vuna_dCompiler_dElab_dRecords_drecordInstanceVar i), sp)), (((v_Vuna_dCompiler_dElab_dRecords_drecordInstancePatsFrom (i + 1)) (remaining - 1)) sp)))))

# 315 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordInstancePats = (fun n sp -> (((v_Vuna_dCompiler_dElab_dRecords_drecordInstancePatsFrom 0) n) sp))

# 325 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dhasFieldInstanceDecl = (fun rname params ctor n fi fname fty -> ((fun fsp -> ((fun recType -> ((fun label -> ((fun head -> ((fun pats -> ((fun body -> ((fun meth -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (Base_dList.C_Base_dList_dList_Nil, head, (Base_dList.C_Base_dList_dList_Cons (meth, Base_dList.C_Base_dList_dList_Nil)), fsp))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("getField", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("p", fsp)), Base_dList.C_Base_dList_dList_Nil)), body, fsp)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("p", fsp)), (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (ctor, pats, fsp)); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dRecords_drecordInstanceVar fi), fsp)) }, Base_dList.C_Base_dList_dList_Nil)), fsp)))) ((v_Vuna_dCompiler_dElab_dRecords_drecordInstancePats n) fsp))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Record.HasField", fsp)), (Base_dList.C_Base_dList_dList_Cons (label, (Base_dList.C_Base_dList_dList_Cons (recType, (Base_dList.C_Base_dList_dList_Cons (fty, Base_dList.C_Base_dList_dList_Nil)))))), fsp)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Field.Field", fsp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (fname, fsp)), Base_dList.C_Base_dList_dList_Nil)), fsp)))) (match params with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (rname, fsp))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (rname, fsp)), ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, fsp)))) params), fsp))
))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan fty)))

# 304 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = dtb__56 } -> (Base_dList.C_Base_dList_dList_Cons ((((((((v_Vuna_dCompiler_dElab_dRecords_dhasFieldInstanceDecl mc0) mc1) mc2) mc3) mc5) dtb__55) dtb__56), ((((((v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesGo mc0) mc1) mc2) mc3) dtb__54) (mc5 + 1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesOf = (fun r -> ((((((v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesGo (r).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) (r).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaParams) (r).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor) (Base_dList.v_Base_dList_dlength (r).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) (v_Vuna_dCompiler_dElab_dRecords_drecordFieldPairs (r).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) 0))

# 292 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesOf dtb__57)) (v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dctorName = (fun dname -> dname)

# 87 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName = dtb__61; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaParams = dtb__62; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields = ((v_Vuna_dCompiler_dElab_dRecords_drecordFieldsOf dtb__63) 0); f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivings = dtb__64; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaDerivingVia = dtb__65; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaRepr = dtb__66; f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor = (v_Vuna_dCompiler_dElab_dRecords_dctorName dtb__61); f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaLinear = dtb__67 }, (v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls dtb__60)))
  | _ -> (v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls dtb__60)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__69, dtb__70, dtb__71) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__70) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__69, dtb__71)); Base_dPair.f_Base_dPair_dPair_second = mc0 }, Base_dList.C_Base_dList_dList_Nil)), mc2, false, dtb__71)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 }
))

# 367 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__72; Base_dPair.f_Base_dPair_dPair_second = dtb__73 } -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__72) dtb__73)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel = (fun fuel records e -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__74, dtb__75) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__76, dtb__77) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__78, dtb__79) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__80, dtb__81) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__82, dtb__83, dtb__84) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__83)) (fun b2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__82, b2, dtb__84))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__85, dtb__86, dtb__87) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__85)) (fun f2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records)) dtb__86)) (fun a2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (f2, a2, dtb__87))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__88, dtb__89, dtb__90, dtb__91) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel (fuel - 1)) records)) dtb__88)) (fun b2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__89)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (b2, body2, dtb__90, dtb__91))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__92, dtb__93) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel (fuel - 1)) records)) dtb__92)) (fun c2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (c2, dtb__93))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__94, dtb__95, dtb__96) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__94)) (fun s2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel (fuel - 1)) records)) dtb__95)) (fun a2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (s2, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs s2)) a2), dtb__96))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__97, dtb__98, dtb__99, dtb__100) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__97)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__98)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__99)) (fun e2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__100))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__101, dtb__102, dtb__103) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__101)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__102, dtb__103))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__104, dtb__105, dtb__106) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__104) records) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__106) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownRecord (dtb__104))) dtb__104)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__105) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__106))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames (dtb__107).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) dtb__105) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__106) (v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames (dtb__107).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields)) dtb__105))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (fuel - 1)) records) (dtb__107).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaFields) dtb__105) dtb__106)) (fun vs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__107).f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaCtor, dtb__106)), vs, dtb__106))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__108, dtb__109, dtb__110) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__108)) (fun b -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel (fuel - 1)) records)) dtb__109)) (fun fs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__110))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__111, dtb__112) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel (fuel - 1)) records)) dtb__111)) (fun s2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (s2, dtb__112))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__116)) (fun d2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__117)) (fun c2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__113, dtb__114, dtb__115, d2, c2, dtb__118))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__119, dtb__120, dtb__121) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__119)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__120)) (fun t2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__121))))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unreordered infix/paren in elaboration")
)))
# 246 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel = (fun fuel records stmt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else (match stmt with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__122, dtb__123, dtb__124) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__122)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__123)) (fun e2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (p2, e2, dtb__124))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__125, dtb__126) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__125)) (fun e2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (e2, dtb__126))))))
  | _ -> failwith "DT: impossible branch"
)))
# 255 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided (dtb__127).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg mc4) (dtb__127).f_Vuna_dCompiler_dElab_dRecords_dRecordFieldMeta_recordFieldName)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__129) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__129)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (mc0 - 1)) mc1) dtb__128) mc3) mc4)) (fun vs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 265 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__130; Base_dPair.f_Base_dPair_dPair_second = dtb__131 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__131)) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__130; Base_dPair.f_Base_dPair_dPair_second = v2 })))))
  | _ -> failwith "DT: impossible branch"
))
# 270 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__132; Base_dPair.f_Base_dPair_dPair_second = dtb__133 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__132)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__133)) (fun v2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = p2; Base_dPair.f_Base_dPair_dPair_second = v2 })))))))
  | _ -> failwith "DT: impossible branch"
))
# 277 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel = (fun fuel records clause -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records)) (Base_dPair.v_Base_dPair_dfirstOf clause))) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) (Base_dPair.v_Base_dPair_dsecondOf clause))) (fun b2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = p2; Base_dPair.f_Base_dPair_dPair_second = b2 }))))))))
# 284 "Vuna/Compiler/Elab/Records.vuna"
and v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__134; Base_dPair.f_Base_dPair_dPair_second = dtb__135 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "record desugar") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__134)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__135)) (fun b2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = p2; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel 512) a1) a2))

# 136 "Vuna/Compiler/Elab/Records.vuna"
let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl = (fun records d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__136, dtb__137, dtb__138, dtb__139) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern records)) dtb__137)) (fun pats2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr records) dtb__138)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__136, pats2, body2, dtb__139))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__157, dtb__158, dtb__159, dtb__160) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__161, dtb__162, dtb__163, dtb__164) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) dtb__163)) (fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__161, dtb__162, ms, dtb__164))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__165, dtb__166, dtb__167, dtb__168) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__169, dtb__170, dtb__171) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__172, dtb__173, dtb__174, dtb__175) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (d))
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords = (fun records decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) decls))

# 348 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith = (fun auxDecls decls0 -> ((fun records -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords records) decls0)) (fun ds -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = records; Base_dPair.f_Base_dPair_dPair_second = ds }))))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls auxDecls)) (v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls decls0))))

# 343 "Vuna/Compiler/Elab/Records.vuna"
let v_Vuna_dCompiler_dElab_dRecords_dprepareDecls = (fun decls0 -> ((v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith Base_dList.C_Base_dList_dList_Nil) decls0))
