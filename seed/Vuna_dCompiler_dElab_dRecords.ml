open Vuna_runtime
type t_Vuna_dCompiler_dElab_dRecords_dRecordInfo = C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo of (string) * (string Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (string)

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupRecord = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if (dtb__2 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7)))) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Cons (dtb__10, (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__9)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt = (fun _uctx0 mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__12 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__14, dtb__15) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__14) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt _uctx0) mc0) dtb__13) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dfieldIndex = (fun _uctx0 fname fields -> ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt _uctx0) fname) fields) 0))

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupProvided = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__18, dtb__19) -> (if (dtb__18 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19)) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided mc0) dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__20 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__22, dtb__23) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__22) dtb__21) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__21)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg = (fun sp fname -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": missing field "; fname]))

let v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg = (fun sp fname -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": unknown field "; fname]))

let v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg = (fun sp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ ": duplicate field"))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__25 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__27, dtb__28) -> (if ((Base_dList.v_Base_dList_dmemName dtb__27) mc0) then ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields mc0) dtb__26) else true)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (match dtb__29 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__31, dtb__32) -> (if ((Base_dList.v_Base_dList_dmemName dtb__31) mc1) then (((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc0) mc1) dtb__30) else ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (match dtb__33 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__35, dtb__36) -> (if ((Base_dList.v_Base_dList_dmemName dtb__35) mc0) then (((v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields mc0) dtb__34) mc2) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc2) dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__37, dtb__38, dtb__39) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__37, dtb__38))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs = (fun params sp -> ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, sp)))) params))

let v_Vuna_dCompiler_dElab_dRecords_drecordRetType = (fun dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dname, sp)), ((v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs params) sp), sp)))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordArrowType = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi ("_", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__40), (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__41) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__42, dtb__43, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", dtb__48)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (mc1, (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__44) (((v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__42) dtb__43) dtb__48)) dtb__48), (Base_dList.v_Base_dList_dlength dtb__44), dtb__48)), Base_dList.C_Base_dList_dList_Nil)), dtb__45, dtb__46, dtb__47, dtb__48))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (match ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls mc0) dtb__50) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__51, dtb__52) -> (match dtb__49 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((fun info -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (info, dtb__51)), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData dtb__49) (mc0 dtb__53)), dtb__52))))) (C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__53, dtb__54, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair) dtb__55), dtb__56, dtb__57, (mc0 dtb__53))))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__51, (Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__52))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel = (fun fuel records pat -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (pat)) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__60) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__60))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__61, dtb__62) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__61, dtb__62))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__63, dtb__64, dtb__65) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__64)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__63, p, dtb__65))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__66, dtb__67) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__66, dtb__67))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__68, dtb__69) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__68, dtb__69))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__70, dtb__71, dtb__72) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun x -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) x))) dtb__71)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__70, ps, dtb__72))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__73, dtb__74, dtb__75) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (match dtb__76 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__74) then (Base_dResult.C_Base_dResult_dResult_Err ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__75))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__79)) dtb__74) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__75) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__79)) dtb__74))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__79) dtb__74) dtb__75)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__82, ps, dtb__75))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__75); ": unknown record: "; dtb__73])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__73) records))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel = (fun fuel records fdefs provided sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__85, dtb__86) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__85) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__84) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (sp)), ps))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__87)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__84) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) fdefs)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern = (fun records pat -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel 64) records) pat))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFields = (fun records fdefs provided sp -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel 64) records) fdefs) provided) sp))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo = (fun remaining n -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (("vuna_ru" ^ (bi_strFromInt (n - remaining))), ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo (remaining - 1)) n)))))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt = (fun i n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo (n - i)) n))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars = (fun n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt 0) n))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__88 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__90, dtb__91) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (Base_dList.C_Base_dList_dList_Cons ((match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__90) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> dtb__94
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__92, mc4))
  | _ -> failwith "DT: impossible branch"
), (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__89) mc1) dtb__93) (mc3 + 1)) mc4)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__97)) mc2) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc3) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__97)) mc2))) else ((fun vars -> ((fun pats -> ((fun args -> ((fun pat -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (mc1, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pat, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__100, mc3)), args, mc3)))), Base_dList.C_Base_dList_dList_Nil)), mc3))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__100, pats, mc3)))) (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__97) mc2) vars) 0) mc3))) ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc3)))) vars))) (v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars (Base_dList.v_Base_dList_dlength dtb__97))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsWithField = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match dtb__101 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if ((Base_dList.v_Base_dList_dmemName mc0) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__105)) then (Base_dList.C_Base_dList_dList_Cons (dtb__101, ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__102))) else ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__109 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__111, dtb__112) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames mc2) then (Base_dResult.C_Base_dResult_dResult_Err ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg mc3))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith dtb__113) mc1) mc2) mc3)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3); ": ambiguous field "; dtb__111; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc3) dtb__111)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__111) mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3) ^ ": record update needs at least one field")))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__115 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__117, dtb__118) -> (Base_dList.C_Base_dList_dList_Cons ((if (dtb__117 = mc0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__117, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__118))) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__118)))), ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc0) dtb__116)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((fun pats -> ((fun body -> ((fun alt -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (mc2, (Base_dList.C_Base_dList_dList_Cons (alt, Base_dList.C_Base_dList_dList_Nil)), mc3))) (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__124, pats, mc3)), body)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)))) ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc1) dtb__121))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dctorName = (fun dname -> dname)

