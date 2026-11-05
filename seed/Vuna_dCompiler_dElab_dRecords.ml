open Vuna_runtime
type t_Vuna_dCompiler_dElab_dRecords_dRecordInfo = C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo of (string) * (string Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string)

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupRecord = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6) -> (if (dtb__2 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6)))) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (match dtb__7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__9, (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt = (fun _uctx0 mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (match dtb__11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__13) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt _uctx0) mc0) dtb__12) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dfieldIndex = (fun _uctx0 fname fields -> ((((v_Vuna_dCompiler_dElab_dRecords_dfieldIndexAt _uctx0) fname) fields) 0))

let rec v_Vuna_dCompiler_dElab_dRecords_dlookupProvided = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match dtb__15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> (if (dtb__17 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18)) else ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided mc0) dtb__16))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__21) dtb__20) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__20)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg = (fun sp fname -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": missing field "; fname]))

let v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg = (fun sp fname -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": unknown field "; fname]))

let v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg = (fun sp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ ": duplicate field"))

let rec v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__24, dtb__25) -> (match dtb__24 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> (if ((Base_dList.v_Base_dList_dmemName dtb__26) mc0) then ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields mc0) dtb__25) else true)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (match dtb__28 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> (if ((Base_dList.v_Base_dList_dmemName dtb__30) mc1) then (((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc0) mc1) dtb__29) else ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) dtb__30))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc0) "")
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__32 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (if ((Base_dList.v_Base_dList_dmemName dtb__34) mc0) then (((v_Vuna_dCompiler_dElab_dRecords_dcheckProvidedFields mc0) dtb__33) mc2) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc2) dtb__34))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__36, dtb__37, dtb__38) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs = (fun params sp -> ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (p, sp)))) params))

let v_Vuna_dCompiler_dElab_dRecords_drecordRetType = (fun dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dname, sp)), ((v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs params) sp), sp)))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordArrowType = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi ("_", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__39), (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__40) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__41, dtb__42, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", dtb__46)), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (mc1, (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__43) (((v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__41) dtb__42) dtb__46)) dtb__46), (Base_dList.v_Base_dList_dlength dtb__43), dtb__46)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), dtb__44, dtb__45, dtb__46))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> (match ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls mc0) dtb__48) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__50) -> (match dtb__47 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> ((fun info -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (info, dtb__49)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData dtb__47) (mc0 dtb__51)), dtb__50))))) (C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__51, dtb__52, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair) dtb__53), dtb__54, (mc0 dtb__51))))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__50))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel = (fun fuel records pat -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (pat)) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__57) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__57))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__58, dtb__59) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__58, dtb__59))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__60, dtb__61, dtb__62) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__61)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__60, p, dtb__62))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__63, dtb__64) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__63, dtb__64))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__65, dtb__66) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__65, dtb__66))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__67, dtb__68, dtb__69) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun x -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) x))) dtb__68)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__67, ps, dtb__69))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__70, dtb__71, dtb__72) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (match dtb__73 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__71) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__72))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__76)) dtb__71) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__72) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__76)) dtb__71))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__76) dtb__71) dtb__72)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__78, ps, dtb__72))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__72); ": unknown record: "; dtb__70])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__70) records))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel = (fun fuel records fdefs provided sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__81) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__80) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (sp)), ps))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__83)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__80) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (p2, ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) fdefs)))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern = (fun records pat -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel 64) records) pat))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFields = (fun records fdefs provided sp -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel 64) records) fdefs) provided) sp))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo = (fun remaining n -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons (("vuna_ru" ^ (bi_strFromInt (n - remaining))), ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo (remaining - 1)) n)))))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt = (fun i n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAtGo (n - i)) n))

let v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars = (fun n -> ((v_Vuna_dCompiler_dElab_dRecords_drecUpdateVarsAt 0) n))

let rec v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (match dtb__84 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__86) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> dtb__90
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__88, mc4))
  | _ -> failwith "DT: impossible branch"
), (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__85) mc1) dtb__89) (mc3 + 1)) mc4)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__93)) mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc3) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__93)) mc2))) else ((fun vars -> ((fun pats -> ((fun args -> ((fun pat -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc1, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (pat, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__95, mc3)), args, mc3)))), Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc3))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__95, pats, mc3)))) (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__93) mc2) vars) 0) mc3))) ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc3)))) vars))) (v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars (Base_dList.v_Base_dList_dlength dtb__93))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsWithField = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__96 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> (if ((Base_dList.v_Base_dList_dmemName mc0) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__100)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__96, ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__97))) else ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__97))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__103 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg mc3))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith dtb__107) mc1) mc2) mc3)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3); ": ambiguous field "; dtb__105; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc3) dtb__105)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__105) mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3) ^ ": record update needs at least one field")))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__109 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((if (dtb__111 = mc0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__111, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__112))) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__112)))), ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc0) dtb__110)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> ((fun pats -> ((fun body -> ((fun alt -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc2, (Base_dList.C_Base_dList_dList_Base_dList_dCons (alt, Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc3))) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__117, pats, mc3)), body)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc1, mc3)))) ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc1) dtb__115))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dctorName = (fun dname -> dname)

