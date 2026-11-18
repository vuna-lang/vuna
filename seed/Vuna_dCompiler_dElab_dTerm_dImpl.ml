open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily = C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily of (string) * (string) * (string)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount : int; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices : int Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps : t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan = { f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind : string; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc }

# 42 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque = (fun ec ctx i -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__2 } -> ((fun v -> ((fun r -> r) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) ctx) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (i + 1)) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxItemAt i) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)))

# 35 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((mc2 - 1) - mc4), (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__4) (mc4 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices = (fun ec ctx n tele -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo ec) ctx) n) tele) 0))

# 147 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (Base_dData_dList.v_Base_dData_dList_dhasDupNames (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

# 283 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (match dtb__5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__8 } -> (match dtb__7 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__9, dtb__10) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__11, dtb__12) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__13) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__6)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf = (fun last -> (if ((Base_dData_dString.v_Base_dData_dString_dendsWith "Op") last) then ((fun n -> (if (n > 2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((Base_dData_dString.v_Base_dData_dString_dsubstring 0) (Base_dData_dNat.v_Base_dData_dNat_dfromInt (n - 2))) last))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (bi_strLength last)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical = (fun canon -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg canon)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (canon, (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dprefixOfName canon), dtb__14))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__15) -> (match dtb__15 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical dtb__16)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 407 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__18, dtb__19, dtb__20) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__21, dtb__22) -> (match dtb__19 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax dtb__21) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__23; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__20 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 413 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__28, dtb__29) -> (match dtb__26 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__28) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 419 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__35, dtb__36) -> (match dtb__33 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__37, dtb__38) -> (match dtb__38 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__35) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__37; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__39; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__40 } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 425 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__44, dtb__45) -> (match dtb__42 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__46, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax, dtb__43)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, Base_dData_dList.C_Base_dData_dList_dList_Nil)), dtb__43)), dtb__49)), dtb__43))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed @ marker")
))

# 451 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__50, dtb__51, dtb__52) -> (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__53, dtb__54) -> (match dtb__51 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax dtb__53) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__55; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__57; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__59 } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 465 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor = (fun ec cname sp -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf ec) cname) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__61))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (cname))) cname)
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily = (fun ec cname sp -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName cname) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort cname)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets cname))) (fun canon -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) canon) sp))) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor ec) cname) sp)))

# 471 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__62, dtb__63, dtb__64) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily mc0) dtb__62) dtb__64)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle mirror case pattern is not a constructor")
))

# 476 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__67; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__67) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__69) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__69))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__70) -> (if (dtb__70 = mc1) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) mc1) dtb__66) else ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__67)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleClauseFamilyMismatch (mc1, dtb__70))) mc1) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__73; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat mc0) dtb__73) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__76) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies mc0) dtb__76) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle marker has no operation clause")
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__77) -> true
  | _ -> false
))

# 501 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__78) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (if dtb__80 then (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows dtb__83) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm dtb__82) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows dtb__83) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__84) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__84 + 1)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 496 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity = (fun kind -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dcountOpArrows kind) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__85) -> (if (dtb__85 >= 1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__85 - 1))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs = (fun k sp -> (if (k <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs (k - 1)) sp)))))

# 520 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg = (fun canon k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (canon, sp)), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs k) sp), sp))))

# 525 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder = "@vuna@handle@sig"

# 530 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg = (fun canon k sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Effect.Core.sigFn", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg canon) k) sp), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigBinder, sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)))

# 546 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind = (fun globals ec canon -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup canon) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__86) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__86)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup canon) globals) ec)
  | _ -> failwith "DT: impossible branch"
))

# 552 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder = "@vuna@handle@ret"

# 556 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax dtb__87) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder, dtb__88)), dtb__88)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, dtb__88)))
  | _ -> mc0
))

# 538 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall = (fun headMode nameArg canon k comp ret opH sp -> ((fun fnName -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (fnName, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (nameArg, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (canon, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg canon) k) sp), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (comp, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg ret), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (opH, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))), sp))) (if headMode then "Base.Effect.Core.handleWithAt" else "Base.Effect.Core.handleWith")))

# 566 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf = (fun globals ec canon sp -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind globals) ec) canon) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__89) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity dtb__89) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (canon))) canon)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__90) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr = (fun globals ec opTy op sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__91) -> (match dtb__91 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__92, dtb__93, dtb__94) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf globals) ec) dtb__92) sp)) (fun k -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Base.Effect.Core.performCore", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__92, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleSigArg dtb__92) k) sp), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (op, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))), sp))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_EffResFamilyMissing (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) opTy))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue ec) opTy)))

# 575 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith = (fun globals ec expr sp headMode nameArg -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__95) -> (match dtb__95 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 } -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__98; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__100, dtb__101, dtb__102) -> (match dtb__100 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> (match dtb__104 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__107, dtb__108, dtb__109) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies ec) dtb__108)) (fun fam -> ((fun nd_uscrut31 -> (match nd_uscrut31 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__110) -> (match dtb__110 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dPerfFamily_PerfFamily (dtb__111, dtb__112, dtb__113) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopFamilyArityOf globals) ec) dtb__111) sp)) (fun k -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall headMode) nameArg) dtb__111) k) dtb__96) dtb__98) dtb__99) sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HandleFamilyUnsupported (fam))) fam)
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
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "handle marker expected")
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr)))

# 588 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) false) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp))))

# 592 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) true) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffDefaultInstance, sp))))

# 597 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole = (fun globals ec expr sp -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith globals) ec) expr) sp) true) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("_", sp))))

# 706 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf = (fun ec ty -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__114) -> (match dtb__114 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__115, dtb__116) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__115) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__117) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__117; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 } }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__117)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty)))

# 717 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 725 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom = (fun i remaining sp -> (if (remaining <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

# 721 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats = (fun n sp -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom 0) n) sp))

# 734 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (if ((dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__120).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType } })) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo mc0) dtb__121) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup = (fun fname dd -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo fname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd)) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dd))))

# 741 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match dtb__122 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__124; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__125 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__124) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo mc0) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown = (fun dd fields -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo dd) fields))

# 752 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__129; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__130 } -> (if (dtb__129 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor mc0) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 758 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg = (fun i f provided sp -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor (f).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName) provided) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__131) -> dtb__131
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp))
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg mc0) dtb__132) mc2) mc3), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs (mc0 + 1)) dtb__133) mc2) mc3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 770 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__136; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__135)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> (match dtb__138 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__139; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__140 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices mc0) dtb__135)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__136) mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 801 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan = (fun ec baseTy fname sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__141) -> (match dtb__141 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__142; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 } -> (match dtb__143 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__144; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__145 } -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (match dtb__148 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__149; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData = dtb__142; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor = dtb__144; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planIdxs = dtb__145; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planRecord = (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField = dtb__147; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planFieldCount = dtb__149; f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Base_dData_dList.v_Base_dData_dList_dreverse dtb__145)) dtb__150) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ fname))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup fname) dtb__142))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve record type for field "; fname; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 810 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan = (fun ec baseTy fields sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__151) -> (match dtb__151 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__152; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__153 } -> (match dtb__153 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown dtb__152) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ dtb__156))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun fs -> ((fun bodyArgs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData = dtb__152; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor = dtb__154; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs = dtb__155; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upRecord = (dtb__152).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount = (Base_dData_dList.v_Base_dData_dList_dlength fs); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices dtb__152) fields); f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs = bodyArgs }))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs 0) fs) fields) sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields dtb__152))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

# 823 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName "Base.Trait.Record.HasField")

# 833 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__159; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__160 } -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__161) -> (match dtb__161 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__162, dtb__163) -> (if (dtb__162 = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> ((fun nd_uscrut27 -> (match nd_uscrut27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__170) -> (match dtb__170 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__171, dtb__172) -> (if (dtb__171 = "Base.Trait.Field.Field") then (match dtb__172 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__173 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__175) -> (if (dtb__175 = mc4) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__166) mc5) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__176) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__159, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__168; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 } }))
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
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict = (fun ctx ec fname baseTy -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ctx) ec) fname) baseTy))

# 854 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel = (fun fuel globals ctx ec baseTerm baseTy fname sp -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__178) -> (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__179, dtb__180) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["type "; dtb__179; " is not a record"]))
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__181) -> (match dtb__181 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> (match dtb__183 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__184; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = proj; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__184; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Trait.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__184), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__182, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Trait.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (match dtb__186 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 } -> (match dtb__188 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = proj; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Trait.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__189), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__187, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Trait.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) baseTy)))

