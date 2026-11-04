open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames (v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun scrutVal -> (fun expected -> (fun cname -> (fun args -> (fun psp -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownConstructorInCase (cname, (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__0)) args)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1, dtb__2) -> (match dtb__2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__3, dtb__4) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__4) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchTooManyArgs (cname))) cname) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__1)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__1) dtb__0)) ((v_Base_dList_dmap (fun v -> (((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Base_dList_dNil) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs))) (fun refsIdx -> (match (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__1) refsIdx) with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchEmptyCtx)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__1)) refsIdx) ((v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__1) dtb__0)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, dtb__6) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (cname, dtb__3, dtb__5)), dtb__6))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__1) refs2))) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (match dtb__9 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__11, dtb__12, dtb__13) -> ((v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__11) dtb__12) dtb__13) dtb__10)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__15) mc4) mc5) mc6) mc7) mc8) dtb__8) (C_Base_dList_dList_Base_dList_dCons (dtb__14, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__16, dtb__17) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__8) mc10) dtb__10) dtb__16) dtb__17)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__18) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__8) mc10) dtb__10) "_") dtb__18)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__9)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc10), mc3)))))
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTy -> (fun dd -> (fun idxs -> (fun expected -> (fun rest -> (fun acc -> (fun body -> (fun pname -> (fun psp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", binds, dtb__19)), acc))), dtb__20))))) (if ((bi_eq_str pname) "_") then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) scrutTy))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))))) (if ((bi_eq_str pname) "_") then ctx else (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat alts)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase alts) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (match dtb__22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__23, dtb__24) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel ((bi_sub fuel) 1)) globals) ctx) dtb__24) dtb__21) dtb__23) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Base_dList_dNil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Base_dList_dNil)), (v_Base_dPair_dsecondOf alt))))) alts))) ((bi_concat "nd_scrut") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__25) -> (match dtb__25 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__26, dtb__27) -> (if (if ((bi_eq_str dtb__26) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then ((bi_eq_int (v_Base_dList_dlength dtb__27)) 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if ((bi_eq_str dtb__26) "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if ((bi_eq_str dtb__26) "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__26) dtb__27) alts) expected) sp))))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel ((bi_sub fuel) 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (match dtb__29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__28, dtb__32)), dtb__31))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel ((bi_sub fuel) 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (match dtb__34 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__35, dtb__36) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__28, dtb__33)), dtb__36))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun alts -> (fun target -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) alts) target) expected) sp) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__37 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> (match dtb__39 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__41, dtb__42, dtb__43) -> (if ((bi_eq_str dtb__41) mc5) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__40) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__45) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, (C_Base_dPair_dPair_Base_dPair_dPair (mc8, dtb__45))))))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__38) mc5) mc6) mc7) mc8))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__46, dtb__47) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__40) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__38) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__50) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__40) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__38) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__39)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match mc8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc3))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive (mc5))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__55) -> (match dtb__55 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (if dtb__56 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__57)))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__62, dtb__63) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__62))) dtb__61) dtb__59) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__64, dtb__65) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__64))) dtb__61) dtb__59) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__66, dtb__67) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__66) dtb__61) mc7) mc8)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__69))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__70) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__61) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, dtb__72) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__72))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__60)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun litTerm -> (fun body -> (fun rest -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel ((bi_sub fuel) 1)) globals) ctx) dtb__74) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__73, dtb__75)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun name -> (fun body -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__79)), scrutTerm, rig)), dtb__80))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))) ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun fam -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> ((v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTy) dtb__81) idxs) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) C_Base_dList_dList_Base_dList_dNil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, dtb__83) -> (((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__83) ctx) dtb__81) idxs) alts) expected) sp) scrutTerm) dtb__82)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> ((fun metaTy -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel ((bi_sub fuel) 1)) globals) ctx) dtb__85) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__87))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__84))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun c -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__88) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__88))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__89) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (match dtb__91 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__92) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__93)))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "if condition must be ") ((bi_concat v_Vuna_dCompiler_dIntrinsics_dboolTypeName) ((bi_concat " (got ") ((bi_concat ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__92)) ")"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__94, dtb__95) -> (if ((bi_eq_str dtb__94) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), ec)))))) else (if ((bi_eq_str dtb__94) "_") then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__95) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dHoleNoExpectedType) else (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__94) dtb__95)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__96, dtb__97) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__96)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Int", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__98, dtb__99) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__98)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("String", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__100) dtb__101) dtb__102) dtb__103) dtb__104)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__105, dtb__106, dtb__107) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__105) dtb__106) dtb__107)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__108, dtb__109, dtb__110) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__110) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaNoSignature)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__111, dtb__112, dtb__113, dtb__114) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__111) dtb__114)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__116) dtb__112)) (fun pt -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (match dtb__118 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__120) dtb__113)) (fun pe -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__124) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__119) dtb__123)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__115, dtb__117, dtb__121)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, ec4))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pe)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__125, dtb__126, dtb__127, dtb__128) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__125) dtb__126) dtb__127) dtb__128)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__129, dtb__130, dtb__131) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__129) dtb__130) dtb__131)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__132, dtb__133, dtb__134) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__134) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordFieldAccessUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__135, dtb__136, dtb__137) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__137) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordsUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__138, dtb__139, dtb__140) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__140) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordUpdateUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__141, dtb__142) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__142) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDoUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__143, dtb__144, dtb__145) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__143) dtb__144) dtb__145)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun ty -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match dtb__147 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((fun tyVal -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__149) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__151))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun implicit -> (fun dom -> (fun cod -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (match dtb__153 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__155) cod)) (fun pc -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (match dtb__157 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__152)), dtb__152, dtb__156)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (((v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__154) dtb__158))), dtb__159))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__152) ctx))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__160, dtb__161) -> (if ((bi_eq_str dtb__160) "->") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (match dtb__163 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__165 with
  | C_Base_dList_dList_Base_dList_dNil -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel ((bi_sub fuel) 1)) globals) ctx) ec) "_") false) dtb__162) dtb__164) sp)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)) args) else (if ((bi_eq_str dtb__160) "Type") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (match dtb__166 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__168, dtb__169) -> (match dtb__167 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_lt_int dtb__168) 0) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__169) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUniverseLevelNonNegative) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__168))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__168)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__161) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__161) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__161) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)) args) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__170, dtb__171) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__170) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__170) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__173))) args) sp)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (match dtb__175 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__177)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__170))) dtb__174), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__170) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__178) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__170) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__179))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__178)) args) sp)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match dtb__181 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__183)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__170))) dtb__180), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__171) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__170))) dtb__170)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__184, dtb__185) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__184) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__184) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__187))) args) sp)) (fun pa -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__191)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__184))) dtb__188), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__184) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__184) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__193))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__192)) args) sp)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, dtb__195) -> (match dtb__195 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__197)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__184))) dtb__194), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__185) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__184))) dtb__184)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
)
)) fn)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__198, dtb__199) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__198) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__200))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> (match dtb__202 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, dtb__204) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) dtb__204) dtb__203) args) sp)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__208)) dtb__201) dtb__205), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213) -> (if dtb__210 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__212) then (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__212) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__212) dtb__213) args) sp) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__212) args) sp)) (fun ec0 -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__214) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__212)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec0) dtb__212) dtb__213) args) sp) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__212)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec0) dtb__212) dtb__213) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__214))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__215) -> (match dtb__215 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, dtb__217) -> ((fun ty2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__217) ty2) args) sp)) (fun q -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219) -> (match dtb__219 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__218)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__213) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__216)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__212)) sp))))) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__212) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, dtb__223) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__223) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__213) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__222))) args) sp)) (fun p -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__224, dtb__225) -> (match dtb__225 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__224)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__228) dtb__212)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__231) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__213) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__230))) dtb__229) sp)) (fun q -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (match dtb__233 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, dtb__235) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__212))), dtb__232)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__234, dtb__235))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__236)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__238, dtb__239) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__239) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__239) dom))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__238))) args) sp)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (match dtb__241 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__243) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__238, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__240)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__243))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel -> (fun globals -> (fun ec -> (fun ctx -> (fun dom -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__244) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__245) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__246, dtb__247) -> (match dtb__247 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__244) dtb__245) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__246) (v_Vuna_dCompiler_dElab_dTypes_decSols ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__248) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__246) C_Base_dList_dList_Base_dList_dNil) dtb__248) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__249) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__249))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__250) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__244) dtb__245) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__244) dtb__245) args) sp)
)) dtb__244)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel -> (fun globals -> (fun ec -> (fun ctx -> (fun argTy -> (fun argKind -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__253) -> (match dtb__253 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255) -> (match dtb__255 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__256, dtb__257) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__257) ctx) argTy) argKind) dtb__252) sp) else (if (((((v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__257) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__257) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__258) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__258))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__259) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__257) ctx) argTy) argKind) dtb__252) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__257) ctx) argTy) argKind) dtb__252) sp)))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__257) dtb__256))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__260) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__251))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__261, dtb__262, dtb__263) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__262)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (match dtb__265 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__266, dtb__267) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__267) dtb__261) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__264))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__268, dtb__269, dtb__270, dtb__271) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__268) dtb__269) dtb__270) expected) dtb__271)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__272, dtb__273, dtb__274) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__272) dtb__273) expected) dtb__274)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__275, dtb__276, dtb__277, dtb__278) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__284, dtb__285, dtb__286) -> (match dtb__284 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__287, dtb__288) -> (if ((bi_eq_str dtb__287) "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected) else (if ((bi_eq_str dtb__287) "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__284) dtb__285) expected) dtb__286)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__284) dtb__285) expected) dtb__286)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__289, dtb__290, dtb__291) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__289) dtb__290) expected) dtb__291)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__292, dtb__293) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__294, dtb__295) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__296, dtb__297) -> (if ((bi_eq_str dtb__296) "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__297) expected)) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__296, dtb__297))) C_Base_dList_dList_Base_dList_dNil) expected) dtb__297))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
)) expr))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) binds) body) rec_u) expected) sp)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__300, dtb__301) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__300) dtb__301) mc5) mc6) mc7) mc8))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun bind -> (fun rest -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__302, dtb__303) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (match dtb__305 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__306, dtb__307) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__307) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__308, dtb__309) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__302, rig, dtb__308)), dtb__304, rig)), dtb__309))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__302) dtb__306) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__310) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__311, dtb__312) -> (match dtb__312 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__313, dtb__314) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx) dtb__314) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__315, dtb__316) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__315))), dtb__311, rig)), dtb__316))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__313))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLetBindingPattern)
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) binds) body) rec_u) sp))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__317, dtb__318) -> (match dtb__317 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, dtb__320) -> (match dtb__319 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__321, dtb__322) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__321) dtb__320) dtb__318) body) rec_u) sp)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__323) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__320) dtb__318) body) rec_u) sp)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__319)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLetBindingPattern)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__324, dtb__325) -> (match dtb__325 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__326, dtb__327) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__327) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, dtb__329) -> (match dtb__329 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__328)), dtb__324, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__326) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__326))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, dtb__333) -> (match dtb__333 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx) dtb__335) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> (match dtb__337 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__336))), dtb__332, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__334))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__340) -> (match dtb__340 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, dtb__342) -> (match dtb__342 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__343, dtb__344) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__344) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__343) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__345) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) ((bi_concat ": ") dtb__345))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__346) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__346)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__347) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__347))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__348, dtb__349) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel ((bi_sub mc0) 1)) mc1) ctx2) mc3) dtb__349) mc5) expected2) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__348, lamRig, dtb__355)), dtb__356))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__351) dtb__353))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__354) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__348) dtb__353) mc2))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__350) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaTooManyParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__357, dtb__358, dtb__359) -> (match dtb__357 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__360, dtb__361) -> (if (if ((bi_eq_str dtb__360) "->") then true else ((bi_eq_str dtb__360) "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__360) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__362) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__360) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__360) dtb__358) dtb__361) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__363) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__364) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__364))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__365, dtb__366) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__365) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__367) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__365) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__368) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__368))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__369) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__365)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__369, ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
)) expr)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> (match dtb__371 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__374) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__373))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedType (((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__372)))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__372))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__373) dtb__372))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__375, dtb__376) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__375) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__377) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__375) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__375) args) expected) dtb__376) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__378) -> (match dtb__378 with
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__379) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__380) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__375) args) expected) dtb__376)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) dtb__375)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__381, dtb__382) -> (match dtb__382 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__383, dtb__384) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__384) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__383)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__381, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__385) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__385)) args) sp)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__386, dtb__387) -> (match dtb__387 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__388, dtb__389) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__389) dtb__388)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__390) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__386), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__390, dtb__389))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dPrelude_disEqOp name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__391, dtb__392) -> (match dtb__392 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__393, dtb__394) -> (match dtb__394 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__391)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__395, dtb__396) -> (match dtb__396 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__397, dtb__398) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__398) dtb__393)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__399, dtb__400) -> (match dtb__400 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__401, dtb__402) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__402) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__397) dtb__401)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__395) dtb__399) sp) dtb__397) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dDict_disCmpOp name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__403, dtb__404) -> (match dtb__404 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__405, dtb__406) -> (match dtb__406 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__403)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__407, dtb__408) -> (match dtb__408 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__409, dtb__410) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__410) dtb__405)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__411, dtb__412) -> (match dtb__412 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, dtb__414) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__414) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__409) dtb__413)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__407) dtb__411) sp) dtb__409) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__415) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__415))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__416) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__416))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (if ((bi_eq_str name) "&&") then true else ((bi_eq_str name) "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__417, dtb__418) -> (match dtb__418 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__419, dtb__420) -> (match dtb__420 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__417) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__421, dtb__422) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__422) dtb__419) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__423, dtb__424) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__421) dtb__423), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__424))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__425, dtb__426) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__425) args) sp)) (fun mspec -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__427) -> (match dtb__427 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> (match dtb__429 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__431) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__430)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__432) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__432))) args) sp)) (fun pa -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434) -> (match dtb__434 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__435, dtb__436) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__436) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__435) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__437) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__437)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__433), dtb__437))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__438) -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (name, dtb__438))) name) dtb__438)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))))))))
