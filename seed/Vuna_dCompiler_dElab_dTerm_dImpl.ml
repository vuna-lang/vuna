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

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun ec -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__0, dtb__1) -> ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) dtb__0)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__2, dtb__3) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__2, dtb__3))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__4, dtb__5) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__4, dtb__5))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__6, dtb__7) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__6, dtb__7))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__8, dtb__9, dtb__10) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__9)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__8, b2, dtb__10))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__11, dtb__12, dtb__13) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__11)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec)) dtb__12)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__13))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__16)) (fun dom2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__17)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__14, dtb__15, dom2, cod2, dtb__18))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__19, dtb__20, dtb__21, dtb__22) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) dtb__19)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__20)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__21, dtb__22))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__23, dtb__24, dtb__25) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__23)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) dtb__24)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__25))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__26, dtb__27, dtb__28, dtb__29) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__26)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__27)) (fun t2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__28)) (fun el2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, el2, dtb__29))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__30, dtb__31, dtb__32) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__30)) (fun base2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (base2, dtb__31, dtb__32))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__33, dtb__34, dtb__35) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun fv -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (v_Base_dPair_dsecondOf fv))) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf fv), v2)))))))) dtb__34)) (fun fields2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__33, fields2, dtb__35))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__36, dtb__37, dtb__38) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__36)) (fun base2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun fv -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (v_Base_dPair_dsecondOf fv))) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf fv), v2)))))))) dtb__37)) (fun fields2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (base2, fields2, dtb__38))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__39, dtb__40) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt ec)) dtb__39)) (fun stmts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (stmts2, dtb__40))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__41, dtb__42, dtb__43) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__41)) (fun value2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (value2, dtb__42, dtb__43))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__45) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__45)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, v2))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun ec -> (fun stmt -> (match stmt with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__46, dtb__47, dtb__48) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__47)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__46, v2, dtb__48))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__49, dtb__50) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) dtb__49)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (v2, dtb__50))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun scrutVal -> (fun expected -> (fun cname -> (fun args -> (fun psp -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownConstructorInCase (cname, (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__51)) args)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (match dtb__53 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__55) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__55) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchTooManyArgs (cname))) cname) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__52)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__52) dtb__51)) ((v_Base_dList_dmap (fun v -> (((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Base_dList_dNil) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs))) (fun refsIdx -> (match (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__52) refsIdx) with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchEmptyCtx)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__52)) refsIdx) ((v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__52) dtb__51)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (cname, dtb__54, dtb__56)), dtb__57))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__52) refs2))) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__62, dtb__63, dtb__64) -> ((v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__62) dtb__63) dtb__64) dtb__61)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, dtb__66) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__66) mc4) mc5) mc6) mc7) mc8) dtb__59) (C_Base_dList_dList_Base_dList_dCons (dtb__65, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__67, dtb__68) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__59) mc10) dtb__61) dtb__67) dtb__68)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__69) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__59) mc10) dtb__61) "_") dtb__69)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__60)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc10), mc3)))))
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTy -> (fun dd -> (fun idxs -> (fun expected -> (fun rest -> (fun acc -> (fun body -> (fun pname -> (fun psp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", binds, dtb__70)), acc))), dtb__71))))) (if ((bi_eq_str pname) "_") then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) scrutTy))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))))) (if ((bi_eq_str pname) "_") then ctx else (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat alts)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase alts) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__72, dtb__73) -> (match dtb__73 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel ((bi_sub fuel) 1)) globals) ctx) dtb__75) dtb__72) dtb__74) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Base_dList_dNil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Base_dList_dNil)), (v_Base_dPair_dsecondOf alt))))) alts))) ((bi_concat "nd_scrut") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__76) -> (match dtb__76 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__77, dtb__78) -> (if (if ((bi_eq_str dtb__77) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then ((bi_eq_int (v_Base_dList_dlength dtb__78)) 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if ((bi_eq_str dtb__77) "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if ((bi_eq_str dtb__77) "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__77) dtb__78) alts) expected) sp))))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel ((bi_sub fuel) 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match dtb__80 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> (match dtb__81 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__79, dtb__83)), dtb__82))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel ((bi_sub fuel) 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (match dtb__85 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__79, dtb__84)), dtb__87))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__88 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (match dtb__90 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__92, dtb__93, dtb__94) -> (if ((bi_eq_str dtb__92) mc5) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__91) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, (C_Base_dPair_dPair_Base_dPair_dPair (mc8, dtb__96))))))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__89) mc5) mc6) mc7) mc8))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__97, dtb__98) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__91) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__89) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__101) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__91) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__89) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__102)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__90)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match mc8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc3))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive (mc5))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (if dtb__107 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__108)))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__109 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (match dtb__111 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__113, dtb__114) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__113))) dtb__112) dtb__110) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__115, dtb__116) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__115))) dtb__112) dtb__110) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__117, dtb__118) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__117) dtb__112) mc7) mc8)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__120))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__121) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__112) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__123))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__111)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun litTerm -> (fun body -> (fun rest -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel ((bi_sub fuel) 1)) globals) ctx) dtb__125) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (match dtb__127 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__124, dtb__126)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun name -> (fun body -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__130)), scrutTerm, rig)), dtb__131))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))) ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun fam -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> ((v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel ((bi_sub fuel) 1)) globals) ctx) ec) scrutTy) dtb__132) idxs) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) C_Base_dList_dList_Base_dList_dNil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__133, dtb__134) -> (((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__134) ctx) dtb__132) idxs) alts) expected) sp) scrutTerm) dtb__133)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__135, dtb__136) -> ((fun metaTy -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel ((bi_sub fuel) 1)) globals) ctx) dtb__136) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__138))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__135))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun c -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__139))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__140) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, dtb__142) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__143) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, dtb__144)))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "if condition must be ") ((bi_concat v_Vuna_dCompiler_dIntrinsics_dboolTypeName) ((bi_concat " (got ") ((bi_concat ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__143)) ")"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__145, dtb__146) -> (if ((bi_eq_str dtb__145) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), ec)))))) else (if ((bi_eq_str dtb__145) "_") then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__146) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dHoleNoExpectedType) else (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__145) dtb__146)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__147, dtb__148) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__147)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Int", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__149, dtb__150) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__149)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("String", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__151) dtb__152) dtb__153) dtb__154) dtb__155)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__156, dtb__157, dtb__158) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__156) dtb__157) dtb__158)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__159, dtb__160, dtb__161) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__161) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaNoSignature)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__162, dtb__163, dtb__164, dtb__165) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__162) dtb__165)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__167) dtb__163)) (fun pt -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__168, dtb__169) -> (match dtb__169 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__171) dtb__164)) (fun pe -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__172, dtb__173) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__175) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__170) dtb__174)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__166, dtb__168, dtb__172)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, ec4))))))))
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
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__176, dtb__177, dtb__178, dtb__179) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__176) dtb__177) dtb__178) dtb__179)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__180, dtb__181) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__180, dtb__181)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) e2)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__182, dtb__183, dtb__184) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__182) dtb__183) dtb__184)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__185, dtb__186, dtb__187) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__187) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordFieldAccessUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__188, dtb__189, dtb__190) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__190) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordsUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__191, dtb__192, dtb__193) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__193) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordUpdateUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__194, dtb__195) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__195) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDoUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__196, dtb__197, dtb__198) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__196) dtb__197) dtb__198)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun ty -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> (match dtb__200 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> ((fun tyVal -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__202) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, dtb__204) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__204))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__199))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun implicit -> (fun dom -> (fun cod -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__208) cod)) (fun pc -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__209, dtb__210) -> (match dtb__210 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, dtb__212) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__205)), dtb__205, dtb__209)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (((v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__207) dtb__211))), dtb__212))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__205) ctx))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__213, dtb__214) -> (if ((bi_eq_str dtb__213) "->") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (match dtb__216 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (match dtb__218 with
  | C_Base_dList_dList_Base_dList_dNil -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel ((bi_sub fuel) 1)) globals) ctx) ec) "_") false) dtb__215) dtb__217) sp)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)) args) else (if ((bi_eq_str dtb__213) "Type") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__219, dtb__220) -> (match dtb__219 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__221, dtb__222) -> (match dtb__220 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_lt_int dtb__221) 0) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__222) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUniverseLevelNonNegative) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__221))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__221)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__214) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__214) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__214) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)) args) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__223, dtb__224) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__223) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__225) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__223) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__226) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__226))) args) sp)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__230)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__223))) dtb__227), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__223) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__231) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__223) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__232))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__231)) args) sp)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> (match dtb__234 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__236)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__223))) dtb__233), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__224) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__223))) dtb__223)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__237, dtb__238) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__237) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__239) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__237) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__240) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__240))) args) sp)) (fun pa -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (match dtb__242 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__244)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__237))) dtb__241), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__237) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__245) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__237) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__246) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__246))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__245)) args) sp)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> (match dtb__248 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__250)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__237))) dtb__247), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__238) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__237))) dtb__237)
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
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__251, dtb__252) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__251) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__253) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__253))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) sp)
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255) -> (match dtb__255 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__256, dtb__257) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) dtb__257) dtb__256) args) sp)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> (match dtb__259 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__261) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__261)) dtb__254) dtb__258), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__261))))))
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
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> (if dtb__263 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__265) then (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__265) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__265) dtb__266) args) sp) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__265) args) sp)) (fun ec0 -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__267) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__265)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec0) dtb__265) dtb__266) args) sp) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__265)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec0) dtb__265) dtb__266) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__267))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__268) -> (match dtb__268 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__269, dtb__270) -> ((fun ty2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__270) ty2) args) sp)) (fun q -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__271, dtb__272) -> (match dtb__272 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__273, dtb__274) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__269, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__271)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__273, dtb__274))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__266) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__269)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__265)) sp))))) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__265) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__276) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__266) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__275))) args) sp)) (fun p -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__277, dtb__278) -> (match dtb__278 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__277)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__281, dtb__282) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__281) dtb__265)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) dtb__284) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__266) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__283))) dtb__282) sp)) (fun q -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, dtb__286) -> (match dtb__286 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__265))), dtb__285)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288))))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__289, dtb__290) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__289)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__291, dtb__292) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo ((bi_sub fuel) 1)) globals) ctx) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__292) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__292) dom))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__291))) args) sp)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, dtb__294) -> (match dtb__294 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__295, dtb__296) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__291, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__293)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__295, dtb__296))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel -> (fun globals -> (fun ec -> (fun ctx -> (fun dom -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__297) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__298) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__299, dtb__300) -> (match dtb__300 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__297) dtb__298) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__299) (v_Vuna_dCompiler_dElab_dTypes_decSols ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__301) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__299) C_Base_dList_dList_Base_dList_dNil) dtb__301) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__302) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__302))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__303) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__297) dtb__298) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) ec) ctx) dtb__297) dtb__298) args) sp)
)) dtb__297)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel -> (fun globals -> (fun ec -> (fun ctx -> (fun argTy -> (fun argKind -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Base_dList_dCons (dtb__304, dtb__305) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__306) -> (match dtb__306 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__308) -> (match dtb__308 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__309, dtb__310) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__310) ctx) argTy) argKind) dtb__305) sp) else (if (((((v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__310) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__310) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__311) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__311))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__312) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__310) ctx) argTy) argKind) dtb__305) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel ((bi_sub fuel) 1)) globals) dtb__310) ctx) argTy) argKind) dtb__305) sp)))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__310) dtb__309))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__313) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__304))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__314, dtb__315, dtb__316) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__315)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, dtb__318) -> (match dtb__318 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, dtb__320) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__320) dtb__314) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__317))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__321, dtb__322) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__321, dtb__322)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) e2) expected)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__323, dtb__324, dtb__325, dtb__326) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__323) dtb__324) dtb__325) expected) dtb__326)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__327, dtb__328, dtb__329) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__327) dtb__328) expected) dtb__329)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__330, dtb__331, dtb__332, dtb__333) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__339, dtb__340, dtb__341) -> (match dtb__339 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__342, dtb__343) -> (if ((bi_eq_str dtb__342) "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected) else (if ((bi_eq_str dtb__342) "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__339) dtb__340) expected) dtb__341)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__339) dtb__340) expected) dtb__341)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__344, dtb__345, dtb__346) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__344) dtb__345) expected) dtb__346)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__347, dtb__348) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__349, dtb__350) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__351, dtb__352) -> (if ((bi_eq_str dtb__351) "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__353, dtb__354) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__353, dtb__354))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__352) expected)) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__351, dtb__352))) C_Base_dList_dList_Base_dList_dNil) expected) dtb__352))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) expected)
)) expr))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel ((bi_sub fuel) 1)) globals) ctx) ec) binds2) body) rec_u) sp))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__355, dtb__356) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__355) dtb__356) mc5) mc6) mc7) mc8))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun bind -> (fun rest -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__357, dtb__358) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> (match dtb__360 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__361, dtb__362) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__362) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__363, dtb__364) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__357, rig, dtb__363)), dtb__359, rig)), dtb__364))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__357) dtb__361) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__365) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__366, dtb__367) -> (match dtb__367 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel ((bi_sub fuel) 1)) globals) ctx) dtb__369) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__370))), dtb__366, rig)), dtb__371))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((v_Base_dPair_dsecondOf bind), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf bind), (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (rest, body, rec_u, sp)))), C_Base_dList_dList_Base_dList_dNil)), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))))) expected)
))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__372, dtb__373) -> (match dtb__372 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (match dtb__374 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__376, dtb__377) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__376) dtb__375) dtb__373) body) rec_u) sp)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__378) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__375) dtb__373) body) rec_u) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__375, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__373, body, rec_u, sp)))), C_Base_dList_dList_Base_dList_dNil)), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__374))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__379, dtb__380) -> (match dtb__380 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__381, dtb__382) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx2) dtb__382) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__383, dtb__384) -> (match dtb__384 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__385, dtb__386) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__383)), dtb__379, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__385, dtb__386))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__381) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__381))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv))))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__387, dtb__388) -> (match dtb__388 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__389, dtb__390) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel ((bi_sub fuel) 1)) globals) ctx) dtb__390) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__391, dtb__392) -> (match dtb__392 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, dtb__394) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__391))), dtb__387, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, dtb__394))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__395) -> (match dtb__395 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__396, dtb__397) -> (match dtb__397 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__398, dtb__399) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__399) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__398) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__400) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) ((bi_concat ": ") dtb__400))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__401) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__396, ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__401)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__402) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__402))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__403, dtb__404) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel ((bi_sub mc0) 1)) mc1) ctx2) mc3) dtb__404) mc5) expected2) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__410, dtb__411) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__403, lamRig, dtb__410)), dtb__411))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__406) dtb__408))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__409) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__403) dtb__408) mc2))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__405) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaTooManyParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__412, dtb__413, dtb__414) -> (match dtb__412 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__415, dtb__416) -> (if (if ((bi_eq_str dtb__415) "->") then true else ((bi_eq_str dtb__415) "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__415) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__417) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__415) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__415) dtb__413) dtb__416) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__418) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__419) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__419))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__420, dtb__421) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__420) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__422) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__420) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__423) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__423))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__424) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__420)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, ec))))))
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
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__425, dtb__426) -> (match dtb__426 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__427, dtb__428) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__429) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__425, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__429, dtb__428))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedType (((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__427)))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__427))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__428) dtb__427))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__430, dtb__431) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__430) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__432) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__430) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__430) args) expected) dtb__431) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__433) -> (match dtb__433 with
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__434) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__435) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__430) args) expected) dtb__431)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) dtb__430)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel ((bi_sub fuel) 1)) globals) ctx) ec) fn) args) expected) sp)
))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__436, dtb__437) -> (match dtb__437 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__439) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__438)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__436, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p))))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__440) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__440)) args) sp)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__441, dtb__442) -> (match dtb__442 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__444) dtb__443)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__445) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__441), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__445, dtb__444))))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__446, dtb__447) -> (match dtb__447 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__448, dtb__449) -> (match dtb__449 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__446)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__450, dtb__451) -> (match dtb__451 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__452, dtb__453) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__453) dtb__448)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__454, dtb__455) -> (match dtb__455 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__456, dtb__457) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__457) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__452) dtb__456)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__450) dtb__454) sp) dtb__452) ec3)))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__458, dtb__459) -> (match dtb__459 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__460, dtb__461) -> (match dtb__461 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__458)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__462, dtb__463) -> (match dtb__463 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, dtb__465) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__465) dtb__460)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__466, dtb__467) -> (match dtb__467 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__468, dtb__469) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__469) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__464) dtb__468)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__462) dtb__466) sp) dtb__464) ec3)))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__470) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__470))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__471) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__471))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (if ((bi_eq_str name) "&&") then true else ((bi_eq_str name) "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__472, dtb__473) -> (match dtb__473 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__474, dtb__475) -> (match dtb__475 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__472) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, dtb__477) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel ((bi_sub fuel) 1)) globals) ctx) dtb__477) dtb__474) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__478, dtb__479) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__476) dtb__478), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__479))))))))
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
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__480, dtb__481) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__480) args) sp)) (fun mspec -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel ((bi_sub fuel) 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__482) -> (match dtb__482 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, dtb__484) -> (match dtb__484 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__485, dtb__486) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__486) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__485)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, ec2))))))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__487) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel ((bi_sub fuel) 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__487))) args) sp)) (fun pa -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__488, dtb__489) -> (match dtb__489 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__490, dtb__491) -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__491) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__490) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__492) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__492)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__488), dtb__492))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__493) -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (name, dtb__493))) name) dtb__493)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))))))))