# 1046 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__191, dtb__192, dtb__193) -> (match dtb__191 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__194, dtb__195) -> (match dtb__192 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__194) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail dtb__196) dtb__198) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__200, dtb__201) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__200) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
# 1052 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail = (fun h t -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__202) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (h, dtb__202))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__203)) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__203)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort mc0) dtb__204))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1066 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor = (fun ec fam short -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__205) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort short) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__205))
  | _ -> failwith "DT: impossible branch"
))

# 1072 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo mc0) mc1) dtb__207) mc3)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (t, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1083 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__208, dtb__209, dtb__210) -> (match dtb__208 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__211, dtb__212) -> (match dtb__209 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax dtb__211) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__215 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1087 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__220, dtb__221) -> (match dtb__218 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__223 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax dtb__220) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__222; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__225 } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1101 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, mc1, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan mc0)))
))

# 1094 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts = (fun e -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts e) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__226) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__226))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__227) -> (match dtb__227 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__228; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 } -> (match dtb__229 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__230; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__231 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra dtb__228) dtb__231); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__230 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts e))
  | _ -> failwith "DT: impossible branch"
))

# 1106 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> e
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__232) -> (match dtb__232 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__233; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1111 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg = (fun e -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__235) -> (match dtb__235 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__236; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__237 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__237))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts e)))

# 1116 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr = (fun e sp -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg e) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__238) -> dtb__238
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffDefaultInstance, sp))
  | _ -> failwith "DT: impossible branch"
))

# 1138 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry = (fun e sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr e) sp), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel e), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 1133 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsEntry = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__242, dtb__243) -> (match dtb__240 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__244, dtb__245) -> (match dtb__245 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (match dtb__247 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__242 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then mc0 else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1)
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1)
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1)
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1)
)
  | _ -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dwrapRowEntry mc0) mc1)
))

# 1130 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsArgs = (fun e t sp -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsEntry e) sp), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (t, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 1121 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo mc0) mc1) dtb__249) mc3)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowConsArgs dtb__248) t) mc3), mc3))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

# 1145 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc0) mc1) dtb__250) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf mc0) mc1) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1142 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons = (fun ec fam -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf ec) fam) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("::", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Cons", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("RCons", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("VCons", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))

# 1152 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit = (fun ec fam elems sp -> (if (fam = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowFamilyName) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__253) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons ec) fam) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__254) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__253)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__254)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__255) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons ec) fam) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__256) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__255)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__256)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 1165 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf ec) expected) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__257) -> dtb__257
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit = (fun ec dom a -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems a) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__258) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))) dtb__258) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan a))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (a))
  | _ -> failwith "DT: impossible branch"
))

# 1331 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))

# 1334 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 1339 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NatLiteralOutOfRange) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

# 1342 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("natToInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1345 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 1348 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 1352 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 1355 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__259) -> (match dtb__259 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__260, dtb__261) -> (match dtb__261 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__260 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1360 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__262) -> (match dtb__262 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__263, dtb__264) -> (match dtb__264 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__263 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1366 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__265) -> (match dtb__265 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__266, dtb__267) -> (match dtb__267 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__266 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 953 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected = (fun ec name expected -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__268) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then false else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__269, dtb__270) -> false
  | _ -> true
))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__271) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__271))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1372 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 1377 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = bTy }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm); Base_dData_dPair.f_Base_dData_dPair_dPair_second = bTerm } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = aTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = aTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm) } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))

# 1394 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf = (fun mc0 mc1 -> (if (mc1 = "+") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("+")) else (if (mc1 = "-") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("-")) else (if (mc1 = "*") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("*")) else (if (mc1 = "/") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("/")) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot mc1) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName mc0) mc1) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 1401 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

# 1407 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1410 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1419 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName = (fun mc0 -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

# 1415 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 1425 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__272, dtb__273) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__272))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1499 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disSimpleComp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__274, dtb__275) -> true
  | _ -> false
))

# 1554 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower = (fun globals ctx ec traitName methodName lit expected sp -> ((fun dictDom -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__276) -> (match dtb__276 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__277; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__278 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (methodName, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (lit, Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__278 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__279) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictDom) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName traitName), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))

# 1563 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__280, dtb__281) -> "EFloat"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__282, dtb__283, dtb__284) -> "EInterp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__285, dtb__286, dtb__287) -> "EAnn"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__288, dtb__289, dtb__290) -> "ESectR"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__291, dtb__292, dtb__293) -> "ESectL"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__294, dtb__295) -> "ESectOp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__296, dtb__297, dtb__298, dtb__299) -> "EBacktick"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__300, dtb__301) -> "EParen"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__302, dtb__303, dtb__304, dtb__305) -> "EInfix"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__306, dtb__307) -> "EDo"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__308, dtb__309, dtb__310) -> "ERecUpdate"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__311, dtb__312, dtb__313) -> "ERecord"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__314, dtb__315, dtb__316) -> "EField"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__317, dtb__318) -> "ELocalFun"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__319, dtb__320, dtb__321, dtb__322) -> "ELet"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__323, dtb__324, dtb__325) -> "ECase"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__326, dtb__327, dtb__328, dtb__329) -> "EIf"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> "EPi"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__336, dtb__337, dtb__338) -> "EApp"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__339, dtb__340, dtb__341) -> "ELam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__342, dtb__343) -> "EStr"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__344, dtb__345) -> "EInt"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__346, dtb__347) -> "EVar"
  | _ -> failwith "DT: impossible branch"
))

# 1600 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_doverValueCandidateMatches = (fun globals ctx ec expected target -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__348) -> (match dtb__348 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__349) -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__349)) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__350) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__351) -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) target)))

# 1608 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverValueTarget = (fun globals ctx ec short targets expected sp -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__352, dtb__353) -> (match dtb__353 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__352))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName (short, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)))) short) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets))
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName (short, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)))) short) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets))
)) ((Base_dData_dList.v_Base_dData_dList_dfilter ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_doverValueCandidateMatches globals) ctx) ec) expected)) targets)))

# 1719 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__354, dtb__355, dtb__356) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__355)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__357, dtb__358, dtb__359) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__358)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__360, dtb__361, dtb__362) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__360) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__361))
  | _ -> false
))
# 1727 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__363, dtb__364) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__363) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__364))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1732 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__365, dtb__366) -> (match dtb__365 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__367; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__368 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__368) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__366))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1737 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__369, dtb__370) -> (match dtb__369 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__371; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__372 } -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__371) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__370))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__373, dtb__374, dtb__375) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__373)) (fun value2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (value2, dtb__374, dtb__375))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__376, dtb__377) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__376)) (fun stmts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (stmts2, dtb__377))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__378, dtb__379, dtb__380) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__378)) (fun base2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf fv); Base_dData_dPair.f_Base_dData_dPair_dPair_second = v2 })))))) dtb__379)) (fun fields2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (base2, fields2, dtb__380))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__381, dtb__382, dtb__383) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun fv -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf fv))) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf fv); Base_dData_dPair.f_Base_dData_dPair_dPair_second = v2 })))))) dtb__382)) (fun fields2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__381, fields2, dtb__383))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__384, dtb__385, dtb__386) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__384)) (fun base2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (base2, dtb__385, dtb__386))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__387, dtb__388, dtb__389, dtb__390) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__387)) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__388)) (fun t2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__389)) (fun el2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, el2, dtb__390))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__391, dtb__392, dtb__393) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__391)) (fun scrut2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__392)) (fun alts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__393))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__394, dtb__395, dtb__396, dtb__397) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__394)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__395)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (binds2, body2, dtb__396, dtb__397))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__401)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__402)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__398, dtb__399, dtb__400, dom2, cod2, dtb__403))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__404, dtb__405, dtb__406) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__404)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__405)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__406))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__407, dtb__408, dtb__409) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__408)) (fun b2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__407, b2, dtb__409))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__410, dtb__411) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__410, dtb__411))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__412, dtb__413) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__412, dtb__413))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__414, dtb__415) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__414, dtb__415))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__416, dtb__417) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__416, dtb__417))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__418, dtb__419) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__418) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__418, dtb__419)))) else ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__418))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unreordered infix/paren in elaboration")
))
# 1783 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__420; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__421 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__421)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__420; Base_dData_dPair.f_Base_dData_dPair_dPair_second = v2 }))))
  | _ -> failwith "DT: impossible branch"
))
# 1787 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__422, dtb__423) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__422)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (v2, dtb__423))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__424, dtb__425, dtb__426) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__425)) (fun v2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__424, v2, dtb__426))))))
  | _ -> failwith "DT: impossible branch"
))

# 1897 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas = (fun fuel ctx ec v -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__427, dtb__428, dtb__429, dtb__430, dtb__431) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__432; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__433 } -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas (fuel - 1)) ctx) dtb__433) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__431) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__432)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = v; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }))
)))

# 1909 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__434, dtb__435) -> true
  | _ -> false
))

