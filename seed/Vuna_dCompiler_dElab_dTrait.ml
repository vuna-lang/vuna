open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
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
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (int t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTrait_dInstClash = C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) mc1) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__0) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind dtb__0) mc1)) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__5) (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__5)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__9) dtb__3) (C_Base_dList_dList_Base_dList_dCons (dtb__6, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), mc2))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals -> (fun ec -> (fun params -> (fun methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams params) methods) v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__10)) dtb__11)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__12), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__13) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys -> (fun ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty)))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__14), (v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodType dtb__14))), (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__15)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (match dtb__16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName mc0)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__20))))))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__17) dtb__21)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname -> (fun pname -> (fun pKind -> (fun methods -> (fun fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor -> (fun fieldIdx -> (fun rigs -> (fun nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_p", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, lamArgs))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (C_Base_dList_dList_Base_dList_dCons (alt, C_Base_dList_dList_Base_dList_dNil)))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((bi_sub ((bi_sub nFields) 1)) fieldIdx))))) arity)) (v_Base_dList_dlength rigs))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (if dtb__23 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__26) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__26)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (match dtb__27 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, ((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__31)) mc4))), (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) dtb__28) dtb__32) ((bi_add mc3) 1)) mc4)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname -> (fun pname -> (fun methods -> (fun fieldTys -> (fun nFields -> (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) methods) fieldTys) 0) nFields))))))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (match dtb__33 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__35, dtb__36, dtb__37, dtb__38) -> (if ((bi_neq_int (v_Base_dList_dlength dtb__36)) 1) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__38) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterfaceOneParam) else ((fun methodsP -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) dtb__36) methodsP)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, (C_Base_dPair_dPair_Base_dPair_dPair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_dTypes_decAddClass ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__40) dd)) cls))) (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__35, dtb__36, projs, dtb__39)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs dtb__35) pname) methodsP) dtb__39) (v_Base_dList_dlength dtb__37)))) ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), (v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m))))) dtb__37))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections dtb__35) pname) pKind) methodsP) dtb__39))) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Base_dList_dNil)))))) (v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys dtb__39) dapp))))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName dtb__35))) (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName dtb__35))) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind pname) methodsP))) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf dtb__36))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__37)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__34) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__44, dtb__45) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__44, dtb__42))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__46, dtb__47) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__48, dtb__49, dtb__50) -> (match dtb__49 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (match dtb__48 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__53, dtb__54) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__51))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__55) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceContextNotDict)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__56)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__57, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__83, dtb__84, dtb__85) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__83) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__84) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__86) dtb__87)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__88, dtb__89) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__88))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__90) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__91) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__93))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (if ((bi_ge_int dtb__94) 97) then ((bi_le_int dtb__94) 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__96, dtb__97, dtb__98) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__96)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__97))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__101)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__102))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__104, dtb__105, dtb__106) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__104)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__105))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__107, dtb__108) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__107) then (C_Base_dList_dList_Base_dList_dCons (dtb__107, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (if ((v_Base_dList_dmemName dtb__109) dtb__110) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__110) else (C_Base_dList_dList_Base_dList_dCons (dtb__109, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__110))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__111) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__112) else (C_Base_dList_dList_Base_dList_dCons (dtb__111, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__112))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf = (fun banned -> (fun combined -> (fun exprs -> ((fun vars -> ((v_Base_dList_dmap (fun v -> (C_Base_dPair_dPair_Base_dPair_dPair (v, ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))))) vars)) (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__113 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__114) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__115) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__116)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ((bi_concat "_ctx") (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__117))) mc0)) dtb__118) ((bi_add mc2) 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__121, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__120)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body -> (fun remaining -> (fun k -> (if ((bi_le_int remaining) 0) then body else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) ((bi_sub remaining) 1)) ((bi_add k) 1))))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body -> (fun nCtx -> (fun k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) ((bi_sub nCtx) k)) k))))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info -> (fun ctor -> (fun fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (ctor, ((v_Base_dList_dmap (fun t -> (C_Base_dPair_dPair_Base_dPair_dPair (t, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))) fields)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__123), mc0))) dtb__124) ((bi_sub mc2) 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__125, dtb__126) -> (match dtb__125 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, dtb__128) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__127, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__128, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__126)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) ((bi_sub nCtx) 1)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__129, dtb__130) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__129))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__131, dtb__132, dtb__133) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__134)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (match dtb__136 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__138, dtb__139, dtb__140, dtb__141) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__138)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__137) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__137)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls))) methods)))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match dtb__142 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__144, dtb__145, dtb__146, dtb__147) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__144)) mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__143))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__143)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf dtb__148))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__149) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__148))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) methods)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (match dtb__152 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__154, dtb__155, dtb__156, dtb__157) -> (if ((bi_eq_str dtb__154) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__151))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__151)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__158)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__158))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__159))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname -> (fun mname -> (fun decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> (match dtb__160 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__161, dtb__162, dtb__163, dtb__164) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__163)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls -> (fun arg -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__165)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__166))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__167 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__169) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface (dtb__169))) dtb__169)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) mc2) mc5) dtb__170)) (fun q -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__172, dtb__173) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys mc0) mc1) mc2) dtb__168) mc4) dtb__175)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__171) dtb__172), dtb__176)), dtb__177))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc5))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes -> (fun globals -> (fun defined -> (fun ec0 -> (fun sp -> (fun cls -> (fun argExpr -> (fun ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun tele -> ((fun teleCtx0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) teleCtx0) ec0) argExpr)) (fun q -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys classes) globals) teleCtx0) ctxParts) sp) dtb__181)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__182, dtb__178, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__178))), dtb__183))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf banned) combined) (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs))))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("#inst", sp)), (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs)), sp)))) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dsecondOf p))) ctxParts))))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes -> (fun globals -> (fun defined -> (fun ec0 -> (fun sp -> (fun headExpr -> (fun ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Base_dPair_dfirstOf dtb__184)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface ((v_Base_dPair_dfirstOf dtb__184)))) (v_Base_dPair_dfirstOf dtb__184))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__187 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> (match ctxParts with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dTrait_dinstanceMono headExpr) then (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__186) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__185), C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__188, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__185) dtb__188))), ec0))))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__185) dtb__186) ctxParts))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__185) dtb__186) ctxParts)
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)) (v_Base_dPair_dsecondOf dtb__184))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__189), dtb__191)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__190) dtb__192)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys cls)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__193, dtb__194, dtb__195) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__193), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__194), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__195)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__196, dtb__197) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__196), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt mc0) mc1) alt))) dtb__197)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__198, dtb__199) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__198, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__199)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__200, dtb__201, dtb__202) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__200), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__201), dtb__202))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__203, dtb__204, dtb__205) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__203, dtb__204, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) ((bi_add mc1) 1)) dtb__205)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__206, dtb__207, dtb__208, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__209), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) ((bi_add mc1) 1)) dtb__210)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__211, dtb__212) -> (if ((bi_eq_int dtb__212) mc1) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) mc0) else mc2)
  | _ -> mc2
))))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__213, dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__213, dtb__214, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) ((bi_add mc1) (v_Base_dList_dlength dtb__214))) dtb__215)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam = (fun arg -> (fun t -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) 0) t)))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (match dtb__216 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__218, dtb__219, dtb__220, dtb__221) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__218)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__217) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__219, dtb__220)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__217) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__217) mc2)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname -> (fun decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__222) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__223) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__224, dtb__225) -> (if ((bi_ge_int mc4) mc1) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__224 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__227)) mc2) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) ((bi_add mc4) 1)) dtb__225))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx -> (fun nCtx -> (fun dom -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__230, dtb__231) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__230) (v_Vuna_dCompiler_dElab_dTypes_decSols mc2)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__229) mc4) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__231) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__229) (C_Base_dList_dList_Base_dList_dCons (dtb__228, mc4))) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__233) -> ((fun k -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__230) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), ((bi_add ((bi_sub (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) mc1)) k), C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__234) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__234))) dtb__229) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, k)), mc5)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__235) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__229) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub ((bi_sub mc1) 1)) dtb__233))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc2) (v_Base_dList_dreverse mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx -> (fun nCtx -> (fun nTele -> (fun ec -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil) acc))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> (match dtb__236 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__238, dtb__239) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__237) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__238) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__239)) ((bi_add ((bi_sub dtb__239) mc0)) 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__240, dtb__241) -> (match dtb__240 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__242, dtb__243) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__243) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__244) -> (match dtb__244 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__246) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__246)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__246)) 0) dtb__242) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__245)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__247) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__241) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__245)), mc5))) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__246) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__247)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__248) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__241) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__245)), mc5))) dtb__246)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__249) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceContextMissing ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__243)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__243))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__243) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__241) (C_Base_dList_dList_Base_dList_dCons (dtb__240, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc6) (v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals -> (fun ctx -> (fun sp -> (fun goals -> (fun acc -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) C_Base_dList_dList_Base_dList_dNil) acc) ec)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__250, dtb__251, dtb__252) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__250), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__251), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__252)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__253, dtb__254) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__253), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__254)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__255, dtb__256) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__255, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__256)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__257, dtb__258, dtb__259) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__257), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__258), dtb__259))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__260, dtb__261, dtb__262) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__260, dtb__261, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) ((bi_add mc2) 1)) dtb__262)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__263, dtb__264, dtb__265, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__266), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) ((bi_add mc2) 1)) dtb__267)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__268) -> (if ((bi_eq_int dtb__268) mc0) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
)))))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__269, dtb__270, dtb__271) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__269, dtb__270, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) ((bi_add mc2) (v_Base_dList_dlength dtb__270))) dtb__271)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m -> (fun rep -> (fun t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__272, dtb__273) -> (match dtb__272 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__274, dtb__275) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__273) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__274) dtb__275) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__276, dtb__277) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__276))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__278) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__279) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__280, dtb__281) -> (match dtb__280 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__282, dtb__283, dtb__284) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__283) mc2) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__282, dtb__283, (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__284)))), dtb__281)) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__282, dtb__283, dtb__284)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__281))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (mc1, mc2, C_Base_dList_dList_Base_dList_dNil)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__285, dtb__286) -> (match dtb__285 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__287, dtb__288) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__288) then (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__287) (v_Vuna_dCompiler_dElab_dTypes_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__289) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__286) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__286) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__287) dtb__288) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__286) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> (if dtb__291 then ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__294)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec -> (fun name -> (fun level -> (fun m -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__295) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__295))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__296) -> ec
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__297, dtb__298) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__298) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__297) mc0) mc1) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__299, dtb__300) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__299)) mc1) mc2) dtb__300)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n -> (fun x -> (fun xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Base_dList_dCons (x, C_Base_dList_dList_Base_dList_dNil)))) ((v_Base_dList_ddrop n) xs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> (if ((bi_le_int fuel) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__301, dtb__302, dtb__303) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__301, dtb__302, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) 1)) dtb__303)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__304, dtb__305, dtb__306, dtb__307, dtb__308) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__304, dtb__305, dtb__306, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__307), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) 1)) dtb__308)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__309, dtb__310, dtb__311) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__309), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__310), dtb__311))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__312) -> (match dtb__312 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__313, dtb__314) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__313) dtb__314)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__315, dtb__316) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__315, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__316)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__317, dtb__318) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__317), ((v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) alt))) dtb__318)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__319, dtb__320, dtb__321) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__319), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__320), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__321)))
  | _ -> t
))))))))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> (if ((bi_le_int fuel) 0) then alt else (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__322, dtb__323, dtb__324) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__322, dtb__323, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) (v_Base_dList_dlength dtb__323))) dtb__324)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g)) else ((fun args2 -> (if (if (if ((bi_eq_str g) defName) then ((bi_gt_int (v_Base_dList_dlength args2)) appPos) else false) then ((bi_gt_int depth) appPos) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((bi_sub ((bi_sub depth) appPos)) 1))), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName -> (fun dName -> (fun appPos -> (fun t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName -> (fun ec -> (fun ty -> (fun body -> (fun baseIdx -> (fun nGroups -> (fun k -> (fun groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__325, dtb__326) -> (match dtb__325 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__327, dtb__328, dtb__329) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) ((bi_add k) 1)) dtb__326)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__329))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__327))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) ((bi_add baseIdx) 2)) dtb__329) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) ((bi_add baseIdx) 1)) body2))) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__327) dName) ((bi_add baseIdx) 2)) (((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__328)))) ((bi_add ((bi_add baseIdx) 1)) ((bi_sub ((bi_sub nGroups) 1)) k)))) ((bi_concat "d") (bi_strFromInt dtb__327)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (ty, (C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups)))))))))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName -> (fun ec -> (fun ty -> (fun body -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((bi_sub (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty)) 1)))) (v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))))))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__330, dtb__331) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__330)) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__331)) else (C_Base_dList_dList_Base_dList_dCons (dtb__330, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__331))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__332, dtb__333) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__332)) dtb__333)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo = (fun remaining -> (fun i -> (if ((bi_le_int remaining) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("#tele", i, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo ((bi_sub remaining) 1)) ((bi_add i) 1)))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual = (fun ec -> (fun n -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) a)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__334) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__335) -> false
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__336, dtb__337) -> (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__336))) mc1) then (if ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__336)) then true else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__337)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__337))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet = (fun ec -> (fun n -> (fun head -> (fun inst -> (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele inst))) n) then ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) n) head) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst)) else false)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo = (fun remaining -> (fun i -> (if ((bi_le_int remaining) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (((bi_concat "#ov") (bi_strFromInt i)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo ((bi_sub remaining) 1)) ((bi_add i) 1)))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne = (fun ec -> (fun teleA -> (fun hA -> (fun teleB -> (fun hB -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339) -> ((fun envA -> ((fun envB -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__339)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__339)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__340) -> (C_Base_dPair_dPair_Base_dPair_dPair (true, ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__339) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__340))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__341) -> (C_Base_dPair_dPair_Base_dPair_dPair (false, dtb__339))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv (v_Base_dList_dlength teleB)))) ((v_Base_dList_dmap (fun m -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Base_dList_dNil)))) dtb__338))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap = (fun ec -> (fun tele1 -> (fun h1 -> (fun tele2 -> (fun h2 -> (match tele1 with
  | C_Base_dList_dList_Base_dList_dNil -> (match tele2 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) 0) h1) h2), ec))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele1) h1) tele2) h2)
))))))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__342, dtb__343) -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__344, dtb__345) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__344) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__345) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__346, dtb__347) -> (if dtb__346 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__347)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__345))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__344)) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__344))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__348, dtb__349) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__348) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__349) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__350, dtb__351) -> (if dtb__350 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__351)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__349))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__348)) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__348))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash = (fun ec -> (fun name -> (fun tele -> (fun head -> (fun seen -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else (if ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact ec) (v_Base_dList_dlength tele)) head) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap ec) tele) head) seen))))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__352, dtb__353) -> (match dtb__352 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__354, dtb__355) -> (match dtb__354 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__356, dtb__357, dtb__358, dtb__359) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Base_dList_dCons (dtb__352, dtb__353))))) mc3) dtb__359) dtb__357) dtb__356)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__360, dtb__361) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (match dtb__362 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__353) mc1) mc2) dtb__363) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Base_dList_dCons (inst, mc5))) (C_Base_dList_dList_Base_dList_dCons (inst, mc6)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__364) -> (match dtb__364 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__359) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOverlappingInstances (iname))) iname)
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__359) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash dtb__361) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__360)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__360)) mc6))) (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__360), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__360), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__360))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__360))) ((v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__360)) dtb__357))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__353) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls -> (fun classes -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs -> (fun name -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__365) -> dtb__365
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__366, dtb__367) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__366)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> (match dtb__369 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> (match dtb__371 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> (match dtb__373 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__367) ((v_Base_dList_dappend mc1) dtb__370)) dtb__375) (C_Base_dList_dList_Base_dList_dCons (dtb__368, mc3))) ((v_Base_dList_dappend dtb__370) mc4)) (C_Base_dList_dList_Base_dList_dCons (dtb__372, mc5))) ((v_Base_dList_dappend dtb__374) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), mc2))))))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__376, dtb__377) -> (match dtb__376 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, dtb__379) -> (if ((bi_eq_str dtb__378) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__379)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault = (fun globals -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__380) -> dtb__380
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore -> (fun ecAfter -> (fun srcSpan -> (fun gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault gs) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (v_Base_dPair_dfirstOf g))), srcSpan)))) gs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__381, dtb__382) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem (v_Base_dPair_dfirstOf dtb__381)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__382) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__382) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf dtb__381), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault mc0) (v_Base_dPair_dfirstOf dtb__381)), (v_Base_dPair_dsecondOf dtb__381), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (v_Base_dPair_dfirstOf dtb__381)) mc2))), mc4))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals -> (fun ec -> (fun srcSpans -> (fun sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo globals) (v_Vuna_dCompiler_dCommon_dtblOfNames ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__383, dtb__384) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (if dtb__386 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__388) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__385) dtb__388) dtb__389) (C_Base_dList_dList_Base_dList_dCons (dtb__383, dtb__384))) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind)) else (match dtb__383 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__390, dtb__391) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__390) dtb__384) mc5) dtb__388) dtb__389) mc7)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__392) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) "_") dtb__384) mc5) dtb__388) dtb__389) mc7)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__383)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefParamsMustBeVars)
))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefMoreParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (if dtb__394 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__396) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__393) dtb__396) dtb__397) C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6) mc7))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun dom -> (fun clo -> (fun pats -> (fun body -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel ((bi_sub fuel) 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__398, dtb__399) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__398)), dtb__399))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun body -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else (match body with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__400, dtb__401, dtb__402) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
  | _ -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (if dtb__404 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__406) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__403) dtb__406) dtb__407) C_Base_dList_dList_Base_dList_dNil) body) sp) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind)) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body2) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__407) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__408, dtb__409) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (etaName, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__406), dtb__408)), dtb__409))))
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (body, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (etaName, sp)), C_Base_dList_dList_Base_dList_dNil)), sp)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__406) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ((bi_concat "_arity") (bi_strFromInt lvl)))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
)
)))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun pname -> (fun pats -> (fun body -> (fun dom -> (fun clo -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel ((bi_sub fuel) 1)) globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__410, dtb__411) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, dtb__410)), dtb__411))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dom))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals -> (fun ctx0 -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals -> (fun ctx0 -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__412, dtb__413) -> (match dtb__412 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__414, dtb__415) -> (match dtb__413 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__414) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__414) dtb__415) expected) sp) else ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine sp)))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals -> (fun ctx -> (fun ec -> (fun mty -> (fun clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__416, dtb__417) -> (match dtb__416 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc10) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__421) dtb__417) mc5) mc6) mc7) (C_Base_dList_dList_Base_dList_dCons (dtb__420, mc8))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc9))) mc10)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam mc6) dtb__419)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__418) mc7))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc8), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc9), mc3))))))
  | _ -> failwith "DT: impossible branch"
))))))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals -> (fun cls -> (fun ctx -> (fun nCtx -> (fun headArg -> (fun ec -> (fun methods -> (fun sp -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassParams cls))) headArg) methods) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) sp)))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun instDecls -> (fun allDecls -> (fun globals -> (fun classes -> (fun datas -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__422, dtb__423) -> (match dtb__422 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__424, dtb__425, dtb__426, dtb__427) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig classes) globals) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) instDecls))) ec) dtb__427) dtb__425) dtb__424)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__428)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__427) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__430) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__430) dtb__426) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__431) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__427) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceUnknownMethod (dtb__431))) dtb__431)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__430) dtb__426) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__432) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__430)) dtb__432) allDecls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__433) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__433) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__427) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) dtb__430) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArg dtb__428)) dtb__429) dtb__426) dtb__427)) (fun q -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__434, dtb__435) -> (match dtb__435 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__436, dtb__437) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) dtb__427) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) C_Base_dList_dList_Base_dList_dNil) ec2)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__439) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__428))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf dtb__428) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__430))) fields2))) ((v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__430)) dtb__425))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__438)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__434))) (v_Base_dPair_dsecondOf solvedCtx))) (v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__437) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((bi_add nTele) nCtx))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__428)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__428)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx dtb__428))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__423) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals -> (fun ec -> (fun mty -> (fun clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses)))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__440, dtb__441) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__440, dtb__441))) mc1) mc4) mc2) mc3) mc5) dtb__440)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__442, dtb__443) -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__441) mc1) mc2) mc3) ((v_Base_dList_dappend mc4) dtb__442)) ecTbl) ((v_Base_dList_dappend newDefs) mc6))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__443) ((v_Vuna_dCompiler_dCommon_dtblInsertAll dtb__442) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__443))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__443) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__440)))) dtb__442))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), mc5))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) C_Base_dList_dList_Base_dList_dNil)) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair (d, (v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d))))) allDecls)) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__444, dtb__445) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__444, dtb__445))) C_Base_dList_dList_Base_dList_dNil) mc3) mc1) mc2) mc4) dtb__444)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__445) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__446)) dtb__447) ((v_Base_dList_dappend dtb__446) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))))))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))
