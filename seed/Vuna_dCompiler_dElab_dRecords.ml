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
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi ("_", false, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dfieldType dtb__39), (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__40) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__41, dtb__42, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("Type", dtb__45)), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (mc1, (((v_Vuna_dCompiler_dElab_dRecords_drecordArrowType dtb__43) (((v_Vuna_dCompiler_dElab_dRecords_drecordRetType dtb__41) dtb__42) dtb__45)) dtb__45), (Base_dList.v_Base_dList_dlength dtb__43), dtb__45)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), dtb__44, dtb__45))
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls mc0) dtb__47) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (match dtb__46 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> ((fun info -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (info, dtb__48)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dRecords_drecordDeclToData dtb__46) (mc0 dtb__50)), dtb__49))))) (C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__50, dtb__51, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dRecords_drecordFieldPair) dtb__52), dtb__53, (mc0 dtb__50))))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__49))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel = (fun fuel records pat -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (pat)) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__55) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__55))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__56, dtb__57) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__56, dtb__57))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__58, dtb__59, dtb__60) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__59)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__58, p, dtb__60))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__61, dtb__62) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__61, dtb__62))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__63, dtb__64) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__63, dtb__64))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__65, dtb__66, dtb__67) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun x -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) x))) dtb__66)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__65, ps, dtb__67))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__68, dtb__69, dtb__70) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (match dtb__71 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__69) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__70))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__74)) dtb__69) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__70) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__74)) dtb__69))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__74) dtb__69) dtb__70)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__76, ps, dtb__70))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__70); ": unknown record: "; dtb__68])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__68) records))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel = (fun fuel records fdefs provided sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (match dtb__77 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__79) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__78) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (sp)), ps))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__81)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel (fuel - 1)) records) dtb__78) provided) sp)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (p2, ps))))))))
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
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match dtb__82 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__84) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88) -> dtb__88
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__86, mc4))
  | _ -> failwith "DT: impossible branch"
), (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__83) mc1) dtb__87) (mc3 + 1)) mc4)))
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
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__91)) mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg mc3) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__91)) mc2))) else ((fun vars -> ((fun pats -> ((fun args -> ((fun pat -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc1, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (pat, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__93, mc3)), args, mc3)))), Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc3))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__93, pats, mc3)))) (((((v_Vuna_dCompiler_dElab_dRecords_drecUpdateArgs dtb__91) mc2) vars) 0) mc3))) ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc3)))) vars))) (v_Vuna_dCompiler_dElab_dRecords_drecUpdateVars (Base_dList.v_Base_dList_dlength dtb__91))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_drecordsWithField = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((Base_dList.v_Base_dList_dmemName mc0) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__98)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__94, ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__95))) else ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField mc0) dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match dtb__101 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg mc3))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__106 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdateWith dtb__105) mc1) mc2) mc3)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3); ": ambiguous field "; dtb__103; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg mc3) dtb__103)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__103) mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc3) ^ ": record update needs at least one field")))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((if (dtb__109 = mc0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__109, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__110))) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__110)))), ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc0) dtb__108)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> ((fun pats -> ((fun body -> ((fun alt -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (mc2, (Base_dList.C_Base_dList_dList_Base_dList_dCons (alt, Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc3))) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__115, pats, mc3)), body)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc1, mc3)))) ((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessPats mc1) dtb__113))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_dctorName = (fun dname -> dname)

let rec v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__116, dtb__117, dtb__118) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__117) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__116, dtb__118)), mc0)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), mc2, false, dtb__118)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, mc2))
))