let rec v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__118, dtb__119, dtb__120) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__119) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__118, dtb__120)), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc2, false, dtb__120)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, mc2))
))

let v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__121) dtb__122)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel = (fun fuel records e -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__125, dtb__126) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__127, dtb__128) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__129, dtb__130, dtb__131) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__130)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__129, b2, dtb__131))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__132, dtb__133, dtb__134) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__132)) (fun f2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records)) dtb__133)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (f2, a2, dtb__134))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__135, dtb__136, dtb__137, dtb__138) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel (fuel - 1)) records)) dtb__135)) (fun b2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__136)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (b2, body2, dtb__137, dtb__138))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__139, dtb__140) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel (fuel - 1)) records)) dtb__139)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (c2, dtb__140))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__141, dtb__142, dtb__143) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__141)) (fun s2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel (fuel - 1)) records)) dtb__142)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (s2, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs s2)) a2), dtb__143))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__144, dtb__145, dtb__146, dtb__147) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__144)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__145)) (fun t2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__146)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__147))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__148, dtb__149, dtb__150) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__148)) (fun b -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr dtb__151) dtb__149) b) dtb__150)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__150); ": ambiguous field "; dtb__149; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__150); ": unknown field "; dtb__149])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__149) records))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__153, dtb__154, dtb__155) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (match dtb__156 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__154) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__155))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__159)) dtb__154) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__155) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__159)) dtb__154))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (fuel - 1)) records) dtb__159) dtb__154) dtb__155)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__161, dtb__155)), vs, dtb__155))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__155); ": unknown record: "; dtb__153])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__153) records))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__162, dtb__163, dtb__164) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__162)) (fun b -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel (fuel - 1)) records)) dtb__163)) (fun fs -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate records) b) fs) dtb__164)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e2))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__165, dtb__166) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel (fuel - 1)) records)) dtb__165)) (fun s2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (s2, dtb__166))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__170)) (fun d2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__171)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__167, dtb__168, dtb__169, d2, c2, dtb__172))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__173, dtb__174, dtb__175) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__173)) (fun v2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__174)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__175))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel = (fun fuel records stmt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match stmt with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__176, dtb__177, dtb__178) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__176)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__177)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__178))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__179, dtb__180) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__179)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__180))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__181 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__183) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg mc4) dtb__183)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__185)) (fun v2 -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (mc0 - 1)) mc1) dtb__182) mc3) mc4)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__187)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, v2)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__188)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__189)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, v2)))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel = (fun fuel records clause -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records)) (Base_dPair.v_Base_dPair_dfirstOf clause))) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) (Base_dPair.v_Base_dPair_dsecondOf clause))) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__190)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__191)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, b2)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarAlt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarBind = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValue = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValues = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel 512) a1) a2) a3) a4))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel 512) a1) a2))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl = (fun records d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__192, dtb__193, dtb__194, dtb__195) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern records)) dtb__193)) (fun pats2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr records) dtb__194)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__192, pats2, body2, dtb__195))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__209, dtb__210, dtb__211, dtb__212) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__213, dtb__214, dtb__215, dtb__216) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) dtb__215)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__213, dtb__214, ms, dtb__216))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__217, dtb__218, dtb__219, dtb__220) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__221, dtb__222, dtb__223) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__224, dtb__225, dtb__226, dtb__227) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords = (fun records decls -> ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) decls))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith = (fun auxDecls decls0 -> ((fun auxSplit -> ((fun split -> ((fun records -> ((fun decls -> ((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords records) decls)) (Base_dPair.v_Base_dPair_dsecondOf split))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf auxSplit)) (Base_dPair.v_Base_dPair_dfirstOf split)))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) decls0))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) auxDecls)))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDecls = (fun decls0 -> ((v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith Base_dList.C_Base_dList_dList_Base_dList_dNil) decls0))