let rec v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__125, dtb__126, dtb__127) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__126) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__125, dtb__127)), mc0)), Base_dList.C_Base_dList_dList_Nil)), mc2, false, dtb__127)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (mc1, mc2))
))

let v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__128, dtb__129) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__128) dtb__129)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel = (fun fuel records e -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__130, dtb__131) -> (Base_dResult.C_Base_dResult_dResult_Ok (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__132, dtb__133) -> (Base_dResult.C_Base_dResult_dResult_Ok (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__134, dtb__135) -> (Base_dResult.C_Base_dResult_dResult_Ok (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__136, dtb__137) -> (Base_dResult.C_Base_dResult_dResult_Ok (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__138, dtb__139, dtb__140) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__139)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__138, b2, dtb__140))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__141, dtb__142, dtb__143) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__141)) (fun f2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records)) dtb__142)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (f2, a2, dtb__143))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__144, dtb__145, dtb__146, dtb__147) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel (fuel - 1)) records)) dtb__144)) (fun b2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__145)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (b2, body2, dtb__146, dtb__147))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__148, dtb__149) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel (fuel - 1)) records)) dtb__148)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (c2, dtb__149))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__150, dtb__151, dtb__152) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__150)) (fun s2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel (fuel - 1)) records)) dtb__151)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (s2, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs s2)) a2), dtb__152))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__153, dtb__154, dtb__155, dtb__156) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__153)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__154)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__155)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__156))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__157, dtb__158, dtb__159) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__157)) (fun b -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (match dtb__161 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (((((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr dtb__160) dtb__158) b) dtb__159)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__159); ": ambiguous field "; dtb__158; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__159); ": unknown field "; dtb__158])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__158) records))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__162, dtb__163, dtb__164) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (match dtb__165 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__163) then (Base_dResult.C_Base_dResult_dResult_Err ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__164))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__168)) dtb__163) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__164) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__168)) dtb__163))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (fuel - 1)) records) dtb__168) dtb__163) dtb__164)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__171, dtb__164)), vs, dtb__164))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__164); ": unknown record: "; dtb__162])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__162) records))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__172, dtb__173, dtb__174) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__172)) (fun b -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel (fuel - 1)) records)) dtb__173)) (fun fs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate records) b) fs) dtb__174)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Ok (e2))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__175, dtb__176) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel (fuel - 1)) records)) dtb__175)) (fun s2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (s2, dtb__176))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__180)) (fun d2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__181)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__177, dtb__178, dtb__179, d2, c2, dtb__182))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__183, dtb__184, dtb__185) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__183)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__184)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__185))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel = (fun fuel records stmt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else (match stmt with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__186, dtb__187, dtb__188) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__186)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__187)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (p2, e2, dtb__188))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__189, dtb__190) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__189)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (e2, dtb__190))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match dtb__191 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__193, dtb__194) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__193) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg mc4) dtb__193)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__195)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (mc0 - 1)) mc1) dtb__192) mc3) mc4)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__196, dtb__197) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__197)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__196, v2)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__198, dtb__199) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__198)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__199)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (p2, v2)))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel = (fun fuel records clause -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records)) (Base_dPair.v_Base_dPair_dfirstOf clause))) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) (Base_dPair.v_Base_dPair_dsecondOf clause))) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (p2, b2))))))))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__200, dtb__201) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: record desugar fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__200)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__201)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (p2, b2)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarAlt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarBind = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValue = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValues = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel 512) a1) a2) a3) a4))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel 512) a1) a2))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl = (fun records d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__202, dtb__203, dtb__204, dtb__205) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern records)) dtb__203)) (fun pats2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr records) dtb__204)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__202, pats2, body2, dtb__205))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__221, dtb__222, dtb__223, dtb__224) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__225, dtb__226, dtb__227, dtb__228) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) dtb__227)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__225, dtb__226, ms, dtb__228))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__229, dtb__230, dtb__231, dtb__232) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__233, dtb__234, dtb__235) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__236, dtb__237, dtb__238, dtb__239) -> (Base_dResult.C_Base_dResult_dResult_Ok (d))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords = (fun records decls -> ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) decls))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith = (fun auxDecls decls0 -> ((fun auxSplit -> ((fun split -> ((fun records -> ((fun decls -> ((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords records) decls)) (Base_dPair.v_Base_dPair_dsecondOf split))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf auxSplit)) (Base_dPair.v_Base_dPair_dfirstOf split)))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) decls0))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) auxDecls)))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDecls = (fun decls0 -> ((v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith Base_dList.C_Base_dList_dList_Nil) decls0))