# 1915 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__436, dtb__437) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__438) -> (match dtb__438 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__439, dtb__440, dtb__441) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__442, dtb__443) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 1927 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint = (fun goals0 ctx expected ec piTy -> (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) <= goals0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__444) -> (match dtb__444 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__445; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__446 } -> ((fun forcedRes -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue dtb__446) forcedRes) then (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue dtb__446) expected) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__446) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) forcedRes) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__447) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__448) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__448))
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__446) dtb__445))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__449) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas 64) ctx) ec) piTy))))

# 1969 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__450) -> (match dtb__450 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__451, dtb__452) -> (match dtb__452 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__453, dtb__454) -> (match dtb__454 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__455, dtb__456) -> (if (dtb__451 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__453; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__455 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1975 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue = (fun v -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult v) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__457) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__457)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1981 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__458, dtb__459) -> (dtb__458 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 1987 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__460, dtb__461) -> (if (dtb__460 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__462, dtb__463) -> (match dtb__463 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__464, dtb__465) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__462; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__464 }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__461) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1995 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName = (fun g -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg g))

# 2004 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__466, dtb__467) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (String.concat "" [mc0; " "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) dtb__466)])) dtb__467)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1999 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__468) -> (match dtb__468 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__469, dtb__470) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs (v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName dtb__469)) dtb__470)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 2009 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__471) -> dtb__471
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

# 2015 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText = (fun ec n h -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText ec) n) = "default") then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) h) else (String.concat "" [((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) h); "@"; ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText ec) n)])))

# 2021 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnamedLabelParts = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__472) -> (match dtb__472 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__473, dtb__474) -> (if (dtb__473 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__475, dtb__476) -> (match dtb__476 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__477, dtb__478) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__475; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__477 }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__474) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 2029 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryTextOf = (fun ec label -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText ec) label)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__479) -> (match dtb__479 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__480; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__481 } -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText ec) dtb__480) dtb__481)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnamedLabelParts ec) label)))

# 2035 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels = (fun fuel ec row -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) row) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__482, dtb__483) -> (if (dtb__482 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (dtb__482 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__484) -> (match dtb__484 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__485; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__486 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) dtb__485) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels (fuel - 1)) ec) dtb__486) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__487) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryTextOf ec) dtb__485), dtb__487))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__482, dtb__483)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 2049 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__488, dtb__489) -> (match dtb__489 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__488
  | _ -> (String.concat "" [dtb__488; ", "; (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__489)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2056 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel = (fun ec expected actual -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__490) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue ec) dtb__490) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__491) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) ec) dtb__491) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__492) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dList.v_Eq_uBase_uData_uList_uList_ua Base_dData_dString.v_Eq_uString)) dtb__492) Base_dData_dList.C_Base_dData_dList_dList_Nil) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__492)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 2073 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue = (fun a b -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) a)) = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) b))))

# 2076 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue = (fun ec fuel expected label -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__493, dtb__494) -> (if (dtb__493 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__495) -> (match dtb__495 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__496; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__497 } -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue label) dtb__496) then true else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__497)) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__493, dtb__494)))) else false)
  | _ -> false
)))

# 2086 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue = (fun ec fuel actual expected -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__498, dtb__499) -> (if (dtb__498 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then true else (if (dtb__498 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__500) -> (match dtb__500 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__501; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__502 } -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue ec) (fuel - 1)) expected) dtb__501) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue ec) (fuel - 1)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__502)) expected) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__498, dtb__499)))) else false))
  | _ -> false
)))

# 2139 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dweakenLabelTerm = (fun d label tailF result term -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Effect.Core.weaken")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) label), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) tailF), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) result), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))

# 2101 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift = (fun ctx globals ec expected actual term -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Effect.Core.weaken") globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__503) -> ((fun d -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__504) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__505) -> (match dtb__505 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__506; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__507 } -> ((fun tailF -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) tailF) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__508) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) d) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__504)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__508)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__509) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__510) -> ((fun actualRow -> (if ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue dtb__510) 64) actualRow) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__504)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = term; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__510 })) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue dtb__510) actualRow) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup "Base.Effect.Core.raise") globals) dtb__510) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__511) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Effect.Core.raise")), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__504)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__504)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), term, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__510 }))
  | _ -> failwith "DT: impossible branch"
) else (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__510) d) actualRow) tailF) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__512) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__513) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dweakenLabelTerm d) dtb__506) tailF) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__504)) term); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__513 }))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__508))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__507))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryLabelTail ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__504))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
))

# 2220 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm = (fun ec name -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__514) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__514) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))
  | _ -> failwith "DT: impossible branch"
))

# 2226 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm = (fun ec name args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__515) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord dtb__515) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (name, args)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) args)
  | _ -> failwith "DT: impossible branch"
))

# 2434 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2438 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromFloat")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

# 2441 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 2444 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__516) -> (match dtb__516 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__517, dtb__518) -> (match dtb__518 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__517 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 2508 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__519) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__519; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__520, dtb__521) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__520; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__521) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__522, dtb__523, dtb__524) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType dtb__522) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__525; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__526 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__525; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__526) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__523, Base_dData_dList.C_Base_dData_dList_dList_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ""; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 2504 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__527, dtb__528, dtb__529, dtb__530, dtb__531) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs dtb__531)
  | _ -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType mc0))
))

# 2515 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__532, dtb__533, dtb__534, dtb__535, dtb__536) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis dtb__536)
  | _ -> mc0
))

# 2519 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__537, dtb__538) -> (match dtb__537 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__539, dtb__540, dtb__541) -> (if (dtb__540 = ((mc1 - 1) - mc0)) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs (mc0 + 1)) mc1) dtb__538) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2526 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine = (fun fam ctor -> ((fun k -> ((fun args -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__542; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__543 } -> (if (dtb__542 = fam) then (if ((Base_dData_dList.v_Base_dData_dList_dlength args) > 0) then (if ((Base_dData_dList.v_Base_dData_dList_dlength args) < k) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

# 2541 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__544, dtb__545) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__544), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo (mc0 - 1)) dtb__545))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2538 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs = (fun n bs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo n) bs))

# 2561 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__546, dtb__547) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__548, dtb__549) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) mc1) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> (if dtb__551 then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__554) dtb__546)) dtb__547) dtb__549) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc4) dtb__546); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__548 }, mc5))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc5); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 } }))
  | _ -> failwith "DT: impossible branch"
))

# 2545 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs = (fun ec ctx ctor expected -> ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine fam) ctor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__555) -> (match dtb__555 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__556, dtb__557) -> ((fun arity -> (if (dtb__556 = fam) then (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__557) = arity) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) dtb__557) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dData_dList.C_Base_dData_dList_dList_Nil) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)))

# 2577 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__558 = mc0 in (if dtnat__558 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__559 = (dtnat__558 - 1) in (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__560, dtb__561, dtb__562) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__560) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Nil") with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__563) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__559) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__563)) dtb__561) dtb__562)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__561, dtb__562)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__560) then (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__564) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__559) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__564)) dtb__561) dtb__562)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__561, dtb__562)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__560) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor mc1) dtb__562) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc3))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__560)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__560))) (fun target -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__559) mc1) mc2) mc3) target) dtb__561) dtb__562))) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__559) mc1) mc2) mc3) dtb__560) dtb__561) dtb__562))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__565, dtb__566, dtb__567) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
)))))
# 2594 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (let dtnat__568 = mc0 in (if dtnat__568 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__569 = (dtnat__568 - 1) in (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc1) mc4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__570) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__571) -> (match dtb__571 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__572; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__573 } -> (match dtb__573 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__574; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__575 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__569) dtb__575) mc2) dtb__574) mc5)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__576; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__577 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, dtb__576, mc6)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__577 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs mc1) mc2) dtb__570) mc3))
  | _ -> failwith "DT: impossible branch"
)))))
# 2605 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__578 = mc0 in (if dtnat__578 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__579 = (dtnat__578 - 1) in (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__580, dtb__581) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__583 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__579) mc1) ctx2) ty2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__580, dtb__581))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__579) mc1) mc2) dtb__585) dtb__580)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__587; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__588 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__579) dtb__588) ctx2) ty2) dtb__581)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__589; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__590 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__587, dtb__589)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__590 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__586) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__582) dtb__585) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__582, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2628 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__591 = mc0 in (if dtnat__591 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__592 = (dtnat__591 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__593, dtb__594) -> (match dtb__593 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__595; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__596 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__595)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__597; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__598 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo dtb__592) dtb__598) mc2) mc3) dtb__594)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__599; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__600 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__597; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__596 }, dtb__599)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__600 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2624 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts = (fun ec ctx ty alts -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

