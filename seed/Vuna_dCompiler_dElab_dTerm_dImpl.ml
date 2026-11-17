open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily = C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily of (string) * (string) * (string)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps : t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc }

# 41 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque = (fun ec ctx i -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1; Base_dPair.f_Base_dPair_dPair_second = dtb__2 } -> ((fun v -> ((fun r -> r) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) ctx) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (i + 1)) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxItemAt i) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))

# 35 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (Base_dList.C_Base_dList_dList__x58__x58_ (((mc2 - 1) - mc4), (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices = (fun ec ctx n tele -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo ec) ctx) n) tele) 0))

# 142 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (Base_dList.v_Base_dList_dhasDupNames (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

# 271 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__7; Base_dPair.f_Base_dPair_dPair_second = dtb__8 } -> (match dtb__7 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__9, dtb__10) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__11, dtb__12) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__13) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf = (fun last -> (if ((Base_dString.v_Base_dString_dendsWith "Op") last) then ((fun n -> (if (n > 2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring 0) (Base_dNat.v_Base_dNat_dfromInt (n - 2))) last))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (bi_strLength last)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 380 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical = (fun canon -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg canon)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (canon, (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName canon), dtb__14))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__15) -> (match dtb__15 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical dtb__16)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 393 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__18, dtb__19, dtb__20) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__21, dtb__22) -> (match dtb__19 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax dtb__21) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__20 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 399 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__28) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 405 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__35, dtb__36) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__37, dtb__38) -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__35) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = dtb__40 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 411 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__46, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax, dtb__43)), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, Base_dList.C_Base_dList_dList_Nil)), dtb__43)), dtb__49)), dtb__43))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
))

# 437 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__53, dtb__54) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax dtb__53) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__57; Base_dPair.f_Base_dPair_dPair_second = dtb__59 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 451 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor = (fun ec cname sp -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) cname) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__61))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily = (fun ec cname sp -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName cname) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort cname)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets cname))) (fun canon -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) canon) sp))) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) cname) sp)))

# 457 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__62, dtb__63, dtb__64) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily mc0) dtb__62) dtb__64)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle mirror case pattern is not a constructor")
))

# 462 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__67) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__69) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__69))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__70) -> (if (dtb__70 = mc1) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) mc1) dtb__66) else ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__67)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleClauseFamilyMismatch (mc1, dtb__70))) mc1) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__73; Base_dPair.f_Base_dPair_dPair_second = dtb__74 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__73) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__76) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) dtb__76) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__77) -> true
  | _ -> false
))

# 487 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__78) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (if dtb__80 then (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows dtb__83) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm dtb__82) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__84 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 482 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity = (fun kind -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows kind) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (if (dtb__85 >= 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__85 - 1))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs = (fun k sp -> (if (k <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs (k - 1)) sp)))))

# 507 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg = (fun canon k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs k) sp), sp))))

# 512 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder = "@vuna@handle@sig"

# 517 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg = (fun canon k sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Eff.sigFn", sp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg canon) k) sp), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)), sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))

# 533 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind = (fun globals ec canon -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup canon) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__86)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder = "@vuna@handle@ret"

# 543 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax dtb__87) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder, dtb__88)), dtb__88)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88)))
  | _ -> mc0
))

# 525 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall = (fun headMode nameArg canon k comp ret opH sp -> ((fun fnName -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (fnName, sp)), (Base_dList.C_Base_dList_dList__x58__x58_ (nameArg, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (canon, sp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg canon) k) sp), (Base_dList.C_Base_dList_dList__x58__x58_ (comp, (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg ret), (Base_dList.C_Base_dList_dList__x58__x58_ (opH, Base_dList.C_Base_dList_dList_Nil)))))))))))), sp))) (if headMode then "Base.Eff.handleWithAt" else "Base.Eff.handleWith")))

# 552 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf = (fun globals ec canon sp -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind globals) ec) canon) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity dtb__89) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr = (fun globals ec opTy op sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> (match dtb__91 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__92, dtb__93, dtb__94) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf globals) ec) dtb__92) sp)) (fun k -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Eff.performCore", sp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__92, sp)), (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg dtb__92) k) sp), (Base_dList.C_Base_dList_dList__x58__x58_ (op, Base_dList.C_Base_dList_dList_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_EffResFamilyMissing (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue ec) opTy)))

# 561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith = (fun globals ec expr sp headMode nameArg -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (match dtb__95 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__96; Base_dPair.f_Base_dPair_dPair_second = dtb__97 } -> (match dtb__97 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = dtb__99 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__100, dtb__101, dtb__102) -> (match dtb__100 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (match dtb__104 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__107, dtb__108, dtb__109) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies ec) dtb__108)) (fun fam -> ((fun nd_uscrut31 -> (match nd_uscrut31 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (match dtb__110 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__111, dtb__112, dtb__113) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf globals) ec) dtb__111) sp)) (fun k -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall headMode) nameArg) dtb__111) k) dtb__96) dtb__98) dtb__99) sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (fam))) fam)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical fam))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed handle marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed handle marker")
)) dtb__99)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle marker expected")
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr)))

# 574 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) false) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp))))

# 578 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) true) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffDefaultInstance, sp))))

# 583 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) true) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp))))

# 688 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf = (fun ec ty -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__114) -> (match dtb__114 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__115, dtb__116) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__115) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__117) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__116 } }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__117)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty)))

# 699 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 707 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom = (fun i remaining sp -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 703 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats = (fun n sp -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom 0) n) sp))

# 716 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (if ((dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = (dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType } })) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo mc0) dtb__121) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 713 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup = (fun fname dd -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo fname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd))))

# 723 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__124) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo mc0) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown = (fun dd fields -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo dd) fields))

# 734 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__130 } -> (if (dtb__129 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__130)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor mc0) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 740 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg = (fun i f provided sp -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor (f).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131) -> dtb__131
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp))
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg mc0) dtb__132) mc2) mc3), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs (mc0 + 1)) dtb__133) mc2) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 752 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__135)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> (match dtb__138 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = dtb__140 } -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__135)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__136) mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan = (fun ec baseTy fname sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (match dtb__141 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> (match dtb__143 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData = dtb__142; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor = dtb__144; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs = dtb__145; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord = (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField = dtb__147; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount = dtb__149; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Base_dList.v_Base_dList_dreverse dtb__145)) dtb__150) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ fname))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup fname) dtb__142))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve record type for field "; fname; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 792 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan = (fun ec baseTy fields sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> (match dtb__151 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> (match dtb__153 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown dtb__152) fields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ dtb__156))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun fs -> ((fun bodyArgs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData = dtb__152; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor = dtb__154; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs = dtb__155; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord = (dtb__152).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount = (Base_dList.v_Base_dList_dlength fs); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices dtb__152) fields); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs = bodyArgs }))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs 0) fs) fields) sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dtb__152))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 805 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName "Base.Record.HasField")

# 815 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__161) -> (match dtb__161 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__162, dtb__163) -> (if (dtb__162 = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__168, dtb__169) -> ((fun nd_uscrut27 -> (match nd_uscrut27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__170) -> (match dtb__170 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__171, dtb__172) -> (if (dtb__171 = "Base.Field.Field") then (match dtb__172 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__175) -> (if (dtb__175 = mc4) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__166) mc5) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__176) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__159, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__168; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__177) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) dtb__164))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) dtb__163) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__158) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc2) mc1) dtb__160)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict = (fun ctx ec fname baseTy -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ctx) ec) fname) baseTy))

# 836 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel = (fun fuel globals ctx ec baseTerm baseTy fname sp -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__178) -> (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__179, dtb__180) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["type "; dtb__179; " is not a record"]))
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (match dtb__181 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> (match dtb__183 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__184), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__182, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (match dtb__186 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (match dtb__188 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__189), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__187, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) baseTy)))

# 1024 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__191, dtb__192, dtb__193) -> (match dtb__191 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__194, dtb__195) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__194) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail dtb__196) dtb__198) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__200, dtb__201) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__200) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
# 1030 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail = (fun h t -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (h, dtb__202))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__203)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__203)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort mc0) dtb__204))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1044 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor = (fun ec fam short -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort short) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__205))
  | _ -> failwith "DT: impossible branch"
))

# 1050 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, dtb__207) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo mc0) mc1) dtb__207) mc3)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, (Base_dList.C_Base_dList_dList__x58__x58_ (t, Base_dList.C_Base_dList_dList_Nil)))), mc3))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__208, dtb__209, dtb__210) -> (match dtb__208 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__211, dtb__212) -> (match dtb__209 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax dtb__211) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__215 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1065 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__220, dtb__221) -> (match dtb__218 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__223 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__220) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__222; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__224; Base_dPair.f_Base_dPair_dPair_second = dtb__225 } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1079 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, mc1, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan mc0)))
))

# 1072 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts = (fun e -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (match dtb__227 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__228; Base_dPair.f_Base_dPair_dPair_second = dtb__229 } -> (match dtb__229 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__230; Base_dPair.f_Base_dPair_dPair_second = dtb__231 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra dtb__228) dtb__231); Base_dPair.f_Base_dPair_dPair_second = dtb__230 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts e))
  | _ -> failwith "DT: impossible branch"
))

# 1084 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> e
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> (match dtb__232 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__233; Base_dPair.f_Base_dPair_dPair_second = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1089 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (match dtb__235 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__236; Base_dPair.f_Base_dPair_dPair_second = dtb__237 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1094 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr = (fun e sp -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238) -> dtb__238
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1106 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsArgs = (fun e t sp -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName, sp)), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr e) sp), (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel e), Base_dList.C_Base_dList_dList_Nil)))), sp)), (Base_dList.C_Base_dList_dList__x58__x58_ (t, Base_dList.C_Base_dList_dList_Nil)))))

# 1099 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__239, dtb__240) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo mc0) mc1) dtb__240) mc3)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsArgs dtb__239) t) mc3), mc3))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1113 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc0) mc1) dtb__241) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf mc0) mc1) dtb__242)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1110 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons = (fun ec fam -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf ec) fam) (Base_dList.C_Base_dList_dList__x58__x58_ ("::", (Base_dList.C_Base_dList_dList__x58__x58_ ("Cons", (Base_dList.C_Base_dList_dList__x58__x58_ ("RCons", (Base_dList.C_Base_dList_dList__x58__x58_ ("VCons", Base_dList.C_Base_dList_dList_Nil))))))))))

# 1120 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit = (fun ec fam elems sp -> (if (fam = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowFamilyName) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__244) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons ec) fam) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__244)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__245)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons ec) fam) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__247) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__246)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__247)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1133 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf ec) expected) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248) -> dtb__248
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1139 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit = (fun ec dom a -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))) dtb__249) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan a))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1291 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 }, Base_dList.C_Base_dList_dList_Nil)))))))