let v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (((v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo mc0) dtb__119) dtb__120)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel = (fun fuel records e -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__121, dtb__122) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__123, dtb__124) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__125, dtb__126) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__127, dtb__128, dtb__129) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__128)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__127, b2, dtb__129))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__130, dtb__131, dtb__132) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__130)) (fun f2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records)) dtb__131)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (f2, a2, dtb__132))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__133, dtb__134, dtb__135, dtb__136) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel (fuel - 1)) records)) dtb__133)) (fun b2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__134)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (b2, body2, dtb__135, dtb__136))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__137, dtb__138) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel (fuel - 1)) records)) dtb__137)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (c2, dtb__138))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__139, dtb__140, dtb__141) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__139)) (fun s2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel (fuel - 1)) records)) dtb__140)) (fun a2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (s2, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs s2)) a2), dtb__141))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__142, dtb__143, dtb__144, dtb__145) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__142)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__143)) (fun t2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__144)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__145))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__146, dtb__147, dtb__148) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__146)) (fun b -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__150 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((((v_Vuna_dCompiler_dElab_dRecords_dfieldAccessExpr dtb__149) dtb__147) b) dtb__148)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__148); ": ambiguous field "; dtb__147; " (declared by multiple records)"])))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__148); ": unknown field "; dtb__147])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_drecordsWithField dtb__147) records))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__151, dtb__152, dtb__153) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__154) -> (match dtb__154 with
  | C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_Vuna_dCompiler_dElab_dRecords_dRecordInfo (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> (if (v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames dtb__152) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg dtb__153))) else (if ((v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__157)) dtb__152) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg dtb__153) (v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf dtb__157)) dtb__152))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (fuel - 1)) records) dtb__157) dtb__152) dtb__153)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__159, dtb__153)), vs, dtb__153))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__153); ": unknown record: "; dtb__151])))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dRecords_dlookupRecord dtb__151) records))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__160, dtb__161, dtb__162) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__160)) (fun b -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel (fuel - 1)) records)) dtb__161)) (fun fs -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecUpdate records) b) fs) dtb__162)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e2))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__163, dtb__164) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel (fuel - 1)) records)) dtb__163)) (fun s2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (s2, dtb__164))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__167)) (fun d2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__168)) (fun c2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__165, dtb__166, d2, c2, dtb__169))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__170, dtb__171, dtb__172) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__170)) (fun v2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__171)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__172))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel = (fun fuel records stmt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match stmt with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__173, dtb__174, dtb__175) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records) dtb__173)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__174)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__175))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__176, dtb__177) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) dtb__176)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__177))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match dtb__178 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dRecords_dlookupProvided dtb__180) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg mc4) dtb__180)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__182)) (fun v2 -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel (mc0 - 1)) mc1) dtb__179) mc3) mc4)) (fun vs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (v2, vs))))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__184)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, v2)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__185)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__186)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, v2)))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel = (fun fuel records clause -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (fuel - 1)) records)) (Base_dPair.v_Base_dPair_dfirstOf clause))) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (fuel - 1)) records) (Base_dPair.v_Base_dPair_dsecondOf clause))) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))))
and v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, dtb__188) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: record desugar fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel (mc0 - 1)) mc1) dtb__187)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel (mc0 - 1)) mc1) dtb__188)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, b2)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarAlt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarBind = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValue = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValues = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel 512) a1) a2) a3) a4))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmt = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel 512) a1) a2))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr = (fun a1 a2 -> (((v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel 512) a1) a2))

let rec v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl = (fun records d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__189, dtb__190, dtb__191, dtb__192) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern records)) dtb__190)) (fun pats2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr records) dtb__191)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__189, pats2, body2, dtb__192))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__204, dtb__205, dtb__206, dtb__207) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__208, dtb__209, dtb__210, dtb__211) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) dtb__210)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__208, dtb__209, ms, dtb__211))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__212, dtb__213, dtb__214, dtb__215) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__216, dtb__217, dtb__218) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__219, dtb__220, dtb__221, dtb__222) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (d))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords = (fun records decls -> ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl records)) decls))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith = (fun auxDecls decls0 -> ((fun auxSplit -> ((fun split -> ((fun records -> ((fun decls -> ((v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords records) decls)) (Base_dPair.v_Base_dPair_dsecondOf split))) ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf auxSplit)) (Base_dPair.v_Base_dPair_dfirstOf split)))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) decls0))) ((v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls v_Vuna_dCompiler_dElab_dRecords_dctorName) auxDecls)))

let v_Vuna_dCompiler_dElab_dRecords_dprepareDecls = (fun decls0 -> ((v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith Base_dList.C_Base_dList_dList_Base_dList_dNil) decls0))