# 2656 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__601 = mc0 in (if dtnat__601 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__602 = (dtnat__601 - 1) in (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__603, dtb__604) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__605, dtb__606, dtb__607, dtb__608, dtb__609) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__606 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__602) mc1) ctx2) ty2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__603, dtb__604))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__602) mc1) mc2) dtb__608) dtb__603)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__610; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__611 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__602) dtb__611) ctx2) ty2) dtb__604)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__612; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__613 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__610, dtb__612)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__613 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__609) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__605) dtb__608) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__605, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2645 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__614 = mc0 in (if dtnat__614 = 0 then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern resolve") else (let dtb__615 = (dtnat__614 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__616, dtb__617) -> (match dtb__616 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__618; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__619 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__618)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__620; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__621 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo dtb__615) dtb__621) mc2) mc3) dtb__617)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__622; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__623 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__620; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__619 }, dtb__622)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__623 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

# 2640 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats = (fun ec ctx expected clauses -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

# 2720 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__624, dtb__625, dtb__626) -> (match dtb__624 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__627, dtb__628) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__627) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__629) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 2742 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain = (fun fuel canonical acc expr -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__630, dtb__631, dtb__632) -> (match dtb__630 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__633, dtb__634) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__633) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = expr }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__635) -> (if (canonical <> dtb__635) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__636, dtb__637) -> (match dtb__637 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__638, dtb__639) -> (match dtb__638 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__640, dtb__641, dtb__642) -> (match dtb__640 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__643, dtb__644) -> (match dtb__643 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__645; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__646 } -> (match dtb__644 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__639 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain (fuel - 1)) dtb__635) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__645, dtb__636, dtb__634, dtb__646)), acc))) dtb__641)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__631))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = expr }))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = expr }))
)) expr)))

# 2755 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__647, dtb__648, dtb__649) -> (match dtb__647 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__650, dtb__651) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__650) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__652) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__653) -> (match dtb__653 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__654; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__655 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical = dtb__652; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps = dtb__654; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast = dtb__655; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan = dtb__651 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain 4096) dtb__652) Base_dData_dList.C_Base_dData_dList_dList_Nil) mc0))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 2765 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__656, dtb__657) -> (match dtb__656 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__658, dtb__659, dtb__660, dtb__661) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, dtb__660)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__659, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__658; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__661 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild mc0) dtb__657) mc2) mc3), dtb__660)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__660))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 2772 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback = (fun chain -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan))

# 2779 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__662, dtb__663) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__662)) dtb__663) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__662 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__664) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__664))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2786 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__665) -> (match dtb__665 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__666, dtb__667, dtb__668) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__666, dtb__667, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) dtb__668)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__669, dtb__670) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__669, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) dtb__670)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 2802 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__671, dtb__672, dtb__673, dtb__674, dtb__675) -> (if dtb__672 then (match dtb__675 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__676, dtb__677, dtb__678, dtb__679, dtb__680) -> (if dtb__677 then (match dtb__679 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__681, dtb__682, dtb__683) -> (match dtb__681 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__684) -> (match dtb__682 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__685, dtb__686, dtb__687) -> (match dtb__680 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__688, dtb__689, dtb__690, dtb__691, dtb__692) -> (if dtb__689 then (match dtb__692 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__693, dtb__694, dtb__695, dtb__696, dtb__697) -> (if dtb__694 then (match dtb__697 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__698, dtb__699, dtb__700, dtb__701, dtb__702) -> (if dtb__699 then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__701 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__703, dtb__704, dtb__705) -> (match dtb__703 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__706, dtb__707, dtb__708) -> (match dtb__704 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__709, dtb__710, dtb__711) -> (match dtb__702 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__712, dtb__713, dtb__714, dtb__715, dtb__716) -> (if dtb__713 then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__715 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__717, dtb__718, dtb__719, dtb__720, dtb__721) -> (if dtb__718 then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match dtb__720 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__722, dtb__723, dtb__724) -> (match dtb__721 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__725, dtb__726, dtb__727) -> (match dtb__725 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__728, dtb__729, dtb__730) -> (match dtb__726 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__731, dtb__732, dtb__733) -> (match dtb__716 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__734, dtb__735, dtb__736) -> (match dtb__734 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__737, dtb__738, dtb__739) -> (match dtb__735 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__740, dtb__741, dtb__742) -> (if (if (if (if (dtb__686 = 0) then (dtb__707 = 3) else false) then (dtb__729 = 5) else false) then (dtb__738 = 5) else false) then (if (if (if (if (dtb__710 = 1) then (dtb__723 = 2) else false) then (dtb__732 = 2) else false) then (dtb__741 = 2) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__700, dtb__714, dtb__719)))) else (if (if (if (if (dtb__710 = 0) then (dtb__723 = 1) else false) then (dtb__732 = 3) else false) then (dtb__741 = 3) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__700, dtb__714, dtb__719)))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 2813 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf = (fun globals ctx ec bindName -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup bindName) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__743) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup bindName) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__744) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (bindName)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__744 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2822 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf = (fun globals ctx ec bindName -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__745) -> (match dtb__745 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__746; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__747 } -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf dtb__747) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__748) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__746; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__747; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__748 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf globals) ctx) ec) bindName)))

# 2832 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer = (fun ctx ec dom sp -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__749; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__750 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__749; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__750) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__750) dom)) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) }))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

# 2841 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep = (fun fuel globals ctx ec sp dom -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dom) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__751) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__751))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__752) -> (match dtb__752 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__753; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__754 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__753; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__754 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) sp)))))

# 2867 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock = (fun fuel globals ctx ec sp bindName headTerm bindTyTerm shape mVal aVal -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match shape with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__755, dtb__756, dtb__757) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__758, dtb__759, dtb__760, dtb__761, dtb__762) -> (if dtb__759 then ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__763, dtb__764, dtb__765, dtb__766, dtb__767) -> (if dtb__764 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__766) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__766)) (fun dp -> (match dp with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__768; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__769 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planBind = bindName; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead = headTerm; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) mVal); f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal = mVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal = aVal; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm = dtb__768; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE = dtb__755; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL = dtb__756; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig = dtb__757; f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc = dtb__769 }))))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__762) mVal))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) bindTyTerm)))
  | _ -> failwith "DT: impossible branch"
)))

# 2887 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm = (fun ecLinear ecPaper ctx sp binderSp plan binder aVal eTerm argRig lamRig inner -> ((fun depth -> ((fun ctx2 -> ((fun inner2 -> ((fun binderName -> ((fun lamTerm -> ((fun args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planHead) args)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planDictTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) aVal); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = eTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = argRig }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = lamTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigL }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, binderSp, inner2)))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear ecLinear) ctx) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear ecLinear) ctx2) inner) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName sp) depth) binder) else binder) else binder))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) inner) else inner))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binder) aVal) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