# 1294 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Nil))))

# 1299 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NatLiteralOutOfRange) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

# 1302 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("natToInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1305 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1308 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1312 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 1315 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__250) -> (match dtb__250 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__251, dtb__252) -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__251 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1320 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__253) -> (match dtb__253 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__254, dtb__255) -> (match dtb__255 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__254 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1326 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__256) -> (match dtb__256 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__257, dtb__258) -> (match dtb__258 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__257 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 933 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected = (fun ec name expected -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__260, dtb__261) -> false
  | _ -> true
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected mc0) mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__262))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 1337 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = bTy }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dPair.f_Base_dPair_dPair_second = bTerm } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = aTy; Base_dPair.f_Base_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = aTerm; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))

# 1351 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf = (fun mc0 mc1 -> (if (mc1 = "+") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("+")) else (if (mc1 = "-") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("-")) else (if (mc1 = "*") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("*")) else (if (mc1 = "/") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("/")) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot mc1) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName mc0) mc1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

# 1358 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1364 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1367 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1376 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName = (fun mc0 -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1372 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1382 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__263, dtb__264) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1450 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disSimpleComp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__265, dtb__266) -> true
  | _ -> false
))

# 1505 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower = (fun globals ctx ec traitName methodName lit expected sp -> ((fun dictDom -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__267) -> (match dtb__267 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (methodName, sp)), (Base_dList.C_Base_dList_dList__x58__x58_ (lit, Base_dList.C_Base_dList_dList_Nil)), sp)); Base_dPair.f_Base_dPair_dPair_second = dtb__269 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__270) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictDom) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName traitName), (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected), Base_dList.C_Base_dList_dList_Nil))))))))

# 1514 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__271, dtb__272) -> "EFloat"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__273, dtb__274, dtb__275) -> "EInterp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__276, dtb__277, dtb__278) -> "EAnn"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__279, dtb__280, dtb__281) -> "ESectR"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__282, dtb__283, dtb__284) -> "ESectL"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__285, dtb__286) -> "ESectOp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__287, dtb__288, dtb__289, dtb__290) -> "EBacktick"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__291, dtb__292) -> "EParen"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__293, dtb__294, dtb__295, dtb__296) -> "EInfix"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__297, dtb__298) -> "EDo"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__299, dtb__300, dtb__301) -> "ERecUpdate"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__302, dtb__303, dtb__304) -> "ERecord"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__305, dtb__306, dtb__307) -> "EField"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__308, dtb__309) -> "ELocalFun"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__310, dtb__311, dtb__312, dtb__313) -> "ELet"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__314, dtb__315, dtb__316) -> "ECase"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__317, dtb__318, dtb__319, dtb__320) -> "EIf"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> "EPi"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__327, dtb__328, dtb__329) -> "EApp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__330, dtb__331, dtb__332) -> "ELam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__333, dtb__334) -> "EStr"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__335, dtb__336) -> "EInt"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__337, dtb__338) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 1551 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_doverValueCandidateMatches = (fun globals ctx ec expected target -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__339) -> (match dtb__339 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__340) -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__340)) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__341) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__342) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) target)))

# 1559 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverValueTarget = (fun globals ctx ec short targets expected sp -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__343, dtb__344) -> (match dtb__344 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__343))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName (short, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)))) short) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName (short, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)))) short) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets))
)) ((Base_dList.v_Base_dList_dfilter ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_doverValueCandidateMatches globals) ctx) ec) expected)) targets)))

# 1667 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__345, dtb__346, dtb__347) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__346)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__348, dtb__349, dtb__350) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__349)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__351, dtb__352, dtb__353) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__351) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__352))
  | _ -> false
))
# 1675 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__354, dtb__355) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__354) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__355))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1680 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__356, dtb__357) -> (match dtb__356 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__358; Base_dPair.f_Base_dPair_dPair_second = dtb__359 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__359) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__357))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1685 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__360, dtb__361) -> (match dtb__360 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__362; Base_dPair.f_Base_dPair_dPair_second = dtb__363 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__362) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1690 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__364, dtb__365, dtb__366) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__364)) (fun value2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (value2, dtb__365, dtb__366))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__367, dtb__368) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__367)) (fun stmts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (stmts2, dtb__368))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__369, dtb__370, dtb__371) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__369)) (fun base2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf fv); Base_dPair.f_Base_dPair_dPair_second = v2 })))))) dtb__370)) (fun fields2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (base2, fields2, dtb__371))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__372, dtb__373, dtb__374) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf fv); Base_dPair.f_Base_dPair_dPair_second = v2 })))))) dtb__373)) (fun fields2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__372, fields2, dtb__374))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__375, dtb__376, dtb__377) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__375)) (fun base2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (base2, dtb__376, dtb__377))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__378, dtb__379, dtb__380, dtb__381) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__378)) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__379)) (fun t2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__380)) (fun el2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, el2, dtb__381))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__382, dtb__383, dtb__384) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__382)) (fun scrut2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__383)) (fun alts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__384))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__385, dtb__386, dtb__387, dtb__388) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__385)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__386)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (binds2, body2, dtb__387, dtb__388))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__389, dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__392)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__393)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__389, dtb__390, dtb__391, dom2, cod2, dtb__394))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__395, dtb__396, dtb__397) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__395)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__396)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__397))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__398, dtb__399, dtb__400) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__399)) (fun b2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__398, b2, dtb__400))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__401, dtb__402) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__401, dtb__402))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__403, dtb__404) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__403, dtb__404))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__405, dtb__406) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__405, dtb__406))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__407, dtb__408) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__407, dtb__408))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__409, dtb__410) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__409) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__409, dtb__410)))) else ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__409))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unreordered infix/paren in elaboration")
))
# 1731 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = dtb__412 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__412)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 1735 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__413, dtb__414) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__413)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (v2, dtb__414))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__415, dtb__416, dtb__417) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__416)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__415, v2, dtb__417))))))
  | _ -> failwith "DT: impossible branch"
))

# 1845 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas = (fun fuel ctx ec v -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__423; Base_dPair.f_Base_dPair_dPair_second = dtb__424 } -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas (fuel - 1)) ctx) dtb__424) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__422) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__423)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = v; Base_dPair.f_Base_dPair_dPair_second = ec }))
)))

# 1857 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__425, dtb__426) -> true
  | _ -> false
))

# 1863 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__427, dtb__428) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__429) -> (match dtb__429 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__430, dtb__431, dtb__432) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__433, dtb__434) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1875 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint = (fun goals0 ctx expected ec piTy -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) <= goals0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__435) -> (match dtb__435 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__436; Base_dPair.f_Base_dPair_dPair_second = dtb__437 } -> ((fun forcedRes -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue dtb__437) forcedRes) then (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue dtb__437) expected) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__437) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) forcedRes) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__438) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__439) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439))
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__437) dtb__436))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__440) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas 64) ctx) ec) piTy))))

# 1916 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__441) -> (match dtb__441 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__442, dtb__443) -> (match dtb__443 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__444, dtb__445) -> (match dtb__445 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__446, dtb__447) -> (if (dtb__442 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__444; Base_dPair.f_Base_dPair_dPair_second = dtb__446 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1922 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue = (fun v -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult v) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__448) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__448)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1928 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__449, dtb__450) -> (dtb__449 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 1934 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail = (fun v -> (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__451, dtb__452) -> (if (dtb__451 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__453, dtb__454) -> (match dtb__454 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__455, dtb__456) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__453; Base_dPair.f_Base_dPair_dPair_second = dtb__455 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__452) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1943 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName = (fun g -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg g))

# 1952 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__457, dtb__458) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (String.concat "" [mc0; " "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) dtb__457)])) dtb__458)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1947 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__459) -> (match dtb__459 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__460, dtb__461) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName dtb__460)) dtb__461)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1957 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__462) -> dtb__462
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

# 1963 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText = (fun ec n h -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText ec) n) = "default") then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) h) else (String.concat "" [((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) h); "@"; ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText ec) n)])))

# 1969 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnamedLabelParts = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__463) -> (match dtb__463 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__464, dtb__465) -> (if (dtb__464 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__466, dtb__467) -> (match dtb__467 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__468, dtb__469) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__466; Base_dPair.f_Base_dPair_dPair_second = dtb__468 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__465) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1977 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryTextOf = (fun ec label -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) label)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__470) -> (match dtb__470 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__471; Base_dPair.f_Base_dPair_dPair_second = dtb__472 } -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText ec) dtb__471) dtb__472)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnamedLabelParts ec) label)))

# 1983 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels = (fun fuel ec row -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) row) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__473, dtb__474) -> (if (dtb__473 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else (if (dtb__473 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__475) -> (match dtb__475 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__476; Base_dPair.f_Base_dPair_dPair_second = dtb__477 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) dtb__476) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels (fuel - 1)) ec) dtb__477) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__478) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryTextOf ec) dtb__476), dtb__478))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__473, dtb__474)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 1997 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__479, dtb__480) -> (match dtb__480 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__479
  | _ -> (String.concat "" [dtb__479; ", "; (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__480)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2004 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel = (fun ec expected actual -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__481) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue ec) dtb__481) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__482) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) ec) dtb__482) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__483) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__483) Base_dList.C_Base_dList_dList_Nil) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__483)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2021 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue = (fun a b -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) a)) = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) b))))

# 2024 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue = (fun ec fuel expected label -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__484, dtb__485) -> (if (dtb__484 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__486) -> (match dtb__486 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__487; Base_dPair.f_Base_dPair_dPair_second = dtb__488 } -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue label) dtb__487) then true else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__488)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__484, dtb__485)))) else false)
  | _ -> false
)))

# 2034 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue = (fun ec fuel actual expected -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__489, dtb__490) -> (if (dtb__489 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then true else (if (dtb__489 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__491) -> (match dtb__491 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__492; Base_dPair.f_Base_dPair_dPair_second = dtb__493 } -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) expected) dtb__492) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__493)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__489, dtb__490)))) else false))
  | _ -> false
)))

# 2087 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dweakenLabelTerm = (fun d label tailF result term -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Eff.weaken")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) label), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) tailF), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) result), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))

