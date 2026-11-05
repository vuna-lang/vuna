open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup of (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (int Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTrait_dInstClash = C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) mc1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__0) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKind dtb__0) mc1)) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (Base_dMaybe.v_Base_dMaybe_disJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__5) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__5)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__9) dtb__3) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), mc2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec params methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) (((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams params) methods) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__10)) dtb__11)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__12), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__13) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__14), (match dtb__14 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__16, dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__15)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc1, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, mc2, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName mc0)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, 0)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__23))))))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__20) dtb__24)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname pname pKind methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_p", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, lamArgs))))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (alt, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx))))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (if dtb__26 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__29) else (1 + (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__29)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (match dtb__30 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, ((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc3) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__34)) mc4))), (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) dtb__31) dtb__35) (mc3 + 1)) mc4)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname pname methods fieldTys nFields -> (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) methods) fieldTys) 0) nFields))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__38, dtb__39, dtb__40, dtb__41) -> (if ((Base_dList.v_Base_dList_dlength dtb__39) <> 1) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__41) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterfaceOneParam) else ((fun methodsP -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) dtb__39) methodsP)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dd, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (projs, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (cls, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__43) dd)) cls))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__38, dtb__39, projs, dtb__42)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs dtb__38) pname) methodsP) dtb__42) (Base_dList.v_Base_dList_dlength dtb__40)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m))))) dtb__40))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections dtb__38) pname) pKind) methodsP) dtb__42))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (pname, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys dtb__42) dapp))))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (pname, 0)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName dtb__38))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName dtb__38))) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKind pname) methodsP))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dparamNameOf dtb__39))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__40)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__37) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__44, dtb__45, dtb__46) -> (match dtb__44 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__47, dtb__48) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__45))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__49, dtb__50) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__51, dtb__52, dtb__53) -> (match dtb__52 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match dtb__51 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__56, dtb__57) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__54))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__58) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__59)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__60, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__86, dtb__87, dtb__88) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__86) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__87) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__89) dtb__90)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__91, dtb__92) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__91))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__93) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__95) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__94) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__96))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (if (dtb__97 >= 97) then (dtb__97 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__99, dtb__100, dtb__101) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__99)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__100))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__104)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__105))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__107, dtb__108, dtb__109) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__107)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__108))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__110, dtb__111) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__110) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (if ((Base_dList.v_Base_dList_dmemName dtb__112) dtb__113) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__113) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__113))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__114) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__115) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__115))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf = (fun banned combined exprs -> ((fun vars -> ((Base_dList.v_Base_dList_dmap (fun v -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v, ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))))) vars)) (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (match dtb__116 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__117) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__118) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__119)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__120))) mc0)) dtb__121) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__122, dtb__123) -> (match dtb__122 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__124, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__123)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__126), mc0))) dtb__127) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (match dtb__128 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__130, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__131, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__129)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__132, dtb__133) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__132))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__134, dtb__135, dtb__136) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__137)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__139 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__141, dtb__142, dtb__143, dtb__144) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__141)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__140) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__140)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__145, dtb__146, dtb__147, dtb__148) -> dtb__147
  | _ -> failwith "DT: impossible branch"
))) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__149 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__151, dtb__152, dtb__153, dtb__154) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__151) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__150))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__150)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__155))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__156) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dfirstOf dtb__155))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__157, dtb__158, dtb__159, dtb__160) -> dtb__159
  | _ -> failwith "DT: impossible branch"
)) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match dtb__161 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__163, dtb__164) -> (match dtb__163 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__165, dtb__166, dtb__167, dtb__168) -> (if (dtb__165 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__163)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__162))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__162)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__169) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__169))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__170))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> (match dtb__171 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__172, dtb__173, dtb__174, dtb__175) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__174)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls arg -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (arg, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__176) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__177))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match dtb__178 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__180) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface (dtb__180))) dtb__180)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__182)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc5) dtb__181) dtb__183)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__179) mc4) dtb__185)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__182) dtb__184), dtb__186)), dtb__187))))
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
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExpr ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun tele -> ((fun teleCtx0 -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> ((Base_dResult.v_Base_dResult_dandThen ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind globals) teleCtx0) ec0) argExpr) dtb__188) sp)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__189, dtb__190) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__190)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__191, dtb__189, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__189))), dtb__192))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele))) (((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleOf banned) combined) (Base_dList.C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("#inst", sp)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (argExpr, ctxArgs)), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__193)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__193)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__193))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (match dtb__196 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> (match ctxParts with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dElab_dTrait_dinstanceMono headExpr) then (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__195) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__194), Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__197, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__194) dtb__197))), ec0))))
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__194) dtb__195) ctxParts))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__194) dtb__195) ctxParts)
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__193))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf dtb__198), dtb__200)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__199) dtb__201)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__202, dtb__203, dtb__204, dtb__205) -> dtb__204
  | _ -> failwith "DT: impossible branch"
)) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__209
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__210, dtb__211, dtb__212) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__210), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__211), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__212)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__213, dtb__214) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__213), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt mc0) mc1) alt))) dtb__214)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__215, dtb__216) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__215, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__216)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__217, dtb__218, dtb__219) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__217), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__218), dtb__219))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__220, dtb__221, dtb__222) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__220, dtb__221, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + 1)) dtb__222)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__223, dtb__224, dtb__225, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) mc1) dtb__226), (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + 1)) dtb__227)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__228, dtb__229) -> (if (dtb__229 = mc1) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) mc0) else mc2)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__230, dtb__231, dtb__232) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__230, dtb__231, (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__231))) dtb__232)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam = (fun arg t -> (((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamGo arg) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (match dtb__233 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__235, dtb__236, dtb__237, dtb__238) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__235) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__234) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__236, dtb__237)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__234) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__234) mc2)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__239) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__240) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__241, dtb__242) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__241 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__244)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__242))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__245, dtb__246) -> dtb__245
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (match dtb__247 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__249, dtb__250) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__249) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__251) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__248) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__250) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__248) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__249) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__253) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__253))) dtb__248) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, k)), mc5)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__254) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__248) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__252))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc2) (Base_dList.v_Base_dList_dreverse mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil) acc))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__255, dtb__256) -> (match dtb__255 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, dtb__258) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__256) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__257) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__258)) ((dtb__258 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__259, dtb__260) -> (match dtb__259 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__261, dtb__262) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__262) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__263) -> (match dtb__263 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__265)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__265)) 0) dtb__261) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__264)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__266) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__260) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__261, dtb__264)), mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__265) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__266)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__267) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__260) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__261, dtb__264)), mc5))) dtb__265)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__268) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__262)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__262))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__262) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__260) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__259, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc6) (Base_dList.v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Base_dList_dNil) acc) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__269, dtb__270, dtb__271) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__269), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__270), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__271)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__272, dtb__273) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__272), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__273)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__274, dtb__275) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__274, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__275)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__276, dtb__277, dtb__278) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__276), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__277), dtb__278))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__279, dtb__280, dtb__281) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__279, dtb__280, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__281)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__282, dtb__283, dtb__284, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__285), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__286)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__287) -> (if (dtb__287 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__288, dtb__289, dtb__290) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__288, dtb__289, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__289))) dtb__290)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__291, dtb__292) -> (match dtb__291 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, dtb__294) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__292) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__293) dtb__294) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__295, dtb__296) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__295))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__297) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__298) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__299, dtb__300) -> (match dtb__299 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__301, dtb__302, dtb__303) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__302) mc2) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__301, dtb__302, (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, dtb__303)))), dtb__300)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__301, dtb__302, dtb__303)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__300))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (mc1, mc2, Base_dList.C_Base_dList_dList_Base_dList_dNil)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__304, dtb__305) -> (match dtb__304 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__306, dtb__307) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__307) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__306) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__308) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__305) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__305) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__306) dtb__307) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__305) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (if dtb__310 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__313)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__314) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__314))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__315) -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__316, dtb__317) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__317) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__316) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__318, dtb__319) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__318)) mc1) mc2) dtb__319)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (x, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__320, dtb__321, dtb__322) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__320, dtb__321, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__322)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__323, dtb__324, dtb__325, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__326), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__327)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__328, dtb__329, dtb__330) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__328), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__329), dtb__330))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__331) -> (match dtb__331 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, dtb__333) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__332) dtb__333)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__334, dtb__335) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__334, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__335)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__336, dtb__337) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__336), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__337)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__338, dtb__339, dtb__340) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__338), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__339), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__340)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__341, dtb__342, dtb__343) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__341, dtb__342, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__342))) dtb__343)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((depth - appPos) - 1))), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) args))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__344, dtb__345) -> (match dtb__344 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__346, dtb__347, dtb__348) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__345)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__348))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__346))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__348) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__346) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__347)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__346)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ty, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec)))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__349, dtb__350) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__349) = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__350)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__349, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__350))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__351, dtb__352) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__351)) dtb__352)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("#tele", i, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual = (fun ec n a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) a)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTrait_dteleAlphaEnv n)) b)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__353) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__354) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__355, dtb__356) -> (if ((Base_dList.v_Base_dList_dlength (match dtb__355 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__357, dtb__358, dtb__359, dtb__360) -> dtb__358
  | _ -> failwith "DT: impossible branch"
)) = mc1) then (if ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual mc0) mc1) mc2) (match dtb__355 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__361, dtb__362, dtb__363, dtb__364) -> dtb__364
  | _ -> failwith "DT: impossible branch"
)) then true else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__356)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact mc0) mc1) mc2) dtb__356))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet = (fun ec n head inst -> (if ((Base_dList.v_Base_dList_dlength (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__365, dtb__366, dtb__367, dtb__368) -> dtb__366
  | _ -> failwith "DT: impossible branch"
)) = n) then ((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) n) head) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__369, dtb__370, dtb__371, dtb__372) -> dtb__372
  | _ -> failwith "DT: impossible branch"
)) else false))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo = (fun remaining i -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (("#ov" ^ (bi_strFromInt i)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo (remaining - 1)) (i + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv = (fun n -> ((v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnvGo n) 0))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne = (fun ec teleA hA teleB hB -> (match (((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) teleA) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__373, dtb__374) -> ((fun envA -> ((fun envB -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__374)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__374)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envA) hA)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval envB) hB)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__375) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (true, ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__374) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__375))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__376) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (false, dtb__374))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dteleGlobalEnv (Base_dList.v_Base_dList_dlength teleB)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) dtb__373))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap = (fun ec tele1 h1 tele2 h2 -> (match tele1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match tele2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dheadsAlphaEqual ec) 0) h1) h2), ec))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele2) h2) tele1) h1)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlapOne ec) tele1) h1) tele2) h2)
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__377, dtb__378) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__379, dtb__380) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc1)) mc2) dtb__379) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__380) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__381, dtb__382) -> (if dtb__381 then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__382)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__380))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (match dtb__379 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__383, dtb__384, dtb__385, dtb__386) -> dtb__384
  | _ -> failwith "DT: impossible branch"
)) (match dtb__379 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__387, dtb__388, dtb__389, dtb__390) -> dtb__390
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__391, dtb__392) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceExactQuiet mc0) (Base_dList.v_Base_dList_dlength mc1)) mc2) dtb__391) then ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__392) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, dtb__394) -> (if dtb__393 then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap)), dtb__394)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap mc0) mc1) mc2) dtb__392))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dheadsOverlap mc0) mc1) mc2) (match dtb__391 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__395, dtb__396, dtb__397, dtb__398) -> dtb__396
  | _ -> failwith "DT: impossible branch"
)) (match dtb__391 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__399, dtb__400, dtb__401, dtb__402) -> dtb__402
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash = (fun ec name tele head seen -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dhasInstName name) seen) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else (if ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceExact ec) (Base_dList.v_Base_dList_dlength tele)) head) seen) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate)), ec)) else ((((v_Vuna_dCompiler_dElab_dTrait_danyInstanceOverlap ec) tele) head) seen))))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__403, dtb__404) -> (match dtb__403 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__405, dtb__406) -> (match dtb__405 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__407, dtb__408, dtb__409, dtb__410) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__403, dtb__404))))) mc3) dtb__410) dtb__408) dtb__407)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__411, dtb__412) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, dtb__414) -> (match dtb__413 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__404) mc1) mc2) dtb__414) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (inst, mc5))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__415) -> (match dtb__415 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashOverlap -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__410) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOverlappingInstances (iname))) iname)
  | C_Vuna_dCompiler_dElab_dTrait_dInstClash_Vuna_dCompiler_dElab_dTrait_dClashDuplicate -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__410) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTrait_dfindInstanceClash dtb__412) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__411)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__411)) mc6))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__411), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__411), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__411))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__411))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__411)) dtb__408))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__404) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__416) -> dtb__416
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__417, dtb__418) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__417)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__419, dtb__420) -> (match dtb__420 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__421, dtb__422) -> (match dtb__422 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__423, dtb__424) -> (match dtb__424 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__425, dtb__426) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__418) ((Base_dList.v_Base_dList_dappend mc1) dtb__421)) dtb__426) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__419, mc3))) ((Base_dList.v_Base_dList_dappend dtb__421) mc4)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__423, mc5))) ((Base_dList.v_Base_dList_dappend dtb__425) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc3), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc2))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__427, dtb__428) -> (match dtb__427 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__429, dtb__430) -> (if (dtb__429 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__430)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__428))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__431) -> dtb__431
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl (Base_dHashMap.v_Base_dHashMap_dfromList gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__432, dtb__433) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember (Base_dPair.v_Base_dPair_dfirstOf dtb__432)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__433) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__433) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__432), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__432)), (Base_dPair.v_Base_dPair_dsecondOf dtb__432), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__432)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__434, dtb__435) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> (if dtb__437 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__439) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__436) dtb__439) dtb__440) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__434, dtb__435))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__439) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__436) dtb__439) dtb__440) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__434, dtb__435))) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match dtb__434 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__441, dtb__442) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__441) dtb__435) mc5) dtb__439) dtb__440) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__443) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) "_") dtb__435) mc5) dtb__439) dtb__440) mc7)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__434)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> (if dtb__445 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__447) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__444) dtb__447) dtb__448) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__447) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__444) dtb__447) dtb__448) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7))
  | _ -> (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__449, dtb__450) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dtb__449)), dtb__450))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__451, dtb__452) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__451)), dtb__452))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__453, dtb__454, dtb__455) -> (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (if dtb__457 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__459) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__456) dtb__459) dtb__460) Base_dList.C_Base_dList_dList_Base_dList_dNil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__459) then ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__456) dtb__459) dtb__460) Base_dList.C_Base_dList_dList_Base_dList_dNil) body) sp) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__460) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__461, dtb__462) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (etaName, ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__459), dtb__461)), dtb__462))))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (body, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (etaName, sp)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__459) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)
)
)))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec pname pats body dom clo sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__463, dtb__464) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, dtb__463)), dtb__464))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dom))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals ctx0 ec clauses expected sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__465, dtb__466) -> (match dtb__465 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__467, dtb__468) -> (match dtb__466 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__467) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__467) dtb__468) expected) sp) else ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine sp))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__469, dtb__470) -> (match dtb__469 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__471, dtb__472) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc10) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__473, dtb__474) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__474) dtb__470) mc5) mc6) mc7) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__473, mc8))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__473, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc9))) mc10)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParam mc6) dtb__472)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__471) mc7))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc8), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc9), mc3))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArg ec methods sp -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dparamNameOf (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__475, dtb__476, dtb__477, dtb__478) -> dtb__476
  | _ -> failwith "DT: impossible branch"
))) headArg) methods) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun instDecls allDecls globals classes datas ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__479, dtb__480) -> (match dtb__479 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__481, dtb__482, dtb__483, dtb__484) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig classes) globals) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) instDecls))) ec) dtb__484) dtb__482) dtb__481)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__485, dtb__486) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__485)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__484) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__487) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__487) dtb__483) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__488) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__484) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceUnknownMethod (dtb__488))) dtb__488)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__487) dtb__483) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__489) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__487)) dtb__489) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__490) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__490) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__484) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) dtb__487) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArg dtb__485)) dtb__486) dtb__483) dtb__484)) (fun q -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__491, dtb__492) -> (match dtb__492 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__493, dtb__494) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) dtb__484) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) Base_dList.C_Base_dList_dList_Base_dList_dNil) ec2)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__495, dtb__496) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__496) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__485))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf dtb__485) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__487))) fields2))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__487)) dtb__482))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__495)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__491))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__494) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__485)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__485)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx dtb__485))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__480) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__497, dtb__498) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__497, dtb__498))) mc1) mc4) mc2) mc3) mc5) dtb__497)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__499, dtb__500) -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__498) mc1) mc2) mc3) ((Base_dList.v_Base_dList_dappend mc4) dtb__499)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc6))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__500) ((Base_dHashMap.v_Base_dHashMap_dinsertAll dtb__499) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__500))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__500) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dsecondOf dtb__497)))) dtb__499))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls classes datas globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (d, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d))))) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__501, dtb__502) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__501, dtb__502))) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc3) mc1) mc2) mc4) dtb__501)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__503, dtb__504) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__502) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__503)) dtb__504) ((Base_dList.v_Base_dList_dappend dtb__503) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9))