# 54 "Vuna/Compiler/Elab/Term/Impl.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 psp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownConstructorInCase ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__770) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan psp)) (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__770)) args))) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__771; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__772 } -> (match dtb__772 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__773; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__774 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__774) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 psp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_BranchTooManyArgs ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan psp)) (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized ec) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__771)) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__771) dtb__770)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dData_dList.C_Base_dData_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs)))) (fun refsIdx -> (match (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__771) refsIdx) with
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImpossibleBranchEmptyCtx)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__771)) refsIdx) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__771) dtb__770)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__775; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__776 } -> ((fun n -> ((fun opaqueIdxs -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = cname; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__773; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__776 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__776) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses opaqueIdxs) dtb__775))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices dtb__776) branchCtx2) n) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__773)))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__773))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__771) refs2))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
# 84 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__777, dtb__778) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__777 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__779; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__780 } -> (match dtb__779 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__781, dtb__782, dtb__783) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__781) dtb__782) dtb__783) dtb__780)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__784; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__785 } -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__785) mc4) mc5) mc6) mc7) mc8) dtb__778) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__784, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__786, dtb__787) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__778) mc10) dtb__780) dtb__786) dtb__787)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__788) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__778) mc10) dtb__780) "_") dtb__788)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__779)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc10); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 })))
  | _ -> failwith "DT: impossible branch"
))
# 105 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CatchAllNotLast) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__789; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__790 } -> ((fun binds -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ""; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binds; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = bodyTerm2 }, acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__790 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__790) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) (if (pname = "_") then dtb__789 else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__790) ctx) scrutTy) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__789) else dtb__789)))) (if (pname = "_") then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = pname; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) scrutTy); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName pname) psp) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
# 135 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__791; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__792 } -> (match dtb__792 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__793; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__794 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts dtb__794) ctx) dtb__793) alts)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__795; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__796 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dstep ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat dtb__796) dtb__795)) (fun _u ec3 -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase dtb__795) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) ec3) scrut) dtb__795) expected) sp) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) ec3) dtb__791) dtb__793) dtb__795) expected) sp))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))
# 155 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun name -> ((fun clauses -> ((fun table -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr table) clauses) name)) (fun bodyExpr -> ((((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive table) (fun _u -> (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmatrixOf clauses))) sp) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (name, sp)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = scrut }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), bodyExpr, false, sp))) expected))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun alt -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf alt), Base_dData_dList.C_Base_dData_dList_dList_Nil)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf alt) })) alts))) ("nd_scrut" ^ (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
# 165 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__797) -> (match dtb__797 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__798, dtb__799) -> (if (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical dtb__798) then ((Base_dData_dList.v_Base_dData_dList_dlength dtb__799) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__798 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName) then (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts alts) then ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel (fuel - 1)) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm scrutTerm)) scrutTerm) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue) alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__798) dtb__799) alts) expected) sp)) else (if (dtb__798 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__798 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__798) dtb__799) alts) expected) sp)))))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
# 182 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__800; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__801 } -> (match dtb__801 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__802; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__803 } -> (match dtb__802 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__804) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__800, dtb__804)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__803 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) dtb__803) alts) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__805; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__806 } -> (match dtb__806 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__807; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__808 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__800, dtb__805)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__808 }))
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
# 194 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
# 199 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__809, dtb__810) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__809 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__811; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__812 } -> (match dtb__811 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__813, dtb__814, dtb__815) -> (if (dtb__813 = mc5) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__812) mc6)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__816; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__817 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__816; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__817 } }))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__810) mc5) mc6) mc7) mc8))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__818, dtb__819) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__812) mc6)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__820; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__821 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__821) dtb__810) mc5) mc6) mc7) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__820)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__822) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__812) mc6)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__823; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__824 } -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) dtb__824) dtb__810) mc5) mc6) mc7) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__823)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__811)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match mc8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__825) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__825; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 } }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 224 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__826; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__827 } -> (match dtb__827 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__828; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__829 } -> (if dtb__828 then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__826; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__829 })) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 234 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__830, dtb__831) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__830 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__832; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__833 } -> (match dtb__832 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__834, dtb__835) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__834))) dtb__833) dtb__831) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__836, dtb__837) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__836))) dtb__833) dtb__831) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__838, dtb__839) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__838) dtb__833) mc7) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__838) dtb__839)) mc8)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__840; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__841 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__840; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__841 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__842) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__833) mc7)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__843; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__844 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__843; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__844 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__832)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__845; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__846 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__846) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__847; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__848 } -> (match dtb__848 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__849; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__850 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__845, dtb__847)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__849; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__850 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 266 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__851; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__852 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, dtb__851)), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__852 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) ctx))))
# 291 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__853; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__854 } -> (match dtb__854 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__855; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__856 } -> (if dtb__855 then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__853; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__856 })) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 299 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__857, dtb__858) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match dtb__857 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__859; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__860 } -> (match dtb__859 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__861, dtb__862) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__861))) dtb__860) dtb__858) mc8) mc9)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__863, dtb__864) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__863) dtb__860) mc8) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__863) dtb__864)) mc9)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__865; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__866 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__865; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__866 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__867) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__860) mc8)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__868; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__869 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__868; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = true; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__869 } }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__859)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = false; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 } })))
  | _ -> failwith "DT: impossible branch"
))
# 317 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy litTerm body rest expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__870; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__871 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__871) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun q -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__872; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__873 } -> (match dtb__873 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__874; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__875 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("bi_eq_int")), cmpTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__870, dtb__872)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__874; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__875 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
# 328 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel = (fun fuel globals ctx ec bindTerm binderTy name body expected binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__876; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__877 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, dtb__876)), bindTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__877 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) binderTy))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) binderTy) ctx))))
# 338 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__878) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__878) idxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__879; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__880 } -> (((((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__880) ctx) dtb__878) idxs) alts) expected) sp) scrutTerm) dtb__879)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 348 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun pmeta -> (match pmeta with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__881; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__882 } -> ((fun metaTy -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__882) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__883; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__884 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__883; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = metaTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__884 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__881))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec))))
# 364 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__885) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__885))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__886) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__887; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__888 } -> (match dtb__888 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__889; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__890 } -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__889) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__887; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__890 })) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName; " (got "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__889); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
# 600 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__891) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__892) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__892))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__893) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr2 -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__894) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__894))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__895) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr3 -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr3) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__896) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__896))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__897) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__893))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__898) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__899) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) dtb__899) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__900) -> (match dtb__900 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__901; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__902 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__901)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__903; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__904 } -> (match dtb__904 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__905; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__906 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr globals) dtb__906) dtb__905) dtb__901) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__906) callExpr)))
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
# 630 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__907) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__907)) (fun r -> (match r with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__908) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__908))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__907))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr))))
# 641 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__909, dtb__910, dtb__911) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__909) dtb__910) dtb__911)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__912, dtb__913) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__913) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DoUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__914, dtb__915, dtb__916) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__914) dtb__915) dtb__916)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__917, dtb__918, dtb__919) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__919) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_RecordsUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__920, dtb__921, dtb__922) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__920) dtb__921) dtb__922)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__923, dtb__924, dtb__925) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__923) dtb__924) dtb__925)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__926, dtb__927) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__926) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__927) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__926, dtb__927)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__928, dtb__929, dtb__930, dtb__931) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__928) dtb__929) dtb__930) dtb__931)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__932, dtb__933, dtb__934, dtb__935) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__932) dtb__935)) (fun pc -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__936; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__937 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__937) dtb__933)) (fun pt -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__938; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__939 } -> (match dtb__939 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__940; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__941 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__941) dtb__934)) (fun pe -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__942; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__943 } -> (match dtb__943 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__944; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__945 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__945) dtb__940) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__945) dtb__944) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__936, dtb__938, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__942))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__940; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__945 } })) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__945) dtb__940) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__945) dtb__944) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__936, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__938), dtb__942)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__945 } })) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__945) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__940) dtb__944)) (fun ec4 -> ((fun branchOpaque -> ((fun tTerm2 -> ((fun eTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__936, tTerm2, eTerm2)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__940; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec4 } }))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__942) else dtb__942))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__938) else dtb__938))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec4) ctx) dtb__940))))))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__946, dtb__947, dtb__948) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__948) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaNoSignature)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__949, dtb__950, dtb__951) -> (match dtb__949 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__952, dtb__953) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__952) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__951) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__952, dtb__953))) dtb__950) dtb__951) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__949) dtb__950) dtb__951) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__954, dtb__955, dtb__956, dtb__957, dtb__958, dtb__959) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__954) dtb__955) dtb__956) dtb__957) dtb__958) dtb__959)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__960, dtb__961) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__960)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__962, dtb__963) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__962)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("String", Base_dData_dList.C_Base_dData_dList_dList_Nil)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__964, dtb__965) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__964)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Int", Base_dData_dList.C_Base_dData_dList_dList_Nil)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__966, dtb__967) -> (if (dtb__966 = "Type") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__966) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__967) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_HoleNoExpectedType) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__966) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__967) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__966)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__966))) (fun t -> (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) t) dtb__967))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverValueName dtb__966) then ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 dtb__967) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousName ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__966), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__966))))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__966)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__966))) else (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__966) dtb__967)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unreordered infix/paren in elaboration")
)) expr)))
# 872 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel = (fun fuel globals ctx ec base fname sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__968; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__969 } -> (match dtb__969 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__970; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__971 } -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf dtb__971) dtb__970) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__972) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan dtb__971) dtb__970) fname) sp)) (fun plan -> ((fun arity -> ((fun tele -> ((fun proj -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = proj; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planType; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__971 } }))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__968, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor), tele, (arity + (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planField)))) ((Base_dData_dList.v_Base_dData_dList_ddrop arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planCtor)))) (Base_dData_dList.v_Base_dData_dList_dlength ((plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_planData).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__971) dtb__968) dtb__970) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))))
# 889 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel = (fun fuel globals ctx ec base fields sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fields with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "record update needs at least one field")
  | _ -> (if (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames fields) then ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "duplicate field in record update") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__973; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__974 } -> (match dtb__974 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__975; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__976 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan dtb__976) dtb__975) fields) sp)) (fun plan -> ((fun body -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (fuel - 1)) globals) ctx) dtb__976) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upData) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upIdxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__973)) dtb__975) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldCount) sp)) sp) body)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__977; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__978 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__973, (dtb__977).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName, (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (dtb__977).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upFieldIndices, (dtb__977).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__975; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__978 } }))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upCtor), sp)), (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_upBodyArgs, sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb))))
)))
# 907 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__979; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__980 } -> (match dtb__980 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__981; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__982 } -> ((fun tyVal -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__982) value) tyVal)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__983; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__984 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__983; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = tyVal; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__984 } }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__979))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
# 918 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit qty dom cod sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__985; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__986 } -> (match dtb__986 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__987; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__988 } -> ((fun domVal -> ((fun isTypeDom -> ((fun isLinDom -> ((fun lvl -> ((fun ctx2 -> ((fun badQty -> ((fun badLinQty -> (if badQty then (if implicit then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MultiplicityImplicit (name))) name) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LinearTypeNeedsOne (name))) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__988) cod)) (fun pc -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__989; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__990 } -> (match dtb__990 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__991; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__992 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (name, implicit, (if isLinDom then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else (if implicit then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig ec) domVal) else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfQty false) isTypeDom) qty))), dtb__985, dtb__989)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__987) dtb__991))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__992 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))))) (match qty with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__993) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero dtb__993) then isLinDom else false)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (match qty with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__994) -> (if implicit then true else isTypeDom)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__985) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) domVal))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeDomain domVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__985))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
# 969 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__995, dtb__996) -> (if (dtb__995 = "->") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__997, dtb__998) -> (match dtb__998 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__999, dtb__1000) -> (match dtb__1000 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) dtb__997) dtb__999) sp)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)) args) else (if (dtb__995 = "Type") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1001, dtb__1002) -> (match dtb__1001 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__1003, dtb__1004) -> (match dtb__1002 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__1003 < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__1004) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UniverseLevelNonNegative) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__1003))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__1003)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__996) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__996) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__996) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)) args) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1005, dtb__1006) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1005) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1006) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1005)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1005))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1006))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1005) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1007) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__1005) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1008) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1008))) args) sp) hint)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1009; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1010 } -> (match dtb__1010 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1011; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1012 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1012) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1005))) dtb__1009); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1011; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1012 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__1005) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1013) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__1005) hint) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1013)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1014; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1015 } -> (match dtb__1015 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1016; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1017 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1017) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1005))) dtb__1014); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1016; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1017 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1005) args) sp)) (fun mspec -> (match mspec with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1018) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1018))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1013)) args) sp) hint)) (fun pa -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1019; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1020 } -> (match dtb__1020 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1021; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1022 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1022) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1005))) dtb__1019); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1021; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1022 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1005) args) sp)) (fun mspec -> (match mspec with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1023) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1023))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__1006) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1005))) dtb__1005)
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1024, dtb__1025) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1024) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1025) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1024)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1024))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1025))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1024) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1026) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__1024) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1027) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1027))) args) sp) hint)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1028; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1029 } -> (match dtb__1029 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1030; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1031 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1031) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1024))) dtb__1028); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1030; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1031 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__1024) globals) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1032) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint ec) dtb__1024) hint) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1032)) args) sp) hint)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1033; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1034 } -> (match dtb__1034 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1035; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1036 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1036) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1024))) dtb__1033); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1035; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1036 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1024) args) sp)) (fun mspec -> (match mspec with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1037) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1037))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1032)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1038; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1039 } -> (match dtb__1039 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1040; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1041 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc dtb__1041) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1024))) dtb__1038); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1040; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1041 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1024) args) sp)) (fun mspec -> (match mspec with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1042) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1042))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__1025) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1024))) dtb__1024)
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
# 1021 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1043, dtb__1044) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1043) args) sp)) (fun mspec -> (match mspec with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1045) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1045))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
# 1030 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1046; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1047 } -> (match dtb__1047 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1048; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1049 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1049) dtb__1048) args) sp) hint)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1050; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1051 } -> (match dtb__1051 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1052; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1053 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1053)) dtb__1046) dtb__1050); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1052; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1053 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
# 1039 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
# 1176 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1054, dtb__1055, dtb__1056, dtb__1057, dtb__1058) -> (if dtb__1055 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__1057) then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__1057) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__1057) dtb__1058) args) sp) hint) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__1057) args) sp)) (fun ec0 -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1059) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1057)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1057) dtb__1058) args) sp) hint) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1057)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__1057) dtb__1058) args) sp) hint) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1059))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1060) -> (match dtb__1060 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1061; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1062 } -> ((fun ty2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1062) ty2) args) sp) hint)) (fun q -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1063; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1064 } -> (match dtb__1064 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1065; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1066 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1061; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1063)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1065; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1066 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1061)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__1057)) sp))))) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec) dtb__1057) then (match ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ec) dtb__1057) with
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__1067, dtb__1068) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1068) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) dtb__1067)) args) sp) hint)) (fun p -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1069; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1070 } -> (match dtb__1070 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1071; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1072 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1067); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1069)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1071; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1072 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__1073) -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1074; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1075 } -> ((fun ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1074))) args) sp) hint)) (fun p -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1076; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1077 } -> (match dtb__1077 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1078; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1079 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1074; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1076)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1078; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1079 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1075) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1057) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1080; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1081 } -> ((fun ec2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1080))) args) sp) hint)) (fun p -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1082; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1083 } -> (match dtb__1083 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1084; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1085 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1080; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__1082)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1084; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1085 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1081) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__1057) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | _ -> failwith "DT: impossible branch"
) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__1057) then (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain ec) dtb__1057) then (match args with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1086, dtb__1087) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand dtb__1086) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1088) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1088) dtb__1057)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1089; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1090 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1090) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1089))) dtb__1087) sp) hint)) (fun q -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1091; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1092 } -> (match dtb__1092 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1093; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1094 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1089; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1056 }, dtb__1091)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1093; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1094 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1095; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1096 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1096) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1095))) args) sp) hint)) (fun p -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1097; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1098 } -> (match dtb__1098 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1099; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1100 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1095; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1056 }, dtb__1097)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1099; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1100 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1102 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1102) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1101))) args) sp) hint)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1104 } -> (match dtb__1104 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1105; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1106 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1056 }, dtb__1103)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1105; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1106 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1107; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1108 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1108) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1107))) args) sp) hint)) (fun p -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1110 } -> (match dtb__1110 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1111; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1112 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1107; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1056 }, dtb__1109)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1111; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1112 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImplicitParamKind)))) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = forced; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1113, dtb__1114) -> ((fun ec0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec0) sp) dtb__1054) dtb__1056) dtb__1057)) (fun argRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit ec0) dtb__1057) dtb__1113)) (fun a2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__1057)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1116 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__1116) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1058) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1115))) dtb__1114) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun q -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1117; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1118 } -> (match dtb__1118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1120 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = argRig }, dtb__1117)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1120 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))) ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1121) -> (match dtb__1121 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1123 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint dtb__1122) ctx) dtb__1123) ec) forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ec
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1124) -> dtb__1124
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ec
  | _ -> failwith "DT: impossible branch"
)) hint))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = forced; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1125, dtb__1126) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1125)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
# 1278 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp hint -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1128 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__1128) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1128) dom)) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1127))) args) sp) hint)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1129; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1130 } -> (match dtb__1130 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1132 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, dtb__1129)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1132 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
# 1292 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1133) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1134) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1135, dtb__1136) -> (match dtb__1136 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1133) dtb__1134) args) sp)) (fun ecProbe -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__1135) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1137) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__1135) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1137) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1138) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1138))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1139) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1133) dtb__1134) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__1133) dtb__1134) args) sp)
)) dtb__1133)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1310 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1140, dtb__1141) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1142) -> (match dtb__1142 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1143; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1144 } -> (match dtb__1144 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1145; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1146 } -> ((fun forced -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1146) ctx) argTy) argKind) dtb__1141) sp) else (if (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__1146) ctx) forced) argKind) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1146) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1147) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1147))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1148) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1146) ctx) argTy) argKind) dtb__1141) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__1146) ctx) argTy) argKind) dtb__1141) sp)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1146) dtb__1145))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1149) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1140))
  | _ -> failwith "DT: impossible branch"
)))
# 1432 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1150) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel (fuel - 1)) globals) ctx) ec) dtb__1150) args) expected) sp)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1439 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel = (fun fuel globals ctx ec op args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1151, dtb__1152) -> (match dtb__1152 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1153, dtb__1154) -> (match dtb__1154 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1151) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1155; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1156 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1156) dtb__1153) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1158 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1155) dtb__1157); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1158 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1151) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1159; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1160 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1160) dtb__1153) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1161; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1162 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1159) dtb__1161); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1162 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1151) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pa -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1163; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1164 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1164) dtb__1153) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1165; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1166 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1163) dtb__1165); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1166 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) args)))
# 1465 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1167) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel (fuel - 1)) globals) ctx) ec) dtb__1167) args) sp)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))
# 1472 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel = (fun fuel globals ctx ec op args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1168, dtb__1169) -> (match dtb__1169 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1170, dtb__1171) -> (match dtb__1171 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1168)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1172; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1173 } -> (match dtb__1173 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1174; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1175 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1175) dtb__1170)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1176; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1177 } -> (match dtb__1177 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1178; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1179) dtb__1174) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1179) dtb__1178) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1172) dtb__1176); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1179) dtb__1174) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1179) dtb__1178) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1172) dtb__1176); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1179) dtb__1174) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1179) dtb__1178) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 op) dtb__1172) dtb__1176); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1179) dtb__1174) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1179) dtb__1178) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1170) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1180) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1170)) dtb__1180)) (fun bNat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) dtb__1172) bNat); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } }))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1172)) dtb__1176); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } }))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1179) dtb__1174) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1179) dtb__1178) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__1168) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1181) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__1168)) dtb__1181)) (fun aNat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 op) aNat) dtb__1176); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } }))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 op) dtb__1172) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1176)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1179 } }))))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) args)))
# 1503 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1182) -> ((fun simpleComp -> ((fun firstCall -> ((fun thirdCall -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind firstCall) (fun callExpr -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1183) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1183))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1184) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAtHole globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun callExpr2 -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr2) expected) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1185) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1185))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1186) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind thirdCall) (fun callExpr3 -> (match ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.retry-third") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr3) expected))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1187) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1187))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1188) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1184))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (if simpleComp then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))))) (if simpleComp then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt globals) ec) expr) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1189) -> (match dtb__1189 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1190; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1191 } -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_disSimpleComp dtb__1190)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1192) -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.infer") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1193) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) callExpr) expected)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1194) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))) dtb__1194) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsDefCheck "vuna.elab.term.core") (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName expr)) (fun _u -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow fuel) globals) ctx) ec) expr) expected)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 1588 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1195) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1195) expected)) (fun r -> (match r with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1196) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1196))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__1195)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
# 1613 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__1197, dtb__1198, dtb__1199) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1198)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1201 } -> (match dtb__1201 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1202; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1203 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1203) dtb__1197) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1200))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1204, dtb__1205) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__1204) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats ec) ctx) expected) dtb__1204)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1206; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1207 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__1207)) dtb__1206)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1207) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1204, dtb__1205)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1208, dtb__1209, dtb__1210, dtb__1211) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__1208) dtb__1209) dtb__1210) expected) dtb__1211)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1212, dtb__1213, dtb__1214) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1212) dtb__1213) expected) dtb__1214)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__1215, dtb__1216, dtb__1217, dtb__1218) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__1215) dtb__1218)) (fun pc -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1219; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1220 } -> ((fun attempt -> (match attempt with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1221) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1221))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1222) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1220) dtb__1216) expected)) (fun pt -> (match pt with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1223; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1224 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1224) dtb__1217) expected)) (fun pe -> (match pe with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1225; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1226 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__1219, dtb__1223, dtb__1225)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1226 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__1227, dtb__1228, dtb__1229, dtb__1230, dtb__1231, dtb__1232) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1233, dtb__1234, dtb__1235) -> (match dtb__1233 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1236, dtb__1237) -> (if (dtb__1236 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1236 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax dtb__1236) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__1235) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstParam) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1236, dtb__1237))) dtb__1234) expected) dtb__1235))))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__1233) dtb__1234) expected) dtb__1235)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__1238, dtb__1239, dtb__1240) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__1238) dtb__1239) expected) dtb__1240)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__1241, dtb__1242) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1243, dtb__1244) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1245) -> (match dtb__1245 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1246, dtb__1247) -> (match dtb__1247 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__1246 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__1241)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1248) -> (match dtb__1248 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1249; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1250 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1250) dtb__1249) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1242)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1251) -> (match dtb__1251 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1252; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1253 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1253) dtb__1252) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1242))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1254) -> (match dtb__1254 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1255; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1256 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1256) dtb__1255) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1242))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1257) -> (match dtb__1257 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1258; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1259 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1259) dtb__1258) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1242))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__1260, dtb__1261) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1262, dtb__1263) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1264) -> (match dtb__1264 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1265, dtb__1266) -> (match dtb__1266 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__1265 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__1260)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec })) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1267) -> (match dtb__1267 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1269 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1269) dtb__1268) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1261)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1270) -> (match dtb__1270 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1272 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1272) dtb__1271) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1261))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1273) -> (match dtb__1273 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1275 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1275) dtb__1274) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1261))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1276) -> (match dtb__1276 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1277; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1278 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1278) dtb__1277) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1261))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__1279, dtb__1280) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1281, dtb__1282) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1283) -> (match dtb__1283 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1284, dtb__1285) -> (match dtb__1285 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__1284 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__1280) dtb__1279)) (fun t -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = t; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec })))) else (if (dtb__1284 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1286) -> (match dtb__1286 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1287; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1288 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1288) dtb__1287) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1280))))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1289) -> (match dtb__1289 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1291 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1291) dtb__1290) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1280))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1292) -> (match dtb__1292 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1293; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1294 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1294) dtb__1293) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1280))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1295) -> (match dtb__1295 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1296; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1297 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1297) dtb__1296) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1280))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1298, dtb__1299) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__1298) then ((fun pmeta -> (match pmeta with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1300; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1301 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1300; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1301 }))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta ctx) ec) dtb__1299) expected) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf dtb__1298))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1298) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1299) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1298)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1298))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1299))) Base_dData_dList.C_Base_dData_dList_dList_Nil) expected) dtb__1299))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverValueName dtb__1298) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverValueTarget globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueShort dtb__1298)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets dtb__1298)) expected) dtb__1299)) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1299))) Base_dData_dList.C_Base_dData_dList_dList_Nil) expected) dtb__1299))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1298, dtb__1299))) Base_dData_dList.C_Base_dData_dList_dList_Nil) expected) dtb__1299))))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
# 1708 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
# 1794 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
# 1801 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1302, dtb__1303) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1302) dtb__1303) mc5) mc6) mc7) mc8))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
# 1808 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bnd rest body rec_u expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (Base_dData_dPair.v_Base_dData_dPair_dfirstOf bnd) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1304, dtb__1305) -> ((fun value -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1306; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1307 } -> (match dtb__1307 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1308; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1309 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__1309) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1310; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1311 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__1304, rig, ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__1304) dtb__1305), bodyTerm2)), dtb__1306, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1311 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1311) ctx) dtb__1308) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__1310) else dtb__1310))
  | _ -> failwith "DT: impossible branch"
)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1304) dtb__1308) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1308))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf bnd))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1312) -> ((fun value -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1313; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1314 } -> (match dtb__1314 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1315; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1316 } -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__1316) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1317; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1318 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, dtb__1312, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1317))), dtb__1313, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1318 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1315))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf bnd))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf bnd), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf bnd); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (rest, body, rec_u, sp)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dData_dPair.v_Base_dData_dPair_dfirstOf bnd))))) expected)
)))
# 1851 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1319, dtb__1320) -> (match dtb__1319 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1322 } -> (match dtb__1321 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1323, dtb__1324) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1323) dtb__1322) dtb__1320) body) rec_u) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__1323) dtb__1324)) sp)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1325) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1322) dtb__1320) body) rec_u) dtb__1325) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1322, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1320, body, rec_u, sp)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__1321))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 1864 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1326; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1327 } -> (match dtb__1327 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1328; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1329 } -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__1329) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1330; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1331 } -> (match dtb__1331 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1332; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1333 } -> ((fun bodyTerm2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, binderSp, bodyTerm2)), dtb__1326, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1332; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1333 } }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1333) ctx) dtb__1328) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__1330) else dtb__1330))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__1328) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1328))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1880 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1334; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1335 } -> (match dtb__1335 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1337 } -> ((fun rig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__1337) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1338; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1339 } -> (match dtb__1339 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1340; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1341 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, binderSp, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1338))), dtb__1334, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1340; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1341 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1336))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
# 1944 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1342) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1343) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand expr) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1344) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr expr)) (fun callExpr -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) callExpr)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1345, dtb__1346, dtb__1347) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1345) dtb__1346) dtb__1347) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = expected })))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel fuel) globals) ctx) ec) expr)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 2145 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1348) -> (match dtb__1348 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1349; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1350 } -> (match dtb__1350 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1351; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1352 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1352) expected) dtb__1351) dtb__1349) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1353) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1353; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1352) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1352) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1351) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1354) -> (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift ctx) globals) dtb__1352) expected) dtb__1351) dtb__1349) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1355) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__1355); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1355)) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel dtb__1352) expected) dtb__1351) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1356) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels dtb__1356) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldEffect (("actual: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1351))))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldEffect (("expected: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected))))) d))))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1356)))) (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__1356)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) dtb__1354)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1357) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1349; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1357) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1358) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1358))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected))))
# 2162 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1359, dtb__1360) -> (match dtb__1359 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1361; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1362 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun forced -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1363, dtb__1364) -> (match dtb__1364 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun lvl -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) mc3) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1365; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1366 } -> ((fun domVal -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt mc7) mc2) dtb__1366) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1367; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1368 } -> ((fun piVal -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__1368)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__1368)) lvl) dtb__1363) Base_dData_dList.C_Base_dData_dList_dList_Nil) piVal) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1369) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) mc2) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__1368) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1369))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1361; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1362 }, dtb__1360))) mc5) piVal) mc7)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1370) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, domVal, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__1367 })))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc2) dtb__1365))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1371, dtb__1372, dtb__1373, dtb__1374, dtb__1375) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain mc3) mc7) dtb__1361) dtb__1373) dtb__1374)) (fun lamRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1360) mc5) expected2) mc7)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1376; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1377 } -> ((fun inner2 -> ((fun binderName -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, dtb__1362, inner2)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1377 }))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear mc3) mc2) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear mc3) ctx2) dtb__1376) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName mc7) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__1361) else dtb__1361) else dtb__1361))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1377) mc2) dtb__1374) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (0, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__1376) else dtb__1376))
  | _ -> failwith "DT: impossible branch"
)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1375) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1361) dtb__1374) mc2))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__1371) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)) forced)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
# 2231 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1378, dtb__1379, dtb__1380) -> (match dtb__1378 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1381, dtb__1382) -> (if (if (dtb__1381 = "->") then true else (dtb__1381 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1381) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1383) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1381) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1381) dtb__1379) dtb__1382) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1384) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1385) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1385))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1386, dtb__1387) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1386) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1388) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__1386) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1389) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1389))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1390) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec) dtb__1386); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1390; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)) expr)))
# 2253 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1391; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1392 } -> (match dtb__1392 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1393; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1394 } -> ((fun forced -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1395) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1391; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1395; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1394 } }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedType (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1393)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1393))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1394) dtb__1393))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2268 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1396, dtb__1397) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1396) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1397) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1396)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1396))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1397))) args) expected) sp))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1396) ctx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1398) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor ec) dtb__1396) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1399) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1399) args) expected) dtb__1397)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1396) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1396) args) expected) dtb__1397) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1396) args) expected) sp) dtb__1397))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1396) args) expected) sp) dtb__1397))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
# 2294 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel = (fun fuel globals ctx ec fn name args expected sp vsp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1400) -> (match dtb__1400 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__1401) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__1402) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))))
# 2304 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1403; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1404 } -> (match dtb__1404 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1405; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1406 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1406) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1405)))) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1403; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
# 2313 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1407) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1407)) args) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1408; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1409 } -> (match dtb__1409 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1410; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1411 } -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1411) dtb__1410)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1412) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1411) name) dtb__1408); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1412; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1411 } }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
# 2358 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1413, dtb__1414) -> (match dtb__1414 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1415, dtb__1416) -> (match dtb__1416 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1413)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1417; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1418 } -> (match dtb__1418 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1419; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1420 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1420) dtb__1415)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1421; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1422 } -> (match dtb__1422 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1423; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1424 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1424) dtb__1419) dtb__1423) dtb__1417) dtb__1421) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1425) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1425))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1425))) sp) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__1425))) dtb__1424)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1424) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1419) dtb__1423)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__1417) dtb__1421) sp) dtb__1419) ec3)))
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
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))
# 2375 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1426, dtb__1427) -> (match dtb__1427 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1428, dtb__1429) -> (match dtb__1429 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1426)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1430; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1431 } -> (match dtb__1431 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1432; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1433 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1433) dtb__1428)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1434; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1435 } -> (match dtb__1435 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1436; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1437 } -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1437) dtb__1432) dtb__1436) dtb__1430) dtb__1434) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1438) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1438))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1438))) sp) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__1438))) dtb__1437)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1437) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1432) dtb__1436)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__1430) dtb__1434) sp) dtb__1432) ec3)))
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
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))
# 2394 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName) then (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1439) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1439))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1440) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1440))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1441) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1441))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
# 2416 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1442, dtb__1443) -> (match dtb__1443 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1442)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1444; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1445 } -> (match dtb__1445 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1446; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1447 } -> ((fun tyv -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue tyv) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1444; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = tyv; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1447 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1447) tyv) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1447) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm dtb__1444); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1447 } })))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1447) tyv) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1447) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName)) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1444)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1447 } })))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1447) tyv) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm dtb__1444); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1447 } })))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1447) dtb__1446))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) args)))
# 2456 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1448, dtb__1449) -> (match dtb__1449 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1450, dtb__1451) -> (match dtb__1451 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1448) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pa -> (match pa with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1452; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1453 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1453) dtb__1450) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue)) (fun pb -> (match pb with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1454; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1455 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__1452) dtb__1454); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1455 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)) args) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))
# 2467 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1456, dtb__1457) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__1456) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected ec) dtb__1456) expected) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1456) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1458) -> (match dtb__1458 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1459; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1460 } -> (match dtb__1460 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1461; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1462 } -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1462) expected) dtb__1461) dtb__1459) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1463) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1463; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1462 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1462) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1461)) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1459; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1464) -> (match dtb__1464 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1465; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1466 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1465; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1466 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
)))
# 2674 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1467) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1467))) args) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1468; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1469 } -> (match dtb__1469 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1470; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1471 } -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1471) expected) dtb__1470) ctorTerm) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1472) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1472; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1471 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1471) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1470) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1473) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1473)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1468); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1473 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1474) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1474)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1474))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1471)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1468))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1475) -> (match dtb__1475 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1476; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1477 } -> (match dtb__1477 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1478; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1479 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1479) dtb__1478) args) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1480; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1481 } -> (match dtb__1481 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1482; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1483 } -> ((fun allArgs -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1483) expected) dtb__1482) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1483)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1484) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1484; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1483 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1483) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1482) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1485) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1485)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1485 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1486) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1486)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__1486))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__1476) dtb__1480))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs ec) ctx) dtb__1467) expected))
  | _ -> failwith "DT: impossible branch"
)))
# 2911 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain = (fun fuel globals ctx ec plan steps last -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1487, dtb__1488) -> (match dtb__1487 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__1489, dtb__1490, dtb__1491, dtb__1492) -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__1491) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1493; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1494 } -> ((fun aVal -> ((fun mArgTy -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1494) dtb__1491) "_") (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planRigE) mArgTy)) (fun argRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1494) dtb__1490) mArgTy)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1495; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1496 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1496) dtb__1491) dtb__1489) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planInnerRig) aVal)) (fun lamRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx2) dtb__1496) plan) dtb__1488) last)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1497; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1498 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm dtb__1496) dtb__1498) ctx) dtb__1491) dtb__1492) plan) dtb__1489) aVal) dtb__1495) argRig) lamRig) dtb__1497); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1498 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1489) aVal) ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1493))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) last) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (plan).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))
  | _ -> failwith "DT: impossible branch"
)) steps)))
# 2934 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel = (fun fuel globals ctx ec chain expected -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1499) -> (match dtb__1499 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1500; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1501 } -> (match dtb__1501 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1502; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1503 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1504; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1505 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1505) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1506; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1507 } -> ((fun mVal -> ((fun aVal -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1507) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1500) dtb__1502) dtb__1503) mVal) aVal)) (fun mp -> (match mp with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1508) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1508).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1508) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1509; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1510 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1510) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (dtb__1508).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planMVal) (dtb__1508).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planAVal))) (fun ec4 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1509; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec4) }))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1506))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1504))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1511) -> (match dtb__1511 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1512; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1513 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1500) dtb__1502) dtb__1503) dtb__1512) dtb__1513)) (fun mp -> (match mp with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1514) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1514).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1514) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1515; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1516 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1515; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1516) }))))
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
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))
# 2963 "Vuna/Compiler/Elab/Term/Impl.vuna"
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel = (fun fuel globals ctx ec chain -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "inference") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1517) -> (match dtb__1517 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1518; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1519 } -> (match dtb__1519 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1520; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1521 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1522; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1523 } -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) ctx) dtb__1523) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1524; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1525 } -> ((fun mVal -> ((fun aVal -> ((fun resultTy -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1525) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSpan) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical) dtb__1518) dtb__1520) dtb__1521) mVal) aVal)) (fun mp -> (match mp with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1526) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (dtb__1526).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_planEc) dtb__1526) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainSteps) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainLast)) (fun q -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1527; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1528 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1527; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = resultTy; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1528 } }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1524))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1522))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (chain).f_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_doChainCanonical))))

# 2330 "Vuna/Compiler/Elab/Term/Impl.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind = (fun globals ctx ec expr expected sp -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1529) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) globals) ctx) ec) expr))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) }))))
  | _ -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1530, dtb__1531, dtb__1532) -> (match dtb__1530 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1533, dtb__1534) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1533) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1533) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1533))) dtb__1533)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1535) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1535)) dtb__1531) sp) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1536; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1537 } -> (match dtb__1537 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__1538; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1539 } -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1539) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1538) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1540) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm dtb__1540) dtb__1533) dtb__1536); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1540 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1541) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTypeMismatch sp) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1538))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1542, dtb__1543) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1542) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1542) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1542))) dtb__1542)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1544) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__1544)))) (fun ec1 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm ec1) dtb__1542); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec1 }))))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
)) expr)
))