# 2049 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift = (fun ctx globals ec expected actual term -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Eff.weaken") globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__494) -> ((fun d -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__495) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__496) -> (match dtb__496 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__497; Base_dPair.f_Base_dPair_dPair_second = dtb__498 } -> ((fun tailF -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) tailF) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) d) (Base_dPair.v_Base_dPair_dsecondOf dtb__495)) (Base_dPair.v_Base_dPair_dsecondOf dtb__499)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__500) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__501) -> ((fun actualRow -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue dtb__501) 64) actualRow) (Base_dPair.v_Base_dPair_dfirstOf dtb__495)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = term; Base_dPair.f_Base_dPair_dPair_second = dtb__501 })) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue dtb__501) actualRow) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Eff.raise") globals) dtb__501) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__502) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Eff.raise")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dPair.v_Base_dPair_dfirstOf dtb__495)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dPair.v_Base_dPair_dsecondOf dtb__495)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)); Base_dPair.f_Base_dPair_dPair_second = dtb__501 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__501) d) actualRow) tailF) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__503) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__504) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dweakenLabelTerm d) dtb__497) tailF) (Base_dPair.v_Base_dPair_dsecondOf dtb__495)) term); Base_dPair.f_Base_dPair_dPair_second = dtb__504 }))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__499))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__498))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) (Base_dPair.v_Base_dPair_dfirstOf dtb__495))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
))

# 2167 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm = (fun ec name -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__505) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__505) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, Base_dList.C_Base_dList_dList_Nil)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2173 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm = (fun ec name args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__506) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__506) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, args)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 2375 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2379 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromFloat")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2382 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName, Base_dList.C_Base_dList_dList_Nil))))

# 2385 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__507) -> (match dtb__507 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__508, dtb__509) -> (match dtb__509 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__508 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 2447 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__510) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__510; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__511, dtb__512) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__511; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__512) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__513, dtb__514, dtb__515) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType dtb__513) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__516; Base_dPair.f_Base_dPair_dPair_second = dtb__517 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__516; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__517) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__514, Base_dList.C_Base_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 2443 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__518, dtb__519, dtb__520, dtb__521, dtb__522) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs dtb__522)
  | _ -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType mc0))
))

# 2454 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__523, dtb__524, dtb__525, dtb__526, dtb__527) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis dtb__527)
  | _ -> mc0
))

# 2458 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__528, dtb__529) -> (match dtb__528 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__530, dtb__531, dtb__532) -> (if (dtb__531 = ((mc1 - 1) - mc0)) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs (mc0 + 1)) mc1) dtb__529) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2465 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine = (fun fam ctor -> ((fun k -> ((fun args -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__533; Base_dPair.f_Base_dPair_dPair_second = dtb__534 } -> (if (dtb__533 = fam) then (if ((Base_dList.v_Base_dList_dlength args) > 0) then (if ((Base_dList.v_Base_dList_dlength args) < k) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

# 2479 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__535, dtb__536) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dPair.v_Base_dPair_dsecondOf dtb__535), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo (mc0 - 1)) dtb__536))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2476 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs = (fun n bs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo n) bs))

# 2498 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__537, dtb__538) -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__539, dtb__540) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) mc1) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__541, dtb__542, dtb__543, dtb__544, dtb__545) -> (if dtb__542 then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__545) dtb__537)) dtb__538) dtb__540) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc4) dtb__537); Base_dPair.f_Base_dPair_dPair_second = dtb__539 }, mc5))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 2483 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs = (fun ec ctx ctor expected -> ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine fam) ctor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__546) -> (match dtb__546 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__547, dtb__548) -> ((fun arity -> (if (dtb__547 = fam) then (if ((Base_dList.v_Base_dList_dlength dtb__548) = arity) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) dtb__548) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Nil) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)))

# 2513 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__549 = mc0 in (if dtnat__549 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__550 = (dtnat__549 - 1) in (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__551, dtb__552, dtb__553) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__551) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__554) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__550) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__554)) dtb__552) dtb__553)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__552, dtb__553)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__551) then (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__555) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__550) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__555)) dtb__552) dtb__553)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__552, dtb__553)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__551) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor mc1) dtb__553) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__551)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__551))) (fun target -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__550) mc1) mc2) mc3) target) dtb__552) dtb__553))) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__550) mc1) mc2) mc3) dtb__551) dtb__552) dtb__553))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__556, dtb__557, dtb__558) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)))))
# 2530 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (let dtnat__559 = mc0 in (if dtnat__559 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__560 = (dtnat__559 - 1) in (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__561) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__562) -> (match dtb__562 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> (match dtb__564 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__565; Base_dPair.f_Base_dPair_dPair_second = dtb__566 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__560) dtb__566) mc2) dtb__565) mc5)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__567; Base_dPair.f_Base_dPair_dPair_second = dtb__568 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, dtb__567, mc6)); Base_dPair.f_Base_dPair_dPair_second = dtb__568 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs mc1) mc2) dtb__561) mc3))
  | _ -> failwith "DT: impossible branch"
)))))
# 2541 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__569 = mc0 in (if dtnat__569 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__570 = (dtnat__569 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__571, dtb__572) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__573, dtb__574, dtb__575, dtb__576, dtb__577) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__574 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__570) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__571, dtb__572))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__570) mc1) mc2) dtb__576) dtb__571)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__578; Base_dPair.f_Base_dPair_dPair_second = dtb__579 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__570) dtb__579) ctx2) ty2) dtb__572)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__580; Base_dPair.f_Base_dPair_dPair_second = dtb__581 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__578, dtb__580)); Base_dPair.f_Base_dPair_dPair_second = dtb__581 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__577) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__573) dtb__576) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__573, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2564 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__582 = mc0 in (if dtnat__582 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__583 = (dtnat__582 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__584, dtb__585) -> (match dtb__584 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__586; Base_dPair.f_Base_dPair_dPair_second = dtb__587 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__586)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__588; Base_dPair.f_Base_dPair_dPair_second = dtb__589 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo dtb__583) dtb__589) mc2) mc3) dtb__585)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__590; Base_dPair.f_Base_dPair_dPair_second = dtb__591 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__588; Base_dPair.f_Base_dPair_dPair_second = dtb__587 }, dtb__590)); Base_dPair.f_Base_dPair_dPair_second = dtb__591 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2560 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts = (fun ec ctx ty alts -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 2592 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__592 = mc0 in (if dtnat__592 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__593 = (dtnat__592 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__594, dtb__595) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__596, dtb__597, dtb__598, dtb__599, dtb__600) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__597 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__593) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__594, dtb__595))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__593) mc1) mc2) dtb__599) dtb__594)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__601; Base_dPair.f_Base_dPair_dPair_second = dtb__602 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__593) dtb__602) ctx2) ty2) dtb__595)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__603; Base_dPair.f_Base_dPair_dPair_second = dtb__604 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__601, dtb__603)); Base_dPair.f_Base_dPair_dPair_second = dtb__604 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__600) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__596) dtb__599) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__596, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2581 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__605 = mc0 in (if dtnat__605 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__606 = (dtnat__605 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__607, dtb__608) -> (match dtb__607 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__609; Base_dPair.f_Base_dPair_dPair_second = dtb__610 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__609)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__611; Base_dPair.f_Base_dPair_dPair_second = dtb__612 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo dtb__606) dtb__612) mc2) mc3) dtb__608)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__613; Base_dPair.f_Base_dPair_dPair_second = dtb__614 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__611; Base_dPair.f_Base_dPair_dPair_second = dtb__610 }, dtb__613)); Base_dPair.f_Base_dPair_dPair_second = dtb__614 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2576 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats = (fun ec ctx expected clauses -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 2656 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__615, dtb__616, dtb__617) -> (match dtb__615 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__618, dtb__619) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__618) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__620) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 2678 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain = (fun fuel canonical acc expr -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__621, dtb__622, dtb__623) -> (match dtb__621 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__624, dtb__625) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__624) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__626) -> (if (canonical <> dtb__626) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__627, dtb__628) -> (match dtb__628 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__629, dtb__630) -> (match dtb__629 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__631, dtb__632, dtb__633) -> (match dtb__631 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__634, dtb__635) -> (match dtb__634 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__636; Base_dPair.f_Base_dPair_dPair_second = dtb__637 } -> (match dtb__635 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__630 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain (fuel - 1)) dtb__626) (Base_dList.C_Base_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__636, dtb__627, dtb__625, dtb__637)), acc))) dtb__632)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__622))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = expr }))
)) expr)))

# 2691 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__638, dtb__639, dtb__640) -> (match dtb__638 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__641, dtb__642) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__641) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__643) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__644) -> (match dtb__644 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__645; Base_dPair.f_Base_dPair_dPair_second = dtb__646 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical = dtb__643; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps = dtb__645; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast = dtb__646; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan = dtb__642 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain 4096) dtb__643) Base_dList.C_Base_dList_dList_Nil) mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 2701 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__647, dtb__648) -> (match dtb__647 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__649, dtb__650, dtb__651, dtb__652) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, dtb__651)), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__650, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__649; Base_dPair.f_Base_dPair_dPair_second = dtb__652 }, Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild mc0) dtb__648) mc2) mc3), dtb__651)), Base_dList.C_Base_dList_dList_Nil)))), dtb__651))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 2708 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback = (fun chain -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan))

# 2715 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__653, dtb__654) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__653)) dtb__654) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = dtb__653 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__655) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__655))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2722 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__656) -> (match dtb__656 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__657, dtb__658, dtb__659) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__657, dtb__658, Base_dList.C_Base_dList_dList_Nil))))) dtb__659)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__660, dtb__661) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__660, Base_dList.C_Base_dList_dList_Nil))))) dtb__661)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 2738 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__662, dtb__663, dtb__664, dtb__665, dtb__666) -> (if dtb__663 then (match dtb__666 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__667, dtb__668, dtb__669, dtb__670, dtb__671) -> (if dtb__668 then (match dtb__670 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__672, dtb__673, dtb__674) -> (match dtb__672 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__675) -> (match dtb__673 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__676, dtb__677, dtb__678) -> (match dtb__671 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__679, dtb__680, dtb__681, dtb__682, dtb__683) -> (if dtb__680 then (match dtb__683 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__684, dtb__685, dtb__686, dtb__687, dtb__688) -> (if dtb__685 then (match dtb__688 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__689, dtb__690, dtb__691, dtb__692, dtb__693) -> (if dtb__690 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__692 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__694, dtb__695, dtb__696) -> (match dtb__694 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__697, dtb__698, dtb__699) -> (match dtb__695 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__700, dtb__701, dtb__702) -> (match dtb__693 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__703, dtb__704, dtb__705, dtb__706, dtb__707) -> (if dtb__704 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__706 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__708, dtb__709, dtb__710, dtb__711, dtb__712) -> (if dtb__709 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__711 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__713, dtb__714, dtb__715) -> (match dtb__712 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__716, dtb__717, dtb__718) -> (match dtb__716 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__719, dtb__720, dtb__721) -> (match dtb__717 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__722, dtb__723, dtb__724) -> (match dtb__707 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__725, dtb__726, dtb__727) -> (match dtb__725 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__728, dtb__729, dtb__730) -> (match dtb__726 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__731, dtb__732, dtb__733) -> (if (if (if (if (dtb__677 = 0) then (dtb__698 = 3) else false) then (dtb__720 = 5) else false) then (dtb__729 = 5) else false) then (if (if (if (if (dtb__701 = 1) then (dtb__714 = 2) else false) then (dtb__723 = 2) else false) then (dtb__732 = 2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__691, dtb__705, dtb__710)))) else (if (if (if (if (dtb__701 = 0) then (dtb__714 = 1) else false) then (dtb__723 = 3) else false) then (dtb__732 = 3) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__691, dtb__705, dtb__710)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 2748 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf = (fun globals ctx ec bindName -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup bindName) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__734) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup bindName) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__735) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (bindName)); Base_dPair.f_Base_dPair_dPair_second = dtb__735 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2757 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf = (fun globals ctx ec bindName -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__736) -> (match dtb__736 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__737; Base_dPair.f_Base_dPair_dPair_second = dtb__738 } -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf dtb__738) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__739) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__737; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__738; Base_dPair.f_Base_dPair_dPair_second = dtb__739 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf globals) ctx) ec) bindName)))

