open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
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

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) mc1) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__0) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind dtb__0) mc1)) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
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
))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec params methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams params) methods) v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__10)) dtb__11)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__12), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__13) (mc1 + 1)) mc2)))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__14), (match dtb__14 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__16, dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__15)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName mc0)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__23))))))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__20) dtb__24)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname pname pKind methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_p", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, lamArgs))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (C_Base_dList_dList_Base_dList_dCons (alt, C_Base_dList_dList_Base_dList_dNil)))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx))))) arity)) (v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (if dtb__26 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__29) else (1 + (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__29)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, ((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__34)) mc4))), (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) dtb__31) dtb__35) (mc3 + 1)) mc4)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname pname methods fieldTys nFields -> (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) methods) fieldTys) 0) nFields))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals ec ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (match dtb__36 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__38, dtb__39, dtb__40, dtb__41) -> (if ((v_Base_dList_dlength dtb__39) <> 1) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__41) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterfaceOneParam) else ((fun methodsP -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) dtb__39) methodsP)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, (C_Base_dPair_dPair_Base_dPair_dPair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_dTypes_decAddClass ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__43) dd)) cls))) (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__38, dtb__39, projs, dtb__42)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs dtb__38) pname) methodsP) dtb__42) (v_Base_dList_dlength dtb__40)))) ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), (v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m))))) dtb__40))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections dtb__38) pname) pKind) methodsP) dtb__42))) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Base_dList_dNil)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))))) (v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys dtb__42) dapp))))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName dtb__38))) (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName dtb__38))) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind pname) methodsP))) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf dtb__39))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__40)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__37) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__44, dtb__45, dtb__46) -> (match dtb__44 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__47, dtb__48) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__45))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__49, dtb__50) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__51, dtb__52, dtb__53) -> (match dtb__52 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__55 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__51 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__56, dtb__57) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__54))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__58) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__59)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__60, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__61
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__79
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__86, dtb__87, dtb__88) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__86) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__87) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__89) dtb__90)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__91, dtb__92) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__91))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__93) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__94) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__96))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (dtp_unpack n) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (if (dtb__97 >= 97) then (dtb__97 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__99, dtb__100, dtb__101) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__99)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__100))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__104)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__105))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__107, dtb__108, dtb__109) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__107)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__108))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__110, dtb__111) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__110) then (C_Base_dList_dList_Base_dList_dCons (dtb__110, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (if ((v_Base_dList_dmemName dtb__112) dtb__113) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__113) else (C_Base_dList_dList_Base_dList_dCons (dtb__112, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__113))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (if ((v_Base_dHashMap_dmember dtb__114) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__115) else (C_Base_dList_dList_Base_dList_dCons (dtb__114, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__115))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf = (fun banned combined exprs -> ((fun vars -> ((v_Base_dList_dmap (fun v -> (C_Base_dPair_dPair_Base_dPair_dPair (v, ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))))) vars)) (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (match dtb__116 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__117) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__118) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__119)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__120))) mc0)) dtb__121) (mc2 + 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__122, dtb__123) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__124, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__123)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (ctor, ((v_Base_dList_dmap (fun t -> (C_Base_dPair_dPair_Base_dPair_dPair (t, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))) fields)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__126), mc0))) dtb__127) (mc2 - 1))
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__130, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__131, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__129)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__132, dtb__133) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__132))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__134, dtb__135, dtb__136) -> (match dtb__135 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__137)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__139 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__141, dtb__142, dtb__143, dtb__144) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__141)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__140) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__140)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (match cls with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__145, dtb__146, dtb__147, dtb__148) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__149 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__151, dtb__152, dtb__153, dtb__154) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__151) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__150))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__150)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf dtb__155))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__156) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__155))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (match cls with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__157, dtb__158, dtb__159, dtb__160) -> dtb__159
  | _ -> failwith "DT: impossible branch"
)) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match dtb__161 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__163, dtb__164) -> (match dtb__163 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__165, dtb__166, dtb__167, dtb__168) -> (if (dtb__165 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__162))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__162)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__169) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__169))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__170))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> (match dtb__171 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__172, dtb__173, dtb__174, dtb__175) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__174)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls arg -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__176) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__177))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match dtb__178 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__180) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface (dtb__180))) dtb__180)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictArgKind mc5) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__182)), C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc5) dtb__181) dtb__183)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__179) mc4) dtb__185)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__182) dtb__184), dtb__186)), dtb__187))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExpr ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun tele -> ((fun teleCtx0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) teleCtx0) ec0) argExpr)) (fun q -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__191)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__192, dtb__188, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__188))), dtb__193))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf banned) combined) (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs))))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("#inst", sp)), (C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs)), sp)))) (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dsecondOf p))) ctxParts)))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Base_dPair_dfirstOf dtb__194)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface ((v_Base_dPair_dfirstOf dtb__194)))) (v_Base_dPair_dfirstOf dtb__194))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__197 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> (match ctxParts with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dTrait_dinstanceMono headExpr) then (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__196) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__198) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__195), C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, dtb__198, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__195) dtb__198))), ec0))))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__195) dtb__196) ctxParts))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__195) dtb__196) ctxParts)
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)) (v_Base_dPair_dsecondOf dtb__194))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__199), dtb__201)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__200) dtb__202)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (match cls with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__203, dtb__204, dtb__205, dtb__206) -> dtb__205
  | _ -> failwith "DT: impossible branch"
)) (match cls with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__210
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__211, dtb__212, dtb__213) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__211), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__212), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__213)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__214), ((v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt mc0) mc1) alt))) dtb__215)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__216, dtb__217) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__216, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__217)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__218, dtb__219, dtb__220) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__218), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__219), dtb__220))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__221, dtb__222, dtb__223) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__221, dtb__222, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + 1)) dtb__223)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__224, dtb__225, dtb__226, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__227), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + 1)) dtb__228)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__229, dtb__230) -> (if (dtb__230 = mc1) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) mc0) else mc2)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__231, dtb__232, dtb__233) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__231, dtb__232, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + (v_Base_dList_dlength dtb__232))) dtb__233)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam = (fun arg t -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (match dtb__234 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__236, dtb__237, dtb__238, dtb__239) -> (if ((v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__236) = (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__235) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__235) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__235) mc2)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__240) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__241) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (if (mc4 >= mc1) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__242 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__244, dtb__245) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__245)) mc2) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__243))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (match ctx with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__246, dtb__247) -> dtb__246
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__248, dtb__249) -> (match dtb__248 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__250, dtb__251) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__250) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__249) mc4) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__251) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__249) (C_Base_dList_dList_Base_dList_dCons (dtb__248, mc4))) mc5)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__253) -> ((fun k -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__250) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__254) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__254))) dtb__249) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__250, k)), mc5)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__255) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__249) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__253))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc2) (v_Base_dList_dreverse mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil) acc))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> (match dtb__256 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__257) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__258) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__259)) ((dtb__259 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__260, dtb__261) -> (match dtb__260 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__262, dtb__263) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__263) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__264) -> (match dtb__264 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__265, dtb__266) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__266)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__266)) 0) dtb__262) C_Base_dList_dList_Base_dList_dNil) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__265)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__267) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__261) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, dtb__265)), mc5))) ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__266) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__267)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__268) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__261) mc4) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__262, dtb__265)), mc5))) dtb__266)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__269) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceContextMissing ((v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__263)))) (v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__263))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__263) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__261) (C_Base_dList_dList_Base_dList_dCons (dtb__260, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), ((v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc6) (v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) C_Base_dList_dList_Base_dList_dNil) acc) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__270, dtb__271, dtb__272) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__270), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__271), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__272)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__273, dtb__274) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__273), ((v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__274)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__275, dtb__276) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__275, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__276)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__277), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__278), dtb__279))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__280, dtb__281, dtb__282) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__280, dtb__281, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__282)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__283, dtb__284, dtb__285, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__286), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__287)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__288) -> (if (dtb__288 = mc0) then (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__289, dtb__290, dtb__291) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__289, dtb__290, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (v_Base_dList_dlength dtb__290))) dtb__291)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__292, dtb__293) -> (match dtb__292 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__293) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__294) dtb__295) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__296, dtb__297) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__296))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__298) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__299) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__300, dtb__301) -> (match dtb__300 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__302, dtb__303, dtb__304) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__303) mc2) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__302, dtb__303, (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__304)))), dtb__301)) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__302, dtb__303, dtb__304)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__301))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (mc1, mc2, C_Base_dList_dList_Base_dList_dNil)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__305, dtb__306) -> (match dtb__305 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__307, dtb__308) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__308) then (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__307) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__309) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__306) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__306) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__307) dtb__308) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__306) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> (if dtb__311 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__314)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) C_Base_dList_dList_Base_dList_dNil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__315) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__315))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__316) -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__317, dtb__318) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__318) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__317) mc0) mc1) mc3))
  | C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__319, dtb__320) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__319)) mc1) mc2) dtb__320)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Base_dList_dCons (x, C_Base_dList_dList_Base_dList_dNil)))) ((v_Base_dList_ddrop n) xs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__321, dtb__322, dtb__323) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__321, dtb__322, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__323)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__324, dtb__325, dtb__326, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__327), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__328)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__329, dtb__330, dtb__331) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__329), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__330), dtb__331))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__332) -> (match dtb__332 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__333, dtb__334) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__333) dtb__334)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__335, dtb__336) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__335, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__336)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__337, dtb__338) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__337), ((v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__338)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__339, dtb__340, dtb__341) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__339), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__340), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__341)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__342, dtb__343, dtb__344) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__342, dtb__343, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (v_Base_dList_dlength dtb__343))) dtb__344)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((depth - appPos) - 1))), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__345, dtb__346) -> (match dtb__345 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__347, dtb__348, dtb__349) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__346)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__349))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__347))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__349) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__347) dName) (baseIdx + 2)) (((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__348)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__347)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (ty, (C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec)))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__350, dtb__351) -> (if ((v_Base_dPair_dfirstOf dtb__350) = mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__351)) else (C_Base_dList_dList_Base_dList_dCons (dtb__350, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__351))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__352, dtb__353) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__352)) dtb__353)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo = (fun remaining i -> (if (remaining <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("#tele", i, C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual = (fun ec n a b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) a)) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__354) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__355) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__356, dtb__357) -> (if ((v_Base_dList_dlength (match dtb__356 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__358, dtb__359, dtb__360, dtb__361) -> dtb__359
  | _ -> failwith "DT: impossible branch"
)) = mc1) then (if ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual mc0) mc1) mc2) (match dtb__356 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__362, dtb__363, dtb__364, dtb__365) -> dtb__365
  | _ -> failwith "DT: impossible branch"
)) then true else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__357)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__357))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet = (fun ec n head inst -> (if ((v_Base_dList_dlength (match inst with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__366, dtb__367, dtb__368, dtb__369) -> dtb__367
  | _ -> failwith "DT: impossible branch"
)) = n) then ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) n) head) (match inst with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__370, dtb__371, dtb__372, dtb__373) -> dtb__373
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo = (fun remaining i -> (if (remaining <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (("#ov" ^ (bi_strFromInt i)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne = (fun ec teleA hA teleB hB -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> ((fun envA -> ((fun envB -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__375)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__375)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__376) -> (C_Base_dPair_dPair_Base_dPair_dPair (true, ((v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__375) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__376))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__377) -> (C_Base_dPair_dPair_Base_dPair_dPair (false, dtb__375))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv (v_Base_dList_dlength teleB)))) ((v_Base_dList_dmap (fun m -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Base_dList_dNil)))) dtb__374))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap = (fun ec tele1 h1 tele2 h2 -> (match tele1 with
  | C_Base_dList_dList_Base_dList_dNil -> (match tele2 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) 0) h1) h2), ec))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele1) h1) tele2) h2)
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__378, dtb__379) -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__380, dtb__381) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__380) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__381) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> (if dtb__382 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__383)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__381))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (match dtb__380 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__384, dtb__385, dtb__386, dtb__387) -> dtb__385
  | _ -> failwith "DT: impossible branch"
)) (match dtb__380 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__388, dtb__389, dtb__390, dtb__391) -> dtb__391
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__392, dtb__393) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (v_Base_dList_dlength mc1)) mc2) dtb__392) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__393) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__394, dtb__395) -> (if dtb__394 then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__395)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__393))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (match dtb__392 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__396, dtb__397, dtb__398, dtb__399) -> dtb__397
  | _ -> failwith "DT: impossible branch"
)) (match dtb__392 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__400, dtb__401, dtb__402, dtb__403) -> dtb__403
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash = (fun ec name tele head seen -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else (if ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact ec) (v_Base_dList_dlength tele)) head) seen) then (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap ec) tele) head) seen))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__404, dtb__405) -> (match dtb__404 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__406, dtb__407) -> (match dtb__406 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__408, dtb__409, dtb__410, dtb__411) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Base_dList_dCons (dtb__404, dtb__405))))) mc3) dtb__411) dtb__409) dtb__408)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__412, dtb__413) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__414, dtb__415) -> (match dtb__414 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__405) mc1) mc2) dtb__415) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Base_dList_dCons (inst, mc5))) (C_Base_dList_dList_Base_dList_dCons (inst, mc6)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__416) -> (match dtb__416 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__411) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOverlappingInstances (iname))) iname)
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__411) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash dtb__413) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__412)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__412)) mc6))) (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__412), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__412), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__412))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__412))) ((v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__412)) dtb__409))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__405) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__417) -> dtb__417
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__418, dtb__419) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__418)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> (match dtb__421 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__422, dtb__423) -> (match dtb__423 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, dtb__425) -> (match dtb__425 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__426, dtb__427) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__419) ((v_Base_dList_dappend mc1) dtb__422)) dtb__427) (C_Base_dList_dList_Base_dList_dCons (dtb__420, mc3))) ((v_Base_dList_dappend dtb__422) mc4)) (C_Base_dList_dList_Base_dList_dCons (dtb__424, mc5))) ((v_Base_dList_dappend dtb__426) mc6))
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
))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__428, dtb__429) -> (match dtb__428 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> (if (dtb__430 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__431)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__429))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((v_Base_dHashMap_dlookup name) tbl) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__432) -> dtb__432
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl (v_Base_dHashMap_dfromList gs)) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__433, dtb__434) -> (if ((v_Base_dHashMap_dmember (v_Base_dPair_dfirstOf dtb__433)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__434) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__434) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf dtb__433), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (v_Base_dPair_dfirstOf dtb__433)), (v_Base_dPair_dsecondOf dtb__433), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (v_Base_dPair_dfirstOf dtb__433)) mc2))), mc4))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (v_Base_dHashMap_dofNames ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__435, dtb__436) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__437, dtb__438, dtb__439, dtb__440, dtb__441) -> (if dtb__438 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__440) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__437) dtb__440) dtb__441) (C_Base_dList_dList_Base_dList_dCons (dtb__435, dtb__436))) mc5) mc7) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__440) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__437) dtb__440) dtb__441) (C_Base_dList_dList_Base_dList_dCons (dtb__435, dtb__436))) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match dtb__435 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__442, dtb__443) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__442) dtb__436) mc5) dtb__440) dtb__441) mc7)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__444) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) "_") dtb__436) mc5) dtb__440) dtb__441) mc7)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__435)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefParamsMustBeVars)
))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefMoreParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> (if dtb__446 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__448) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__445) dtb__448) dtb__449) C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__448) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__445) dtb__448) dtb__449) C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec name dom clo pats body sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__450, dtb__451) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dtb__450)), dtb__451))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec name dom clo pats body sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__452, dtb__453) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__452)), dtb__453))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else (match body with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__454, dtb__455, dtb__456) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
  | _ -> (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> (if dtb__458 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__460) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__457) dtb__460) dtb__461) C_Base_dList_dList_Base_dList_dNil) body) sp) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__460) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__457) dtb__460) dtb__461) C_Base_dList_dList_Base_dList_dNil) body) sp) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__461) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__462, dtb__463) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (etaName, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__460), dtb__462)), dtb__463))))
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (body, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (etaName, sp)), C_Base_dList_dList_Base_dList_dNil)), sp)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__460) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
)
)))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec pname pats body dom clo sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, dtb__465) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, dtb__464)), dtb__465))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dom))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals ctx0 ec clauses expected sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__466, dtb__467) -> (match dtb__466 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__468, dtb__469) -> (match dtb__467 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__468) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__468) dtb__469) expected) sp) else ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (v_Vuna_dCompiler_dCommon_dspanStartLine sp))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__470, dtb__471) -> (match dtb__470 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__472, dtb__473) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc10) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__474, dtb__475) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__475) dtb__471) mc5) mc6) mc7) (C_Base_dList_dList_Base_dList_dCons (dtb__474, mc8))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__474, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc9))) mc10)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam mc6) dtb__473)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__472) mc7))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc8), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc9), mc3))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArg ec methods sp -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (match cls with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__476, dtb__477, dtb__478, dtb__479) -> dtb__477
  | _ -> failwith "DT: impossible branch"
))) headArg) methods) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun instDecls allDecls globals classes datas ec ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__480, dtb__481) -> (match dtb__480 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__482, dtb__483, dtb__484, dtb__485) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig classes) globals) (v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) instDecls))) ec) dtb__485) dtb__483) dtb__482)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__486, dtb__487) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__486)) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__485) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__488) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__488) dtb__484) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__489) -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__485) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceUnknownMethod (dtb__489))) dtb__489)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__488) dtb__484) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__490) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__488)) dtb__490) allDecls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__491) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__491) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__485) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) dtb__488) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArg dtb__486)) dtb__487) dtb__484) dtb__485)) (fun q -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__492, dtb__493) -> (match dtb__493 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__494, dtb__495) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) dtb__485) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) C_Base_dList_dList_Base_dList_dNil) ec2)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__496, dtb__497) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__497) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__486))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf dtb__486) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__488))) fields2))) ((v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__488)) dtb__483))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__496)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__492))) (v_Base_dPair_dsecondOf solvedCtx))) (v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__495) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__486)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__486)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx dtb__486))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__481) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__498, dtb__499) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__498, dtb__499))) mc1) mc4) mc2) mc3) mc5) dtb__498)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__500, dtb__501) -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__499) mc1) mc2) mc3) ((v_Base_dList_dappend mc4) dtb__500)) ecTbl) ((v_Base_dList_dappend newDefs) mc6))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__501) ((v_Base_dHashMap_dinsertAll dtb__500) (v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__501))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__501) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dsecondOf dtb__498)))) dtb__500))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls classes datas globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) C_Base_dList_dList_Base_dList_dNil)) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair (d, (v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d))))) allDecls)) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__502, dtb__503) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (C_Base_dList_dList_Base_dList_dCons (dtb__502, dtb__503))) C_Base_dList_dList_Base_dList_dNil) mc3) mc1) mc2) mc4) dtb__502)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__504, dtb__505) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__503) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__504)) dtb__505) ((v_Base_dList_dappend dtb__504) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))
