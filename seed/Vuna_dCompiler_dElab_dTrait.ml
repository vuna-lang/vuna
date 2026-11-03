open Vuna_runtime
open Vuna_builtins
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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
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
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) mc1) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__0) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind dtb__0) mc1)) mc2))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match dtb__2 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__5) (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__5)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__9) dtb__3) (C_Base_dList_dList_Cons (dtb__6, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), mc2))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals -> (fun ec -> (fun params -> (fun methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams params) methods) (v_Vuna_dCompiler_dElab_dTypes_demptyCtx ()))) ec) methods) C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__10)) dtb__11)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__12), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__13) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys -> (fun ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty)))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName mc0)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Nil))), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__16))))))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__15) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname -> (fun pname -> (fun pKind -> (fun methods -> (fun fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor -> (fun fieldIdx -> (fun rigs -> (fun nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_p", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, lamArgs))))) (((v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil)))))) (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((bi_sub ((bi_sub nFields) 1)) fieldIdx))))) arity)) (v_Base_dList_dlength rigs))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> (if dtb__21 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__24) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__24)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, ((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__27)) mc4))), (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) dtb__26) dtb__28) ((bi_add mc3) 1)) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname -> (fun pname -> (fun methods -> (fun fieldTys -> (fun nFields -> (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) methods) fieldTys) 0) nFields))))))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__33, dtb__34, dtb__35, dtb__36) -> (if ((bi_neq_int (v_Base_dList_dlength dtb__34)) 1) then ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__36) "[TC_InterfaceOneParam] DT: interfaces must have exactly one parameter (M15 limitation)") else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) dtb__34) dtb__35)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, ec3))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_dTypes_decAddClass ((v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__38) dd)) cls))) (C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__33, dtb__34, projs, dtb__37)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs dtb__33) pname) dtb__35) dtb__37) (v_Base_dList_dlength dtb__35)))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections dtb__33) pname) pKind) dtb__35) dtb__37))) (C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys dtb__37) dapp))))) ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName dtb__33))) (v_Vuna_dCompiler_dElab_dMeta_ddictTypeName dtb__33))) ((v_Vuna_dCompiler_dElab_dSig_dclassParamKind pname) dtb__35))) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf dtb__34))
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

let v_Vuna_dCompiler_dElab_dTrait_danonInstName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> ((v_Base_dString_dstartsWith "#") dtb__47)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (if ((bi_eq_generic dtb__48) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__48)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dexprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__50, dtb__51) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__52, dtb__53) -> (bi_strFromInt dtb__52)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__54, dtb__55) -> dtb__54
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dargSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__56, dtb__57) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dElab_dTrait_dexprNameFor dtb__56)) (v_Vuna_dCompiler_dElab_dTrait_dargSuffix dtb__57)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dderivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__58, dtb__59, dtb__60) -> (match dtb__58 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__61, dtb__62) -> ((bi_concat dtb__61) (v_Vuna_dCompiler_dElab_dTrait_dargSuffix dtb__59))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__63, dtb__64) -> dtb__63
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dTrait_dderivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65) -> (if (v_Vuna_dCompiler_dElab_dTrait_danonInstName dtb__65) then ((bi_concat (v_Vuna_dCompiler_dElab_dTrait_dinstPrefixOf dtb__65)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dTrait_dderivedInstName headExpr)))) else dtb__65)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dargNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__66, dtb__67) -> dtb__66
  | _ -> "Int"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__68, dtb__69, dtb__70) -> (match dtb__69 with
  | C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTrait_dargNameOf dtb__71)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__73, dtb__74) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__73))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__75 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__77, dtb__78, dtb__79, dtb__80) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__77)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__76) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__76)
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls))) methods)))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (match dtb__81 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__83, dtb__84, dtb__85, dtb__86) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__83)) mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__82))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__82)
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (v_Base_dPair_dfirstOf dtb__87))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__88) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__87))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) methods)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls -> (fun arg -> ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__89)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__90))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__91), dtb__93)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__92) dtb__94)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods cls)) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys cls)))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__95 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__97)) (v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__96) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__96) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__96) mc2)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname -> (fun decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun clauses -> (match clauses with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__101))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__105, dtb__106) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__106) then (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__105) (v_Vuna_dCompiler_dElab_dTypes_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> ((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__104)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106)), ((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__104)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> ((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> (if dtb__109 then ((bi_add 1) (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__112)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec -> (fun name -> (fun m -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) 0) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, 0, C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__113) -> (match (((v_Vuna_dCompiler_dElab_dMeta_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) dtb__113) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__114) -> ec
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__115) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) dtb__113)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__116) -> ec
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n -> (fun x -> (fun xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Cons (x, C_Base_dList_dList_Nil)))) ((v_Base_dList_ddrop n) xs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__117, dtb__118, dtb__119) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__117, dtb__118, (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__119)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__120, dtb__121, dtb__122, (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__123), (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__124)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__125, dtb__126, dtb__127) -> (match (v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> ((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine defName) dName) appPos) depth) dtb__129) dtb__130)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__125), (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__126), dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__131, dtb__132) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__131, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__132)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__133, dtb__134) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__133), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo defName) dName) appPos) depth)) dtb__134)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__135, dtb__136, dtb__137) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__135), (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__136), (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) dtb__137)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__138, dtb__139, dtb__140) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__138, dtb__139, (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) ((bi_add depth) (v_Base_dList_dlength dtb__139))) dtb__140)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> ((fun args2 -> (if (if (if ((bi_eq_str g) defName) then ((bi_gt_int (v_Base_dList_dlength args2)) appPos) else false) then ((bi_gt_int depth) appPos) else false) then ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((bi_sub ((bi_sub depth) appPos)) 1))), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))))))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName -> (fun dName -> (fun appPos -> (fun t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__141 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> ((fun dName -> ((fun argIdx -> ((fun quoteDepth -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun ec2 -> ((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo mc0) ec2) ty2) body3) ((bi_add mc4) 1)) dtb__142)) (((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc1) dName) dtb__143))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls mc0) dName) ((bi_add argIdx) 1)) body2))) ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__143) dName) ((bi_add argIdx) 2)) (((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) argIdx) mc3)))) ((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) argIdx) dictDom) mc2))) (((v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt quoteDepth) (v_Vuna_dCompiler_dElab_dTypes_decSols mc1)) ((v_Vuna_dCompiler_dCore_dEval_dquote quoteDepth) dtb__144)))) ((bi_add (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)) mc4))) ((bi_add ((v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((bi_sub (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)) 1))) mc4))) ((bi_concat "d") (bi_strFromInt dtb__143)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, (C_Base_dPair_dPair_Base_dPair_dPair (mc3, mc1))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName -> (fun ec -> (fun ty -> (fun body -> ((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) 0) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__145)) mc0) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__146)) else (C_Base_dList_dList_Cons (dtb__145, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__146))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__147, dtb__148) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__147)) dtb__148)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceIsNamed = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dTrait_danonInstName dtb__149))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dheadsEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dConv_dconv (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) a)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__150) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__151) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindDefaultDup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if mc1 then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed dtb__152) then ((((v_Vuna_dCompiler_dElab_dTrait_dfindDefaultDup mc0) mc1) mc2) dtb__153) else (if (((v_Vuna_dCompiler_dElab_dTrait_dheadsEqual mc0) mc2) (v_Vuna_dCompiler_dElab_dTypes_ddtInstHead dtb__152)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152)) else ((((v_Vuna_dCompiler_dElab_dTrait_dfindDefaultDup mc0) mc1) mc2) dtb__153))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dfindDuplicateInstance = (fun ec -> (fun name -> (fun named -> (fun ty -> (fun seen -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (name, ty, named)))) else ((((v_Vuna_dCompiler_dElab_dTrait_dfindDefaultDup ec) named) ty) seen)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (match dtb__154 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (match dtb__156 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadName dtb__160) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__162) "[TC_InstanceHeadNotApp] DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__163) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__162) ((bi_concat "[TC_UnknownInterface] DT: unknown interface ") ((bi_concat dtb__163) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164) -> ((fun iname -> ((fun ty -> ((fun named -> (match (((((v_Vuna_dCompiler_dElab_dTrait_dfindDuplicateInstance mc3) iname) named) ty) mc6) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__162) ((bi_concat "[TC_DuplicateInstance] DT: duplicate instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__155) mc1) mc2) mc3) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, ty, named)), mc5))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, ty, named)), mc6)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dinstanceIsNamed dtb__158))) ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__164) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm dtb__160)))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__164)) dtb__158) dtb__160))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__155) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls -> (fun classes -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs -> (fun name -> (match ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> dtb__166
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__167, dtb__168) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__167)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> (match dtb__170 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> (match dtb__172 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, dtb__174) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__168) ((v_Base_dList_dappend mc1) dtb__171)) dtb__174) (C_Base_dList_dList_Cons (dtb__169, mc3))) ((v_Base_dList_dappend dtb__171) mc4)) (C_Base_dList_dList_Cons (dtb__173, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc2))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault = (fun globals -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175) -> dtb__175
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore -> (fun ecAfter -> (fun gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault gs) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (v_Vuna_dCompiler_dElab_dTypes_decDefs ecAfter)) (v_Base_dPair_dfirstOf g))))))) gs))))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (if ((v_Base_dList_dmemName (v_Base_dPair_dfirstOf dtb__176)) mc1) then ((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) dtb__177) mc3) else ((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) dtb__177) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((v_Base_dPair_dfirstOf dtb__176), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefault mc0) (v_Base_dPair_dfirstOf dtb__176)), (v_Base_dPair_dsecondOf dtb__176))), mc3))))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals -> (fun ec -> (fun sourceDefs -> ((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo globals) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs)) (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEnd = (fun globals -> (fun ctx -> (fun ec -> (fun body -> (fun expected -> (fun sp -> (match body with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__178, dtb__179, dtb__180) -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_DefFewerParams] DT: definition has fewer parameters than its signature")
)))))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__181, dtb__182) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> (if dtb__184 then (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain mc2) dtb__186) then (((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder mc0) mc1) mc2) dtb__183) dtb__186) dtb__187) (C_Base_dList_dList_Cons (dtb__181, dtb__182))) mc4) mc6) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc6) "[TC_ImplicitParamKind] DT: implicit parameters must be types or inductive families (M14)")) else (match dtb__181 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__188, dtb__189) -> (((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern mc0) mc1) mc2) dtb__188) dtb__182) mc4) dtb__186) dtb__187) mc6)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__190) -> (((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern mc0) mc1) mc2) "_") dtb__182) mc4) dtb__186) dtb__187) mc6)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__181)) "[TC_DefParamsMustBeVars] DT: definition parameters must be variables (M13)")
))
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc6) "[TC_DefMoreParams] DT: definition has more parameters than its signature")
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195) -> (if dtb__192 then (if ((v_Vuna_dCompiler_dElab_dMeta_disIndexDomain mc2) dtb__194) then (((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder mc0) mc1) mc2) dtb__191) dtb__194) dtb__195) C_Base_dList_dList_Nil) mc4) mc6) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc6) "[TC_ImplicitParamKind] DT: implicit parameters must be types or inductive families (M14)")) else ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEnd mc0) mc1) mc2) mc4) mc5) mc6))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dcheckE mc0) mc1) mc2) mc4) mc5)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc2) mc5))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun dom -> (fun clo -> (fun pats -> (fun body -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__196)), dtb__197))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun globals -> (fun ctx -> (fun ec -> (fun pname -> (fun pats -> (fun body -> (fun dom -> (fun clo -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, dtb__198)), dtb__199))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dtypeLayerRig false) dom))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))))))))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) (v_Vuna_dCompiler_dElab_dTypes_demptyCtx ())) ec) pats) body) expected) sp)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "[TC_FunctionNoClauses] DT: function has no clauses")
  | C_Base_dList_dList_Cons (dtb__200, dtb__201) -> (match dtb__200 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, dtb__203) -> (match dtb__201 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__202) then ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDef globals) ec) dtb__202) dtb__203) expected) sp) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals -> (fun ec -> (fun mty -> (fun clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabFunDef globals) ec) clauses) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__204 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__206, dtb__207) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt mc8) "[TC_InstanceMissingMethod] DT: instance is missing an implementation for an interface method")
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod mc0) mc1) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) dtb__209) dtb__205) mc3) mc4) mc5) (C_Base_dList_dList_Cons (dtb__208, mc6))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc7))) mc8)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam mc3) mc4) dtb__207))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__206) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc7), mc1))))))
  | _ -> failwith "DT: impossible branch"
))))))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethods = (fun globals -> (fun cls -> (fun headArg -> (fun ec -> (fun methods -> (fun sp -> (((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (v_Vuna_dCompiler_dElab_dTypes_ddtClassParams cls))) headArg) methods) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) sp)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun globals -> (fun classes -> (fun datas -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadName dtb__214) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__216) "[TC_InstanceHeadNotApp] DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__217) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__217) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__216) ((bi_concat "[TC_UnknownInterface] DT: unknown interface ") ((bi_concat dtb__217) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__218) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__218) dtb__215) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__216) ((bi_concat "[TC_InstanceUnknownMethod] DT: instance has unknown method ") dtb__219))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__218) dtb__215) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__216) "[TC_InstanceMissingMethod] DT: instance is missing an implementation for an interface method")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethods globals) dtb__218) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm dtb__214)) ec) dtb__215) dtb__216)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__221, dtb__222) -> (match dtb__222 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__223, dtb__224) -> ((fun iname -> ((fun headTerm -> ((fun dctor -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dTypes_decAddDef ((v_Vuna_dCompiler_dElab_dTypes_decAddInst dtb__224) (C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, dictTyTerm, (v_Vuna_dCompiler_dElab_dTrait_dinstanceIsNamed dtb__212))))) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__218) headTerm))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dctor, dtb__223)))) (v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__218)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm dtb__214))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__218)) dtb__212) dtb__214))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__211) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__225, dtb__226) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstance mc3) mc1) mc2) mc4) dtb__225)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> ((fun newDefs -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__226) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__227)) dtb__228) ((v_Base_dList_dappend newDefs) mc5))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc4) dtb__228) dtb__227))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__229, dtb__230) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstance mc3) mc1) mc2) mc4) dtb__229)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__231, dtb__232) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__230) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__231)) dtb__232) ((v_Base_dList_dappend dtb__231) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))