# 2767 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer = (fun ctx ec dom sp -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__740; Base_dPair.f_Base_dPair_dPair_second = dtb__741 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__740; Base_dPair.f_Base_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__741) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__741) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

# 2776 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep = (fun fuel globals ctx ec sp dom -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dom) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__742) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__742))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__743) -> (match dtb__743 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__744; Base_dPair.f_Base_dPair_dPair_second = dtb__745 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__744; Base_dPair.f_Base_dPair_dPair_second = dtb__745 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) sp)))))

# 2802 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock = (fun fuel globals ctx ec sp bindName headTerm bindTyTerm shape mVal aVal -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match shape with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__746, dtb__747, dtb__748) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__749, dtb__750, dtb__751, dtb__752, dtb__753) -> (if dtb__750 then ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__754, dtb__755, dtb__756, dtb__757, dtb__758) -> (if dtb__755 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__757) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__757)) (fun dp -> (match dp with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__759; Base_dPair.f_Base_dPair_dPair_second = dtb__760 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind = bindName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead = headTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) mVal); f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal = mVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal = aVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm = dtb__759; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE = dtb__746; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL = dtb__747; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig = dtb__748; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc = dtb__760 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__753) mVal))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) bindTyTerm)))
  | _ -> failwith "DT: impossible branch"
)))

# 2821 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm = (fun ecLinear ecPaper ctx sp binderSp plan binder aVal eTerm argRig lamRig inner -> ((fun depth -> ((fun ctx2 -> ((fun inner2 -> ((fun binderName -> ((fun lamTerm -> ((fun args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead) args)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) aVal); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = eTerm; Base_dPair.f_Base_dPair_dPair_second = argRig }, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = lamTerm; Base_dPair.f_Base_dPair_dPair_second = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL }, Base_dList.C_Base_dList_dList_Nil)))))))))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, binderSp, inner2)))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear ecLinear) ctx) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear ecLinear) ctx2) inner) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName sp) depth) binder) else binder) else binder))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) inner) else inner))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binder) aVal) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

