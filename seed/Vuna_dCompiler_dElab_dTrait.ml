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

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (match dtb__14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName mc0)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__16))))))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__15) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname -> (fun pname -> (fun pKind -> (fun methods -> (fun fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor -> (fun fieldIdx -> (fun rigs -> (fun nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_p", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, lamArgs))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (C_Base_dList_dList_Base_dList_dCons (alt, C_Base_dList_dList_Base_dList_dNil)))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((bi_sub ((bi_sub nFields) 1)) fieldIdx))))) arity)) (v_Base_dList_dlength rigs))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> (if dtb__21 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__24) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__24)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (match dtb__25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, ((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__27)) mc4))), (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) dtb__26) dtb__28) ((bi_add mc3) 1)) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname -> (fun pname -> (fun methods -> (fun fieldTys -> (fun nFields -> (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) methods) fieldTys) 0) nFields))))))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__33, dtb__34, dtb__35, dtb__36) -> (if ((bi_neq_int (v_Base_dList_dlength dtb__34)) 1) then ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 dtb__36) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInterfaceOneParam) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) dtb__34) dtb__35)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, (C_Base_dPair_dPair_Base_dPair_dPair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_dTypes_decAddClass ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__38) dd)) cls))) (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__33, dtb__34, projs, dtb__37)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs dtb__33) pname) dtb__35) dtb__37) (v_Base_dList_dlength dtb__35)))) ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf m), dtb__36)))) dtb__35))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections dtb__33) pname) pKind) dtb__35) dtb__37))) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Base_dList_dNil)))))) (v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys dtb__37) dapp))))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName dtb__33))) (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName dtb__33))) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind pname) dtb__35))) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf dtb__34))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__32) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadName = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__39, dtb__40) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__44, dtb__45) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dargSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dElab_dTrait_dexprNameFor dtb__46)) (v_Vuna_dCompiler_dElab_dTrait_dargSuffix dtb__47)))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dexprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__48, dtb__49) -> dtb__48
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__50, dtb__51) -> (bi_strFromInt dtb__50)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__52, dtb__53) -> dtb__52
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__54, dtb__55, dtb__56) -> ((bi_concat (v_Vuna_dCompiler_dElab_dTrait_dexprNameFor dtb__54)) (v_Vuna_dCompiler_dElab_dTrait_dargSuffix dtb__55))
  | _ -> "X"
))

let v_Vuna_dCompiler_dElab_dTrait_dderivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__57, dtb__58, dtb__59) -> (match dtb__57 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__60, dtb__61) -> ((bi_concat dtb__60) (v_Vuna_dCompiler_dElab_dTrait_dargSuffix dtb__58))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__62, dtb__63) -> dtb__62
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceName = (fun cname -> (fun headExpr -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dTrait_dderivedInstName headExpr)))))