# 53 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 psp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownConstructorInCase ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__761) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan psp)) (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__761)) args))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__762; Base_dPair.f_Base_dPair_dPair_second = dtb__763 } -> (match dtb__763 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__764; Base_dPair.f_Base_dPair_dPair_second = dtb__765 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__765) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 psp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_BranchTooManyArgs ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan psp)) (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__762)) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__762) dtb__761)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)))) (fun refsIdx -> (match (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__762) refsIdx) with
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImpossibleBranchEmptyCtx)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__762)) refsIdx) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__762) dtb__761)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__766; Base_dPair.f_Base_dPair_dPair_second = dtb__767 } -> ((fun n -> ((fun opaqueIdxs -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = cname; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__764; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }; Base_dPair.f_Base_dPair_dPair_second = dtb__767 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__767) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses opaqueIdxs) dtb__766))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices dtb__767) branchCtx2) n) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__764)))) (Base_dList.v_Base_dList_dlength dtb__764))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__762) refs2))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
# 81 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__768, dtb__769) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__768 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__770; Base_dPair.f_Base_dPair_dPair_second = dtb__771 } -> (match dtb__770 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__772, dtb__773, dtb__774) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__772) dtb__773) dtb__774) dtb__771)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__775; Base_dPair.f_Base_dPair_dPair_second = dtb__776 } -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__776) mc4) mc5) mc6) mc7) mc8) dtb__769) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__775, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__777, dtb__778) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__769) mc10) dtb__771) dtb__777) dtb__778)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__779) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__769) mc10) dtb__771) "_") dtb__779)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__770)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc10); Base_dPair.f_Base_dPair_dPair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 102 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CatchAllNotLast) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__780; Base_dPair.f_Base_dPair_dPair_second = dtb__781 } -> ((fun binds -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ""; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binds; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }, acc))); Base_dPair.f_Base_dPair_dPair_second = dtb__781 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__781) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) (if (pname = "_") then dtb__780 else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__781) ctx) scrutTy) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__780) else dtb__780)))) (if (pname = "_") then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = pname; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) scrutTy); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName pname) psp) }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
# 130 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__782; Base_dPair.f_Base_dPair_dPair_second = dtb__783 } -> (match dtb__783 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__784; Base_dPair.f_Base_dPair_dPair_second = dtb__785 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts dtb__785) ctx) dtb__784) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__786; Base_dPair.f_Base_dPair_dPair_second = dtb__787 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat dtb__787) dtb__786)) (fun _u ec3 -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase dtb__786) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) ec3) scrut) dtb__786) expected) sp) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) ec3) dtb__782) dtb__784) dtb__786) expected) sp))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))
# 150 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun name -> ((fun clauses -> ((fun table -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr table) clauses) name)) (fun bodyExpr -> ((((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive table) (fun _u -> (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmatrixOf clauses))) sp) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (name, sp)); Base_dPair.f_Base_dPair_dPair_second = scrut }, Base_dList.C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec))) ((Base_dList.v_Base_dList_dmap (fun alt -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dPair.v_Base_dPair_dfirstOf alt), Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf alt) })) alts))) ("nd_scrut" ^ (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
# 160 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__788) -> (match dtb__788 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__789, dtb__790) -> (if (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical dtb__789) then ((Base_dList.v_Base_dList_dlength dtb__790) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__789 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName) then (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts alts) then ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel (fuel - 1)) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm scrutTerm)) scrutTerm) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue) alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__789) dtb__790) alts) expected) sp)) else (if (dtb__789 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__789 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__789) dtb__790) alts) expected) sp)))))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
# 174 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__791; Base_dPair.f_Base_dPair_dPair_second = dtb__792 } -> (match dtb__792 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__793; Base_dPair.f_Base_dPair_dPair_second = dtb__794 } -> (match dtb__793 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__795) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__791, dtb__795)); Base_dPair.f_Base_dPair_dPair_second = dtb__794 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) dtb__794) alts) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__796; Base_dPair.f_Base_dPair_dPair_second = dtb__797 } -> (match dtb__797 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__798; Base_dPair.f_Base_dPair_dPair_second = dtb__799 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__791, dtb__796)); Base_dPair.f_Base_dPair_dPair_second = dtb__799 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 185 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
# 190 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__800, dtb__801) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__800 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__802; Base_dPair.f_Base_dPair_dPair_second = dtb__803 } -> (match dtb__802 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__804, dtb__805, dtb__806) -> (if (dtb__804 = mc5) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__803) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__807; Base_dPair.f_Base_dPair_dPair_second = dtb__808 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__807; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = mc8; Base_dPair.f_Base_dPair_dPair_second = dtb__808 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__801) mc5) mc6) mc7) mc8))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__809, dtb__810) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__803) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__811; Base_dPair.f_Base_dPair_dPair_second = dtb__812 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__812) dtb__801) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__811)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__813) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__803) mc6)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__814; Base_dPair.f_Base_dPair_dPair_second = dtb__815 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__815) dtb__801) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__814)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__802)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match mc8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__816) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__816; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc3 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 214 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__817; Base_dPair.f_Base_dPair_dPair_second = dtb__818 } -> (match dtb__818 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__819; Base_dPair.f_Base_dPair_dPair_second = dtb__820 } -> (if dtb__819 then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__817; Base_dPair.f_Base_dPair_dPair_second = dtb__820 })) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 223 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__821, dtb__822) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__821 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__823; Base_dPair.f_Base_dPair_dPair_second = dtb__824 } -> (match dtb__823 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__825, dtb__826) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__825))) dtb__824) dtb__822) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__827, dtb__828) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__827))) dtb__824) dtb__822) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__829, dtb__830) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__829) dtb__824) mc7) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__829) dtb__830)) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__831; Base_dPair.f_Base_dPair_dPair_second = dtb__832 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__831; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__832 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__833) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__824) mc7)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__834; Base_dPair.f_Base_dPair_dPair_second = dtb__835 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__834; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__835 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__823)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 243 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__836; Base_dPair.f_Base_dPair_dPair_second = dtb__837 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__837) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__838; Base_dPair.f_Base_dPair_dPair_second = dtb__839 } -> (match dtb__839 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__840; Base_dPair.f_Base_dPair_dPair_second = dtb__841 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__836, dtb__838)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__840; Base_dPair.f_Base_dPair_dPair_second = dtb__841 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 254 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__842; Base_dPair.f_Base_dPair_dPair_second = dtb__843 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, dtb__842)), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__843 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))) ctx))))
# 279 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__844; Base_dPair.f_Base_dPair_dPair_second = dtb__845 } -> (match dtb__845 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__846; Base_dPair.f_Base_dPair_dPair_second = dtb__847 } -> (if dtb__846 then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__844; Base_dPair.f_Base_dPair_dPair_second = dtb__847 })) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 286 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__848, dtb__849) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__848 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__850; Base_dPair.f_Base_dPair_dPair_second = dtb__851 } -> (match dtb__850 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__852, dtb__853) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__852))) dtb__851) dtb__849) mc8) mc9)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__854, dtb__855) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__854) dtb__851) mc8) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__854) dtb__855)) mc9)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__856; Base_dPair.f_Base_dPair_dPair_second = dtb__857 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__856; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__857 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__858) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__851) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__859; Base_dPair.f_Base_dPair_dPair_second = dtb__860 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__859; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__860 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__850)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__861; Base_dPair.f_Base_dPair_dPair_second = dtb__862 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__862) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun q -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__863; Base_dPair.f_Base_dPair_dPair_second = dtb__864 } -> (match dtb__864 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__865; Base_dPair.f_Base_dPair_dPair_second = dtb__866 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("bi_eq_int")), cmpTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__861, dtb__863)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__865; Base_dPair.f_Base_dPair_dPair_second = dtb__866 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 314 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel = (fun fuel globals ctx ec bindTerm binderTy name body expected binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__867; Base_dPair.f_Base_dPair_dPair_second = dtb__868 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, dtb__867)), bindTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__868 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) binderTy))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) binderTy) ctx))))
# 324 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__869) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__869) idxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) Base_dList.C_Base_dList_dList_Nil)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__870; Base_dPair.f_Base_dPair_dPair_second = dtb__871 } -> (((((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__871) ctx) dtb__869) idxs) alts) expected) sp) scrutTerm) dtb__870)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 334 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun pmeta -> (match pmeta with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__872; Base_dPair.f_Base_dPair_dPair_second = dtb__873 } -> ((fun metaTy -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__873) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__874; Base_dPair.f_Base_dPair_dPair_second = dtb__875 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__874; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = metaTy; Base_dPair.f_Base_dPair_dPair_second = dtb__875 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__872))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec))))
# 350 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__876) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__876))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__877) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__878; Base_dPair.f_Base_dPair_dPair_second = dtb__879 } -> (match dtb__879 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__880; Base_dPair.f_Base_dPair_dPair_second = dtb__881 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__880) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__878; Base_dPair.f_Base_dPair_dPair_second = dtb__881 })) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName; " (got "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__880); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
# 586 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__882) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__883) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__883))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__884) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr2 -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__885) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__885))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__886) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr3 -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__887) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__887))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__888) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__884))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__889) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__890) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) dtb__890) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__891) -> (match dtb__891 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__892; Base_dPair.f_Base_dPair_dPair_second = dtb__893 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__892)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__894; Base_dPair.f_Base_dPair_dPair_second = dtb__895 } -> (match dtb__895 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__896; Base_dPair.f_Base_dPair_dPair_second = dtb__897 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr globals) dtb__897) dtb__896) dtb__892) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__897) callExpr)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr))
  | _ -> failwith "DT: impossible branch"
)))
# 616 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__898) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__898)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__899) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__899))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__898))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 627 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__900, dtb__901, dtb__902) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__900) dtb__901) dtb__902)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__903, dtb__904) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__904) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DoUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__905, dtb__906, dtb__907) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__905) dtb__906) dtb__907)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__908, dtb__909, dtb__910) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__910) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_RecordsUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__911, dtb__912, dtb__913) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__911) dtb__912) dtb__913)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__914, dtb__915, dtb__916) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__914) dtb__915) dtb__916)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__917, dtb__918) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__917) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__918) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__917, dtb__918)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__919, dtb__920, dtb__921, dtb__922) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__919) dtb__920) dtb__921) dtb__922)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__923, dtb__924, dtb__925, dtb__926) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__923) dtb__926)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__927; Base_dPair.f_Base_dPair_dPair_second = dtb__928 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__928) dtb__924)) (fun pt -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__929; Base_dPair.f_Base_dPair_dPair_second = dtb__930 } -> (match dtb__930 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__931; Base_dPair.f_Base_dPair_dPair_second = dtb__932 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__932) dtb__925)) (fun pe -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__933; Base_dPair.f_Base_dPair_dPair_second = dtb__934 } -> (match dtb__934 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__935; Base_dPair.f_Base_dPair_dPair_second = dtb__936 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__936) dtb__931) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__936) dtb__935) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__927, dtb__929, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__933))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__931; Base_dPair.f_Base_dPair_dPair_second = dtb__936 } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__936) dtb__931) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__936) dtb__935) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__927, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__929), dtb__933)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__936 } })) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__936) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__931) dtb__935)) (fun ec4 -> ((fun branchOpaque -> ((fun tTerm2 -> ((fun eTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__927, tTerm2, eTerm2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__931; Base_dPair.f_Base_dPair_dPair_second = ec4 } }))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__933) else dtb__933))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__929) else dtb__929))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec4) ctx) dtb__931))))))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__937, dtb__938, dtb__939) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__939) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaNoSignature)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__940, dtb__941, dtb__942) -> (match dtb__940 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__943, dtb__944) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__943) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__942) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__943, dtb__944))) dtb__941) dtb__942) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__940) dtb__941) dtb__942) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__945, dtb__946, dtb__947, dtb__948, dtb__949, dtb__950) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__945) dtb__946) dtb__947) dtb__948) dtb__949) dtb__950)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__951, dtb__952) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__951)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__953, dtb__954) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__953)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("String", Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__955, dtb__956) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__955)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Int", Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__957, dtb__958) -> (if (dtb__957 = "Type") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Base_dPair.f_Base_dPair_dPair_second = ec } })) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__957) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__958) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HoleNoExpectedType) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__957) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__958) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__957)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__957))) (fun t -> (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) t) dtb__958))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverValueName dtb__957) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__958) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__957), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__957))))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__957)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__957))) else (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__957) dtb__958)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unreordered infix/paren in elaboration")
)) expr)))
# 854 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel = (fun fuel globals ctx ec base fname sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__959; Base_dPair.f_Base_dPair_dPair_second = dtb__960 } -> (match dtb__960 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__961; Base_dPair.f_Base_dPair_dPair_second = dtb__962 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf dtb__962) dtb__961) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__963) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan dtb__962) dtb__961) fname) sp)) (fun plan -> ((fun arity -> ((fun tele -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = proj; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType; Base_dPair.f_Base_dPair_dPair_second = dtb__962 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__959, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor), tele, (arity + (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField)))) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor)))) (Base_dList.v_Base_dList_dlength ((plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__962) dtb__959) dtb__961) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))))
# 871 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel = (fun fuel globals ctx ec base fields sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fields with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "record update needs at least one field")
  | _ -> (if (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames fields) then ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "duplicate field in record update") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__964; Base_dPair.f_Base_dPair_dPair_second = dtb__965 } -> (match dtb__965 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__966; Base_dPair.f_Base_dPair_dPair_second = dtb__967 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan dtb__967) dtb__966) fields) sp)) (fun plan -> ((fun body -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (fuel - 1)) globals) ctx) dtb__967) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__964)) dtb__966) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__968; Base_dPair.f_Base_dPair_dPair_second = dtb__969 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__964, (dtb__968).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName, (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (dtb__968).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices, (dtb__968).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__966; Base_dPair.f_Base_dPair_dPair_second = dtb__969 } }))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor), sp)), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs, sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb))))
)))
# 889 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__970; Base_dPair.f_Base_dPair_dPair_second = dtb__971 } -> (match dtb__971 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__972; Base_dPair.f_Base_dPair_dPair_second = dtb__973 } -> ((fun tyVal -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__973) value) tyVal)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__974; Base_dPair.f_Base_dPair_dPair_second = dtb__975 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__974; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = tyVal; Base_dPair.f_Base_dPair_dPair_second = dtb__975 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__970))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
# 900 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit qty dom cod sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__976; Base_dPair.f_Base_dPair_dPair_second = dtb__977 } -> (match dtb__977 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__978; Base_dPair.f_Base_dPair_dPair_second = dtb__979 } -> ((fun domVal -> ((fun isTypeDom -> ((fun isLinDom -> ((fun lvl -> ((fun ctx2 -> ((fun badQty -> ((fun badLinQty -> (if badQty then (if implicit then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MultiplicityImplicit (name))) name) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearTypeNeedsOne (name))) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__979) cod)) (fun pc -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__980; Base_dPair.f_Base_dPair_dPair_second = dtb__981 } -> (match dtb__981 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__982; Base_dPair.f_Base_dPair_dPair_second = dtb__983 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (name, implicit, (if isLinDom then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else (if implicit then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig ec) domVal) else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfQty false) isTypeDom) qty))), dtb__976, dtb__980)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__978) dtb__982))); Base_dPair.f_Base_dPair_dPair_second = dtb__983 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__984) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero dtb__984) then isLinDom else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__985) -> (if implicit then true else isTypeDom)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__976) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) domVal))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeDomain domVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__976))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
# 949 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__986, dtb__987) -> (if (dtb__986 = "->") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__988, dtb__989) -> (match dtb__989 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__990, dtb__991) -> (match dtb__991 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dtb__988) dtb__990) sp)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)) args) else (if (dtb__986 = "Type") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__992, dtb__993) -> (match dtb__992 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__994, dtb__995) -> (match dtb__993 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__994 < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__995) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UniverseLevelNonNegative) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__994))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__994)))); Base_dPair.f_Base_dPair_dPair_second = ec } })))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__987) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__987) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__987) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)) args) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__996, dtb__997) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__996) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__997) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__996)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__996))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__997))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__996) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__998) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__996) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__999) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__999))) args) sp) hint)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1000; Base_dPair.f_Base_dPair_dPair_second = dtb__1001 } -> (match dtb__1001 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1002; Base_dPair.f_Base_dPair_dPair_second = dtb__1003 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1003) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__996))) dtb__1000); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1002; Base_dPair.f_Base_dPair_dPair_second = dtb__1003 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__996) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1004) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__996) hint) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1004)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1005; Base_dPair.f_Base_dPair_dPair_second = dtb__1006 } -> (match dtb__1006 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1007; Base_dPair.f_Base_dPair_dPair_second = dtb__1008 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1008) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__996))) dtb__1005); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1007; Base_dPair.f_Base_dPair_dPair_second = dtb__1008 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__996) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1009) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1009))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1004)) args) sp) hint)) (fun pa -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1010; Base_dPair.f_Base_dPair_dPair_second = dtb__1011 } -> (match dtb__1011 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1012; Base_dPair.f_Base_dPair_dPair_second = dtb__1013 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1013) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__996))) dtb__1010); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1012; Base_dPair.f_Base_dPair_dPair_second = dtb__1013 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__996) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1014) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1014))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__997) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__996))) dtb__996)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
  | _ -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1015, dtb__1016) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1015) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1016) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1015)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1015))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1016))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1015) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1017) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__1015) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1018) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1018))) args) sp) hint)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1019; Base_dPair.f_Base_dPair_dPair_second = dtb__1020 } -> (match dtb__1020 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1021; Base_dPair.f_Base_dPair_dPair_second = dtb__1022 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1022) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1015))) dtb__1019); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1021; Base_dPair.f_Base_dPair_dPair_second = dtb__1022 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__1015) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1023) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__1015) hint) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1023)) args) sp) hint)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1024; Base_dPair.f_Base_dPair_dPair_second = dtb__1025 } -> (match dtb__1025 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1026; Base_dPair.f_Base_dPair_dPair_second = dtb__1027 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1027) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1015))) dtb__1024); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1026; Base_dPair.f_Base_dPair_dPair_second = dtb__1027 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1015) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1028) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1028))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1023)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1029; Base_dPair.f_Base_dPair_dPair_second = dtb__1030 } -> (match dtb__1030 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1031; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1032) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1015))) dtb__1029); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1031; Base_dPair.f_Base_dPair_dPair_second = dtb__1032 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1015) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1033) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1033))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__1016) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1015))) dtb__1015)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)
)) fn)))
# 999 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1034, dtb__1035) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1034) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1036) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1036))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1008 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1037; Base_dPair.f_Base_dPair_dPair_second = dtb__1038 } -> (match dtb__1038 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1039; Base_dPair.f_Base_dPair_dPair_second = dtb__1040 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1040) dtb__1039) args) sp) hint)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1041; Base_dPair.f_Base_dPair_dPair_second = dtb__1042 } -> (match dtb__1042 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1043; Base_dPair.f_Base_dPair_dPair_second = dtb__1044 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1044)) dtb__1037) dtb__1041); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1043; Base_dPair.f_Base_dPair_dPair_second = dtb__1044 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
# 1017 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1144 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1045, dtb__1046, dtb__1047, dtb__1048, dtb__1049) -> (if dtb__1046 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__1048) then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__1048) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1048) dtb__1049) args) sp) hint) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1048) args) sp)) (fun ec0 -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1050) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1048)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1048) dtb__1049) args) sp) hint) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1048)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1048) dtb__1049) args) sp) hint) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1050))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1051) -> (match dtb__1051 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1052; Base_dPair.f_Base_dPair_dPair_second = dtb__1053 } -> ((fun ty2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1053) ty2) args) sp) hint)) (fun q -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1054; Base_dPair.f_Base_dPair_dPair_second = dtb__1055 } -> (match dtb__1055 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1056; Base_dPair.f_Base_dPair_dPair_second = dtb__1057 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1052; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1054)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1056; Base_dPair.f_Base_dPair_dPair_second = dtb__1057 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1052)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1048)) sp))))) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec) dtb__1048) then (match ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ec) dtb__1048) with
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__1058, dtb__1059) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1059) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) dtb__1058)) args) sp) hint)) (fun p -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1060; Base_dPair.f_Base_dPair_dPair_second = dtb__1061 } -> (match dtb__1061 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1062; Base_dPair.f_Base_dPair_dPair_second = dtb__1063 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1058); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1060)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1062; Base_dPair.f_Base_dPair_dPair_second = dtb__1063 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__1064) -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1065; Base_dPair.f_Base_dPair_dPair_second = dtb__1066 } -> ((fun ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1065))) args) sp) hint)) (fun p -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1067; Base_dPair.f_Base_dPair_dPair_second = dtb__1068 } -> (match dtb__1068 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1069; Base_dPair.f_Base_dPair_dPair_second = dtb__1070 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1065; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1067)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1069; Base_dPair.f_Base_dPair_dPair_second = dtb__1070 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1066) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1048) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1071; Base_dPair.f_Base_dPair_dPair_second = dtb__1072 } -> ((fun ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1071))) args) sp) hint)) (fun p -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1073; Base_dPair.f_Base_dPair_dPair_second = dtb__1074 } -> (match dtb__1074 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1075; Base_dPair.f_Base_dPair_dPair_second = dtb__1076 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1071; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1073)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1075; Base_dPair.f_Base_dPair_dPair_second = dtb__1076 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1072) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1048) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | _ -> failwith "DT: impossible branch"
) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__1048) then (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dtb__1048) then (match args with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1077, dtb__1078) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand dtb__1077) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1079) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1079) dtb__1048)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1080; Base_dPair.f_Base_dPair_dPair_second = dtb__1081 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1081) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1080))) dtb__1078) sp) hint)) (fun q -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1082; Base_dPair.f_Base_dPair_dPair_second = dtb__1083 } -> (match dtb__1083 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1084; Base_dPair.f_Base_dPair_dPair_second = dtb__1085 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1080; Base_dPair.f_Base_dPair_dPair_second = dtb__1047 }, dtb__1082)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1084; Base_dPair.f_Base_dPair_dPair_second = dtb__1085 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1086; Base_dPair.f_Base_dPair_dPair_second = dtb__1087 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1087) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1086))) args) sp) hint)) (fun p -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1088; Base_dPair.f_Base_dPair_dPair_second = dtb__1089 } -> (match dtb__1089 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1090; Base_dPair.f_Base_dPair_dPair_second = dtb__1091 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1086; Base_dPair.f_Base_dPair_dPair_second = dtb__1047 }, dtb__1088)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1090; Base_dPair.f_Base_dPair_dPair_second = dtb__1091 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1092; Base_dPair.f_Base_dPair_dPair_second = dtb__1093 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1093) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1092))) args) sp) hint)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1094; Base_dPair.f_Base_dPair_dPair_second = dtb__1095 } -> (match dtb__1095 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1096; Base_dPair.f_Base_dPair_dPair_second = dtb__1097 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1092; Base_dPair.f_Base_dPair_dPair_second = dtb__1047 }, dtb__1094)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1096; Base_dPair.f_Base_dPair_dPair_second = dtb__1097 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1098; Base_dPair.f_Base_dPair_dPair_second = dtb__1099 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1099) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1098))) args) sp) hint)) (fun p -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1100; Base_dPair.f_Base_dPair_dPair_second = dtb__1101 } -> (match dtb__1101 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1102; Base_dPair.f_Base_dPair_dPair_second = dtb__1103 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1098; Base_dPair.f_Base_dPair_dPair_second = dtb__1047 }, dtb__1100)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1102; Base_dPair.f_Base_dPair_dPair_second = dtb__1103 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImplicitParamKind)))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = forced; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1104, dtb__1105) -> ((fun ec0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec0) sp) dtb__1045) dtb__1047) dtb__1048)) (fun argRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit ec0) dtb__1048) dtb__1104)) (fun a2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1048)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1106; Base_dPair.f_Base_dPair_dPair_second = dtb__1107 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1107) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1049) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1106))) dtb__1105) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun q -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1108; Base_dPair.f_Base_dPair_dPair_second = dtb__1109 } -> (match dtb__1109 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1110; Base_dPair.f_Base_dPair_dPair_second = dtb__1111 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1106; Base_dPair.f_Base_dPair_dPair_second = argRig }, dtb__1108)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1110; Base_dPair.f_Base_dPair_dPair_second = dtb__1111 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))) ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1112) -> (match dtb__1112 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1113; Base_dPair.f_Base_dPair_dPair_second = dtb__1114 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint dtb__1113) ctx) dtb__1114) ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ec
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1115) -> dtb__1115
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ec
  | _ -> failwith "DT: impossible branch"
)) hint))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = forced; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1116, dtb__1117) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1116)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
# 1239 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1118; Base_dPair.f_Base_dPair_dPair_second = dtb__1119 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1119) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1119) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1118))) args) sp) hint)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1120; Base_dPair.f_Base_dPair_dPair_second = dtb__1121 } -> (match dtb__1121 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1122; Base_dPair.f_Base_dPair_dPair_second = dtb__1123 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1118; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1120)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1122; Base_dPair.f_Base_dPair_dPair_second = dtb__1123 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
# 1253 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1124) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1125) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1126, dtb__1127) -> (match dtb__1127 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1124) dtb__1125) args) sp)) (fun ecProbe -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__1126) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1128) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__1126) Base_dList.C_Base_dList_dList_Nil) dtb__1128) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1129) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1129))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1130) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1124) dtb__1125) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1124) dtb__1125) args) sp)
)) dtb__1124)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1271 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1131, dtb__1132) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1133) -> (match dtb__1133 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1134; Base_dPair.f_Base_dPair_dPair_second = dtb__1135 } -> (match dtb__1135 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1136; Base_dPair.f_Base_dPair_dPair_second = dtb__1137 } -> ((fun forced -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1137) ctx) argTy) argKind) dtb__1132) sp) else (if (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__1137) ctx) forced) argKind) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1137) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1138) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1138))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1139) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1137) ctx) argTy) argKind) dtb__1132) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1137) ctx) argTy) argKind) dtb__1132) sp)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1137) dtb__1136))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1140) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1131))
  | _ -> failwith "DT: impossible branch"
)))
# 1389 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1141) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1141) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1396 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel = (fun fuel globals ctx ec op args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1142, dtb__1143) -> (match dtb__1143 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1144, dtb__1145) -> (match dtb__1145 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1142) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1146; Base_dPair.f_Base_dPair_dPair_second = dtb__1147 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1147) dtb__1144) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1148; Base_dPair.f_Base_dPair_dPair_second = dtb__1149 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1146) dtb__1148); Base_dPair.f_Base_dPair_dPair_second = dtb__1149 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1142) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1150; Base_dPair.f_Base_dPair_dPair_second = dtb__1151 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1151) dtb__1144) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1152; Base_dPair.f_Base_dPair_dPair_second = dtb__1153 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1150) dtb__1152); Base_dPair.f_Base_dPair_dPair_second = dtb__1153 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1142) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1154; Base_dPair.f_Base_dPair_dPair_second = dtb__1155 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1155) dtb__1144) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1156; Base_dPair.f_Base_dPair_dPair_second = dtb__1157 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1154) dtb__1156); Base_dPair.f_Base_dPair_dPair_second = dtb__1157 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 1419 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1158) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1158) args) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1426 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel = (fun fuel globals ctx ec op args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1159, dtb__1160) -> (match dtb__1160 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1161, dtb__1162) -> (match dtb__1162 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1159)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1163; Base_dPair.f_Base_dPair_dPair_second = dtb__1164 } -> (match dtb__1164 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1165; Base_dPair.f_Base_dPair_dPair_second = dtb__1166 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1166) dtb__1161)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1167; Base_dPair.f_Base_dPair_dPair_second = dtb__1168 } -> (match dtb__1168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1169; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1170) dtb__1165) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1170) dtb__1169) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1163) dtb__1167); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1170) dtb__1165) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1170) dtb__1169) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1163) dtb__1167); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1170) dtb__1165) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1170) dtb__1169) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1163) dtb__1167); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1170) dtb__1165) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1170) dtb__1169) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1161) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1171) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1161)) dtb__1171)) (fun bNat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1163) bNat); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1163)) dtb__1167); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1170) dtb__1165) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1170) dtb__1169) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1159) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1172) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1159)) dtb__1172)) (fun aNat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) aNat) dtb__1167); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1163) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1167)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1170 } }))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 1454 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1173) -> ((fun simpleComp -> ((fun firstCall -> ((fun thirdCall -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind firstCall) (fun callExpr -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1174) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1174))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1175) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr2 -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1176) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1176))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1177) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind thirdCall) (fun callExpr3 -> (match ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.retry-third") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1178) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1178))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1179) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1175))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (if simpleComp then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))))) (if simpleComp then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1180) -> (match dtb__1180 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1181; Base_dPair.f_Base_dPair_dPair_second = dtb__1182 } -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_disSimpleComp dtb__1181)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1183) -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.infer") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1184) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1185) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))) dtb__1185) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsDefCheck "vuna.elab.term.core") (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName expr)) (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1539 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1186) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1186) expected)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1187) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1187))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__1186)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 1564 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__1188, dtb__1189, dtb__1190) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1189)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1191; Base_dPair.f_Base_dPair_dPair_second = dtb__1192 } -> (match dtb__1192 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1193; Base_dPair.f_Base_dPair_dPair_second = dtb__1194 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1194) dtb__1188) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1195, dtb__1196) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__1195) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats ec) ctx) expected) dtb__1195)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1197; Base_dPair.f_Base_dPair_dPair_second = dtb__1198 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__1198)) dtb__1197)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1198) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1195, dtb__1196)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1199, dtb__1200, dtb__1201, dtb__1202) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__1199) dtb__1200) dtb__1201) expected) dtb__1202)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1203, dtb__1204, dtb__1205) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1203) dtb__1204) expected) dtb__1205)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__1206, dtb__1207, dtb__1208, dtb__1209) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1206) dtb__1209)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1210; Base_dPair.f_Base_dPair_dPair_second = dtb__1211 } -> ((fun attempt -> (match attempt with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1212) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1212))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1213) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1211) dtb__1207) expected)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1214; Base_dPair.f_Base_dPair_dPair_second = dtb__1215 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1215) dtb__1208) expected)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1216; Base_dPair.f_Base_dPair_dPair_second = dtb__1217 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__1210, dtb__1214, dtb__1216)); Base_dPair.f_Base_dPair_dPair_second = dtb__1217 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__1218, dtb__1219, dtb__1220, dtb__1221, dtb__1222, dtb__1223) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1224, dtb__1225, dtb__1226) -> (match dtb__1224 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1227, dtb__1228) -> (if (dtb__1227 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1227 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__1227) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__1226) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1227, dtb__1228))) dtb__1225) expected) dtb__1226))))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__1224) dtb__1225) expected) dtb__1226)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__1229, dtb__1230, dtb__1231) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__1229) dtb__1230) expected) dtb__1231)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__1232, dtb__1233) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1234, dtb__1235) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1236) -> (match dtb__1236 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1237, dtb__1238) -> (match dtb__1238 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1237 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__1232)); Base_dPair.f_Base_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1239) -> (match dtb__1239 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1240; Base_dPair.f_Base_dPair_dPair_second = dtb__1241 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1241) dtb__1240) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1233)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1242) -> (match dtb__1242 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1243; Base_dPair.f_Base_dPair_dPair_second = dtb__1244 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1244) dtb__1243) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1233))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1245) -> (match dtb__1245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1246; Base_dPair.f_Base_dPair_dPair_second = dtb__1247 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1247) dtb__1246) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1233))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1248) -> (match dtb__1248 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1249; Base_dPair.f_Base_dPair_dPair_second = dtb__1250 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1250) dtb__1249) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1233))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__1251, dtb__1252) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1253, dtb__1254) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1255) -> (match dtb__1255 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1256, dtb__1257) -> (match dtb__1257 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1256 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__1251)); Base_dPair.f_Base_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1258) -> (match dtb__1258 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1259; Base_dPair.f_Base_dPair_dPair_second = dtb__1260 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1260) dtb__1259) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1252)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1261) -> (match dtb__1261 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1262; Base_dPair.f_Base_dPair_dPair_second = dtb__1263 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1263) dtb__1262) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1252))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1264) -> (match dtb__1264 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1265; Base_dPair.f_Base_dPair_dPair_second = dtb__1266 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1266) dtb__1265) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1252))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1267) -> (match dtb__1267 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1268; Base_dPair.f_Base_dPair_dPair_second = dtb__1269 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1269) dtb__1268) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1252))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__1270, dtb__1271) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1272, dtb__1273) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1274) -> (match dtb__1274 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1275, dtb__1276) -> (match dtb__1276 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1275 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__1271) dtb__1270)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = t; Base_dPair.f_Base_dPair_dPair_second = ec })))) else (if (dtb__1275 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1277) -> (match dtb__1277 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1278; Base_dPair.f_Base_dPair_dPair_second = dtb__1279 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1279) dtb__1278) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1271))))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1280) -> (match dtb__1280 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1281; Base_dPair.f_Base_dPair_dPair_second = dtb__1282 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1282) dtb__1281) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1271))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1283) -> (match dtb__1283 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1284; Base_dPair.f_Base_dPair_dPair_second = dtb__1285 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1285) dtb__1284) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1271))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1286) -> (match dtb__1286 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1287; Base_dPair.f_Base_dPair_dPair_second = dtb__1288 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1288) dtb__1287) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1271))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1289, dtb__1290) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__1289) then ((fun pmeta -> (match pmeta with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1291; Base_dPair.f_Base_dPair_dPair_second = dtb__1292 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1291; Base_dPair.f_Base_dPair_dPair_second = dtb__1292 }))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta ctx) ec) dtb__1290) expected) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf dtb__1289))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1289) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1290) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1289)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1289))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1290))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1290))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverValueName dtb__1289) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverValueTarget globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__1289)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__1289)) expected) dtb__1290)) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1290))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1290))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1289, dtb__1290))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1290))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
# 1656 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 1742 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 1749 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1293, dtb__1294) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1293) dtb__1294) mc5) mc6) mc7) mc8))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 1756 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bnd rest body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (Base_dPair.v_Base_dPair_dfirstOf bnd) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1295, dtb__1296) -> ((fun value -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1297; Base_dPair.f_Base_dPair_dPair_second = dtb__1298 } -> (match dtb__1298 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1299; Base_dPair.f_Base_dPair_dPair_second = dtb__1300 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__1300) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1301; Base_dPair.f_Base_dPair_dPair_second = dtb__1302 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__1295, rig, ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__1295) dtb__1296), bodyTerm2)), dtb__1297, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__1302 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1302) ctx) dtb__1299) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1301) else dtb__1301))
  | _ -> failwith "DT: impossible branch"
)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1295) dtb__1299) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1299))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bnd))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1303) -> ((fun value -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1304; Base_dPair.f_Base_dPair_dPair_second = dtb__1305 } -> (match dtb__1305 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1306; Base_dPair.f_Base_dPair_dPair_second = dtb__1307 } -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__1307) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1308; Base_dPair.f_Base_dPair_dPair_second = dtb__1309 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, dtb__1303, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1308))), dtb__1304, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = dtb__1309 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1306))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bnd))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Base_dPair.v_Base_dPair_dsecondOf bnd), (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf bnd); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (rest, body, rec_u, sp)) }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dPair.v_Base_dPair_dfirstOf bnd))))) expected)
)))
# 1799 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1310, dtb__1311) -> (match dtb__1310 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1312; Base_dPair.f_Base_dPair_dPair_second = dtb__1313 } -> (match dtb__1312 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1314, dtb__1315) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1314) dtb__1313) dtb__1311) body) rec_u) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__1314) dtb__1315)) sp)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1316) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1313) dtb__1311) body) rec_u) dtb__1316) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1313, (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1312; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1311, body, rec_u, sp)) }, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__1312))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 1812 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1317; Base_dPair.f_Base_dPair_dPair_second = dtb__1318 } -> (match dtb__1318 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1319; Base_dPair.f_Base_dPair_dPair_second = dtb__1320 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__1320) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1321; Base_dPair.f_Base_dPair_dPair_second = dtb__1322 } -> (match dtb__1322 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1323; Base_dPair.f_Base_dPair_dPair_second = dtb__1324 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, bodyTerm2)), dtb__1317, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1323; Base_dPair.f_Base_dPair_dPair_second = dtb__1324 } }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1324) ctx) dtb__1319) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1321) else dtb__1321))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__1319) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1319))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1828 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1325; Base_dPair.f_Base_dPair_dPair_second = dtb__1326 } -> (match dtb__1326 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1327; Base_dPair.f_Base_dPair_dPair_second = dtb__1328 } -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__1328) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1329; Base_dPair.f_Base_dPair_dPair_second = dtb__1330 } -> (match dtb__1330 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1331; Base_dPair.f_Base_dPair_dPair_second = dtb__1332 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, binderSp, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1329))), dtb__1325, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1331; Base_dPair.f_Base_dPair_dPair_second = dtb__1332 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1327))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1891 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1333) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1334) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1335) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1336, dtb__1337, dtb__1338) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1336) dtb__1337) dtb__1338) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)); Base_dPair.f_Base_dPair_dPair_second = expected })))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2093 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1339) -> (match dtb__1339 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1340; Base_dPair.f_Base_dPair_dPair_second = dtb__1341 } -> (match dtb__1341 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1342; Base_dPair.f_Base_dPair_dPair_second = dtb__1343 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1343) expected) dtb__1342) dtb__1340) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1344) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1344; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1343) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1343) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1342) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1345) -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift ctx) globals) dtb__1343) expected) dtb__1342) dtb__1340) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1346) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__1346); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) (Base_dPair.v_Base_dPair_dsecondOf dtb__1346)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel dtb__1343) expected) dtb__1342) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1347) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels dtb__1347) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldEffect (("actual: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1342))))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldEffect (("expected: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected))))) d))))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1347)))) (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1347)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) dtb__1345)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1348) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1340; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1348) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1349) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1349))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected))))
# 2110 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1350, dtb__1351) -> (match dtb__1350 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1352; Base_dPair.f_Base_dPair_dPair_second = dtb__1353 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun forced -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1354, dtb__1355) -> (match dtb__1355 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun lvl -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) mc3) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1356; Base_dPair.f_Base_dPair_dPair_second = dtb__1357 } -> ((fun domVal -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) dtb__1357) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1358; Base_dPair.f_Base_dPair_dPair_second = dtb__1359 } -> ((fun piVal -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__1359)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__1359)) lvl) dtb__1354) Base_dList.C_Base_dList_dList_Nil) piVal) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1360) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) mc2) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__1359) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1360))) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1352; Base_dPair.f_Base_dPair_dPair_second = dtb__1353 }, dtb__1351))) mc5) piVal) mc7)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1361) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, domVal, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__1358 })))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc2) dtb__1356))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1362, dtb__1363, dtb__1364, dtb__1365, dtb__1366) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain mc3) mc7) dtb__1352) dtb__1364) dtb__1365)) (fun lamRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1351) mc5) expected2) mc7)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1367; Base_dPair.f_Base_dPair_dPair_second = dtb__1368 } -> ((fun inner2 -> ((fun binderName -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, dtb__1353, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__1368 }))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear mc3) mc2) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear mc3) ctx2) dtb__1367) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName mc7) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__1352) else dtb__1352) else dtb__1352))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1368) mc2) dtb__1365) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1367) else dtb__1367))
  | _ -> failwith "DT: impossible branch"
)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1366) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1352) dtb__1365) mc2))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__1362) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)) forced)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2178 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1369, dtb__1370, dtb__1371) -> (match dtb__1369 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1372, dtb__1373) -> (if (if (dtb__1372 = "->") then true else (dtb__1372 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1372) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1374) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1372) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1372) dtb__1370) dtb__1373) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1375) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1376) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1376))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1377, dtb__1378) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1377) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1379) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__1377) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1380) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1380))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1381) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec) dtb__1377); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1381; Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)) expr)))
# 2199 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1382; Base_dPair.f_Base_dPair_dPair_second = dtb__1383 } -> (match dtb__1383 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1384; Base_dPair.f_Base_dPair_dPair_second = dtb__1385 } -> ((fun forced -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1386) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1382; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1386; Base_dPair.f_Base_dPair_dPair_second = dtb__1385 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedType (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1384)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1384))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1385) dtb__1384))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2214 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1387, dtb__1388) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1387) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1388) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1387)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1387))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1388))) args) expected) sp))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1387) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1389) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor ec) dtb__1387) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1390) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1390) args) expected) dtb__1388)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1387) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1387) args) expected) dtb__1388) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1387) args) expected) sp) dtb__1388))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1387) args) expected) sp) dtb__1388))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2239 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel = (fun fuel globals ctx ec fn name args expected sp vsp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1391) -> (match dtb__1391 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__1392) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__1393) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))))
# 2249 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1394; Base_dPair.f_Base_dPair_dPair_second = dtb__1395 } -> (match dtb__1395 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1396; Base_dPair.f_Base_dPair_dPair_second = dtb__1397 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1397) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1396)))) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1394; Base_dPair.f_Base_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2257 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1398) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1398)) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1399; Base_dPair.f_Base_dPair_dPair_second = dtb__1400 } -> (match dtb__1400 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1401; Base_dPair.f_Base_dPair_dPair_second = dtb__1402 } -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1402) dtb__1401)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1403) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1402) name) dtb__1399); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__1403; Base_dPair.f_Base_dPair_dPair_second = dtb__1402 } }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
# 2302 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1404, dtb__1405) -> (match dtb__1405 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1406, dtb__1407) -> (match dtb__1407 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1404)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1408; Base_dPair.f_Base_dPair_dPair_second = dtb__1409 } -> (match dtb__1409 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1410; Base_dPair.f_Base_dPair_dPair_second = dtb__1411 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1411) dtb__1406)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1412; Base_dPair.f_Base_dPair_dPair_second = dtb__1413 } -> (match dtb__1413 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1414; Base_dPair.f_Base_dPair_dPair_second = dtb__1415 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1415) dtb__1410) dtb__1414) dtb__1408) dtb__1412) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1416) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1416))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1416))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1416))) dtb__1415)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1415) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1410) dtb__1414)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__1408) dtb__1412) sp) dtb__1410) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2319 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1417, dtb__1418) -> (match dtb__1418 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1419, dtb__1420) -> (match dtb__1420 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1417)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1421; Base_dPair.f_Base_dPair_dPair_second = dtb__1422 } -> (match dtb__1422 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1423; Base_dPair.f_Base_dPair_dPair_second = dtb__1424 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1424) dtb__1419)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1425; Base_dPair.f_Base_dPair_dPair_second = dtb__1426 } -> (match dtb__1426 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1427; Base_dPair.f_Base_dPair_dPair_second = dtb__1428 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1428) dtb__1423) dtb__1427) dtb__1421) dtb__1425) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1429) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1429))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1429))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1429))) dtb__1428)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1428) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1423) dtb__1427)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__1421) dtb__1425) sp) dtb__1423) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2338 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName) then (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1430) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1430))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1431) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1431))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1432) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1432))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 2359 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1433, dtb__1434) -> (match dtb__1434 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1433)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1435; Base_dPair.f_Base_dPair_dPair_second = dtb__1436 } -> (match dtb__1436 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1437; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } -> ((fun tyv -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue tyv) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1435; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = tyv; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1438) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1438) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm dtb__1435); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1438) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1438) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1435)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } })))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1438) tyv) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm dtb__1435); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1438 } })))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1438) dtb__1437))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
# 2397 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1439, dtb__1440) -> (match dtb__1440 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1441, dtb__1442) -> (match dtb__1442 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1439) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1443; Base_dPair.f_Base_dPair_dPair_second = dtb__1444 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1444) dtb__1441) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pb -> (match pb with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1445; Base_dPair.f_Base_dPair_dPair_second = dtb__1446 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__1443) dtb__1445); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__1446 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
# 2408 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1447, dtb__1448) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__1447) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected ec) dtb__1447) expected) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1447) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1449) -> (match dtb__1449 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1450; Base_dPair.f_Base_dPair_dPair_second = dtb__1451 } -> (match dtb__1451 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1452; Base_dPair.f_Base_dPair_dPair_second = dtb__1453 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1453) expected) dtb__1452) dtb__1450) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1454) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1454; Base_dPair.f_Base_dPair_dPair_second = dtb__1453 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1453) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1452)) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1450; Base_dPair.f_Base_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1455) -> (match dtb__1455 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1456; Base_dPair.f_Base_dPair_dPair_second = dtb__1457 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1456; Base_dPair.f_Base_dPair_dPair_second = dtb__1457 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
)))
# 2610 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1458) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1458))) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1459; Base_dPair.f_Base_dPair_dPair_second = dtb__1460 } -> (match dtb__1460 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1461; Base_dPair.f_Base_dPair_dPair_second = dtb__1462 } -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1462) expected) dtb__1461) ctorTerm) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1463) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1463; Base_dPair.f_Base_dPair_dPair_second = dtb__1462 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1462) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1461) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1464) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1464)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1459); Base_dPair.f_Base_dPair_dPair_second = dtb__1464 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1465) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1465)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1465))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1462)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1459))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1466) -> (match dtb__1466 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1467; Base_dPair.f_Base_dPair_dPair_second = dtb__1468 } -> (match dtb__1468 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1469; Base_dPair.f_Base_dPair_dPair_second = dtb__1470 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1470) dtb__1469) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1471; Base_dPair.f_Base_dPair_dPair_second = dtb__1472 } -> (match dtb__1472 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1473; Base_dPair.f_Base_dPair_dPair_second = dtb__1474 } -> ((fun allArgs -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1474) expected) dtb__1473) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1474)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1475) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1475; Base_dPair.f_Base_dPair_dPair_second = dtb__1474 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1474) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1473) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1476) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1476)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs); Base_dPair.f_Base_dPair_dPair_second = dtb__1476 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1477) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1477)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1477))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend dtb__1467) dtb__1471))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs ec) ctx) dtb__1458) expected))
  | _ -> failwith "DT: impossible branch"
)))
# 2844 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain = (fun fuel globals ctx ec plan steps last -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1478, dtb__1479) -> (match dtb__1478 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__1480, dtb__1481, dtb__1482, dtb__1483) -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__1482) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1484; Base_dPair.f_Base_dPair_dPair_second = dtb__1485 } -> ((fun aVal -> ((fun mArgTy -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1485) dtb__1482) "_") (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE) mArgTy)) (fun argRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1485) dtb__1481) mArgTy)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1486; Base_dPair.f_Base_dPair_dPair_second = dtb__1487 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1487) dtb__1482) dtb__1480) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig) aVal)) (fun lamRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx2) dtb__1487) plan) dtb__1479) last)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1488; Base_dPair.f_Base_dPair_dPair_second = dtb__1489 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm dtb__1487) dtb__1489) ctx) dtb__1482) dtb__1483) plan) dtb__1480) aVal) dtb__1486) argRig) lamRig) dtb__1488); Base_dPair.f_Base_dPair_dPair_second = dtb__1489 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1480) aVal) ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1484))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) last) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))
  | _ -> failwith "DT: impossible branch"
)) steps)))
# 2867 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel = (fun fuel globals ctx ec chain expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1490) -> (match dtb__1490 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1491; Base_dPair.f_Base_dPair_dPair_second = dtb__1492 } -> (match dtb__1492 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1493; Base_dPair.f_Base_dPair_dPair_second = dtb__1494 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1495; Base_dPair.f_Base_dPair_dPair_second = dtb__1496 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1496) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1497; Base_dPair.f_Base_dPair_dPair_second = dtb__1498 } -> ((fun mVal -> ((fun aVal -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1498) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1491) dtb__1493) dtb__1494) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1499) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1499).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1499) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1500; Base_dPair.f_Base_dPair_dPair_second = dtb__1501 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1501) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (dtb__1499).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (dtb__1499).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))) (fun ec4 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1500; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1497))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1495))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1502) -> (match dtb__1502 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1503; Base_dPair.f_Base_dPair_dPair_second = dtb__1504 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1491) dtb__1493) dtb__1494) dtb__1503) dtb__1504)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1505) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1505).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1505) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1506; Base_dPair.f_Base_dPair_dPair_second = dtb__1507 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1506; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1507) }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected ec) expected))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))
# 2896 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel = (fun fuel globals ctx ec chain -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1508) -> (match dtb__1508 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1509; Base_dPair.f_Base_dPair_dPair_second = dtb__1510 } -> (match dtb__1510 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1511; Base_dPair.f_Base_dPair_dPair_second = dtb__1512 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1513; Base_dPair.f_Base_dPair_dPair_second = dtb__1514 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1514) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1515; Base_dPair.f_Base_dPair_dPair_second = dtb__1516 } -> ((fun mVal -> ((fun aVal -> ((fun resultTy -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1516) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1509) dtb__1511) dtb__1512) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1517) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1517).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1517) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1518; Base_dPair.f_Base_dPair_dPair_second = dtb__1519 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1518; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = resultTy; Base_dPair.f_Base_dPair_dPair_second = dtb__1519 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1515))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1513))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))

# 2274 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind = (fun globals ctx ec expr expected sp -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1520) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) globals) ctx) ec) expr))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)) }))))
  | _ -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1521, dtb__1522, dtb__1523) -> (match dtb__1521 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1524, dtb__1525) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1524) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1524) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1524))) dtb__1524)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1526) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1526)) dtb__1522) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1527; Base_dPair.f_Base_dPair_dPair_second = dtb__1528 } -> (match dtb__1528 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1529; Base_dPair.f_Base_dPair_dPair_second = dtb__1530 } -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1530) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1529) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1531) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1531) dtb__1524) dtb__1527); Base_dPair.f_Base_dPair_dPair_second = dtb__1531 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1532) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTypeMismatch sp) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1529))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1533, dtb__1534) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1533) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1533) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1533))) dtb__1533)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1535) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1535)))) (fun ec1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec1) dtb__1533); Base_dPair.f_Base_dPair_dPair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
)) expr)
))