let v_Vuna_dCompiler_dElab_dTrait_dargNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__64, dtb__65) -> dtb__64
  | _ -> "Int"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__66, dtb__67) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__68, dtb__69, dtb__70) -> (match dtb__68 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__71, dtb__72) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, dtb__69))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__73, dtb__74, dtb__75) -> (match dtb__74 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__73 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__78, dtb__79) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__76))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) e))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__80) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 mc0) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceContextNotDict)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__81)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__82, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> dtb__89
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__108, dtb__109) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__108))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__110, dtb__111, dtb__112) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__110) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__111) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__113) dtb__114)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__115) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__116) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__118) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__118))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (if ((bi_ge_int dtb__119) 97) then ((bi_le_int dtb__119) 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__121) then (C_Base_dList_dList_Base_dList_dCons (dtb__121, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__123, dtb__124, dtb__125) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__123)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__124))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__128)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__129))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__131, dtb__132, dtb__133) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__131)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__132))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> (if ((v_Base_dList_dmemName dtb__134) dtb__135) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__135) else (C_Base_dList_dList_Base_dList_dCons (dtb__134, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__135))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__136) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__137) else (C_Base_dList_dList_Base_dList_dCons (dtb__136, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__137))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf = (fun banned -> (fun combined -> (fun exprs -> ((fun vars -> ((v_Base_dList_dmap (fun v -> (C_Base_dPair_dPair_Base_dPair_dPair (v, ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))))) vars)) (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (match dtb__138 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__139) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__140) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__141)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ((bi_concat "_ctx") (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__142))) mc0)) dtb__143) ((bi_add mc2) 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__144 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__146, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__145)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body -> (fun remaining -> (fun k -> (if ((bi_le_int remaining) 0) then body else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) ((bi_sub remaining) 1)) ((bi_add k) 1))))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body -> (fun nCtx -> (fun k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) ((bi_sub nCtx) k)) k))))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info -> (fun ctor -> (fun fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (ctor, ((v_Base_dList_dmap (fun t -> (C_Base_dPair_dPair_Base_dPair_dPair (t, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))) fields)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__148), mc0))) dtb__149) ((bi_sub mc2) 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__152, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__153, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__151)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) ((bi_sub nCtx) 1)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__154, dtb__155) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__154))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__156, dtb__157, dtb__158) -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTrait_dargNameOf dtb__159)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)) e))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match dtb__161 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__163, dtb__164, dtb__165, dtb__166) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__163)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__162) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__162)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls))) methods)))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__167 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__169, dtb__170, dtb__171, dtb__172) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__169)) mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__168))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__168)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf dtb__173))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__174) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__173))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) methods)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls -> (fun arg -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__175)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__176))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__177 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__179) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 mc4) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnknownInterface (dtb__179))) dtb__179)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) mc2) mc5) dtb__180)) (fun q -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (match dtb__183 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys mc0) mc1) mc2) dtb__178) mc4) dtb__185)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__181) dtb__182), dtb__186)), dtb__187))))
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
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceCtxTys classes) globals) teleCtx0) ctxParts) sp) dtb__191)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__192, dtb__188, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__188))), dtb__193))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf banned) combined) (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs))))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("#inst", sp)), (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs)), sp)))) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dsecondOf p))) ctxParts))))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes -> (fun globals -> (fun defined -> (fun ec0 -> (fun sp -> (fun headExpr -> (fun ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Base_dPair_dfirstOf dtb__194)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dUnknownInterface ((v_Base_dPair_dfirstOf dtb__194)))) (v_Base_dPair_dfirstOf dtb__194))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__197 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> (match ctxParts with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dTrait_dinstanceMono headExpr) then (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__196) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__195), C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__198, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__195) dtb__198))), ec0))))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__195) dtb__196) ctxParts))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__195) dtb__196) ctxParts)
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceHeadNotApp)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceHeadNotApp)
)) (v_Base_dPair_dsecondOf dtb__194))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__199), dtb__201)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__200) dtb__202)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys cls)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo = (fun arg -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__203, dtb__204) -> (if ((bi_eq_int dtb__204) depth) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) depth) arg) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__205, dtb__206, dtb__207, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__208), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) ((bi_add depth) 1)) dtb__209)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__210, dtb__211, dtb__212) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__210, dtb__211, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) ((bi_add depth) 1)) dtb__212)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__213, dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__213), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__214), dtb__215))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__216, dtb__217) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__216, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__217)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__218, dtb__219) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__218), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt arg) depth) alt))) dtb__219)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__220, dtb__221, dtb__222) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__220), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__221), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) depth) dtb__222)))
  | _ -> t
))))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt = (fun arg -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__223, dtb__224, dtb__225) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__223, dtb__224, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) ((bi_add depth) (v_Base_dList_dlength dtb__224))) dtb__225)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam = (fun arg -> (fun t -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) 0) t)))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__226, dtb__227) -> (match dtb__226 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__228, dtb__229, dtb__230, dtb__231) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__228)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__227) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__227) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__227) mc2)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname -> (fun decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__232) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__233) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (if ((bi_ge_int mc4) mc1) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__234 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__236, dtb__237) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__237)) mc2) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) ((bi_add mc4) 1)) dtb__235))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx -> (fun nCtx -> (fun dom -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__240, dtb__241) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__240) (v_Vuna_dCompiler_dElab_dTypes_decSols mc2)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__239) mc4) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__241) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__239) (C_Base_dList_dList_Base_dList_dCons (dtb__238, mc4))) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__243) -> ((fun k -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__240) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), ((bi_add ((bi_sub (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) mc1)) k), C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__244) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__244))) dtb__239) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, k)), mc5)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__245) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__239) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub ((bi_sub mc1) 1)) dtb__243))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__246, dtb__247) -> (match dtb__246 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__248, dtb__249) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__247) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__248) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__249)) ((bi_add ((bi_sub dtb__249) mc0)) 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__250, dtb__251) -> (match dtb__250 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__252, dtb__253) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__253) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__254) -> (match dtb__254 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__256)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__256)) 0) dtb__252) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__255)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__257) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__251) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, dtb__255)), mc5))) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__256) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__257)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__258) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__251) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, dtb__255)), mc5))) dtb__256)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__259) -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 mc2) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceContextMissing ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__253)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__253))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__253) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__251) (C_Base_dList_dList_Base_dList_dCons (dtb__250, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc6) (v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals -> (fun ctx -> (fun sp -> (fun goals -> (fun acc -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) C_Base_dList_dList_Base_dList_dNil) acc) ec)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun m -> (fun rep -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__260) -> (if ((bi_eq_int dtb__260) m) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) depth) rep) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__261, dtb__262, dtb__263, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__264), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) ((bi_add depth) 1)) dtb__265)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__266, dtb__267, dtb__268) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__266, dtb__267, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) ((bi_add depth) 1)) dtb__268)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__269, dtb__270, dtb__271) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__269), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__270), dtb__271))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__272, dtb__273) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__272, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__273)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__274, dtb__275) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__274), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt m) rep) depth) alt))) dtb__275)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__276, dtb__277, dtb__278) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__276), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__277), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) depth) dtb__278)))
  | _ -> t
)))))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun m -> (fun rep -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__279, dtb__280, dtb__281) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__279, dtb__280, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) ((bi_add depth) (v_Base_dList_dlength dtb__280))) dtb__281)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m -> (fun rep -> (fun t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__282, dtb__283) -> (match dtb__282 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__284, dtb__285) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__283) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__284) dtb__285) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun clauses -> (match clauses with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__286, dtb__287) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__286))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__288) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__289) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__291) -> (match dtb__290 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__292, dtb__293, dtb__294) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__293) mc2) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__292, dtb__293, (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__294)))), dtb__291)) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__292, dtb__293, dtb__294)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__291))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (mc1, mc2, C_Base_dList_dList_Base_dList_dNil)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__295, dtb__296) -> (match dtb__295 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__297, dtb__298) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__298) then (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__297) (v_Vuna_dCompiler_dElab_dTypes_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__299) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__296) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__296) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__297) dtb__298) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__296) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun t -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> (if dtb__301 then ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__304)) else 0)
  | _ -> 0
)) t))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec -> (fun name -> (fun level -> (fun m -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__305) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__305))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__306) -> ec
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__308) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__308) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__307) mc0) mc1) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__309, dtb__310) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__309)) mc1) mc2) dtb__310)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n -> (fun x -> (fun xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Base_dList_dCons (x, C_Base_dList_dList_Base_dList_dNil)))) ((v_Base_dList_ddrop n) xs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> (if ((bi_le_int fuel) 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__311, dtb__312, dtb__313) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__311, dtb__312, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) 1)) dtb__313)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__314, dtb__315, dtb__316, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__317), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) 1)) dtb__318)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__319, dtb__320, dtb__321) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__319), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__320), dtb__321))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__322) -> (match dtb__322 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__323, dtb__324) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__323) dtb__324)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__325, dtb__326) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__325, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__326)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__327, dtb__328) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__327), ((v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) alt))) dtb__328)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__329, dtb__330, dtb__331) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__329), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__330), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) dtb__331)))
  | _ -> t
))))))))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> (if ((bi_le_int fuel) 0) then alt else (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__332, dtb__333, dtb__334) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__332, dtb__333, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) ((bi_add depth) (v_Base_dList_dlength dtb__333))) dtb__334)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel -> (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g)) else ((fun args2 -> (if (if (if ((bi_eq_str g) defName) then ((bi_gt_int (v_Base_dList_dlength args2)) appPos) else false) then ((bi_gt_int depth) appPos) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((bi_sub ((bi_sub depth) appPos)) 1))), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel ((bi_sub fuel) 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName -> (fun dName -> (fun appPos -> (fun t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName -> (fun ec -> (fun ty -> (fun body -> (fun baseIdx -> (fun nGroups -> (fun k -> (fun groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__335, dtb__336) -> (match dtb__335 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__337, dtb__338, dtb__339) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) ((bi_add k) 1)) dtb__336)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__339))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__337))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) ((bi_add baseIdx) 2)) dtb__339) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) ((bi_add baseIdx) 1)) body2))) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__337) dName) ((bi_add baseIdx) 2)) (((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__338)))) ((bi_add ((bi_add baseIdx) 1)) ((bi_sub ((bi_sub nGroups) 1)) k)))) ((bi_concat "d") (bi_strFromInt dtb__337)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (ty, (C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups)))))))))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName -> (fun ec -> (fun ty -> (fun body -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((bi_sub (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty)) 1)))) (v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))))))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__340, dtb__341) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__340)) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__341)) else (C_Base_dList_dList_Base_dList_dCons (dtb__340, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__341))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__342, dtb__343) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__342)) dtb__343)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo = (fun remaining -> (fun i -> (if ((bi_le_int remaining) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("#tele", i, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo ((bi_sub remaining) 1)) ((bi_add i) 1)))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual = (fun ec -> (fun n -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) a)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__344) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__345) -> false
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__346, dtb__347) -> (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__346))) mc1) then (if ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__346)) then true else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__347)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__347))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet = (fun ec -> (fun n -> (fun head -> (fun inst -> (if ((bi_eq_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele inst))) n) then ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) n) head) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead inst)) else false)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo = (fun remaining -> (fun i -> (if ((bi_le_int remaining) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (((bi_concat "#ov") (bi_strFromInt i)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo ((bi_sub remaining) 1)) ((bi_add i) 1)))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne = (fun ec -> (fun teleA -> (fun hA -> (fun teleB -> (fun hB -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__348, dtb__349) -> ((fun envA -> ((fun envB -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__349)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__349)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__350) -> (C_Base_dPair_dPair_Base_dPair_dPair (true, ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__349) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__350))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__351) -> (C_Base_dPair_dPair_Base_dPair_dPair (false, dtb__349))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv (v_Base_dList_dlength teleB)))) ((v_Base_dList_dmap (fun m -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Base_dList_dNil)))) dtb__348))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__352, dtb__353) -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__354, dtb__355) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__354) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__355) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__356, dtb__357) -> (if dtb__356 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__357)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__355))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__354)) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__354))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__358, dtb__359) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__358) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__359) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__360, dtb__361) -> (if dtb__360 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__361)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__359))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstTele dtb__358)) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__358))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash = (fun ec -> (fun name -> (fun tele -> (fun head -> (fun seen -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else (if ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact ec) (v_Base_dList_dlength tele)) head) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap ec) tele) head) seen))))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__362, dtb__363) -> (match dtb__362 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__364, dtb__365) -> (match dtb__364 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__366, dtb__367, dtb__368, dtb__369) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Base_dList_dCons (dtb__362, dtb__363))))) mc3) dtb__369) dtb__367) dtb__366)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> (match dtb__372 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__363) mc1) mc2) dtb__373) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Base_dList_dCons (inst, mc5))) (C_Base_dList_dList_Base_dList_dCons (inst, mc6)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__374) -> (match dtb__374 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__369) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dOverlappingInstances (iname))) iname)
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__369) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash dtb__371) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__370)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__370)) mc6))) (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__370), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__370), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__370))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__370))) ((v_Vuna_dCompiler_dElab_dTrait_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__370)) dtb__367))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__363) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls -> (fun classes -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs -> (fun name -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__375) -> dtb__375
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__376, dtb__377) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__376)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__378, dtb__379) -> (match dtb__379 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__380, dtb__381) -> (match dtb__381 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> (match dtb__383 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__384, dtb__385) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__377) ((v_Base_dList_dappend mc1) dtb__380)) dtb__385) (C_Base_dList_dList_Base_dList_dCons (dtb__378, mc3))) ((v_Base_dList_dappend dtb__380) mc4)) (C_Base_dList_dList_Base_dList_dCons (dtb__382, mc5))) ((v_Base_dList_dappend dtb__384) mc6))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__386, dtb__387) -> (match dtb__386 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__388, dtb__389) -> (if ((bi_eq_str dtb__388) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__389)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__387))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault = (fun globals -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__390) -> dtb__390
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore -> (fun ecAfter -> (fun srcSpan -> (fun gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault gs) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (v_Base_dPair_dfirstOf g))), srcSpan)))) gs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__391, dtb__392) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem (v_Base_dPair_dfirstOf dtb__391)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__392) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__392) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf dtb__391), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault mc0) (v_Base_dPair_dfirstOf dtb__391)), (v_Base_dPair_dsecondOf dtb__391), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (v_Base_dPair_dfirstOf dtb__391)) mc2))), mc4))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals -> (fun ec -> (fun srcSpans -> (fun sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo globals) (v_Vuna_dCompiler_dCommon_dtblOfNames ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__393, dtb__394) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> (if dtb__396 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__398) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__395) dtb__398) dtb__399) (C_Base_dList_dList_Base_dList_dCons (dtb__393, dtb__394))) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dImplicitParamKind)) else (match dtb__393 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__400, dtb__401) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__400) dtb__394) mc5) dtb__398) dtb__399) mc7)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__402) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) "_") dtb__394) mc5) dtb__398) dtb__399) mc7)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__393)) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDefParamsMustBeVars)
))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dDefMoreParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (if dtb__404 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__406) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) dtb__403) dtb__406) dtb__407) C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dImplicitParamKind)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel ((bi_sub mc0) 1)) mc1) mc2) mc3) mc5) mc6) mc7))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun dom -> (fun clo -> (fun pats -> (fun body -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel ((bi_sub fuel) 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__408, dtb__409) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__408)), dtb__409))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun body -> (fun expected -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else (match body with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__410, dtb__411, dtb__412) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
  | _ -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__413, dtb__414, dtb__415, dtb__416, dtb__417) -> (if dtb__414 then (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__416) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel ((bi_sub fuel) 1)) globals) ctx) ec) dtb__413) dtb__416) dtb__417) C_Base_dList_dList_Base_dList_dNil) body) sp) else ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dImplicitParamKind)) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel ((bi_sub fuel) 1)) globals) ctx2) ec) body2) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__417) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (etaName, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__416), dtb__418)), dtb__419))))
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (body, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (etaName, sp)), C_Base_dList_dList_Base_dList_dNil)), sp)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__416) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ((bi_concat "_arity") (bi_strFromInt lvl)))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
)
)))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel -> (fun globals -> (fun ctx -> (fun ec -> (fun pname -> (fun pats -> (fun body -> (fun dom -> (fun clo -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel ((bi_sub fuel) 1)) globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, dtb__420)), dtb__421))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dom))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals -> (fun ctx0 -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals -> (fun ctx0 -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__422, dtb__423) -> (match dtb__422 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, dtb__425) -> (match dtb__423 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__424) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__424) dtb__425) expected) sp) else ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dFunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine sp)))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals -> (fun ctx -> (fun ec -> (fun mty -> (fun clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__426, dtb__427) -> (match dtb__426 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 mc10) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceMissingMethod)
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__431) dtb__427) mc5) mc6) mc7) (C_Base_dList_dList_Base_dList_dCons (dtb__430, mc8))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc9))) mc10)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam mc6) dtb__429)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__428) mc7))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc8), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc9), mc3))))))
  | _ -> failwith "DT: impossible branch"
))))))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals -> (fun cls -> (fun ctx -> (fun nCtx -> (fun headArg -> (fun ec -> (fun methods -> (fun sp -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassParams cls))) headArg) methods) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) sp)))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun decls -> (fun globals -> (fun classes -> (fun datas -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__432, dtb__433) -> (match dtb__432 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__434, dtb__435, dtb__436, dtb__437) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig classes) globals) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) decls))) ec) dtb__437) dtb__435) dtb__434)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__438)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 dtb__437) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__440) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__440) dtb__436) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__441) -> (((v_Vuna_dCompiler_dDiagnostics_dtcErr1 dtb__437) (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceUnknownMethod (dtb__441))) dtb__441)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__440) dtb__436) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__442) -> ((v_Vuna_dCompiler_dDiagnostics_dtcErr0 dtb__437) C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dInstanceMissingMethod)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) dtb__440) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArg dtb__438)) dtb__439) dtb__436) dtb__437)) (fun q -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> (match dtb__444 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__445, dtb__446) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) dtb__437) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) C_Base_dList_dList_Base_dList_dNil) ec2)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__447, dtb__448) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__448) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__438))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf dtb__438) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__440))) fields2))) ((v_Vuna_dCompiler_dElab_dTrait_dinstanceName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__440)) dtb__435))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__447)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__443))) (v_Base_dPair_dsecondOf solvedCtx))) (v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__446) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((bi_add nTele) nCtx))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__438)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__438)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx dtb__438))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__433) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals -> (fun ec -> (fun mty -> (fun clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses)))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__449, dtb__450) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__449, dtb__450))) mc3) mc1) mc2) mc4) dtb__449)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__451, dtb__452) -> ((fun newDefs -> ((fun ecTbl -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__450) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__451)) ecTbl) ((v_Base_dList_dappend newDefs) mc5))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__452) ((v_Vuna_dCompiler_dCommon_dtblInsertAll dtb__451) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__452))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc4) dtb__452) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__449)))) dtb__451))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__453, dtb__454) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__453, dtb__454))) mc3) mc1) mc2) mc4) dtb__453)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__455, dtb__456) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__454) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__455)) dtb__456) ((v_Base_dList_dappend dtb__455) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))))))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))
